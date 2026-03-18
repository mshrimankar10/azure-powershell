---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragefile
Module Name: Az.Storage
ms.assetid: 38207027-FD76-45EE-8817-88599735C0B0
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageFile

## SYNOPSIS

Lists directories and files for a path.

## SYNTAX

### ShareName (Default)

```
Get-AzStorageFile [-ShareName] <string> [[-Path] <string>] [-ExcludeExtendedInfo]
 [-DisAllowTrailingDot] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Share

```
Get-AzStorageFile [-ShareClient] <ShareClient> [[-Path] <string>] [-ExcludeExtendedInfo]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Directory

```
Get-AzStorageFile [-ShareDirectoryClient] <ShareDirectoryClient> [[-Path] <string>]
 [-ExcludeExtendedInfo] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageFile** cmdlet lists directories and files for the share or directory that you specify.
Specify the *Path* parameter to get an instance of a directory or file in the specified path.
This cmdlet returns **AzureStorageFile** and **AzureStorageDirectory** objects.
You can use the **IsDirectory** property to distinguish between folders and files.

## EXAMPLES

### Example 1: List directories in a share

```powershell
Get-AzStorageFile -ShareName "ContosoShare06" | Where-Object {$_.GetType().Name -eq "AzureStorageFileDirectory"}
```

This command lists only the directories in the share ContosoShare06.
It first retrieves both files and directories, passes them to the **where** operator by using the pipeline operator, then discards any objects whose type is not "AzureStorageFileDirectory".

### Example 2: List a File Directory

```powershell
Get-AzStorageFile -ShareName "ContosoShare06" -Path "ContosoWorkingFolder" | Get-AzStorageFile
```

This command lists the files and folders in the directory ContosoWorkingFolder under the share ContosoShare06.
It first gets the directory instance, and then pipelines it to the **Get-AzStorageFile** cmdlet to list the directory.

### Example 3: List files and directories in a share, and exclude extended info

```powershell
Get-AzStorageFile -ShareName "ContosoShare06" -ExcludeExtendedInfo
```

This command lists the files and folders in under the share ContosoShare06, and exclude extended file info like timestamps, ETag, attributes, permissionKey in list file and Directory.
Currently, **-ExcludeExtendedInfo** will be needed to list files and directories from NFS file share or from a directory in NFS file share.

## PARAMETERS

### -ClientTimeoutPerRequest

Specifies the client side time-out interval, in seconds, for one service request.
If the previous call fails within the specified interval, this cmdlet retries the request.
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
This parameter can help mitigate network connection problems in low bandwidth environments, such as 100 kilobits per second.
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

### -Context

Specifies an Azure Storage context.
To obtain a Storage context, use the New-AzStorageContext cmdlet.
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

### -DisAllowTrailingDot

Disallow trailing dot (.) to suffix directory and file names.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ExcludeExtendedInfo

Not include extended file info like timestamps, ETag, attributes, permissionKey in list file and Directory.

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

### -Path

Specifies the path of a folder.
If you omit the *Path* parameter, **Get-AzStorageFile** lists the directories and files in the specified file share or directory.
If you include the *Path* parameter, **Get-AzStorageFile** returns an instance of a directory or file in the specified path.
Path to an existing file/directory.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ServerTimeoutPerRequest

Specifies the service-side timeout interval, in seconds, for a request.
If the specified interval elapses before the service processes the request, the Storage service returns an error.
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

### -ShareClient

ShareClient object indicated the share where the files/directories would be listed.

```yaml
Type: Azure.Storage.Files.Shares.ShareClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Share
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareDirectoryClient

ShareDirectoryClient object indicated the base folder where the files/directories would be listed.

```yaml
Type: Azure.Storage.Files.Shares.ShareDirectoryClient
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Directory
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareName

Specifies the name of the file share.
This cmdlet gets a file or directory from the file share that this parameter specifies.
Name of the file share where the files/directories would be listed.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: 0
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

### Azure.Storage.Files.Shares.ShareClient

### Azure.Storage.Files.Shares.ShareDirectoryClient

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageFile

## NOTES

## RELATED LINKS

- [Get-AzStorageFileContent](./Get-AzStorageFileContent.md)
- [New-AzStorageDirectory](./New-AzStorageDirectory.md)
- [Remove-AzStorageDirectory](./Remove-AzStorageDirectory.md)
- [Remove-AzStorageFile](./Remove-AzStorageFile.md)
- [Set-AzStorageFileContent](./Set-AzStorageFileContent.md)
