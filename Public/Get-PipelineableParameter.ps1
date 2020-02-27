# .EXAMPLE
# Get-PipelineableParameter -Name Select-String
function Get-PipelineableParameter
{
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [string[]]$Name
    )

    process
    {
        $Name.ForEach{
            Get-Command -Name $_ `
            | ForEach-Object {
                $CurrentCommand = $_

                $CurrentCommand `
                | Select-Object -ExpandProperty Parameters `
                | Select-Object -ExpandProperty Values `
                | ForEach-Object {
                    $CurrentParameter = $_

                    $CurrentParameter `
                    | Select-Object -ExpandProperty Attributes `
                    | Where-Object { $_.ValueFromPipeline -or $_.ValueFromPipelineByPropertyName } `
                    | ForEach-Object {
                        [PSCustomObject]@{
                            CommandName                     = $CurrentCommand.Name
                            ParameterSetName                = $_.ParameterSetName
                            ParameterName                   = $CurrentParameter.Name
                            ParameterType                   = $CurrentParameter.ParameterType
                            ValueFromPipeline               = $_.ValueFromPipeline
                            ValueFromPipelineByPropertyName = $_.ValueFromPipelineByPropertyName
                            PSTypeName                      = 'UncommonSense.PowerShell.Utils.PipelineableParameter'
                        }
                    }
            }
    }
}
}
}