# UncommonSense.PowerShell.Utils

PowerShell utility cmdlets

## Index

| Command | Synopsis |
| ------- | -------- |
| [Find-Application](#Find-Application) | Shows in which folder the given (native) command resides |
| [Find-InFiles](#Find-InFiles) | Performs an (optionally recursive) file search based on a regular expression |
| [Find-UniqueFileName](#Find-UniqueFileName) | Find-UniqueFileName [-Path] <string> [[-MaxAttempts] <int>] [-CreateFile] [<CommonParameters>] |
| [Format-HashTable](#Format-HashTable) | Pretty-prints a (nested) hash table |
| [Format-Object](#Format-Object) | Pretty-prints a (nested) object |
| [Get-CommandInSameModule](#Get-CommandInSameModule) | Gets a list of commands that live in the same module as the given command. |
| [Get-ContiguousRange](#Get-ContiguousRange) | Returns the first item or all items of the first contiguous range of items of the specified length |
| [Get-DropboxPath](#Get-DropboxPath) | Get-DropboxPath |
| [Get-FormattedText](#Get-FormattedText) | Get-FormattedText [[-Text] <string[]>] [-BackgroundColor <string>] [-ForegroundColor <string>] [-BackgroundBright] [-ForegroundBright] [-Negative] [-Underline] [<CommonParameters>] |
| [Get-PropertyValueOrDefault](#Get-PropertyValueOrDefault) | Get-PropertyValueOrDefault [-PropertyName] <string> [[-DefaultValue] <Object>] -Object <Object[]> [<CommonParameters>] |
| [Get-ValueOrDefault](#Get-ValueOrDefault) | Returns the value that was passed in, or, if that value was null, blank, zero or empty, returns the specified default value.  If value may refer to an undefined element in an array or hashtable, wrap $Value in a scriptblock to prevent premature evaluation. |
| [Set-BreakOnError](#Set-BreakOnError) | Sets a breakpoint that causes the debugger to break on the first run-time error |
| [Split-Collection](#Split-Collection) | Splits a collection into chuncks of a given size |

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
<a name="Find-UniqueFileName"></a>
## Find-UniqueFileName
### Synopsis
Find-UniqueFileName [-Path] <string> [[-MaxAttempts] <int>] [-CreateFile] [<CommonParameters>]
### Syntax
```powershell
Find-UniqueFileName [-Path] <string> [[-MaxAttempts] <int>] [-CreateFile] [<CommonParameters>]
```
### Parameters
#### CreateFile
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### MaxAttempts &lt;int&gt;
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Path &lt;string&gt;
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
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
<a name="Get-CommandInSameModule"></a>
## Get-CommandInSameModule
### Synopsis
Gets a list of commands that live in the same module as the given command.
### Syntax
```powershell
Get-CommandInSameModule [-Name] <string> [<CommonParameters>]
```
### Parameters
#### Name &lt;String&gt;
    The name of the command whose sibling commands should be displayed
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-ContiguousRange"></a>
## Get-ContiguousRange
### Synopsis
Returns the first item or all items of the first contiguous range of items of the specified length
### Syntax
```powershell
Get-ContiguousRange [-Items] <int[]> [[-RequiredLength] <int>] [-ReturnAll] [<CommonParameters>]
```
### Parameters
#### Items &lt;Int32[]&gt;
    The items in which the contiguous range is to be found
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue)
    Accept wildcard characters?  false
#### RequiredLength &lt;Int32&gt;
    The required number of contiguous items
    
    Required?                    false
    Position?                    2
    Default value                1
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### ReturnAll [&lt;SwitchParameter&gt;]
    If true, all contiguous items are returned; if false, only the first item in the range is returned
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
### Examples
#### Example 1 
```powershell
1..20 | ForEach-Object { Get-ContiguousRange -Items (1..9 + 25..35 + 50..90) -RequiredLength $_ }

```


<a name="Get-DropboxPath"></a>
## Get-DropboxPath
### Synopsis
Get-DropboxPath
### Syntax
```powershell
Get-DropboxPath
```
### Parameters
<a name="Get-FormattedText"></a>
## Get-FormattedText
### Synopsis
Get-FormattedText [[-Text] <string[]>] [-BackgroundColor <string>] [-ForegroundColor <string>] [-BackgroundBright] [-ForegroundBright] [-Negative] [-Underline] [<CommonParameters>]
### Syntax
```powershell
Get-FormattedText [[-Text] <string[]>] [-BackgroundColor <string>] [-ForegroundColor <string>] [-BackgroundBright] [-ForegroundBright] [-Negative] [-Underline] [<CommonParameters>]
```
### Parameters
#### BackgroundBright
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### BackgroundColor &lt;string&gt;
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### ForegroundBright
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### ForegroundColor &lt;string&gt;
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Negative
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Text &lt;string[]&gt;
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       true (ByValue)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Underline
    
    Required?                    false
    Position?                    Named
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Get-PropertyValueOrDefault"></a>
## Get-PropertyValueOrDefault
### Synopsis
Get-PropertyValueOrDefault [-PropertyName] <string> [[-DefaultValue] <Object>] -Object <Object[]> [<CommonParameters>]
### Syntax
```powershell
Get-PropertyValueOrDefault [-PropertyName] <string> [[-DefaultValue] <Object>] -Object <Object[]> [<CommonParameters>]
```
### Parameters
#### DefaultValue &lt;Object&gt;
    
    Required?                    false
    Position?                    1
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### Object &lt;Object[]&gt;
    
    Required?                    true
    Position?                    Named
    Accept pipeline input?       true (ByValue)
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
#### PropertyName &lt;string&gt;
    
    Required?                    true
    Position?                    0
    Accept pipeline input?       false
    Parameter set name           (All)
    Aliases                      None
    Dynamic?                     false
<a name="Get-ValueOrDefault"></a>
## Get-ValueOrDefault
### Synopsis
Returns the value that was passed in, or, if that value was
null, blank, zero or empty, returns the specified default value.

If value may refer to an undefined element in an array or hashtable,
wrap $Value in a scriptblock to prevent premature evaluation.
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


#### Example 9 
```powershell
({ @()[3] } | ?? H) -eq 'H' # returns True

```


#### Example 10 
```powershell
({ @{}.Foo.Baz} | ?? I) -eq 'I' #returns True

```


<a name="Set-BreakOnError"></a>
## Set-BreakOnError
### Synopsis
Sets a breakpoint that causes the debugger to break on the first run-time error
### Syntax
```powershell
Set-BreakOnError
```
<a name="Split-Collection"></a>
## Split-Collection
### Synopsis
Splits a collection into chuncks of a given size
### Syntax
```powershell
Split-Collection [-Collection] <psobject[]> [-ChunkSize] <int> [<CommonParameters>]
```
### Parameters
#### Collection &lt;PSObject[]&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue)
    Accept wildcard characters?  false
#### ChunkSize &lt;Int32&gt;
    
    Required?                    true
    Position?                    2
    Default value                0
    Accept pipeline input?       false
    Accept wildcard characters?  false
### Examples
#### Example 1 
```powershell
$Collection = (65..90) | ForEach-Object { [char]$_ }

```

$Collection | Split-Collection -ChunkSize 3 | Select-Object -Skip 3 -First 1
#### Example 2 
```powershell
$Collection = (65..90) | ForEach-Object { [char]$_ }

```

Split-Collection -Collection $Collection -ChunkSize 5 | Select-Object -Skip 3 -First 1
#### Example 3 
```powershell
$EmptyCollection = @()

```

$EmptyCollection | Split-Collection -ChunkSize 2 | Measure-Object
<div style='font-size:small; color: #ccc'>Generated 16-12-2018 09:04</div>
