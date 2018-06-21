# .Synopsis
# Shows in which folder the given (native) command resides
function Find-Application {
    [Alias('which')]
    param
    (
        [Parameter(Mandatory)][string]$Command
    )

    Get-Command -Name $command -ErrorAction SilentlyContinue | 
        Select-Object -First 1 -ExpandProperty Path
}
