---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageservicemetricsproperty
Module Name: Az.Storage
ms.assetid: 5878FAD4-A4BB-4DBF-A1F2-221FD34F0308
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageServiceMetricsProperty

## SYNOPSIS

Modifies metrics properties for the Azure Storage service.

## SYNTAX

### Default (Default)

```
Set-AzStorageServiceMetricsProperty [-ServiceType] <StorageServiceType>
 [-MetricsType] <ServiceMetricsType> [-Version <Double>] [-RetentionDays <Int32>]
 [-MetricsLevel <MetricsLevel>] [-PassThru] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Set-AzStorageServiceMetricsProperty [-ServiceType] <StorageServiceType>
 [-MetricsType] <ServiceMetricsType> [-Version <double>] [-RetentionDays <int>]
 [-MetricsLevel <MetricsLevel>] [-PassThru] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageServiceMetricsProperty** cmdlet modifies metrics properties for the Azure Storage service.

## EXAMPLES

### Example 1: Modify metrics properties for the Blob service

```powershell
Set-AzStorageServiceMetricsProperty -ServiceType Blob -MetricsType Hour -MetricsLevel Service -PassThru -RetentionDays 10 -Version 1.0
```

This command modifies version 1.0 metrics for blob storage to a level of Service.
Azure Storage service metrics retains entries for 10 days.
Because this command specifies the *PassThru* parameter, the command displays the modified metrics properties.

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

### -MetricsLevel

Specifies the metrics level that Azure Storage uses for the service.
The acceptable values for this parameter are:
- None
- Service
- ServiceAndApi
Metrics level.(None/Service/ServiceAndApi)

```yaml
Type: System.Nullable`1[Microsoft.Azure.Storage.Shared.Protocol.MetricsLevel]
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
AcceptedValues:
- None
- Service
- ServiceAndApi
HelpMessage: ''
```

### -MetricsType

Specifies a metrics type.
This cmdlet sets the Azure Storage service metrics type to the value that this parameter specifies.
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

### -PassThru

Indicates that this cmdlets returns the updated metrics properties.
If you do not specify this parameter, this cmdlet does not return a value.
Display ServiceProperties

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

### -RetentionDays

Specifies the number of days that the Azure Storage service retains metrics information.
Metrics retention days. -1 means disable Metrics retention policy, otherwise enable.

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

### -ServiceType

Specifies the storage service type.
This cmdlet modifies the metrics properties for the service type that this parameter specifies.
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

### -Version

Specifies the version of the Azure Storage metrics.
The default value is 1.0.
Metrics version

```yaml
Type: System.Nullable`1[System.Double]
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

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.Azure.Storage.Shared.Protocol.MetricsProperties

## NOTES

## RELATED LINKS

- [Get-AzStorageServiceMetricsProperty](./Get-AzStorageServiceMetricsProperty.md)
- [New-AzStorageContext](./New-AzStorageContext.md)
