function Get-ContiguousRange
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory)]
        [int[]]$Items,

        [ValidateRange(1, [int]::MaxValue)]
        [int]$RequiredLength = 1
    )

    $Index = 0

    $Items | `
        ForEach-Object { [pscustomobject]@{ Difference = $_ - $Index; Value = $_; Index = $Index++ } } | `
        Group-Object -Property Difference | `
        Where-Object -Property Count -GE $RequiredLength | `
        Select-Object -First 1 -ExpandProperty Group |
        Select-Object -First 1 -ExpandProperty Value
}

# e.g. 
1..20 | ForEach-Object { Get-ContiguousRange -Items (1..9 + 25..35 + 50..90) -RequiredLength $_ }
