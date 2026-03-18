---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azdatalakegen2childitem
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzDataLakeGen2ChildItem

## SYNOPSIS

Lists sub directories and files from a directory or filesystem root.

## SYNTAX

### Default (Default)

```
Get-AzDataLakeGen2ChildItem [-FileSystem] <String> [[-Path] <String>] [-FetchProperty] [-Recurse]
 [-MaxCount <Int32>] [-ContinuationToken <String>] [-AsJob] [-OutputUserPrincipalName]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzDataLakeGen2ChildItem [-FileSystem] <string> [[-Path] <string>] [-FetchProperty] [-Recurse]
 [-MaxCount <int>] [-ContinuationToken <string>] [-AsJob] [-OutputUserPrincipalName]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzDataLakeGen2ChildItem** cmdlet lists sub directories and files in a directory or Filesystem in an Azure storage account.
This cmdlet only works if Hierarchical Namespace is enabled for the Storage account. This kind of account can be created by run "New-AzStorageAccount" cmdlet with "-EnableHierarchicalNamespace $true".

## EXAMPLES

### Example 1: List the direct sub items from a Filesystem

```powershell
Get-AzDataLakeGen2ChildItem -FileSystem "filesystem1"
```

```output
FileSystem Name: filesystem1

Path                 IsDirectory  Length          LastModified         Permissions  Owner                Group
----                 -----------  ------          ------------         -----------  -----                -----
dir1                 True                         2020-03-13 13:07:34Z rwxr-x---    $superuser           $superuser
dir2                 True                         2020-03-23 09:28:36Z rwxr-x---    $superuser           $superuser
```

This command lists the direct sub items from a Filesystem

### Example 2: List recursively from a directory, and fetch Properties/ACL

```powershell
Get-AzDataLakeGen2ChildItem -FileSystem "filesystem1" -Path "dir1/" -Recurse -FetchProperty
```

```output
FileSystem Name: filesystem1

Path                 IsDirectory  Length          LastModified         Permissions  Owner                Group
----                 -----------  ------          ------------         -----------  -----                -----
dir1/dir3            True                         2020-03-23 09:34:31Z rwx---rwx    $superuser           $superuser
dir1/file1           False        1024            2020-03-23 09:29:18Z rwx---rwx    $superuser           $superuser
dir1/testfile_1K_0   False        1024            2020-03-23 09:29:21Z rw-r-----    $superuser           $superuser
```

This command lists the direct sub items from a Filesystem

### Example 3: List items recursively from a Filesystem in multiple batches

```powershell
$MaxReturn = 1000
$FileSystemName = "filesystem1"
$Total = 0
$Token = $Null
do
 {
     $items = Get-AzDataLakeGen2ChildItem -FileSystem $FileSystemName -Recurse -MaxCount $MaxReturn  -ContinuationToken $Token
     $Total += $items.Count
     if($items.Length -le 0) { Break;}
     $Token = $items[$items.Count -1].ContinuationToken;
 }
 While ($null -ne $Token)
Echo "Total $Total items in Filesystem $FileSystemName"
```

This example uses the *MaxCount* and *ContinuationToken* parameters to list items recursively from a Filesystem in multiple batches.
A small *MaxCount* can limit the number of items returned from a single request, may help prevent operation timeout errors, and reduce the memory usage of PowerShell.
The first four commands assign values to variables to use in the example.
The fifth command specifies a **Do-While** statement that uses the **Get-AzDataLakeGen2ChildItem** cmdlet to list items.
The statement includes the continuation token stored in the $Token variable.
$Token changes value as the loop runs.
The final command uses the **Echo** command to display the total.

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

### -FetchProperty

Fetch the datalake item properties and ACL.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases:
- FetchPermission
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

### -OutputUserPrincipalName

If specify this parameter, the user identity values returned in the owner and group fields of each list entry will be transformed from Microsoft Entra Object IDs to User Principal Names. If not specify this parameter, the values will be returned as Microsoft Entra Object IDs. Note that group and application Object IDs are not translated because they do not have unique friendly names.
If you specify this parameter, the user identity values returned in the owner and group fields of each list entry will be transformed from Microsoft Entra Object IDs to User Principal Names. If you do not specify this parameter, the values will be returned as Microsoft Entra Object IDs. Note that group and application Object IDs are not translated because they do not have unique friendly names.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases:
- UserPrincipalName
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

The path in the specified Filesystem that should be retrieved.
Should be a directory, in the format 'directory1/directory2/'.
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

### -Recurse

Indicates if will recursively get the Child Item.
The default is false.
Indicates if will recursively get the Child Item. The default is false.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureDataLakeGen2Item

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

