function Test-NullableType
{
    [OutputType([bool])]
    param    
    (
        [Parameter(Mandatory, Position = 0)]
        [Type]$Type
    )    

    if ($Type.IsGenericType)
    {
        $Type.GetGenericTypeDefinition() -eq [Nullable`1]
    }
    else 
    {
        $false    
    }
}
