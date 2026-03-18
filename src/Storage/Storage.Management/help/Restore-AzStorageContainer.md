---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/restore-azstoragecontainer
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Restore-AzStorageContainer

## SYNOPSIS

Restores a previously deleted Azure storage blob container.

## SYNTAX

### Default (Default)

```
Restore-AzStorageContainer [-Name] <String> [-VersionId] <String> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### __AllParameterSets

```
Restore-AzStorageContainer [-Name] <string> [-VersionId] <string> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Restore-AzStorageContainer** cmdlet restores a previously deleted Azure storage blob container.
This cmdlet only works after enabled Container softdelete with Enable-AzStorageBlobDeleteRetentionPolicy.

## EXAMPLES

### Example 1: List containers include deleted containers, and restore all deleted containers with pipeline

```powershell
Get-AzStorageContainer -IncludeDeleted -Context $ctx | Where-Object { $_.IsDeleted } | Restore-AzStorageContainer
```

```output
Storage Account Name: storageaccountname

Name                 PublicAccess         LastModified                   IsDeleted  VersionId
----                 ------------         ------------                   ---------  ---------
container1           Off
container2           Off
```

This command lists all containers include deleted containers, filter out all the deleted containers, then restore all deleted container to the same container name with pipeline.

### Example 2: Restore a single deleted container

<!-- Skip: Output cannot be splitted from code -->


```
Get-AzStorageContainer -IncludeDeleted -Context $ctx | Where-Object { $_.IsDeleted }

   Storage Account Name: storageaccountname

Name                 PublicAccess         LastModified                   IsDeleted  VersionId
----                 ------------         ------------                   ---------  ---------
container1                                8/28/2020 10:18:13 AM +00:00   True       01D685BC91A88F22
container2                                9/4/2020 12:52:37 PM +00:00    True       01D67D248986B6DA

Restore-AzStorageContainer -Name container1 -VersionId 01D685BC91A88F22 -Context $ctx

   Storage Account Name: storageaccountname

Name                 PublicAccess         LastModified                   IsDeleted  VersionId
----                 ------------         ------------                   ---------  ---------
container1           Off
```

This first command lists all containers and filter out deleted containers.
The secondary command restores a deleted container by manually input the parameters.

## PARAMETERS

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

### -Name

The name of the previously deleted container.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- Container
- DeletedContainerName
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -VersionId

The version of the previously deleted container.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- 'DeletedContainerVersion, '
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

