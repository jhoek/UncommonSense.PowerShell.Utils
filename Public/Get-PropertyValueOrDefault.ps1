function Get-PropertyValueOrDefault {
    [Alias('?.')]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline)]
        [AllowNull()]
        [object[]]$Object,

        [Parameter(Mandatory, Position = 0)]
        [string]$PropertyName,

        [Parameter(Position = 1)]
        [object]$DefaultValue = $null
    )

    process {
        foreach ($Item in $Object) {
            if ($Item -eq $null) {
                $DefaultValue
            }
            if ($Item | Get-Member -MemberType NoteProperty, Property -Name $PropertyName) {
                $Item.$PropertyName
            }
            else {
                $DefaultValue
            }
        }
    }
}