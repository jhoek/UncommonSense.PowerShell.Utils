<#
.SYNOPSIS
Returns the value that was passed in, or, if that value was
null, blank, zero or empty, returns the specified default value.

If value may refer to an undefined element in an array or hashtable,
wrap $Value in a scriptblock to prevent premature evaluation.

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

.EXAMPLE
({ @()[3] } | ?? H) -eq 'H' # returns True

.EXAMPLE
({ @{}.Foo.Baz} | ?? I) -eq 'I' #returns True
#>
function Get-ValueOrDefault {
    [Alias('OrOtherwise', '??')]
    param
    (
        [Parameter(ValueFromPipeline)]
        $Value,

        [Parameter(Position = 1)]
        $DefaultValue
    )

    try {
        if ($Value -is [ScriptBlock]) {
            $Value = & $Value
        }
    }
    catch [System.Management.Automation.PropertyNotFoundException], [System.IndexOutOfRangeException] {
        $Value = $false
    }

    if ($Value) {
        $Value
    }
    else {
        $DefaultValue
    }
}