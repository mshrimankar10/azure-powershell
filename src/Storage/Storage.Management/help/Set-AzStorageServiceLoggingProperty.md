---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageserviceloggingproperty
Module Name: Az.Storage
ms.assetid: 5422429E-C609-4C1F-A021-E2A085B5F74E
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageServiceLoggingProperty

## SYNOPSIS

Modifies logging for Azure Storage services.

## SYNTAX

### Default (Default)

```
Set-AzStorageServiceLoggingProperty [-ServiceType] <StorageServiceType> [-Version <Double>]
 [-RetentionDays <Int32>] [-LoggingOperations <LoggingOperations[]>] [-PassThru]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
Set-AzStorageServiceLoggingProperty [-ServiceType] <StorageServiceType> [-Version <double>]
 [-RetentionDays <int>] [-LoggingOperations <LoggingOperations[]>] [-PassThru]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageServiceLoggingProperty** cmdlet modifies logging for Azure Storage services.

## EXAMPLES

### Example 1: Modify logging properties for the Blob service

```powershell
Set-AzStorageServiceLoggingProperty -ServiceType Blob -LoggingOperations Read,Write -PassThru -RetentionDays 10 -Version 1.0
```

This command modifies version 1.0 logging for blob storage to include read and write operations.
Azure Storage service logging retains entries for 10 days.
Because this command specifies the *PassThru* parameter, the command displays the modified logging properties.

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

### -LoggingOperations

Specifies an array of Azure Storage service operations.
Azure Storage services logs the operations that this parameter specifies.
The acceptable values for this parameter are:
- None
- Read
- Write
- Delete
- All
Logging operations. (All, None, combinations of Read, Write, Delete that are separated by semicolon.)

```yaml
Type: Microsoft.Azure.Storage.Shared.Protocol.LoggingOperations[]
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
- Read
- Write
- Delete
- All
HelpMessage: ''
```

### -PassThru

Indicates that this cmdlet returns the updated logging properties.
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

Specifies the number of days that the Azure Storage service retains logged information.
Logging retention days. -1 means disable Logging retention policy, otherwise enable.

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
This cmdlet modifies the logging properties for the service type that this parameter specifies.
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

Specifies the version of the Azure Storage service logging.
The default value is 1.0.
Logging version

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

### Microsoft.Azure.Storage.Shared.Protocol.LoggingProperties

## NOTES

## RELATED LINKS

- [Get-AzStorageServiceLoggingProperty](./Get-AzStorageServiceLoggingProperty.md)
- [New-AzStorageContext](./New-AzStorageContext.md)
