# .SYNOPSIS
# Returns the first item of the first contiguous range of items of the specified length
# .EXAMPLE
# 1..20 | ForEach-Object { Get-ContiguousRange -Items (1..9 + 25..35 + 50..90) -RequiredLength $_ }
function Get-ContiguousRange {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [int[]]$Items,

        [ValidateRange(1, [int]::MaxValue)]
        [int]$RequiredLength = 1
    )

    begin {
        $CachedItems = New-Object TypeName System.Collections.ArrayList
    }

    process {
        foreach ($Item in $Items) {
            $CachedItems.Add($Item)
        }
    }

    end {
        $Index = 0

        $CachedItems | `
            ForEach-Object { [pscustomobject]@{ Difference = $_ - $Index; Value = $_; Index = $Index++ } } | `
            Group-Object -Property Difference | `
            Where-Object -Property Count -GE $RequiredLength | `
            Select-Object -First 1 -ExpandProperty Group |
            Select-Object -First 1 -ExpandProperty Value
    }
}