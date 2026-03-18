---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageusage
Module Name: Az.Storage
ms.assetid: 11AAA319-DDBB-4156-9BE7-4DE8B80A904C
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageUsage

## SYNOPSIS

Gets the Storage resource usage of the current subscription.

## SYNTAX

### Default (Default)

```
Get-AzStorageUsage -Location <String> [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzStorageUsage -Location <string> [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageUsage** cmdlet gets the resource usage for Azure Storage for the current subscription.

## EXAMPLES

### Example 1: Get the storage resources usage of specified location

```powershell
Get-AzStorageUsage -Location 'West US'
```

```output
LocalizedName : Storage Accounts
Name          : StorageAccounts
Unit          : Count
CurrentValue  : 18
Limit         : 250
```

This command gets the Storage resources usage of specified location under the current subscription.

## PARAMETERS

### -DefaultProfile

The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
DefaultValue: None
SupportsWildcards: false
Aliases:
- AzContext
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

### -Location

Indicate to get Storage resources usage on the specified location.
If not specified, will get Storage resources usage on all locations under the subscription.
Storage Accounts Location.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
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

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSUsage

## NOTES

## RELATED LINKS

- [Azure Storage Manager Cmdlets](./Az.Storage.md)
