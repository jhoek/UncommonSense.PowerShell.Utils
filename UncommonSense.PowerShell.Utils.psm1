Set-StrictMode -Version Latest

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