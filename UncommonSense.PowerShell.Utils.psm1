Set-StrictMode -Version Latest

function Find-Application
{
    [Alias('which')]
    param
    (
        [string]$Command
    )

    Get-Command -Name $command -ErrorAction SilentlyContinue | 
        Select-Object -First 1 -ExpandProperty Path
}

function Find-InFiles 
{
    [Alias('grep')]
    param
    (
        [Parameter(Mandatory, Position=1)]
        [string]$Pattern,
        
        [ValidateNotNullOrEmpty()]
        $Path = $Pwd,

        [string]$Filter = '*.*',

        [Switch]$Recurse,

        [int[]]$Context = 0
    )

    Get-ChildItem -Path $Path -Filter $Filter -Recurse:$Recurse | 
        Select-String -Pattern $Pattern -Context $Context | 
            Format-Table -AutoSize -Property Path, LineNumber, Line 
}

function Format-Object 
{
    param
    (
        [Parameter(Mandatory)][string]$Caption,
        [Parameter(Mandatory)]$Value,
        [int]$Indentation = 0
    )

    Write-Host $Value.GetType().FullName -ForegroundColor DarkYellow

    switch($true) 
    {
        # Hashtable
        ($Value -is [System.Collections.IDictionary]) 
        {
            Write-Output "$("  " * $Indentation)$Caption" 

            foreach($Key in $Value.Keys)
            {
                Format-Object -Caption $Key -Value $Value[$Key] -Indentation ($Indentation + 1) 
            }
                    
            break
        }

        # Collection
        ($Value -is [System.Collections.ICollection]) 
        { 
            Write-Output "$("  " * $Indentation)$Caption" 
            $Value | ForEach-Object { Format-Object -Caption $_.ToString() -Value $_ -Indentation ($Indentation + 1) }                                         
            break 
        }

        default 
        {
            Write-Output "$("  " * $Indentation)$($value.ToString())"
        }
    }
}

function Format-HashTable 
{
	param
	(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[System.Collections.IDictionary[]]$HashTable,
		
		[ValidateRange(0, [int]::MaxValue)]
		[int]$Indentation = 0
	)
	
	process
	{
        foreach($Item in $HashTable)
        {
		    foreach($Key in $Item.Keys)
		    {
			    $Value = $Item["$Key"]
		
			    if ($Value -is [hashtable] -or $Value -is [System.Collections.Specialized.OrderedDictionary])
			    {
                    Write-Output "$("  " * $Indentation)$Key"
				    Format-HashTable -HashTable $Value -Indentation ($Indentation + 1)
			    }
			    else
			    {
				    Write-Output "$("  " * $Indentation)$Key = $Value"
			    }	
		    }
        }
	}
}

<#
.EXAMPLE
('A' | ?? B) -eq "A" # returns True

.EXAMPLE
('' | ?? C) -eq 'C' # returns True

.EXAMPLE
($null | ?? D) -eq 'D' # returns True

.EXAMPLE
(1 | ?? 2) -eq 1 # returns True

.EXAMPLE
(0 | ?? 3) -eq 3 # returns True

.EXAMPLE
('A' -as [int] | ?? E) -eq 'E' # returns True

.EXAMPLE
($false | ?? F) -eq 'F' # returns True

.EXAMPLE
($true | ?? G) -eq $true # returns True
#>
function OrOtherwise
{
    [Alias('??')]
    param
    (
        [Parameter(ValueFromPipeline)]
        $Value,

        [Parameter(Position=1)]
        $DefaultValue
    )

    if ($Value)
    {
        $Value
    }
    else
    {
        $DefaultValue
    }
}