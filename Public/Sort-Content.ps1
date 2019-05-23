function Sort-Content
{
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [string[]]$Path,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'OEM', 'Unicode', 'UTF7', 'UTF8', 'UTF8BOM', 'UTF8NoBOM', 'UTF32')]
        [string]$Encoding = 'UTF8NoBOM'
    )

    process
    {
        $Provider = $null

        $Path.ForEach{
            $PSCmdlet.GetResolvedProviderPathFromPSPath($Path, [ref]$Provider).ForEach{
                Get-Content -Path $_.FullName -Encoding $Encoding `
                    | Sort-Object `
                    | Set-Content -Path $_.FullName -Encoding $Encoding
            }
        }
    }
}