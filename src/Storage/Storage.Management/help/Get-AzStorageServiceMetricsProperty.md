---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageservicemetricsproperty
Module Name: Az.Storage
ms.assetid: 3B5B828A-6B3E-49BD-8BA9-916F8B69B8E9
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageServiceMetricsProperty

## SYNOPSIS

Gets metrics properties for the Azure Storage service.

## SYNTAX

### Default (Default)

```
Get-AzStorageServiceMetricsProperty [-ServiceType] <StorageServiceType>
 [-MetricsType] <ServiceMetricsType> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzStorageServiceMetricsProperty [-ServiceType] <StorageServiceType>
 [-MetricsType] <ServiceMetricsType> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageServiceMetricsProperty** cmdlet gets metrics properties for the Azure Storage service.

## EXAMPLES

### Example 1: Get metrics properties for the Blob service

```powershell
Get-AzStorageServiceMetricsProperty -ServiceType Blob -MetricsType Hour
```

This command gets metrics properties for blob storage for the Hour metrics type.

## PARAMETERS

### -Context

Specifies an Azure storage context.
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

### -MetricsType

Specifies a metrics type.
This cmdlet gets the Azure Storage service metrics properties for the metrics type that this parameter specifies.
The acceptable values for this parameter are: Hour and Minute.
Azure storage service metrics type(Hour, Minute).

```yaml
Type: Microsoft.WindowsAzure.Commands.Storage.Common.ServiceMetricsType
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Hour
- Minute
HelpMessage: ''
```

### -ServiceType

Specifies the storage service type.
This cmdlet gets the metrics properties for the type that this parameter specifies.
The acceptable values for this parameter are:
- Blob
- Table
- Queue
- File
The value of File is not currently supported.
Azure storage service type(Blob, Table, Queue).

```yaml
Type: Microsoft.WindowsAzure.Commands.Storage.Common.StorageServiceType
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Blob
- Table
- Queue
- File
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.Azure.Storage.Shared.Protocol.MetricsProperties

## NOTES

## RELATED LINKS

- [New-AzStorageContext](./New-AzStorageContext.md)
- [Set-AzStorageServiceMetricsProperty](./Set-AzStorageServiceMetricsProperty.md)
