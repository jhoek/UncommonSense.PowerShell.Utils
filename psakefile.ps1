Properties {
    $ManifestPath = Get-ChildItem -Path "$PSScriptRoot/*.psd1" | Select-Object -First 1 -ExpandProperty FullName
    $PublicFunctions = Get-ChildItem -Path "$PSScriptRoot/Public/*.ps1" | Select-Object -ExpandProperty BaseName
}

Task Default -Depends UpdateManifest, UpdateReadMe

Task UpdateManifest {
    Update-ModuleManifest -Path $ManifestPath -FunctionsToExport $PublicFunctions
}

Task UpdateReadMe {
    .\Update-README.ps1
}