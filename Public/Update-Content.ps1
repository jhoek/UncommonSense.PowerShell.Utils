function Update-Content
{
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [Alias('FullName')]
        [string[]]$Path,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'OEM', 'Unicode', 'UTF7', 'UTF8', 'UTF8BOM', 'UTF8NoBOM', 'UTF32')]
        [string]$Encoding = 'UTF8NoBOM',

        [ValidateNotNull()]
        [scriptblock]$Begin = {},

        [ValidateNotNull()]
        [scriptblock]$ProcessRecord = { param($Line) $Line },

        [ValidateNotNull()]
        [scriptblock]$End = {}
    )

    process
    {
        $Provider = $null

        $Path.ForEach{
            $PSCmdlet.GetResolvedProviderPathFromPSPath($Path, [ref]$Provider)
            | ForEach-Object {
                & $Begin

                Get-Content -Path $_ -Encoding $Encoding `
                | ForEach-Object { & ProcessRecord -Line $_ } `
                | Set-Content -Path $_ -Encoding $Encoding

                & $End
            }
        }
    }
}