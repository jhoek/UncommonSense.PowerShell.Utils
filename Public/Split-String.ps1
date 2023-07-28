function Split-String
{
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
        [Parameter(ParameterSetName = 'RegexMatch')]
        [Parameter(ParameterSetName = 'RegexMatchSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchMultiLine')]
        [switch]$IgnoreCase,

        [Parameter(Mandatory, ParameterSetName = 'SimpleMatch')]
        [switch]$SimpleMatch,

        [Parameter(ParameterSetName = 'RegexMatch')]
        [Parameter(ParameterSetName = 'RegexMatchSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchMultiLine')]
        [switch]$IgnorePatternWhitespace,

        [Parameter(ParameterSetName = 'RegexMatch')]
        [Parameter(ParameterSetName = 'RegexMatchSingleLine')]
        [Parameter(ParameterSetName = 'RegexMatchMultiLine')]
        [switch]$CultureInvariant,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchSingleLine')]
        [switch]$SingleLine,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchMultiLine')]
        [switch]$MultiLine,

        [Parameter(Mandatory, ParameterSetName = 'ScriptBlock')]
        [scriptblock]$ScriptBlock,

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

                default
                {
                    return ($CurrentInputObject -split $Separator, $Options)
                }
            }
        }
    }
}