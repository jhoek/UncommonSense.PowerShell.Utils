# UncommonSense.PowerShell.Utils

PowerShell utility cmdlets

## Index

| Command | Synopsis |
| ------- | -------- |
| [Find-Application](#Find-Application) | Shows in which folder (in particular native) commands reside |
| [Find-InFiles](#Find-InFiles) | Find-InFiles [-Pattern] <string> [-Path <Object>] [-Filter <string>] [-Recurse] [-Context <int[]>] [<CommonParameters>] |
| [Format-HashTable](#Format-HashTable) | Format-HashTable [-HashTable] <IDictionary[]> [[-Indentation] <int>] [<CommonParameters>] |
| [Format-Object](#Format-Object) | Format-Object [-Caption] <string> [-Value] <Object> [[-Indentation] <int>] [<CommonParameters>] |
| [Get-ContiguousRange](#Get-ContiguousRange) | Get-ContiguousRange [-Items] <int[]> [[-RequiredLength] <int>] [<CommonParameters>] |
| [Get-ValueOrDefault](#Get-ValueOrDefault) |  |
| [Set-BreakOnError](#Set-BreakOnError) | Set-BreakOnError |

<a name="Find-Application"></a>
## Find-Application
### Synopsis
Shows in which folder (in particular native) commands reside
### Syntax
```powershell
Find-Application [-Command] <string> [<CommonParameters>]
```
### Parameters
#### Command &lt;String&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Find-InFiles"></a>
## Find-InFiles
### Synopsis
Find-InFiles [-Pattern] <string> [-Path <Object>] [-Filter <string>] [-Recurse] [-Context <int[]>] [<CommonParameters>]
### Syntax
```powershell
Find-InFiles [-Pattern] <string> [-Path <Object>] [-Filter <string>] [-Recurse] [-Context <int[]>] [<CommonParameters>]
```
### Parameters
#### Context &lt;int[]&gt;
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Filter &lt;string&gt;
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Path &lt;Object&gt;
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Pattern &lt;string&gt;
    
    Required?                    true
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Recurse
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Format-HashTable"></a>
## Format-HashTable
### Synopsis
Format-HashTable [-HashTable] <IDictionary[]> [[-Indentation] <int>] [<CommonParameters>]
### Syntax
```powershell
Format-HashTable [-HashTable] <IDictionary[]> [[-Indentation] <int>] [<CommonParameters>]
```
### Parameters
#### HashTable &lt;IDictionary[]&gt;
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       true (ByValue)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Indentation &lt;int&gt;
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Format-Object"></a>
## Format-Object
### Synopsis
Format-Object [-Caption] <string> [-Value] <Object> [[-Indentation] <int>] [<CommonParameters>]
### Syntax
```powershell
Format-Object [-Caption] <string> [-Value] <Object> [[-Indentation] <int>] [<CommonParameters>]
```
### Parameters
#### Caption &lt;string&gt;
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Indentation &lt;int&gt;
    
    Required?                    false
    Position?                    2
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Value &lt;Object&gt;
    
    Required?                    true
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Get-ContiguousRange"></a>
## Get-ContiguousRange
### Synopsis
Get-ContiguousRange [-Items] <int[]> [[-RequiredLength] <int>] [<CommonParameters>]
### Syntax
```powershell
Get-ContiguousRange [-Items] <int[]> [[-RequiredLength] <int>] [<CommonParameters>]
```
### Parameters
#### Items &lt;int[]&gt;
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### RequiredLength &lt;int&gt;
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Get-ValueOrDefault"></a>
## Get-ValueOrDefault
### Synopsis

### Syntax
```powershell
Get-ValueOrDefault [[-DefaultValue] <Object>] [-Value <Object>] [<CommonParameters>]
```
### Parameters
#### Value &lt;Object&gt;
    
    Required?                    false
    Position?                    named
    Default value                
    Accept pipeline input?       true (ByValue)
    Accept wildcard characters?  false
#### DefaultValue &lt;Object&gt;
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
### Examples
#### Example 1 
```powershell
('A' | ?? B) -eq "A" # returns True

```

#### Example 2 
```powershell
('' | ?? C) -eq 'C' # returns True

```

#### Example 3 
```powershell
($null | ?? D) -eq 'D' # returns True

```

#### Example 4 
```powershell
(1 | ?? 2) -eq 1 # returns True

```

#### Example 5 
```powershell
(0 | ?? 3) -eq 3 # returns True

```

#### Example 6 
```powershell
('A' -as [int] | ?? E) -eq 'E' # returns True

```

#### Example 7 
```powershell
($false | ?? F) -eq 'F' # returns True

```

#### Example 8 
```powershell
($true | ?? G) -eq $true # returns True

```

<a name="Set-BreakOnError"></a>
## Set-BreakOnError
### Synopsis
Set-BreakOnError
### Syntax
```powershell
Set-BreakOnError
```
### Parameters
<div style='font-size:small; color: #ccc'>Generated 14-03-2018 14:47</div>
