<#
.EXAMPLE
$Collection = (65..90) | ForEach-Object { [char]$_ }
$Collection | Split-Collection -ChunkSize 3 | Select-Object -Skip 3 -First 1 

.EXAMPLE
$Collection = (65..90) | ForEach-Object { [char]$_ }
Split-Collection -Collection $Collection -ChunkSize 5 | Select-Object -Skip 3 -First 1

.EXAMPLE
$EmptyCollection = @()
$EmptyCollection | Split-Collection -ChunkSize 2 | Measure-Object
#>
function Split-Collection 
{
    param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [PSObject[]]$Collection,

        [Parameter(Mandatory)]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$ChunkSize
    )

    Begin
    {
        [System.Collections.ArrayList]$Chunk = $null
    }

    Process 
    {
        foreach($Item in $Collection)
        {
            if ($null -eq $Chunk)
            {
                $Chunk = New-Object -TypeName System.Collections.ArrayList -ArgumentList $ChunkSize
            }

            $Chunk.Add($Item) | Out-Null

            if ($Chunk.Count -eq $ChunkSize)
            {
                (,$Chunk)
                $Chunk = $null
            }
        }
    }

    End
    {
        if ($null -ne $Chunk)
        {
            (,$Chunk)
        }
    }
}