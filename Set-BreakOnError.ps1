
# .Synopsis
# Sets a breakpoint that causes the debugger to break on the first run-time error
function Set-BreakOnError 
{
    param
    (
    )

    Set-PSBreakpoint -Variable StackTrace -Mode Write
}