function Get-FriendlyTypeName 
{
    [OutputType([string])]
    param    
    (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [Type[]]$Type,

        [ValidateNotNullOrEmpty()]
        [string]$NullableFormat = '[Nullable[{0}]]',

        [ValidateNotNullOrEmpty()]
        [string]$GenericFormat = '{0}[{1}]',

        [ValidateNotNullOrEmpty()]
        [string]$ArrayFormat = '{0}[]'
    )

    begin
    {
        $PrimitiveTypes = @{
            [object]  = 'object'
            [bool]    = 'bool'
            [byte]    = 'byte'
            [char]    = 'char'
            [decimal] = 'decimal'
            [double]  = 'double'
            [float]   = 'float'
            [int]     = 'int'
            [long]    = 'long'
            [sbyte]   = 'sbyte'
            [short]   = 'short'
            [string]  = 'string'
            [uint]    = 'uint'            
            [ushort]  = 'ushort'
            [ulong]   = 'ulong'
            [void]    = 'void'
        }
    }
    process    
    {
        $Type.ForEach{
            $CurrentType = $_

            switch ($true)
            {
                $PrimitiveTypes.ContainsKey($CurrentType)
                {
                    $PrimitiveTypes[$CurrentType]
                    break
                }

                ($CurrentType.IsArray) 
                {
                    $ArrayFormat -f ($CurrentType.GetElementType() | Get-FriendlyTypeName)
                    break
                }

                (Test-NullableType -Type $CurrentType)
                {
                    $NullableFormat -f ($CurrentType.GetGenericArguments() | Get-FriendlyTypeName)
                    break
                }

                ($CurrentType.IsGenericType) 
                {
                    $BaseName = $CurrentType.Name -replace '`.*$', ''
                    $Parameters = $CurrentType.GetGenericArguments() | Get-FriendlyTypeName
                    ($GenericFormat -f $BaseName, $Parameters)
                    break
                }

                default 
                { 
                    $CurrentType.Name 
                }
            }
        }
    }
}