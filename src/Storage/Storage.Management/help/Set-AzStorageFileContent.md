---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstoragefilecontent
Module Name: Az.Storage
ms.assetid: FA98E64B-D589-4653-9ACC-86573FAF4550
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageFileContent

## SYNOPSIS

Uploads the contents of a file.

## SYNTAX

### ShareName (Default)

```
Set-AzStorageFileContent [-ShareName] <string> [-Source] <string> [[-Path] <string>]
 [-FileMode <string>] [-Owner <string>] [-Group <string>] [-PassThru] [-Force] [-AsJob]
 [-DisAllowTrailingDot] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [-PreserveSMBAttribute] [<CommonParameters>]
```

### Share

```
Set-AzStorageFileContent [-ShareClient] <ShareClient> [-Source] <string> [[-Path] <string>]
 [-FileMode <string>] [-Owner <string>] [-Group <string>] [-PassThru] [-Force] [-AsJob]
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm]
 [-PreserveSMBAttribute] [<CommonParameters>]
```

### Directory

```
Set-AzStorageFileContent [-ShareDirectoryClient] <ShareDirectoryClient> [-Source] <string>
 [[-Path] <string>] [-FileMode <string>] [-Owner <string>] [-Group <string>] [-PassThru] [-Force]
 [-AsJob] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [-WhatIf] [-Confirm] [-PreserveSMBAttribute] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageFileContent** cmdlet uploads the contents of a file to a file on a specified share.

## EXAMPLES

### Example 1: Upload a file in the current folder

```powershell
Set-AzStorageFileContent -ShareName "ContosoShare06" -Source "DataFile37" -Path "ContosoWorkingFolder/CurrentDataFile"
```

This command uploads a file that is named DataFile37 in the current folder as a file that is named CurrentDataFile in the folder named ContosoWorkingFolder.

### Example 2: Upload all the files in the current folder

```powershell
$CurrentFolder = (Get-Item .).FullName
$Container = Get-AzStorageShare -Name "ContosoShare06"
Get-ChildItem -Recurse | Where-Object { $_.GetType().Name -eq "FileInfo"} | ForEach-Object {
    $path=$_.FullName.Substring($Currentfolder.Length+1).Replace("\","/")
    Set-AzStorageFileContent -ShareClient $Container -Source $_.FullName -Path $path -Force
}
```

This example uses several common Windows PowerShell cmdlets and the current cmdlet to upload all files from the current folder to the root folder of container ContosoShare06.
The first command gets the name of the current folder and stores it in the $CurrentFolder variable.
The second command uses the **Get-AzStorageShare** cmdlet to get the file share named ContosoShare06, and then stores it in the $Container variable.
The final command gets the contents of the current folder and passes each one to the Where-Object cmdlet by using the pipeline operator.
That cmdlet filters out objects that are not files, and then passes the files to the ForEach-Object cmdlet.
That cmdlet runs a script block for each file that creates the appropriate path for it and then uses the current cmdlet to upload the file.
The result has the same name and same relative position with regard to the other files that this example uploads.
For more information about script blocks, type `Get-Help about_Script_Blocks`.

### Example 3: Upload a local file to an Azure file, and preserve the local File SMB properties (File Attributes, File Creation Time, File Last Write Time) in the Azure file.

```powershell
Set-AzStorageFileContent -Source $localFilePath -ShareName sample -Path "dir1/file1" -PreserveSMBAttribute
```

This example uploads a local file to an Azure file, and preserves the local File SMB properties (File Attributes, File Creation Time, File Last Write Time) in the Azure file.

### Example 4:  Upload a file with FileMode, Owner and Group to a NFS file share

```powershell
Set-AzStorageFileContent -ShareName "contososhare06" -Source "DataFile37" -Path "ContosoWorkingFolder/CurrentDataFile" -FileMode rw-r--rwt -Owner 1 -Group 1
```

This command uploads a local file to an Azure file with FileMode rwxrwSrwx, Owner 1 and Group 1.
FileMode, Owner, Group only works on NFS file share.

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
To obtain a storage context, use the [New-AzStorageContext](./New-AzStorageContext.md) cmdlet.
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

### -FileMode

Only applicable to NFS Files. The mode permissions to be set on the file. Symbolic (rwxrw-rw-) is supported.

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

Indicates that this cmdlet overwrites an existing Azure storage file.
Force to overwrite the existing file.

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

### -Group

Only applicable to NFS Files. The owner group identifier (GID) to be set on the file. The default value is 0 (root group).

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

### -Owner

Only applicable to NFS Files. The owner user identifier (UID) to be set on the file. The default value is 0 (root).

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

Indicates that this cmdlet returns the **AzureStorageFile** object that it creates or uploads.
Returns an object representing the downloaded cloud file. By default, this cmdlet does not generate any output.

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

Specifies the path of a file or folder.
This cmdlet uploads contents to the file that this parameter specifies, or to a file in the folder that this parameter specifies.
If you specify a folder, this cmdlet creates a file that has the same name as the source file.
If you specify a path of a file that does not exist, this cmdlet creates that file and saves the contents to that file.
If you specify a file that already exists, and you specify the _Force_ parameter, this cmdlet overwrites the contents of the file.
If you specify a file that already exists and you do not specify _Force_, this cmdlet makes no change, and returns an error.
If you specify a path of a folder that does not exist, this cmdlet makes no change, and returns an error.
Path to the cloud file which would be uploaded to.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PreserveSMBAttribute

Keep the source File SMB properties (File Attributes, File Creation Time, File Last Write Time) in destination File. This parameter is only available on Windows.

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

Specifies the length of the time-out period for the server part of a request.
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

ShareClient object indicated the share where the file would be uploaded to.

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

ShareDirectoryClient object indicated the directory where the file would be uploaded.

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
This cmdlet uploads to a file in the file share this parameter specifies.
Name of the file share where the file would be uploaded to.

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

### -Source

Specifies the source file that this cmdlet uploads.
If you specify a file that does not exist, this cmdlet returns an error.
Path to the local file to be uploaded.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- FullName
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
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

### Azure.Storage.Files.Shares.ShareClient

### Azure.Storage.Files.Shares.ShareDirectoryClient

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageFile

## NOTES

## RELATED LINKS

- [Remove-AzStorageDirectory](./Remove-AzStorageDirectory.md)
- [New-AzStorageDirectory](./New-AzStorageDirectory.md)
- [Get-AzStorageFileContent](./Get-AzStorageFileContent.md)
