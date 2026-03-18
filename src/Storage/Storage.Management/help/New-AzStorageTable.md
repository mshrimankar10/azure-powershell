---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azstoragetable
Module Name: Az.Storage
ms.assetid: 3B4F32F3-51ED-4851-B38F-172658186C96
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageTable

## SYNOPSIS

Creates a storage table.

## SYNTAX

### Default (Default)

```
New-AzStorageTable [-Name] <String> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageTable [-Name] <string> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageTable** cmdlet creates a storage table associated with the storage account in Azure.

## EXAMPLES

### Example 1: Create an azure storage table

```powershell
New-AzStorageTable -Name "tableabc"
```

This command creates a storage table with a name of tableabc.

### Example 2: Create multiple azure storage tables

<!-- Skip: Output cannot be splitted from code -->


```
"table1 table2 table3".split() | New-AzStorageTable
```

This command creates multiple tables.
It uses the **Split** method of the .NET **String** class and then passes the names on the pipeline.

## PARAMETERS

### -Context

Specifies the storage context.
To create it, you can use the New-AzStorageContext cmdlet.
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

Specifies a name for the new table.
Table name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- Table
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

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageTable

## NOTES

## RELATED LINKS

- [Get-AzStorageTable](./Get-AzStorageTable.md)
- [Remove-AzStorageTable](./Remove-AzStorageTable.md)
