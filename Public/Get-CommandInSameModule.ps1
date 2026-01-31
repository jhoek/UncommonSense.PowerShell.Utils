<#
.SYNOPSIS
Gets a list of commands that live in the same module as the given command.
#>
function Get-CommandInSameModule
{
    [Alias('siblings', 'Get-SiblingCommand')]
    param
    (
        # The name of the command whose sibling commands should be displayed
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]]$Name
    )

    begin
    {
        $ModuleNames = @()
    }

    process
    {
        $Name
        | ForEach-Object { Get-Command -Name $_ }
        | Select-Object -ExpandProperty ModuleName
        | ForEach-Object { $ModuleNames += $_ }
    }

    end
    {
        $ModuleNames
        | Select-Object -Unique
        | ForEach-Object { Get-Command -Module $_ }
    }
}