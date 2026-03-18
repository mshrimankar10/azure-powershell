---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/update-azstorageserviceproperty
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Update-AzStorageServiceProperty

## SYNOPSIS

Modifies the properties for the Azure Storage service.

## SYNTAX

### Default (Default)

```
Update-AzStorageServiceProperty [-ServiceType] <StorageServiceType>
 [-DefaultServiceVersion <String>] [-PassThru] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### __AllParameterSets

```
Update-AzStorageServiceProperty [-ServiceType] <StorageServiceType>
 [-DefaultServiceVersion <string>] [-PassThru] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Update-AzStorageServiceProperty** cmdlet modifies the properties for the Azure Storage service.

## EXAMPLES

### Example 1: Set Blob Service DefaultServiceVersion to 2017-04-17

```powershell
Update-AzStorageServiceProperty -ServiceType Blob -DefaultServiceVersion 2017-04-17
```

This command Set the DefaultServiceVersion of Blob Service to 2017-04-17

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

### -DefaultServiceVersion

DefaultServiceVersion indicates the default version to use for requests to the Blob service if an incoming request's version is not specified. Possible values include version 2008-10-27 and all more recent versions.
See more details in https://learn.microsoft.com/rest/api/storageservices/versioning-for-the-azure-storage-services
Default Service Version to Set

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

### -PassThru

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

### -ServiceType

Specifies the storage service type.
This cmdlet gets the logging properties for the service type that this parameter specifies.
The acceptable values for this parameter are:
- Blob
- Table
- Queue
- File
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

### -WhatIf

Shows what would happen if the cmdlet runs. The cmdlet is not run.
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

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSServiceProperties

### Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSSeriviceProperties

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

