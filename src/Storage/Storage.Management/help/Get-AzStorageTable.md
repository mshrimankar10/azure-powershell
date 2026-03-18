---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragetable
Module Name: Az.Storage
ms.assetid: 4631D36F-926A-4279-AA4D-5F694C18081E
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageTable

## SYNOPSIS

Lists the storage tables.

## SYNTAX

### TableName (Default)

```
Get-AzStorageTable [[-Name] <String>] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### TablePrefix

```
Get-AzStorageTable -Prefix <String> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageTable** cmdlet lists the storage tables associated with the storage account in Azure.

## EXAMPLES

### Example 1: List all Azure Storage tables

```powershell
Get-AzStorageTable
```

This command gets all storage tables for a Storage account.

### Example 2: List Azure Storage tables using a wildcard character

```powershell
Get-AzStorageTable -Name table*
```

This command uses a wildcard character to get storage tables whose name starts with table.

### Example 3: List Azure Storage tables using table name prefix

```powershell
Get-AzStorageTable -Prefix "table"
```

This command uses the *Prefix* parameter to get storage tables whose name starts with table.

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

Specifies the table name.
If the table name is empty, the cmdlet lists all the tables.
Otherwise, it lists all tables that match the specified name or the regular name pattern.
Table name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: true
Aliases:
- N
- Table
ParameterSets:
- Name: TableName
  Position: 0
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Prefix

Specifies a prefix used in the name of the table or tables you want to get.
You can use this to find all tables that start with the same string, such as table.
Table Prefix

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: TablePrefix
  Position: Named
  IsRequired: true
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

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageTable

## NOTES

## RELATED LINKS

- [New-AzStorageTable](./New-AzStorageTable.md)
- [Remove-AzStorageTable](./Remove-AzStorageTable.md)
