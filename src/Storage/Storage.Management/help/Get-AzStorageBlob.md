---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageblob
Module Name: Az.Storage
ms.assetid: E54BFD3A-CD54-4E6B-9574-92B8D3E88FF3
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageBlob

## SYNOPSIS

Lists blobs in a container.

## SYNTAX

### BlobName (Default)

```
Get-AzStorageBlob [[-Blob] <string>] [-Container] <string> [-IncludeDeleted] [-IncludeTag]
 [-MaxCount <int>] [-ContinuationToken <BlobContinuationToken>] [-TagCondition <string>]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### SingleBlobSnapshotTime

```
Get-AzStorageBlob [-Blob] <string> [-Container] <string> -SnapshotTime <DateTimeOffset>
 [-IncludeDeleted] [-IncludeTag] [-MaxCount <int>] [-ContinuationToken <BlobContinuationToken>]
 [-TagCondition <string>] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### SingleBlobVersionID

```
Get-AzStorageBlob [-Blob] <string> [-Container] <string> -VersionId <string> [-IncludeDeleted]
 [-IncludeTag] [-MaxCount <int>] [-ContinuationToken <BlobContinuationToken>]
 [-TagCondition <string>] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### BlobPrefix

```
Get-AzStorageBlob [-Container] <string> [-Prefix <string>] [-IncludeDeleted] [-IncludeVersion]
 [-IncludeTag] [-MaxCount <int>] [-ContinuationToken <BlobContinuationToken>]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageBlob** cmdlet lists blobs in the specified container in an Azure storage account.

## EXAMPLES

### Example 1: Get a blob by blob name

```powershell
Get-AzStorageBlob -Container "ContainerName" -Blob blob*
```

This command uses a blob name and wildcard to get a blob.

### Example 2: Get blobs in a container by using the pipeline

```powershell
Get-AzStorageContainer -Name container* | Get-AzStorageBlob -IncludeDeleted
```

```output
Container Uri: https://storageaccountname.blob.core.windows.net/container1

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime         IsDeleted
----                 --------  ------          -----------                    ------------         ---------- ------------         ---------
test1                BlockBlob 403116          application/octet-stream       2017-11-08 07:53:19Z            2017-11-08 08:19:32Z True
test1                BlockBlob 403116          application/octet-stream       2017-11-08 09:00:29Z                                 True
test2                BlockBlob 403116          application/octet-stream       2017-11-08 07:53:00Z                                 False
```

This command uses the pipeline to get all blobs (include blobs in Deleted status) in a container.

### Example 3: Get blobs by name prefix

```powershell
Get-AzStorageBlob -Container "ContainerName" -Prefix "blob"
```

This command uses a name prefix to get blobs.

### Example 4: List blobs in multiple batches

```powershell
$MaxReturn = 10000
$ContainerName = "abc"
$Total = 0
$Token = $Null
do
 {
     $Blobs = Get-AzStorageBlob -Container $ContainerName -MaxCount $MaxReturn  -ContinuationToken $Token
     $Total += $Blobs.Count
     if($Blobs.Length -le 0) { Break;}
     $Token = $Blobs[$blobs.Count -1].ContinuationToken;
 }
 While ($null -ne $Token)
Echo "Total $Total blobs in container $ContainerName"
```

This example uses the *MaxCount* and *ContinuationToken* parameters to list Azure Storage blobs in multiple batches.
The first four commands assign values to variables to use in the example.
The fifth command specifies a **Do-While** statement that uses the **Get-AzStorageBlob** cmdlet to get blobs.
The statement includes the continuation token stored in the $Token variable.
$Token changes value as the loop runs.
For more information, type `Get-Help About_Do`.
The final command uses the **Echo** command to display the total.

### Example 5: Get all blobs in a container include blob version

```powershell
Get-AzStorageBlob -Container "containername"  -IncludeVersion
```

```output
AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
blob1                BlockBlob 2097152         application/octet-stream       2020-07-06 06:56:06Z Hot                                     False      2020-07-06T06:56:06.2432658Z
blob1                BlockBlob 2097152         application/octet-stream       2020-07-06 06:56:06Z Hot        2020-07-06T06:56:06.8588431Z False
blob1                BlockBlob 2097152         application/octet-stream       2020-07-06 06:56:06Z Hot                                     False      2020-07-06T06:56:06.8598431Z *
blob2                BlockBlob 2097152         application/octet-stream       2020-07-03 16:19:16Z Hot                                     False      2020-07-03T16:19:16.2883167Z
blob2                BlockBlob 2097152         application/octet-stream       2020-07-03 16:19:35Z Hot                                     False      2020-07-03T16:19:35.2381110Z *
```

This command gets all blobs in a container include blob version.

### Example 6: Get a single blob version

```powershell
Get-AzStorageBlob -Container "containername" -Blob blob2 -VersionId "2020-07-03T16:19:16.2883167Z"
```

```output
AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
blob2                BlockBlob 2097152         application/octet-stream       2020-07-03 16:19:16Z Hot                                     False      2020-07-03T16:19:16.2883167Z
```

This command gets a single blobs version with VersionId.

### Example 7: Get a single blob snapshot

