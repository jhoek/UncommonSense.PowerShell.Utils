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
        [switch]$UseCulture,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchSingleLine')]
        [switch]$SingleLine,

        [Parameter(Mandatory, ParameterSetName = 'RegexMatchMultiLine')]
        [switch]$MultiLine,

        [Parameter(Mandatory, ParameterSetName = 'ScriptBlock')]
        [scriptblock]$ScriptBlock,

        [ValidateRange(1, [int]::MaxValue)]
        [int]$MaxCount = [int]::MaxValue
    )

    process
    {
        $InputObject.ForEach{
            switch ($true)
            {
                ($PSCmdlet.ParameterSetName -eq 'ScriptBlock')
                {
                    $_ -split $ScriptBlock, $MaxCount
                }

                ($PSCmdlet.ParameterSetName -eq 'SimpleMatch')
                {
                    switch ($IgnoreCase)
                    {
                        ($false) { $_ -split $Separator, $MaxCount }
                        ($true) { $_ -split $Separator, $MaxCount, IgnoreCase }
                    }

                }
            }
        }
    }
}