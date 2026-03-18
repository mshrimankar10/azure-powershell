---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azdatalakegen2sastoken
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzDataLakeGen2SasToken

## SYNOPSIS

Generates a SAS token for Azure DatalakeGen2 item.

## SYNTAX

### ReceiveManual (Default)

```
New-AzDataLakeGen2SasToken [-FileSystem] <String> [-Path <String>] [-Permission <String>]
 [-Protocol <SasProtocol>] [-IPAddressOrRange <String>] [-StartTime <DateTimeOffset>]
 [-ExpiryTime <DateTimeOffset>] [-EncryptionScope <String>] [-FullUri] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### ItemPipeline

```
New-AzDataLakeGen2SasToken -InputObject <AzureDataLakeGen2Item> [-Permission <String>]
 [-Protocol <SasProtocol>] [-IPAddressOrRange <String>] [-StartTime <DateTimeOffset>]
 [-ExpiryTime <DateTimeOffset>] [-EncryptionScope <String>] [-FullUri] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzDataLakeGen2SasToken** cmdlet generates a Shared Access Signature (SAS) token for an Azure DatalakeGen2 item.

## EXAMPLES

### Example 1: Generate a SAS token with full permission

```powershell
New-AzDataLakeGen2SasToken -FileSystem "filesystem1" -Path "dir1/dir2" -Permission racwdlmeop
```

This example generates a DatalakeGen2 SAS token with full permission.

### Example 2: Generate a SAS token with specific StartTime, ExpireTime, Protocol, IPAddressOrRange, Encryption Scope, by pipeline a datalakegen2 item

```powershell
Get-AzDataLakeGen2Item -FileSystem test -Path "testdir/dir2" | New-AzDataLakeGen2SasToken -Permission rw -Protocol Https -IPAddressOrRange 10.0.0.0-12.10.0.0 -StartTime (Get-Date) -ExpiryTime (Get-Date).AddDays(6) -EncryptionScope scopename
```

This example generates a DatalakeGen2 SAS token by pipeline a datalake gen2 item, and with specific StartTime, ExpireTime, Protocol, IPAddressOrRange, Encryption Scope.

## PARAMETERS

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

### -EncryptionScope

Encryption scope to use when sending requests authorized with this SAS URI.

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

### -ExpiryTime

Expiry Time

```yaml
Type: System.Nullable`1[System.DateTimeOffset]
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

### -FileSystem

FileSystem name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ReceiveManual
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FullUri

Display full uri with sas token

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

### -InputObject

Azure Datalake Gen2 Item Object to remove.

```yaml
Type: Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureDataLakeGen2Item
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ItemPipeline
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IPAddressOrRange

IP, or IP range ACL (access control list) that the request would be accepted by Azure Storage.

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

### -Path

The path in the specified FileSystem that should be retrieved.
Can be a file or directory In the format 'directory/file.txt' or 'directory1/directory2/'.
Skip set this parameter to get the root directory of the Filesystem.
The path in the specified FileSystem that should be retrieved. Can be a file or directory In the format 'directory/file.txt' or 'directory1/directory2/'. Skip set this parameter to get the root directory of the Filesystem.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ReceiveManual
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Permission

Permissions for a blob.
Permissions can be any not-empty subset of "racwdlmeop".
Permissions for a blob. Permissions can be any not-empty subset of "racwdlmeop".

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

### -Protocol

Protocol can be used in the request with this SAS token.

```yaml
Type: System.Nullable`1[Azure.Storage.Sas.SasProtocol]
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
- None
- HttpsAndHttp
- Https
HelpMessage: ''
```

### -StartTime

Start Time

```yaml
Type: System.Nullable`1[System.DateTimeOffset]
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

### System.String

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureDataLakeGen2Item

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

