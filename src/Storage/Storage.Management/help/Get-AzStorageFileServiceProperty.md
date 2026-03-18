---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragefileserviceproperty
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageFileServiceProperty

## SYNOPSIS

Gets service properties for Azure Storage File services.

## SYNTAX

### AccountName (Default)

```
Get-AzStorageFileServiceProperty [-ResourceGroupName] <String> [-StorageAccountName] <String>
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### AccountObject

```
Get-AzStorageFileServiceProperty -StorageAccount <PSStorageAccount>
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### FileServicePropertiesResourceId

```
Get-AzStorageFileServiceProperty [-ResourceId] <String> [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageFileServiceProperty** cmdlet gets the service properties for Azure Storage File services.

## EXAMPLES

### Example 1: Get  Azure Storage File services property of a specified Storage Account

```powershell
Get-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount"
```

```output
StorageAccountName                                : mystorageaccount
ResourceGroupName                                 : myresourcegroup
ShareDeleteRetentionPolicy.Enabled                : True
ShareDeleteRetentionPolicy.Days                   : 3
ProtocolSettings.Smb.Multichannel.Enabled         : False
ProtocolSettings.Smb.Versions                     : {SMB2.1, SMB3.0, SMB3.1.1}
ProtocolSettings.Smb.AuthenticationMethods        : {Kerberos, NTLMv2}
ProtocolSettings.Smb.KerberosTicketEncryption     : {RC4-HMAC, AES-256}
ProtocolSettings.Smb.ChannelEncryption            : {AES-128-CCM, AES-128-GCM, AES-256-GCM}
ProtocolSettings.Smb.EncryptionInTransit.Required : True
ProtocolSettings.Nfs.EncryptionInTransit.Required :
```

This command gets the File services property of a specified Storage Account.

## PARAMETERS

### -DefaultProfile

The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
DefaultValue: None
SupportsWildcards: false
Aliases:
- AzContext
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

### -ResourceGroupName

Resource Group Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ResourceId

Input a Storage account Resource Id, or a File service properties Resource Id.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: FileServicePropertiesResourceId
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StorageAccount

Storage account object

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StorageAccountName

Storage Account Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- AccountName
- Name
ParameterSets:
- Name: AccountName
  Position: 1
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

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

### System.String

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSFileServiceProperties

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

