function Get-DropboxPath 
{
    Get-Content -Path "~/.dropbox/info.json" |
        ConvertFrom-Json | 
        Select-Object -ExpandProperty personal |
        Select-Object -ExpandProperty path
}