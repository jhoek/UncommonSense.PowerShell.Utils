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
function Get-ValueOrDefault
{
    [Alias('OrOtherwise', '??')]
    param
    (
        [Parameter(ValueFromPipeline)]
        $Value,

        [Parameter(Position = 1)]
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