function Find-InFiles 
{
    param
    (
        [Parameter(Mandatory, Position = 1)]
        [string]$Pattern,
        
        [ValidateNotNullOrEmpty()]
        $Path = $Pwd,

        [string]$Filter = '*.*',

        [Switch]$Recurse,

        [int[]]$Context = 0
    )

    Get-ChildItem -Path $Path -Filter $Filter -Recurse:$Recurse | 
        Select-String -Pattern $Pattern -Context $Context | 
        Format-Table -AutoSize -Property Path, LineNumber, Line 
}
