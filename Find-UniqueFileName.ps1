function Find-UniqueFileName
{
    param
    (
        [Parameter(Mandatory)][string]$Path,
        [ValidateRange(1, [int]::MaxValue)][int]$MaxAttempts = 5,
        [switch]$CreateFile
    )

    $Path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    $Directory = Split-Path -Path $Path -Parent
    $BaseName = Split-Path -Path $Path -LeafBase
    $Extension = Split-Path -Path $Path -Extension

    for ($AttemptNo = 0; $AttemptNo -le $MaxAttempts; $AttemptNo++)
    {
        $Suffix = if ($AttemptNo -eq 0)
        {
            ''
        }
        else
        {
            " ($AttemptNo)"
        }

        $AttemptFileName = "$($BaseName)$($Suffix)$($Extension)"
        $AttemptPath = Join-Path -Path $Directory -ChildPath $AttemptFileName

        try
        {
            if (-not (Test-Path -Path $AttemptPath))
            {
                switch ($CreateFile)
                {
                    $true
                    {
                        New-Item -Path $AttemptPath -ItemType File
                        return 
                    }
                    default 
                    {
                        Write-Output $AttemptPath 
                        return
                    }
                }
            }
        }
        catch [System.IO.DirectoryNotFoundException]
        {
            throw
        }
        catch [System.IO.DriveNotFoundException]
        {
            throw
        }
        catch [System.IO.IOException]
        {
            # Swallow other kinds of IO exceptions
        }
    }

    Write-Error("Unable to find a unique file name based on $Path within $MaxAttempts attempts.")
}