---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragefilehandle
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageFileHandle

## SYNOPSIS

Lists file handles of a file share, a file directory or a file.

## SYNTAX

### ShareName (Default)

```
Get-AzStorageFileHandle [-ShareName] <string> [[-Path] <string>] [-Recursive] [-DisAllowTrailingDot]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-IncludeTotalCount]
 [-Skip <ulong>] [-First <ulong>] [<CommonParameters>]
```

### Share

```
Get-AzStorageFileHandle [-ShareClient] <ShareClient> [[-Path] <string>] [-Recursive]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-IncludeTotalCount]
 [-Skip <ulong>] [-First <ulong>] [<CommonParameters>]
```

### Directory

```
Get-AzStorageFileHandle [-ShareDirectoryClient] <ShareDirectoryClient> [[-Path] <string>]
 [-Recursive] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-IncludeTotalCount] [-Skip <ulong>] [-First <ulong>]
 [<CommonParameters>]
```

### File

```
Get-AzStorageFileHandle [-ShareFileClient <ShareFileClient>] [-Recursive]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-IncludeTotalCount]
 [-Skip <ulong>] [-First <ulong>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageFileHandle** cmdlet lists file handles of a  file share, or file directory or a file.

## EXAMPLES

### Example 1: List all file handles on a file share recursively, and sort by ClientIp and OpenTime

```powershell
Get-AzStorageFileHandle -ShareName "mysharename" -Recursive | Sort-Object ClientIP,OpenTime
```

```output
HandleId    Path                  ClientIp       ClientPort OpenTime             LastReconnectTime FileId               ParentId SessionId           ClientName
--------    ----                  --------       ---------- --------             ----------------- ------               -------- ---------           ----------
28506980357                       104.46.105.229 49805      2019-07-29 08:37:36Z                   0                    0        9297571480349046273 myclientvm
28506980537 dir1                  104.46.105.229 49805      2019-07-30 09:28:48Z                   10376363910205800448 0        9297571480349046273 myclientvm
28506980538 dir1                  104.46.105.229 49805      2019-07-30 09:28:48Z                   10376363910205800448 0        9297571480349046273 myclientvm
28582543365                       104.46.119.170 51675      2019-07-30 09:29:32Z                   0                    0        9477733061320772929 myclientvm
28582543375 dir1                  104.46.119.170 51675      2019-07-30 09:29:38Z                   10376363910205800448 0        9477733061320772929 myclientvm
28582543376 dir1                  104.46.119.170 51675      2019-07-30 09:29:38Z                   10376363910205800448 0        9477733061320772929 myclientvm
```

This command lists file handles on a file share, and sort the output by ClientIp, then by OpenTime.

### Example 2: List first 2 file handles on a file directory recursively

```powershell
Get-AzStorageFileHandle -ShareName "mysharename" -Path 'dir1/dir2'  -Recursive -First 2
```

```output
HandleId    Path      ClientIp       ClientPort OpenTime             LastReconnectTime FileId               ParentId             SessionId           ClientName
--------    ----      --------       ---------- --------             ----------------- ------               --------             ---------           ----------
24057151779 dir1/dir2 104.46.105.229 50861      2019-06-18 07:39:23Z                   16140971433240035328 11529285414812647424 9549812641162070049 myclientvm
24057151780 dir1/dir2 104.46.105.229 50861      2019-06-18 07:39:23Z                   16140971433240035328 11529285414812647424 9549812641162070049 myclientvm
```

This command lists first 2 file handles on a file directory recursively .

### Example 3: List the 3rd to the 6th file handles on a file

```powershell
Get-AzStorageFileHandle -ShareName "mysharename" -Path 'dir1/dir2/test.txt' -skip 2 -First 4
```

```output
HandleId    Path               ClientIp       ClientPort OpenTime             LastReconnectTime FileId              ParentId             SessionId           ClientName
--------    ----               --------       ---------- --------             ----------------- ------              --------             ---------           ----------
24055513248 dir1/dir2/test.txt 104.46.105.229 49817      2019-06-18 08:21:59Z                   9223407221226864640 16140971433240035328 9338416139169958321 myclientvm
24055513249 dir1/dir2/test.txt 104.46.105.229 49817      2019-06-18 08:21:59Z                   9223407221226864640 16140971433240035328 9338416139169958321 myclientvm
24055513252 dir1/dir2/test.txt 104.46.105.229 49964      2019-06-18 08:22:54Z                   9223407221226864640 16140971433240035328 9338416138431762125 myclientvm
24055513253 dir1/dir2/test.txt 104.46.105.229 49964      2019-06-18 08:22:54Z                   9223407221226864640 16140971433240035328 9338416138431762125 myclientvm
```

This command lists the 3rd to the 6th file handles on a file.

## PARAMETERS

### -ClientTimeoutPerRequest

The client side maximum execution time for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: None
SupportsWildcards: false
Aliases:
- ClientTimeoutPerRequestInSeconds
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ConcurrentTaskCount

The total amount of concurrent async tasks.
The default value is 10.
The total amount of concurrent async tasks. The default value is 10.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Context

Azure Storage Context Object

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DefaultProfile

The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
DefaultValue: None
SupportsWildcards: false
Aliases:
- AzureRmContext
- AzureCredential
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DisAllowTrailingDot

Disallow trailing dot (.) to suffix directory and file names.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -First

Gets only the first 'n' objects.

```yaml
Type: System.UInt64
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IncludeTotalCount

Reports the number of objects in the data set (an integer) followed by the objects. If the cmdlet cannot determine the total count, it returns 'Unknown total count'.
Currently, this parameter does nothing.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

Path to an existing file/directory.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Directory
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Share
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Recursive

List handles Recursively.
Only works on File Directory.
List handles Recursively. Only works on File Directory.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ServerTimeoutPerRequest

The server time out for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: None
SupportsWildcards: false
Aliases:
- ServerTimeoutPerRequestInSeconds
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareClient

ShareClient object indicated the share where the files/directories would list File Handles

```yaml
Type: Azure.Storage.Files.Shares.ShareClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Share
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareDirectoryClient

ShareDirectoryClient object indicated the base folder where the files/directories would list File Handles

```yaml
Type: Azure.Storage.Files.Shares.ShareDirectoryClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Directory
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareFileClient

ShareFileClient object indicated the file to list File Handles.

```yaml
Type: Azure.Storage.Files.Shares.ShareFileClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: File
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareName

Name of the file share where the files/directories would be listed.
Name of the file share where the files/directories would list File Handles.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Skip

Ignores the first 'n' objects and then gets the remaining objects.

```yaml
Type: System.UInt64
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Azure.Storage.Files.Shares.ShareClient

### Azure.Storage.Files.Shares.ShareDirectoryClient

### Azure.Storage.Files.Shares.ShareFileClient

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSFileHandle

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

