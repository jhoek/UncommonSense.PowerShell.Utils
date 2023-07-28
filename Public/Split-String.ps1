function Split-String
{
    # Parametersets:
    # - ScriptBlock ($MaxCount is optional)
    # - SimpleMatch ($MaxCount is mandatory, as it is an option)
    # - RegexMatch ($MaxCount does not exist)
    #   - RegexMatchWithMaxCount ($MaxCount is mandatory)
    #     - RegexMatchWithMaxCountSingleLine ($MaxCount and $SingleLine mandatory; $MultiLine does not exist)
    #     - RegexMatchWithMaxCountMultiLine ($MaxCount and $MultiLine mandatory; $SingleLine does not exist)
    #   - RegexMatchWithoutMaxCount ($MaxCount does not exist; none of the options exist)

    [CmdletBinding(DefaultParameterSetName = 'RegexMatch')]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$InputObject,

        [Parameter(Mandatory, ParameterSetName = 'SimpleMatch', Position = 1)]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatch', Position = 1)]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatchSingleLine', Position = 1)]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatchMultiLine', Position = 1)]
        [Alias('Delimiter')] # Join-String calls this parameter 'Separator'
        [string]$Separator,

        [Parameter(ParameterSetName = 'SimpleMatch')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCount')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountMultiLine')]
        [switch]$IgnoreCase,

        [Parameter(Mandatory, ParameterSetName = 'SimpleMatch')]
        [switch]$SimpleMatch,

        [Parameter(ParameterSetName = 'RegexMatch')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountMultiLine')]
        [switch]$IgnorePatternWhitespace,

        [Parameter(ParameterSetName = 'RegexMatch')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchWithMaxCountMultiLine')]
        [switch]$CultureInvariant,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchWithMaxCountSingleLine')]
        [switch]$SingleLine,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchWithMaxCountMultiLine')]
        [switch]$MultiLine,

        [Parameter(Mandatory, ParameterSetName = 'ScriptBlock')]
        [scriptblock]$ScriptBlock,

        [Parameter(ParameterSetName = 'ScriptBlock')]
        [Parameter(Mandatory, ParameterSetName = 'SimpleMatch')]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatchWithMaxCount')]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatchWithMaxCountSingleLine')]
        [Parameter(Mandatory, ParameterSetName = 'RegexMatchWithMaxCountMultiLine')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$MaxCount = 0
    )

    begin
    {
        $Options =
        @(
            if ($SimpleMatch) { 'SimpleMatch' }
            if ($RegexMatch) { 'RegexMatch' }
            if ($IgnoreCase) { 'IgnoreCase' }
            if ($CultureInvariant) { 'CultureInvariant' }
            if ($IgnorePatternWhitespace) { 'IgnorePatternWhitespace' }
            if ($ExplicitCapture) { 'ExplicitCapture' }
            if ($SingleLine) { 'SingleLine' }
            if ($MultiLine) { 'MultiLine' }
        ) -join ','

        Write-Verbose "Options are '$Options'"
    }

    process
    {
        $InputObject.ForEach{
            $CurrentInputObject = $_

            switch ($true)
            {
                ($PSCmdlet.ParameterSetName -eq 'ScriptBlock' -and $MaxCount -ne 0)
                {
                    return ($CurrentInputObject -split $ScriptBlock, $MaxCount)
                }

                ($PSCmdlet.ParameterSetName -eq 'ScriptBlock')
                {
                    return ($CurrentInputObject -split $ScriptBlock)
                }

                ($MaxCount -ne 0)
                {
                    return ($CurrentInputObject -split $Separator, $MaxCount, $Options)
                }

                ($Options)
                {
                    Write-Error('')
                }

                default
                {
                    return ($CurrentInputObject -split $Separator)
                }
            }
        }
    }
}