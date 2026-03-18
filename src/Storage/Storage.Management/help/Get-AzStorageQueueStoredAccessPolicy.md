---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragequeuestoredaccesspolicy
Module Name: Az.Storage
ms.assetid: F1EC601C-3ADD-402A-A5F7-84A95D312187
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageQueueStoredAccessPolicy

## SYNOPSIS

Gets the stored access policy or policies for an Azure storage queue.

## SYNTAX

### Default (Default)

```
Get-AzStorageQueueStoredAccessPolicy [-Queue] <String> [[-Policy] <String>]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzStorageQueueStoredAccessPolicy [-Queue] <string> [[-Policy] <string>]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageQueueStoredAccessPolicy** cmdlet lists the stored access policy or policies for an Azure storage queue.

## EXAMPLES

### Example 1: Get a stored access policy in the queue

```powershell
Get-AzStorageQueueStoredAccessPolicy -Queue "MyQueue" -Policy "Policy12"
```

This command gets the access policy named Policy12 in the storage queue named MyQueue.

### Example 2: Get all stored access policies in the queue

```powershell
Get-AzStorageQueueStoredAccessPolicy -Queue "MyQueue"
```

This command gets all stored access policies in the queue named MyQueue.

## PARAMETERS

### -Context

Specifies the Azure storage context.
To obtain a storage context, use the New-AzStorageContext cmdlet.
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

### -Policy

Specifies a stored access policy, which includes the permissions for this Shared Access Signature (SAS) token.
Policy Identifier

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Queue

Specifies the Azure storage queue name.
Queue Name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- Name
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

- [New-AzStorageQueueStoredAccessPolicy](./New-AzStorageQueueStoredAccessPolicy.md)
- [Remove-AzStorageQueueStoredAccessPolicy](./Remove-AzStorageQueueStoredAccessPolicy.md)
- [Set-AzStorageQueueStoredAccessPolicy](./Set-AzStorageQueueStoredAccessPolicy.md)
- [New-AzStorageContext](./New-AzStorageContext.md)
