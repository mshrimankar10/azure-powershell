---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageblobcontent
Module Name: Az.Storage
ms.assetid: F20A5FD3-6EC3-4EFE-988C-75F8583961A4
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageBlobContent

## SYNOPSIS

Uploads a local file to an Azure Storage blob.

## SYNTAX

### SendManual (Default)

```
Set-AzStorageBlobContent [-File] <string> [-Container] <string> [-Blob <string>]
 [-BlobType <string>] [-Properties <hashtable>] [-Metadata <hashtable>] [-Tag <hashtable>]
 [-PremiumPageBlobTier <PremiumPageBlobTier>] [-StandardBlobTier <string>]
 [-EncryptionScope <string>] [-Force] [-AsJob] [-TagCondition <string>] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ContainerPipeline

```
Set-AzStorageBlobContent [-File] <string> -CloudBlobContainer <CloudBlobContainer> [-Blob <string>]
 [-BlobType <string>] [-Properties <hashtable>] [-Metadata <hashtable>] [-Tag <hashtable>]
 [-PremiumPageBlobTier <PremiumPageBlobTier>] [-StandardBlobTier <string>]
 [-EncryptionScope <string>] [-Force] [-AsJob] [-TagCondition <string>] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### BlobPipeline

```
Set-AzStorageBlobContent [-File] <string> -CloudBlob <CloudBlob> [-BlobType <string>]
 [-Properties <hashtable>] [-Metadata <hashtable>] [-Tag <hashtable>]
 [-PremiumPageBlobTier <PremiumPageBlobTier>] [-StandardBlobTier <string>]
 [-EncryptionScope <string>] [-Force] [-AsJob] [-TagCondition <string>] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageBlobContent** cmdlet uploads a local file to an Azure Storage blob.

## EXAMPLES

### Example 1: Upload a named file

```powershell
Set-AzStorageBlobContent -Container "ContosoUpload" -File ".\PlanningData" -Blob "Planning2015"
```

This command uploads the file that is named PlanningData to a blob named Planning2015.

### Example 2: Upload all files under the current folder

```powershell
Get-ChildItem -File -Recurse | Set-AzStorageBlobContent -Container "ContosoUploads"
```

This command uses the core Windows PowerShell cmdlet Get-ChildItem to get all the files in the current folder and in subfolders, and then passes them to the current cmdlet by using the pipeline operator.
The **Set-AzStorageBlobContent** cmdlet uploads the files to the container named ContosoUploads.

### Example 3: Overwrite an existing blob

```powershell
Get-AzStorageBlob -Container "ContosoUploads" -Blob "Planning2015" | Set-AzStorageBlobContent -File "ContosoPlanning"
```

This command gets the blob named Planning2015 in the ContosoUploads container by using the Get-AzStorageBlob cmdlet, and then passes that blob to the current cmdlet.
The command uploads the file that is named ContosoPlanning as Planning2015.
This command does not specify the *Force* parameter.
The command prompts you for confirmation.
If you confirm the command, the cmdlet overwrites the existing blob.

### Example 4: Upload a file to a container by using the pipeline

```powershell
Get-AzStorageContainer -Container "ContosoUpload*" | Set-AzStorageBlobContent -File "ContosoPlanning" -Blob "Planning2015"
```

This command gets the container that starts with the string ContosoUpload by using the **Get-AzStorageContainer** cmdlet, and then passes that blob to the current cmdlet.
The command uploads the file that is named ContosoPlanning as Planning2015.

### Example 5: Upload a file to page blob with metadata and PremiumPageBlobTier as P10

```powershell
$Metadata = @{"key" = "value"; "name" = "test"}
Set-AzStorageBlobContent -File "ContosoPlanning" -Container "ContosoUploads" -Metadata $Metadata -BlobType Page -PremiumPageBlobTier P10
```

The first command creates a hash table that contains metadata for a blob, and stores that hash table in the $Metadata variable.
The second command uploads the file that is named ContosoPlanning to the container named ContosoUploads.
The blob includes the metadata stored in $Metadata, and has PremiumPageBlobTier as P10.

### Example 6: Upload a file to blob with specified blob properties, and set StandardBlobTier as Cool

```powershell
$filepath = "c:\temp\index.html"
Set-AzStorageBlobContent -File $filepath -Container "contosouploads" -Properties @{"ContentType" = [System.Web.MimeMapping]::GetMimeMapping($filepath); "ContentMD5" = "i727sP7HigloQDsqadNLHw=="} -StandardBlobTier Cool
```

```output
AccountName: storageaccountname, ContainerName: contosouploads