```powershell
Get-AzStorageBlob -Container "containername" -Blob blob1 -SnapshotTime "2020-07-06T06:56:06.8588431Z"
```

```output
AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
blob1                BlockBlob 2097152         application/octet-stream       2020-07-06 06:56:06Z Hot        2020-07-06T06:56:06.8588431Z False
```

This command gets a single blobs snapshot with SnapshotTime.

### Example 8: Get blob include blob tags

<!-- Skip: Output cannot be splitted from code -->


```
$blobs = Get-AzStorageBlob -Container "containername" -IncludeTag

$blobs

   AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob             BlockBlob 2097152         application/octet-stream       2020-07-23 09:35:02Z Hot                                     False      2020-07-23T09:35:02.8527357Z *
testblob2            BlockBlob 2097152         application/octet-stream       2020-07-23 09:35:04Z Hot                                     False      2020-07-23T09:35:04.0856187Z *


$blobs[0].Tags
Name          Value
----          -----
tag1          value1
tag2          value2
```

This command lists blobs from a container with blob tags, and show the tags of the first blob.

### Example 9: Get a single blob with blob tag condition

```powershell
Get-AzStorageBlob -Container "containername" -Blob testblob -TagCondition """tag1""='value1'"
```

```output
AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob             BlockBlob 2097152         application/octet-stream       2020-07-23 09:35:02Z Hot                                     False      2020-07-23T09:35:02.8527357Z *
```

This command gets a single blob with blob tag condition.
The cmdlet will only success when the blob contains a tag with name "tag1" and value "value1", else the cmdlet will fail with error code 412.

### Example 10: Get blob properties (example: ImmutabilityPolicy) of a single blob

```powershell
$blobProperties = (Get-AzStorageBlob -Container "ContainerName" -Blob "blob" -Context $ctx).BlobProperties
$blobProperties.ImmutabilityPolicy
```

```output
ExpiresOn                   PolicyMode
---------                   ----------
9/17/2024 2:49:32 AM +00:00   Unlocked
```

This example command gets the immutability property of a single blob. You can get a detailed list of blob properties from the **BlobProperties** property, including but not limited to: LastModified, ContentLength, ContentHash, BlobType, LeaseState, AccessTier, ETag, ImmutabilityPolicy, etc...
To list multiple blobs (execute the cmdlet without blob name), use **ListBlobProperties.Properties** instead of **BlobProperties** for better performance.

## PARAMETERS

### -Blob

Specifies a name or name pattern, which can be used for a wildcard search.
If no blob name is specified, the cmdlet lists all the blobs in the specified container.
If a value is specified for this parameter, the cmdlet lists all blobs with names that match this parameter. This parameter supports wildcards anywhere in the string.
Blob name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: true
Aliases: []
ParameterSets:
- Name: BlobName
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobSnapshotTime
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobVersionID
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

Specifies the name of the container.
Container name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- Name
ParameterSets:
- Name: BlobName
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: BlobPrefix
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: SingleBlobSnapshotTime
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: SingleBlobVersionID
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Context

Specifies the Azure storage account from which you want to get a list of blobs.
You can use the New-AzStorageContext cmdlet to create a storage context.
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

### -ContinuationToken

Specifies a continuation token for the blob list.
Use this parameter and the *MaxCount* parameter to list blobs in multiple batches.
Continuation Token.

```yaml
Type: Microsoft.Azure.Storage.Blob.BlobContinuationToken
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

### -IncludeDeleted

Include Deleted Blob, by default get blob won't include deleted blob.
Include deleted blobs, by default get blob won't include deleted blobs

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobPrefix
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobSnapshotTime
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobVersionID
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IncludeTag

Include blob tags, by default get blob won't include blob tags.

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

### -IncludeVersion

Blob versions will be listed only if this parameter is present, by default get blob won't include blob versions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobPrefix
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -MaxCount

Specifies the maximum number of objects that this cmdlet returns.
The max count of the blobs that can return.

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

### -Prefix

Specifies a prefix for the blob names that you want to get.
This parameter does not support using regular expressions or wildcard characters to search.
This means that if the container has only blobs named "My", "MyBlob1", and "MyBlob2" and you specify "-Prefix My*", the cmdlet returns no blobs.
However, if you specify "-Prefix My", the cmdlet returns "My", "MyBlob1", and "MyBlob2".
Blob Prefix

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobPrefix
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

### -SnapshotTime

Blob SnapshotTime

```yaml
Type: System.Nullable`1[System.DateTimeOffset]
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SingleBlobSnapshotTime
  Position: Named
  IsRequired: true
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
Optional Query statement to apply to the Tags of the Blob. The blob request will fail when the blob tags not match the given tag conditions.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobSnapshotTime
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SingleBlobVersionID
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -VersionId

Blob VersionId

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SingleBlobVersionID
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

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageBlob

## NOTES

## RELATED LINKS

- [Get-AzStorageBlobContent](./Get-AzStorageBlobContent.md)
- [Remove-AzStorageBlob](./Remove-AzStorageBlob.md)
- [Set-AzStorageBlobContent](./Set-AzStorageBlobContent.md)
