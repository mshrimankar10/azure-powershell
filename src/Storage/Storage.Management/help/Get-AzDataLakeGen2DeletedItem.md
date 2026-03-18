---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azdatalakegen2deleteditem
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzDataLakeGen2DeletedItem

## SYNOPSIS

List all deleted files or directories from a directory or filesystem root.

## SYNTAX

### Default (Default)

```
Get-AzDataLakeGen2DeletedItem [-FileSystem] <String> [[-Path] <String>] [-MaxCount <Int32>]
 [-ContinuationToken <String>] [-AsJob] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzDataLakeGen2DeletedItem [-FileSystem] <string> [[-Path] <string>] [-MaxCount <int>]
 [-ContinuationToken <string>] [-AsJob] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzDataLakeGen2DeletedItem** cmdlet lists all deleted files or directories from a directory or filesystem in an Azure storage account.
This cmdlet only works if Hierarchical Namespace is enabled for the Storage account. This kind of account can be created by run "New-AzStorageAccount" cmdlet with "-EnableHierarchicalNamespace $true".

## EXAMPLES

### Example 1: List all deleted files or directories from a Filesystem

```powershell
Get-AzDataLakeGen2DeletedItem -FileSystem "filesystem1"
```

```output
FileSystem Name: filesystem1

Path                 DeletionId           DeletedOn            RemainingRetentionDays
----                 ----------           ---------            ----------------------
dir0/dir1/file1      132658816156507617   2021-05-19 07:06:55Z 3
dir0/dir2            132658834541610122   2021-05-19 07:37:34Z 3
dir0/dir2/file3      132658834534174806   2021-05-19 07:37:33Z 3
```

This command lists all deleted files or directories from a Filesystem.

### Example 2: List all deleted files or directories from a directory

```powershell
Get-AzDataLakeGen2DeletedItem -FileSystem "filesystem1" -Path dir0/dir2
```

```output
FileSystem Name: filesystem1

Path                 DeletionId           DeletedOn            RemainingRetentionDays
----                 ----------           ---------            ----------------------
dir0/dir2            132658834541610122   2021-05-19 07:37:34Z 3
dir0/dir2/file3      132658834534174806   2021-05-19 07:37:33Z 3
```

This command lists all deleted files or directories from a directory.

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

### -ContinuationToken

Continuation Token.

```yaml
Type: System.String
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

### -FileSystem

FileSystem name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -MaxCount

The max count of the blobs that can return.

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

### -Path

The path in the specified FileSystem that should be retrieved.
Can be a directory In the format 'directory1/directory2/', Skip set this parameter to list items from root directory of the Filesystem.
The path in the specified FileSystem that should be retrieved. Can be a directory In the format 'directory1/directory2/', Skip set this parameter to list items from root directory of the Filesystem.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: true
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

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureDataLakeGen2DeletedItem

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

