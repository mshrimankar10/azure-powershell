---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageblobcopystate
Module Name: Az.Storage
ms.assetid: CBD157D2-37C5-491F-A806-6B39F1D0415A
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageBlobCopyState

## SYNOPSIS

Gets the copy status of an Azure Storage blob.

## SYNTAX

### NamePipeline (Default)

```
Get-AzStorageBlobCopyState [-Blob] <string> [-Container] <string> [-WaitForComplete]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### BlobPipeline

```
Get-AzStorageBlobCopyState -CloudBlob <CloudBlob> [-WaitForComplete] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### ContainerPipeline

```
Get-AzStorageBlobCopyState [-Blob] <string> -CloudBlobContainer <CloudBlobContainer>
 [-WaitForComplete] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageBlobCopyState** cmdlet gets the copy status of an Azure Storage blob.
It should run on the copy destination blob.

## EXAMPLES

### Example 1: Get the copy status of a blob

```powershell
Get-AzStorageBlobCopyState -Blob "ContosoPlanning2015" -Container "ContosoUploads"
```

This command gets the copy status of the blob named ContosoPlanning2015 in the container ContosoUploads.

### Example 2: Get the copy status for of a blob by using the pipeline

```powershell
Get-AzStorageBlob -Blob "ContosoPlanning2015" -Container "ContosoUploads" | Get-AzStorageBlobCopyState
```

This command gets the blob named ContosoPlanning2015 in the container named ContosoUploads by using the **Get-AzStorageBlob** cmdlet, and then passes the result to the current cmdlet by using the pipeline operator.
The **Get-AzStorageBlobCopyState** cmdlet gets the copy status for that blob.

### Example 3: Get the copy status for a blob in a container by using the pipeline

```powershell
Get-AzStorageContainer -Name "ContosoUploads" | Get-AzStorageBlobCopyState -Blob "ContosoPlanning2015"
```

This command gets the container named by using the **Get-AzStorageBlob** cmdlet, and then passes the result to the current cmdlet.
The **Get-AzStorageContainer** cmdlet gets the copy status for the blob named ContosoPlanning2015 in that container.

### Example 4: Start Copy and pipeline to get the copy status

```powershell
$destBlob = Start-AzStorageBlobCopy -SrcContainer "contosouploads" -SrcBlob "ContosoPlanning2015" -DestContainer "contosouploads2" -DestBlob "ContosoPlanning2015_copy"

$destBlob | Get-AzStorageBlobCopyState
```

The first command starts copy blob "ContosoPlanning2015" to "ContosoPlanning2015_copy", and output the destination blob object.
The second command pipeline the destination blob object to Get-AzStorageBlobCopyState, to get blob copy state.

## PARAMETERS

### -Blob

Specifies the name of a blob.
This cmdlet gets the state of the blob copy operation for the Azure Storage blob that this parameter specifies.
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
This cmdlet gets the copy status of a blob in the container that this parameter specifies.
To obtain a **CloudBlobContainer** object, use the Get-AzStorageContainer cmdlet.
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

### -Container

Specifies the name of a container.
This cmdlet gets the copy status for a blob in the container that this parameter specifies.
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

### -WaitForComplete

Indicates that this cmdlet waits for the copy to finish.
If you do not specify this parameter, this cmdlet returns a result immediately.
Wait for copy task complete

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

### Microsoft.Azure.Storage.Blob.CopyState

## NOTES

## RELATED LINKS

- [Start-AzStorageBlobCopy](./Start-AzStorageBlobCopy.md)
- [Stop-AzStorageBlobCopy](./Stop-AzStorageBlobCopy.md)
