Set-StrictMode -Version Latest

function Format-Object 
{
    param
    (
        [Parameter(Mandatory)][string]$Caption,
        [Parameter(ValueFromPipeline)][PSObject[]]$Value,
        [int]$Indentation = 0
    )

    process 
    {
        foreach($Item in $Value)
        {
            switch($true) 
            {
                # Hashtable
                ($Item -is [System.Collections.IDictionary]) 
                {
                    Write-Output "$("  " * $Indentation)$Caption" 
                    $Item.Keys | Foreach-Object { Format-Object -Caption $_ -Value $Item[$_] -Indentation ($Indentation + 1) } 
                    break
                }

                # Collection
                ($Item -is [System.Collections.ICollection]) 
                { 
                    Write-Output "$("  " * $Indentation)$Caption" 
                    $Item | ForEach-Object { Format-Object -Caption $_.ToString() -Value $_ -Indentation ($Indentation + 1) }                                         
                    break 
                }

                default 
                {
                    Write-Output "$("  " * $Indentation)$($Caption)=$($Item.ToString())"
                }
            }
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