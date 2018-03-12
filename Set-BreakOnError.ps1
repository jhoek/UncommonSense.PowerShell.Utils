function Set-BreakOnError 
{
    param
    (
    )

    Set-PSBreakpoint -Variable StackTrace -Mode Write
}