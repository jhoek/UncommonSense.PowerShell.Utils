function Reset-Module
{
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [string[]]$Name   
    )

    process
    {
        $Name.ForEach{ Get-Module -Name $_ -ListAvailable | Import-Module -Force }
    }
}