Name                 BlobType  Length          ContentType                    LastModified         AccessTier SnapshotTime                 IsDeleted  VersionId
----                 --------  ------          -----------                    ------------         ---------- ------------                 ---------  ---------
index.html           BlockBlob 403116          text/html                      2020-09-22 08:06:53Z Cool                                    False
```

This command uploads the file c:\temp\index.html to the container named contosouploads with specified blob properties, and set StandardBlobTier as Cool.
This command gets ContentType value set to blob properties by [System.Web.MimeMapping]::GetMimeMapping() API.

### Example 7: Upload a file to a blob with Encryption Scope

```powershell
$blob = Set-AzStorageBlobContent  -File "mylocalfile" -Container "mycontainer" -Blob "myblob"  -EncryptionScope "myencryptscope"

$blob.BlobProperties.EncryptionScope
```

```output
myencryptscope
```

This command  uploads a file to a blob with Encryption Scope.

## PARAMETERS

### -AsJob

Run cmdlet in the background.
Run cmdlet in the background

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

### -Blob

Specifies the name of a blob.
This cmdlet uploads a file to the Azure Storage blob that this parameter specifies.
Blob name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SendManual
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerPipeline
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -BlobType

Specifies the type for the blob that this cmdlet uploads.
The acceptable values for this parameter are:
- Block
- Page
- Append

The default value is Block.
Blob Type('Block', 'Page', 'Append')

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
AcceptedValues:
- Block
- Page
- Append
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

Specifies a **CloudBlob** object.
To obtain a **CloudBlob** object, use the Get-AzStorageBlob cmdlet.
Azure Blob Object

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
This cmdlet uploads content to a blob in the container that this parameter specifies.
To obtain a **CloudBlobContainer** object, use the Get-AzStorageContainer cmdlet.
Azure Blob Container Object

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

Specifies the name of a container.
This cmdlet uploads a file to a blob in the container that this parameter specifies.
Container name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SendManual
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
To use a storage context created from a SAS Token without read permission, need add -Force parameter to skip check blob existence.
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

### -EncryptionScope

Encryption scope to be used when making requests to the blob.

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

### -File

Specifies a local file path for a file to upload as blob content.
file Path.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- FullName
ParameterSets:
- Name: SendManual
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: ContainerPipeline
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobPipeline
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Force

Indicates that this cmdlet overwrites an existing blob without prompting you for confirmation.
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

### -Metadata

Specifies metadata for the uploaded blob.
Blob Metadata

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

### -PremiumPageBlobTier

Page Blob Tier
Premium Page Blob Tier

```yaml
Type: Microsoft.Azure.Storage.Blob.PremiumPageBlobTier
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

### -Properties

Specifies properties for the uploaded blob.
The supported properties are: CacheControl, ContentDisposition, ContentEncoding, ContentLanguage, ContentMD5, ContentType.
Blob Properties

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

### System.String

### Microsoft.Azure.Storage.Blob.CloudBlobContainer

### Microsoft.Azure.Storage.Blob.CloudBlob

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageBlob

## NOTES

## RELATED LINKS

- [Get-AzStorageBlobContent](./Get-AzStorageBlobContent.md)
- [Get-AzStorageBlob](./Get-AzStorageBlob.md)
- [Remove-AzStorageBlob](./Remove-AzStorageBlob.md)
