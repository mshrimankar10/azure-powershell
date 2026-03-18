---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragefilesymboliclink
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageFileSymbolicLink

## SYNOPSIS

Gets the properties of a symbolic link. Only works in NFS file share.

## SYNTAX

### ShareName (Default)

```
Get-AzStorageFileSymbolicLink [-ShareName] <string> [-Path] <string> [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Share

```
Get-AzStorageFileSymbolicLink [-ShareClient] <ShareClient> [-Path] <string>
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Directory

```
Get-AzStorageFileSymbolicLink [-ShareDirectoryClient] <ShareDirectoryClient> [-Path] <string>
 [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageFileSymbolicLink** cmdlet retrieves the properties and target path of a symbolic link in an Azure File share. This cmdlet only works with NFS file shares.

## EXAMPLES

### Example 1: Get symbolic link properties using share name

```powershell
$ctx = New-AzStorageContext -StorageAccountName "myaccount" -EnableFileBackupRequestIntent
$link = Get-AzStorageFileSymbolicLink -ShareName "nfsshare" -Path "linkdir/mylink" -Context $ctx
$link
$link.FileProperties
$link.FileProperties.PosixProperties
$link.ShareFileSymbolicLinkInfo
```

```output
AccountName: myaccount, ShareName: nfsshare

Type Length Name   Path
---- ------ ----   ----
File      0 mylink linkdir/mylink

LastModified          : 9/17/2025 8:36:43 AM +00:00
Metadata              : {}
ContentLength         : 13
ContentType           : application/octet-stream
ETag                  : "0x8DDF5C554DCC708"
ContentHash           :
ContentEncoding       :
CacheControl          :
ContentDisposition    :
ContentLanguage       :
CopyCompletedOn       : 1/1/0001 12:00:00 AM +00:00
CopyStatusDescription :
CopyId                :
CopyProgress          :
CopySource            :
CopyStatus            : Pending
IsServerEncrypted     : True
SmbProperties         : Azure.Storage.Files.Shares.Models.FileSmbProperties
LeaseDuration         : Infinite
LeaseState            : Available
LeaseStatus           : Unlocked
PosixProperties       : Azure.Storage.Files.Shares.Models.FilePosixProperties


FileMode  : rwxrwxrwx
Owner     : 0
Group     : 0
FileType  : SymLink
LinkCount : 1


ETag         : "0x8DDF5C554DCC708"
LastModified : 9/17/2025 8:36:43 AM +00:00
LinkText     : app%2Fmain.exe
```

This command gets the properties of a symbolic link named "mylink" in the "links" directory of the NFS file share "nfsshare".

### Example 2: Get multiple symbolic links in a directory

```powershell
$files = Get-AzStorageFile -ShareName "nfsshare" -Path "linkdir" -Context $ctx | Get-AzStorageFile -ExcludeExtendedInfo
$symLinkFiles = $files | Where-Object {$_.FileProperties.PosixProperties.FileType.ToString() -eq "SymLink"}
foreach ($file in $symLinkFiles) {
    $symlink = Get-AzStorageFileSymbolicLink -ShareName "nfsshare"  -Path "linkdir/$($file.Name)" -Context $ctx
    Write-Output "$($file.Name) -> $([System.Web.HttpUtility]::UrlDecode($symlink.ShareFileSymbolicLinkInfo.LinkText))"
}
```

This command first lists all files in "linkdir" directory , then filter out all files which are symbolic link, finally gets symbolic link properties for each file.

### Example 3: Get symbolic link using ShareClient pipeline

```powershell
$ctx = New-AzStorageContext -StorageAccountName "myaccount" -EnableFileBackupRequestIntent
$shareClient = Get-AzStorageShare -Name "nfsshare" -Context $ctx
$link = $shareClient | Get-AzStorageFileSymbolicLink -Path "linkdir/mylink"
```

This command gets a symbolic link using a ShareClient object obtained from Get-AzStorageShare, demonstrating the pipeline usage with the Share parameter set.

### Example 4: Get symbolic link using ShareDirectoryClient pipeline

```powershell
$ctx = New-AzStorageContext -StorageAccountName "myaccount" -EnableFileBackupRequestIntent
$dirClient = Get-AzStorageFile -ShareName "nfsshare" -Path "linkdir" -Context $ctx
$link = $dirClient | Get-AzStorageFileSymbolicLink -Path "mylink"
```

This command gets a symbolic link within a specific directory using a ShareDirectoryClient object, demonstrating the pipeline usage with the Directory parameter set.

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

### -Path

Path of the symbolic link file to retrieve.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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

### -ShareClient

ShareClient object indicating the share containing the symbolic link.

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

ShareDirectoryClient object indicating the base folder containing the symbolic link.

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

Name of the file share containing the symbolic link.

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

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageFile

### Azure.Storage.Files.Shares.Models.ShareFileSymbolicLinkInfo

{{ Fill in the Description }}

## NOTES

- This cmdlet only works with NFS file shares
- The returned object contains the symbolic link properties including the target path (LinkText)
- Use the FileProperties.LinkText property to access the target path of the symbolic link
- The FileProperties.IsSymbolicLink property can be used to verify the file is indeed a symbolic link

## RELATED LINKS

- [New-AzStorageFileSymbolicLink](./New-AzStorageFileSymbolicLink.md)
- [Get-AzStorageFile](./Get-AzStorageFile.md)
- [New-AzStorageFileHardLink](./New-AzStorageFileHardLink.md)
