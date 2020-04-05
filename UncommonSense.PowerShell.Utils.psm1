$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
Foreach ($import in @($Private + $Public))
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

Register-ArgumentCompleter -CommandName 'Reset-Module' -ParameterName Name -ScriptBlock {
    param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)

    Get-Module -ListAvailable `
    | Where-Object Name -like "$WordToComplete*" `
    | ForEach-Object { "'$_'" }
}