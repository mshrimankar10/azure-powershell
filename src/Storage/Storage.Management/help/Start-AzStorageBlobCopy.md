---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/start-azstorageblobcopy
Module Name: Az.Storage
ms.assetid: 54585346-04E2-4FB4-B5FD-833A85C46ACB
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Start-AzStorageBlobCopy

## SYNOPSIS

Starts to copy a blob.

## SYNTAX

### ContainerName (Default)

```
Start-AzStorageBlobCopy [-SrcBlob] <string> -SrcContainer <string> -DestContainer <string>
 [-DestBlob <string>] [-PremiumPageBlobTier <PremiumPageBlobTier>] [-StandardBlobTier <string>]
 [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>] [-Context <IStorageContext>]
 [-DestContext <IStorageContext>] [-DestTagCondition <string>] [-TagCondition <string>] [-Force]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### BlobInstance

```
Start-AzStorageBlobCopy -CloudBlob <CloudBlob> -DestContainer <string>
 [-BlobBaseClient <BlobBaseClient>] [-DestBlob <string>]
 [-PremiumPageBlobTier <PremiumPageBlobTier>] [-StandardBlobTier <string>]
 [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>] [-Context <IStorageContext>]
 [-DestContext <IStorageContext>] [-DestTagCondition <string>] [-TagCondition <string>] [-Force]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### BlobInstanceToBlobInstance

