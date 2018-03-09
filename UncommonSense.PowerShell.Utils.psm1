. (Join-Path -Path $PSScriptRoot -ChildPath Find-Application.ps1)
. (Join-Path -Path $PSScriptRoot -ChildPath Find-InFiles.ps1)
. (Join-Path -Path $PSScriptRoot -ChildPath Format-Object.ps1)
. (Join-Path -Path $PSScriptRoot -ChildPath Format-HashTable.ps1)
. (Join-Path -Path $PSScriptRoot -ChildPath Get-ValueOrDefault.ps1)
. (Join-Path -Path $PSScriptRoot -ChildPath Get-ContiguousRange.ps1)

Set-Alias -Name which -Value Find-Application
Set-Alias -Name grep -Value Find-InFiles

Export-ModuleMember `
    -Function Find-Application, Find-InFiles, Format-Object, Format-HashTable, Get-ValueOrDefault, Get-ContiguousRange `
    -Alias which, grep



