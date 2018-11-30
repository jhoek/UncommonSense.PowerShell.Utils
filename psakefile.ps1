Properties {
    $ModuleName = Get-ChildItem -Path "$PSScriptRoot/*.psd1" | Select-Object -First 1 -ExpandProperty BaseName
    $ManifestPath = Get-ChildItem -Path "$PSScriptRoot/*.psd1" | Select-Object -First 1 -ExpandProperty FullName
    $PublicFunctions = Get-ChildItem -Path "$PSScriptRoot/Public/*.ps1" | Select-Object -ExpandProperty BaseName
}

Task Default -Depends UpdateExportedFunctions, UpdateReadMe

Task UpdateExportedFunctions {
    Update-ModuleManifest -Path $ManifestPath -FunctionsToExport $PublicFunctions
}

Task UpdateReadMe {
    Import-Module (Join-Path $PSScriptRoot UncommonSense.PowerShell.Utils.psd1) -Force

    Convert-HelpToMarkdown `
        -Title $ModuleName `
        -Commands (Get-Command -Module $ModuleName) `
        -Description 'PowerShell utility cmdlets' |
        Out-File -FilePath (Join-Path $PSScriptRoot README.md) -Encoding utf8
}

Task BumpVersionNo {
    Update-ModuleManifest -Path $ManifestPath -ModuleVersion (Get-ModuleVersion -Path $ManifestPath | Step-ModuleVersion -By Build)
}

Task Publish -Depends BumpVersionNo, UpdateExportedFunctions, UpdateReadMe {
    Publish-Module -Path . -NuGetApiKey $env:NuGetApiKey
}