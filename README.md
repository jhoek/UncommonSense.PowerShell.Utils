# UncommonSense.PowerShell.Utils

PowerShell utility cmdlets

## Index

| Command | Synopsis |
| ------- | -------- |
| [Find-Application](#Find-Application) | Shows in which folder the given (native) command resides |
| [Find-InFiles](#Find-InFiles) | Performs an (optionally recursive) file search based on a regular expression |
| [Format-HashTable](#Format-HashTable) | Pretty-prints a (nested) hash table |
| [Format-Object](#Format-Object) | Pretty-prints a (nested) object |
| [Get-ContiguousRange](#Get-ContiguousRange) | Returns the first item of the first contiguous range of items of the specified length |
| [Get-ValueOrDefault](#Get-ValueOrDefault) | Returns the value that was passed in, or, if that value was null, blank, zero or empty, returns the specified default value |
| [Set-BreakOnError](#Set-BreakOnError) | Sets a breakpoint that causes the debugger to break on the first run-time error |

<a name="Find-Application"></a>
## Find-Application
### Synopsis
Shows in which folder the given (native) command resides
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
Performs an (optionally recursive) file search based on a regular expression
### Syntax
```powershell
Find-InFiles [-Pattern] <string> [-Path <Object>] [-Filter <string>] [-Recurse] [-Context <int[]>] [<CommonParameters>]
```
### Parameters
#### Pattern &lt;String&gt;
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Path &lt;Object&gt;
    
    Required?                    false
    Position?                    named
    Default value                $Pwd
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Filter &lt;String&gt;
    
    Required?                    false
    Position?                    named
    Default value                *.*
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Recurse [&lt;SwitchParameter&gt;]
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Context &lt;Int32[]&gt;
    
    Required?                    false
    Position?                    named
    Default value                0
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Format-HashTable"></a>
## Format-HashTable
### Synopsis
Pretty-prints a (nested) hash table
### Syntax
```powershell
Format-HashTable [-HashTable] <IDictionary[]> [[-Indentation] <int>] [<CommonParameters>]
```
### Parameters
#### HashTable &lt;IDictionary[]&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue)
    Accept wildcard characters?  false
#### Indentation &lt;Int32&gt;
    
    Required?                    false
    Position?                    2
    Default value                0
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Format-Object"></a>
## Format-Object
### Synopsis
Pretty-prints a (nested) object
### Syntax
```powershell
Format-Object [-Caption] <string> [-Value] <Object> [[-Indentation] <int>] [<CommonParameters>]
```
### Parameters
#### Caption &lt;String&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Value &lt;Object&gt;
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Indentation &lt;Int32&gt;
    
    Required?                    false
    Position?                    3
    Default value                0
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-ContiguousRange"></a>
## Get-ContiguousRange
### Synopsis
Returns the first item of the first contiguous range of items of the specified length
### Syntax
```powershell
Get-ContiguousRange [-Items] <int[]> [[-RequiredLength] <int>] [<CommonParameters>]
```
### Parameters
#### Items &lt;Int32[]&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### RequiredLength &lt;Int32&gt;
    
    Required?                    false
    Position?                    2
    Default value                1
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-ValueOrDefault"></a>
## Get-ValueOrDefault
### Synopsis
Returns the value that was passed in, or, if that value was
null, blank, zero or empty, returns the specified default value
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
Sets a breakpoint that causes the debugger to break on the first run-time error
### Syntax
```powershell
Set-BreakOnError
```
<div style='font-size:small; color: #ccc'>Generated 14-03-2018 15:34</div>
