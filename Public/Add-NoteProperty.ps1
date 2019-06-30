function Add-NoteProperty
{
    [CmdletBinding(DefaultParameterSetName = 'ScriptBlock')]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [object[]]$InputObject,

        [Parameter(Mandatory, Position = 0)]
        [string]$Name,

        [parameter(Mandatory, Position = 1, ParameterSetName = 'Value')]
        [object]$Value,

        [Parameter(Mandatory, Position = 1, ParameterSetName = 'ScriptBlock')]
        [scriptblock]$ScriptBlock
    )

    process
    {
        $InputObject.ForEach{
            $CurrentObject = $_

            $ActualValue = switch ($PSCmdlet.ParameterSetName)
            {
                'Value' { $Value }
                'ScriptBlock' { Invoke-Command -ScriptBlock $ScriptBlock -ArgumentList $CurrentObject }
            }

            $_ `
            | Add-Member `
                -MemberType NoteProperty `
                -Name $Name `
                -Value $ActualValue`
                -PassThru
    }
}
}