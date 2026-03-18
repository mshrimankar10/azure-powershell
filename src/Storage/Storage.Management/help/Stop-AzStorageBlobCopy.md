---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/stop-azstorageblobcopy
Module Name: Az.Storage
ms.assetid: C274DFBD-6C93-4043-AF93-DAF7BEA1F11F
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Stop-AzStorageBlobCopy

## SYNOPSIS

Stops a copy operation.

## SYNTAX

### NamePipeline (Default)

```
Stop-AzStorageBlobCopy [-Blob] <string> [-Container] <string> [-Force] [-CopyId <string>]
 [-TagCondition <string>] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### BlobPipeline

```
Stop-AzStorageBlobCopy -CloudBlob <CloudBlob> [-Force] [-CopyId <string>] [-TagCondition <string>]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ContainerPipeline

```
Stop-AzStorageBlobCopy [-Blob] <string> -CloudBlobContainer <CloudBlobContainer> [-Force]
 [-CopyId <string>] [-TagCondition <string>] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Stop-AzStorageBlobCopy** cmdlet stops a copy operation to the specified destination blob.

## EXAMPLES

### Example 1: Stop copy operation by name

```powershell
Stop-AzStorageBlobCopy -Container "ContainerName" -Blob "BlobName" -CopyId "CopyID"
```

This command stops the copy operation by name.

### Example 2: Stop copy operation by using the pipeline

```powershell
Get-AzStorageContainer container* | Stop-AzStorageBlobCopy -Blob "BlobName"
```

This command stops the copy operation by passing the container on the pipeline from **Get-AzStorageContainer**.

### Example 3: Stop copy operation by using the pipeline and Get-AzStorageBlob

```powershell
Get-AzStorageBlob -Container "ContainerName" | Stop-AzStorageBlobCopy -Force
```

This example stops the copy operation by passing the container on the pipeline from the Get-AzStorageBlob cmdlet.

## PARAMETERS

### -Blob

Specifies the name of the blob.
Blob name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ContainerPipeline
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: NamePipeline
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ClientTimeoutPerRequest

Specifies the client-side time-out interval, in seconds, for one service request.
If the previous call fails in the specified interval, this cmdlet retries the request.
If this cmdlet does not receive a successful response before the interval elapses, this cmdlet returns an error.
The client side maximum execution time for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: None
SupportsWildcards: false
Aliases:
- ClientTimeoutPerRequestInSeconds
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

### -CloudBlob

Specifies a **CloudBlob** object from Azure Storage Client library.
To obtain a **CloudBlob** object, use the Get-AzStorageBlob cmdlet.
CloudBlob Object

```yaml
Type: Microsoft.Azure.Storage.Blob.CloudBlob
DefaultValue: None
SupportsWildcards: false
Aliases:
- ICloudBlob
ParameterSets:
- Name: BlobPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CloudBlobContainer

Specifies a **CloudBlobContainer** object from the Azure Storage Client library.
You can create the object or use the Get-AzStorageContainer cmdlet.
CloudBlobContainer Object

```yaml
Type: Microsoft.Azure.Storage.Blob.CloudBlobContainer
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ContainerPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ConcurrentTaskCount

Specifies the maximum concurrent network calls.
You can use this parameter to limit the concurrency to throttle local CPU and bandwidth usage by specifying the maximum number of concurrent network calls.
The specified value is an absolute count and is not multiplied by the core count.
This parameter can help reduce network connection problems in low bandwidth environments, such as 100 kilobits per second.
The default value is 10.
The total amount of concurrent async tasks. The default value is 10.

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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### -Container

Specifies the name of the container.
Container name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: NamePipeline
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Context

Specifies the Azure storage context.
You can create the context by using the New-AzStorageContext cmdlet.
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

### -CopyId

Specifies the copy ID.
Copy Id

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

### -Force

Stops the current copy task on the specified blob without prompting for confirmation.
Force to stop the current copy task on the specified blob

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

### -ServerTimeoutPerRequest

Specifies the service side time-out interval, in seconds, for a request.
If the specified interval elapses before the service processes the request, the storage service returns an error.
The server time out for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: None
SupportsWildcards: false
Aliases:
- ServerTimeoutPerRequestInSeconds
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

### -TagCondition

Optional Tag expression statement to check match condition.
The blob request will fail when the blob tags does not match the given expression.
See details in https://learn.microsoft.com/en-us/rest/api/storageservices/specifying-conditional-headers-for-blob-service-operations#tags-conditional-operations.
Optional Tag expression statement to check match condition. The blob request will fail when the blob tags does not match the given expression.See details in https://learn.microsoft.com/en-us/rest/api/storageservices/specifying-conditional-headers-for-blob-service-operations#tags-conditional-operations.

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

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.
Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### Microsoft.Azure.Storage.Blob.CloudBlob

### Microsoft.Azure.Storage.Blob.CloudBlobContainer

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageBlob

## NOTES

## RELATED LINKS

- [Get-AzStorageBlob](./Get-AzStorageBlob.md)
- [Get-AzStorageContainer](./Get-AzStorageContainer.md)
- [Start-AzStorageBlobCopy](./Start-AzStorageBlobCopy.md)
- [Get-AzStorageBlobCopyState](./Get-AzStorageBlobCopyState.md)
