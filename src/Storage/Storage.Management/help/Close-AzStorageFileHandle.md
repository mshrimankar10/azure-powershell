---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/close-azstoragefilehandle
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Close-AzStorageFileHandle

## SYNOPSIS

Closes file handles of a file share, a file directory or a file.

## SYNTAX

### ShareNameCloseAll (Default)

```
Close-AzStorageFileHandle [-ShareName] <string> [[-Path] <string>] -CloseAll [-Recursive]
 [-DisAllowTrailingDot] [-PassThru] [-AsJob] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ShareNameCloseSingle

```
Close-AzStorageFileHandle [-ShareName] <string> -FileHandle <PSFileHandle> [-DisAllowTrailingDot]
 [-PassThru] [-AsJob] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ShareCloseAll

```
Close-AzStorageFileHandle [-ShareClient] <ShareClient> [[-Path] <string>] -CloseAll [-Recursive]
 [-PassThru] [-AsJob] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ShareCloseSingle

```
Close-AzStorageFileHandle [-ShareClient] <ShareClient> -FileHandle <PSFileHandle> [-PassThru]
 [-AsJob] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### DirectoryCloseAll

```
Close-AzStorageFileHandle [-ShareDirectoryClient] <ShareDirectoryClient> [[-Path] <string>]
 -CloseAll [-Recursive] [-PassThru] [-AsJob] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### FileCloseAll

```
Close-AzStorageFileHandle [-ShareFileClient] <ShareFileClient> -CloseAll [-PassThru] [-AsJob]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Close-AzStorageFileHandle** cmdlet closes file handles of a  file share, or file directory or a file.

## EXAMPLES

### Example 1: Close all file handles on a file

```powershell
Close-AzStorageFileHandle -ShareName "mysharename" -Path 'dir1/dir2/test.txt' -CloseAll
```

This command closes all file handles on a file.

### Example 2: Close all file handles which is opened 1 day ago on a file directory

```powershell
Get-AzStorageFileHandle -ShareName "mysharename" -Path 'dir1/dir2' -Recursive | Where-Object {$_.OpenTime.DateTime.AddDays(1) -lt (Get-Date)} | Close-AzStorageFileHandle -ShareName "mysharename"
```

This command lists all file handles on a file directory recursively, filters out the handles which are opened 1 day ago, and then closes them.

### Example 3: Close all file handles on a file directory recursively and show the closed file handle count

```powershell
Close-AzStorageFileHandle -ShareName "mysharename" -Path 'dir1/dir2' -Recursive -CloseAll -PassThru
```

```output
10
```

This command closes all file handles on a file directory and shows the closed file handle count.

### Example 4: Close all file handles on a file share

```powershell
Close-AzStorageFileHandle -ShareName "mysharename" -CloseAll -Recursive
```

This command closes all file handles on a specific file share recursively.

## PARAMETERS

### -AsJob

Run cmdlet in the background

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

### -CloseAll

Force close all File handles.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareNameCloseAll
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareCloseAll
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirectoryCloseAll
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FileCloseAll
  Position: Named
  IsRequired: true
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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases:
- cf
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
- Name: ShareNameCloseAll
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareNameCloseSingle
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FileHandle

The File Handle to close.

```yaml
Type: Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSFileHandle
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareNameCloseSingle
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareCloseSingle
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PassThru

Return the count of closed file handles.

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
- Name: ShareNameCloseAll
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareCloseAll
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirectoryCloseAll
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
Closed handles Recursively. Only works on File Directory.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareNameCloseAll
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareCloseAll
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirectoryCloseAll
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

ShareClient object indicated the share which contains the files/directories to closed handle.

```yaml
Type: Azure.Storage.Files.Shares.ShareClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareCloseAll
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ShareCloseSingle
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

ShareDirectoryClient object indicated the base folder which contains the files/directories to closed handle.

```yaml
Type: Azure.Storage.Files.Shares.ShareDirectoryClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DirectoryCloseAll
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

ShareFileClient object indicated the file to close handle.

```yaml
Type: Azure.Storage.Files.Shares.ShareFileClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: FileCloseAll
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareName

Name of the file share where the files/directories would be listed.
Name of the file share which contains the files/directories to closed handle.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareNameCloseAll
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareNameCloseSingle
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.
Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases:
- wi
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

### Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSFileHandle

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.Int32

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

