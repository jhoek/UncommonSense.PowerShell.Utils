function Find-Application
{
    param
    (
        [string]$Command
    )

    Get-Command -Name $command -ErrorAction SilentlyContinue | 
        Select-Object -First 1 -ExpandProperty Path
}
