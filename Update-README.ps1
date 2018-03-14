Import-Module (Join-Path $PSScriptRoot UncommonSense.PowerShell.Utils.psd1) -Force

Get-HelpAsMarkDown `
    -Title UncommonSense.PowerShell.Utils `
    -Commands (Get-Command -Module UncommonSense.PowerShell.Utils) `
    -Description 'PowerShell utility cmdlets' | Out-File -FilePath (Join-Path $PSScriptRoot README.md) -Encoding utf8