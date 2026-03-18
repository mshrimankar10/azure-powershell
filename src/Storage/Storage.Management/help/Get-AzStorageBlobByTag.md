---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageblobbytag
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageBlobByTag

## SYNOPSIS

Lists blobs in a storage account across containers, with a blob tag filter sql expression.

## SYNTAX

### Default (Default)

```
Get-AzStorageBlobByTag -TagFilterSqlExpression <String> [-MaxCount <Int32>]
 [-ContinuationToken <BlobContinuationToken>] [-GetBlobProperty] [-Container <String>]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <Int32>] [-ClientTimeoutPerRequest <Int32>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <Int32>] [<CommonParameters>]
```

### __AllParameterSets

```
Get-AzStorageBlobByTag -TagFilterSqlExpression <string> [-MaxCount <int>]
 [-ContinuationToken <BlobContinuationToken>] [-GetBlobProperty] [-Container <string>]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageBlobByTag** cmdlet lists blobs in a storage account across containers, with a blob tag filter sql expression.

## EXAMPLES

### Example 1: List all blobs match a specific blob tag, across containers.

```powershell
Get-AzStorageBlobByTag -TagFilterSqlExpression """tag1""='value1'" -Context $ctx
```

```output
AccountName: storageaccountname, ContainerName: containername1

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob                                                                                                                                   False
testblob2                                                                                                                                  False

   AccountName: storageaccountname, ContainerName: containername2

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob3                                                                                                                                   False
testblob4                                                                                                                                   False
```

This command lists all blobs in a storage account, which contains a tag with name "tag1" and value "value1".

### Example 2: List blobs in a specific container and match a specific blob tag

```powershell
Get-AzStorageBlobByTag -Container 'containername' -TagFilterSqlExpression """tag1""='value1'" -Context $ctx
```

```output
AccountName: storageaccountname, ContainerName: containername

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
test1                                                                                                                                      False
test2                                                                                                                                      False
```

This command lists blobs in a container and match a specific blob tag.

### Example 3: List all blobs match a specific blob tag, across containers, and get the blob properties.

```powershell
Get-AzStorageBlobByTag -TagFilterSqlExpression """tag1""='value1'" -GetBlobProperty
```

```output
AccountName: storageaccountname, ContainerName: containername1

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob             BlockBlob 2097152         application/octet-stream       2020-07-23 09:35:02Z Hot                                     False      2020-07-23T09:35:02.8527357Z *
testblob2            BlockBlob 1048012         application/octet-stream       2020-07-23 09:35:05Z Hot                                     False      2020-07-23T09:35:05.2504530Z *

   AccountName: storageaccountname, ContainerName: containername2

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
testblob3            BlockBlob 100             application/octet-stream       2020-07-01 09:55:14Z Hot                                     False      2020-07-01T09:55:14.6507341Z *
testblob4            BlockBlob 2024            application/octet-stream       2020-07-01 09:42:11Z Hot                                     False      2020-07-01T09:42:11.4283807Z *
```

This command lists all blobs in a storage account, which contains a tag with name "tag1" and value "value1"， and get the blob properties.
Please note, to get blob properties with parameter -GetBlobProperty, each blob will need an additional request, so the cmdlet runs show when there are many blobs.

## PARAMETERS

### -ClientTimeoutPerRequest

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

The total amount of concurrent async tasks.
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

Container name, specify this parameter to only return all blobs whose tags match a search expression in the container.

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

### -Context

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

### -GetBlobProperty

As the blobs get by tag don't contain blob properties, specify tis parameter to get blob properties with an additional request on each blob.

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

### -MaxCount

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

### -ServerTimeoutPerRequest

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

### -TagFilterSqlExpression

Filters the result set to only include blobs whose tags match the specified expression.
See details in https://learn.microsoft.com/en-us/rest/api/storageservices/find-blobs-by-tags#remarks.
Filters the result set to only include blobs whose tags match the specified expression.See details in https://learn.microsoft.com/en-us/rest/api/storageservices/find-blobs-by-tags#remarks.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
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

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageBlob

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

