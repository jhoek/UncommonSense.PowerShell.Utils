<#
.SYNOPSIS
Gets a list of commands that live in the same module as the given command.
#>
function Get-CommandInSameModule
{
    [Alias('siblings')]
    param
    (
        # The name of the command whose sibling commands should be displayed
        [Parameter(Mandatory, Position = 0)]
        [string]$Name
    )

    $ModuleName = Get-Command -Name $Name | Select-Object -ExpandProperty ModuleName
    Get-Command -Module $ModuleName
}