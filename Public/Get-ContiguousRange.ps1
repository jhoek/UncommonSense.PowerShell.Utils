# .SYNOPSIS
# Returns the first item or all items of the first contiguous range of items of the specified length
# .EXAMPLE
# 1..20 | ForEach-Object { Get-ContiguousRange -Items (1..9 + 25..35 + 50..90) -RequiredLength $_ }
function Get-ContiguousRange {
    [CmdletBinding()]
    Param
    (
        # The items in which the contiguous range is to be found
        [Parameter(Mandatory, ValueFromPipeline)]
        [int[]]$Items,

        # The required number of contiguous items
        [ValidateRange(1, [int]::MaxValue)]
        [int]$RequiredLength = 1,

        # If true, all contiguous items are returned; if false, only the first item in the range is returned 
        [switch]$ReturnAll
    )

    begin {
        $CachedItems = New-Object -TypeName System.Collections.ArrayList
    }

    process {
        foreach ($Item in $Items) {
            $CachedItems.Add($Item) | Out-Null
        }
    }

    end {
        $Index = 0

        $Result = $CachedItems | `
            ForEach-Object { [pscustomobject]@{ Difference = $_ - $Index; Value = $_; Index = $Index++ } } | `
            Group-Object -Property Difference | `
            Where-Object -Property Count -GE $RequiredLength | `
            Select-Object -First 1 -ExpandProperty Group

        switch ($ReturnAll) {
            $true { $Result | Select-Object -First $RequiredLength -ExpandProperty Value }
            $false { $Result | Select-Object -First 1 -ExpandProperty Value}
        }            
    }
}