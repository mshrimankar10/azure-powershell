---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragetablestoredaccesspolicy
Module Name: Az.Storage
ms.assetid: BF5526C1-11B9-47A8-A5A6-CB275B470A9E
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageTableStoredAccessPolicy

## SYNOPSIS

Gets the stored access policy or policies for an Azure storage table.

## SYNTAX

### Default (Default)

```
Get-AzStorageTableStoredAccessPolicy [-Table] <String> [[-Policy] <String>]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzStorageTableStoredAccessPolicy [-Table] <string> [[-Policy] <string>]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageTableStoredAccessPolicy** cmdlet lists the stored access policy or policies for an Azure storage table.

## EXAMPLES

### Example 1: Get a stored access policy in a storage table

```powershell
Get-AzStorageTableStoredAccessPolicy -Table "Table02" -Policy "Policy50"
```

This command gets the access policy named Policy50 in the storage table named Table02.

### Example 2: Get all stored access policies in a storage table

```powershell
Get-AzStorageTableStoredAccessPolicy -Table "Table02"
```

This command gets all access policies in the table named Table02.

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

### -Table

Specifies the Azure storage table name.
Table Name

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

### Microsoft.WindowsAzure.Storage.Table.SharedAccessTablePolicy

### Microsoft.Azure.Cosmos.Table.SharedAccessTablePolicy

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

- [New-AzStorageTableStoredAccessPolicy](./New-AzStorageTableStoredAccessPolicy.md)
- [Remove-AzStorageTableStoredAccessPolicy](./Remove-AzStorageTableStoredAccessPolicy.md)
- [Set-AzStorageTableStoredAccessPolicy](./Set-AzStorageTableStoredAccessPolicy.md)
- [New-AzStorageContext](./New-AzStorageContext.md)