```
Start-AzStorageBlobCopy -CloudBlob <CloudBlob> -DestCloudBlob <CloudBlob>
 [-BlobBaseClient <BlobBaseClient>] [-PremiumPageBlobTier <PremiumPageBlobTier>]
 [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>]
 [-Context <IStorageContext>] [-DestContext <IStorageContext>] [-DestTagCondition <string>]
 [-TagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ContainerInstance

```
Start-AzStorageBlobCopy [-SrcBlob] <string> -CloudBlobContainer <CloudBlobContainer>
 -DestContainer <string> [-DestBlob <string>] [-PremiumPageBlobTier <PremiumPageBlobTier>]
 [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>]
 [-Context <IStorageContext>] [-DestContext <IStorageContext>] [-DestTagCondition <string>]
 [-TagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ShareName

```
Start-AzStorageBlobCopy -SrcShareName <string> -SrcFilePath <string> -DestContainer <string>
 [-DestBlob <string>] [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>]
 [-Tag <hashtable>] [-Context <IStorageContext>] [-DestContext <IStorageContext>]
 [-DestTagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ShareInstance

```
Start-AzStorageBlobCopy -SrcShare <CloudFileShare> -SrcFilePath <string> -DestContainer <string>
 [-DestBlob <string>] [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>]
 [-Tag <hashtable>] [-Context <IStorageContext>] [-DestContext <IStorageContext>]
 [-DestTagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### DirInstance

```
Start-AzStorageBlobCopy -SrcDir <CloudFileDirectory> -SrcFilePath <string> -DestContainer <string>
 [-DestBlob <string>] [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>]
 [-Tag <hashtable>] [-Context <IStorageContext>] [-DestContext <IStorageContext>]
 [-DestTagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### FileInstance

```
Start-AzStorageBlobCopy -SrcFile <CloudFile> -DestContainer <string> [-DestBlob <string>]
 [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>]
 [-Context <IStorageContext>] [-DestContext <IStorageContext>] [-DestTagCondition <string>] [-Force]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### FileInstanceToBlobInstance

```
Start-AzStorageBlobCopy -SrcFile <CloudFile> -DestCloudBlob <CloudBlob> [-StandardBlobTier <string>]
 [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>] [-Context <IStorageContext>]
 [-DestContext <IStorageContext>] [-DestTagCondition <string>] [-Force]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### UriPipeline

```
Start-AzStorageBlobCopy -AbsoluteUri <string> -DestContainer <string> -DestBlob <string>
 [-StandardBlobTier <string>] [-RehydratePriority <RehydratePriority>] [-Tag <hashtable>]
 [-Context <IStorageContext>] [-DestContext <IStorageContext>] [-DestTagCondition <string>]
 [-TagCondition <string>] [-Force] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Start-AzStorageBlobCopy** cmdlet starts to copy a blob.

## EXAMPLES

### Example 1: Copy a named blob

```powershell
Start-AzStorageBlobCopy -SrcBlob "ContosoPlanning2015" -DestContainer "ContosoArchives" -SrcContainer "ContosoUploads"
```

This command starts the copy operation of the blob named ContosoPlanning2015 from the container named ContosoUploads to the container named ContosoArchives.

### Example 2: Get a container to specify blobs to copy

```powershell
Get-AzStorageContainer -Name "ContosoUploads" | Start-AzStorageBlobCopy -SrcBlob "ContosoPlanning2015" -DestContainer "ContosoArchives"
```

This command gets the container named ContosoUploads, by using the **Get-AzStorageContainer** cmdlet, and then passes the container to the current cmdlet by using the pipeline operator.
That cmdlet starts the copy operation of the blob named ContosoPlanning2015.
The previous cmdlet provides the source container.
The *DestContainer* parameter specifies ContosoArchives as the destination container.

### Example 3: Get all blobs in a container and copy them

```powershell
Get-AzStorageBlob -Container "ContosoUploads" | Start-AzStorageBlobCopy -DestContainer "ContosoArchives"
```

This command gets the blobs in the container named ContosoUploads, by using the **Get-AzStorageBlob** cmdlet, and then passes the results to the current cmdlet by using the pipeline operator.
That cmdlet starts the copy operation of the blobs to the container named ContosoArchives.

### Example 4: Copy a blob specified as an object

```powershell
$SrcBlob = Get-AzStorageBlob -Container "ContosoUploads" -Blob "ContosoPlanning2015"
$DestBlob = Get-AzStorageBlob -Container "ContosoArchives" -Blob "ContosoPlanning2015Archived"
Start-AzStorageBlobCopy -ICloudBlob $SrcBlob.ICloudBlob -DestICloudBlob $DestBlob.ICloudBlob
```

The first command gets the blob named ContosoPlanning2015 in the container named ContosoUploads.
The command stores that object in the $SrcBlob variable.
The second command gets the blob named ContosoPlanning2015Archived in the container named ContosoArchives.
The command stores that object in the $DestBlob variable.
The last command starts the copy operation from the source container to the destination container.
The command uses standard dot notation to specify the **ICloudBlob** objects for the $SrcBlob and $DestBlob blobs.

### Example 5: Copy a blob from a URI

```powershell
$Context = New-AzStorageContext -StorageAccountName "ContosoGeneral" -StorageAccountKey "< Storage Key for ContosoGeneral ends with == >"
Start-AzStorageBlobCopy -AbsoluteUri "http://www.contosointernal.com/planning" -DestContainer "ContosoArchive" -DestBlob "ContosoPlanning2015" -DestContext $Context
```

This command creates a context for the account named ContosoGeneral that uses the specified key, and then stores that key in the $Context variable.
The second command copies the file from the specified URI to the blob named ContosoPlanning in the container named ContosoArchive.
The command starts the copy operation to the destination context stored in $Context.
There are no source storage context, so the source Uri must have access to the source object. E.g: if the source is a none public Azure blob, the Uri should contain SAS token which has read access to the blob.

### Example 6: Copy a block blob to destination container with a new blob name, and set destination blob StandardBlobTier as Hot, RehydratePriority as High

```powershell
Start-AzStorageBlobCopy -SrcContainer "ContosoUploads" -SrcBlob "BlockBlobName" -DestContainer "ContosoArchives" -DestBlob "NewBlockBlobName" -StandardBlobTier Hot -RehydratePriority High
```

This command starts the copy operation of a block blob to destination container with a new blob name, and set destination blob StandardBlobTier as Hot, RehydratePriority as High

## PARAMETERS

### -AbsoluteUri

Specifies the absolute URI of a file to copy to an Azure Storage blob.
Source blob uri

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- SrcUri
- SourceUri
ParameterSets:
- Name: UriPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -BlobBaseClient

BlobBaseClient Object

```yaml
Type: Azure.Storage.Blobs.Specialized.BlobBaseClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
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
- SrcICloudBlob
- SrcCloudBlob
- ICloudBlob
- SourceICloudBlob
- SourceCloudBlob
ParameterSets:
- Name: BlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CloudBlobContainer

Specifies a **CloudBlobContainer** object from the Azure Storage Client library.
This cmdlet copies a blob from the container that this parameter specifies.
To obtain a **CloudBlobContainer** object, use the Get-AzStorageContainer cmdlet.
CloudBlobContainer Object

```yaml
Type: Microsoft.Azure.Storage.Blob.CloudBlobContainer
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceCloudBlobContainer
ParameterSets:
- Name: ContainerInstance
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

### -Context

Specifies an Azure storage context.
To obtain a storage context, use the New-AzStorageContext cmdlet.
Source Azure Storage Context Object

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext
DefaultValue: None
SupportsWildcards: false
Aliases:
- SrcContext
- SourceContext
ParameterSets:
- Name: ContainerName
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: BlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ContainerInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ShareName
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ShareInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: DirInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: FileInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: FileInstanceToBlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: UriPipeline
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

### -DestBlob

Specifies the name of the destination blob.
Destination blob name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- DestinationBlob
ParameterSets:
- Name: UriPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ContainerInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FileInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DestCloudBlob

Specifies a destination **CloudBlob** object
Destination CloudBlob object

```yaml
Type: Microsoft.Azure.Storage.Blob.CloudBlob
DefaultValue: None
SupportsWildcards: false
Aliases:
- DestICloudBlob
- DestinationCloudBlob
- DestinationICloudBlob
ParameterSets:
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FileInstanceToBlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DestContainer

Specifies the name of the destination container.
Destination container name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- DestinationContainer
ParameterSets:
- Name: ContainerName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: UriPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ContainerInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FileInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DestContext

Specifies an Azure storage context.
To obtain a storage context, use the New-AzStorageContext cmdlet.
Destination Storage context object

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext
DefaultValue: None
SupportsWildcards: false
Aliases:
- DestinationContext
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DestTagCondition

Optional Tag expression statement to check match condition on the destination Blob.
The blob request will fail when the destination blob tags does not match the given expression.
See details in https://learn.microsoft.com/en-us/rest/api/storageservices/specifying-conditional-headers-for-blob-service-operations#tags-conditional-operations.
Optional Query statement to apply to the Tags of the Destination Blob. The blob request will fail when the destination blob tags not match the given tag conditions.

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

### -Force

Indicates that this cmdlet overwrites the destination blob without prompting you for confirmation.
Force to overwrite the existing blob or file

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

### -PremiumPageBlobTier

Premium Page Blob Tier

```yaml
Type: Microsoft.Azure.Storage.Blob.PremiumPageBlobTier
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ContainerName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Unknown
- P4
- P6
- P10
- P20
- P30
- P40
- P50
- P60
- P70
- P80
HelpMessage: ''
```

### -RehydratePriority

Block Blob RehydratePriority. Indicates the priority with which to rehydrate an archived blob. Valid values are High/Standard.

```yaml
Type: Microsoft.Azure.Storage.Blob.RehydratePriority
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
- Standard
- High
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

### -SrcBlob

Specifies the name of the source blob.
Blob name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceBlob
ParameterSets:
- Name: ContainerInstance
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerName
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcContainer

Specifies the name of the source container.
Source Container name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceContainer
ParameterSets:
- Name: ContainerName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcDir

Specifies a **CloudFileDirectory** object from Azure Storage Client library.
Source file directory

```yaml
Type: Microsoft.Azure.Storage.File.CloudFileDirectory
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceDir
ParameterSets:
- Name: DirInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcFile

Specifies a **CloudFile** object from Azure Storage Client library.
You can create it or use Get-AzStorageFile cmdlet.
Source file

```yaml
Type: Microsoft.Azure.Storage.File.CloudFile
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceFile
ParameterSets:
- Name: FileInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FileInstanceToBlobInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcFilePath

Specifies the source file relative path of source directory or source share.
Source file path

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceFilePath
ParameterSets:
- Name: ShareName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ShareInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DirInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcShare

Specifies a **CloudFileShare** object from Azure Storage Client library.
You can create it or use Get-AzStorageShare cmdlet.
Source share

```yaml
Type: Microsoft.Azure.Storage.File.CloudFileShare
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceShare
ParameterSets:
- Name: ShareInstance
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SrcShareName

Specifies the source share name.
Source share name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- SourceShareName
ParameterSets:
- Name: ShareName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StandardBlobTier

Block Blob Tier, valid values are Hot/Cool/Archive/Cold.
See detail in https://learn.microsoft.com/azure/storage/blobs/storage-blob-storage-tiers
Block Blob Tier, valid values are Hot/Cool/Archive/Cold. See detail in https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers

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

### -Tag

Blob Tags

```yaml
Type: System.Collections.Hashtable
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

### -TagCondition

Optional Tag expression statement to check match condition on the source blob.
The blob request will fail when the source blob tags does not match the given expression.
See details in https://learn.microsoft.com/en-us/rest/api/storageservices/specifying-conditional-headers-for-blob-service-operations#tags-conditional-operations.
Optional Query statement to apply to the Tags of the Blob. The blob request will fail when the blob tags not match the given tag conditions.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobInstanceToBlobInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerInstance
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: UriPipeline
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

### Microsoft.Azure.Storage.File.CloudFile

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

### Azure.Storage.Blobs.Specialized.BlobBaseClient

{{ Fill in the Description }}

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageBlob

## NOTES

## RELATED LINKS

- [Get-AzStorageBlobCopyState](./Get-AzStorageBlobCopyState.md)
- [Stop-AzStorageBlobCopy](./Stop-AzStorageBlobCopy.md)
