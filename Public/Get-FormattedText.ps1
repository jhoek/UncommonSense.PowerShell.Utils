function Get-FormattedText
{
    param
    (
        [Parameter(Position = 1, ValueFromPipeline)]
        [string[]]$Text,

        [ValidateSet('Black', 'Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'White')]
        [string]$BackgroundColor,

        [ValidateSet('Black', 'Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'White')]
        [string]$ForegroundColor,

        [switch]$BackgroundBright,
        [switch]$ForegroundBright,
        [switch]$Negative,
        [switch]$Underline
    )

    Process
    {
        foreach($Item in $Text)
        {
            $Values = @()

            if ($BackgroundColor) {
                if ($BackgroundBright) {
                    $Values += 100 + (Get-ColorOffset -Color $BackgroundColor)
                }
                else {
                    $Values += 40 + (Get-ColorOffset -Color $BackgroundColor)
                }
            }

            if ($ForegroundColor) {
                if ($ForegroundBright) {
                    $Values = 90 + (Get-ColorOffset -Color $ForegroundColor)
                }
                else {
                    $Values = 30 + (Get-ColorOffset -Color $ForegroundColor)
                }
            }

            if ($Negative) {
                $Values += 7
            }

            if ($UnderLine) {
                $Values += 4
            }

            if ($Values) {
                $Esc = [char]27
                "$Esc[$($Values -join ';')m$Item$Esc[0m"
            }
            else {
                $Item
            }
        }
    }
}