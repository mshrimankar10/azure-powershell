---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/update-azstoragefileserviceproperty
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Update-AzStorageFileServiceProperty

## SYNOPSIS

Modifies the service properties for the Azure Storage File service.

## SYNTAX

### AccountName (Default)

```
Update-AzStorageFileServiceProperty [-ResourceGroupName] <string> [-StorageAccountName] <string>
 [-EnableShareDeleteRetentionPolicy <bool>] [-ShareRetentionDays <int>]
 [-EnableSmbMultichannel <bool>] [-SmbProtocolVersion <string[]>]
 [-SmbAuthenticationMethod <string[]>] [-SmbChannelEncryption <string[]>]
 [-SmbKerberosTicketEncryption <string[]>] [-SmbEncryptionInTransitRequired <bool>]
 [-NfsEncryptionInTransitRequired <bool>] [-CorsRule <PSCorsRule[]>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountObject

```
Update-AzStorageFileServiceProperty -StorageAccount <PSStorageAccount>
 [-EnableShareDeleteRetentionPolicy <bool>] [-ShareRetentionDays <int>]
 [-EnableSmbMultichannel <bool>] [-SmbProtocolVersion <string[]>]
 [-SmbAuthenticationMethod <string[]>] [-SmbChannelEncryption <string[]>]
 [-SmbKerberosTicketEncryption <string[]>] [-SmbEncryptionInTransitRequired <bool>]
 [-NfsEncryptionInTransitRequired <bool>] [-CorsRule <PSCorsRule[]>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### FileServicePropertiesResourceId

```
Update-AzStorageFileServiceProperty [-ResourceId] <string>
 [-EnableShareDeleteRetentionPolicy <bool>] [-ShareRetentionDays <int>]
 [-EnableSmbMultichannel <bool>] [-SmbProtocolVersion <string[]>]
 [-SmbAuthenticationMethod <string[]>] [-SmbChannelEncryption <string[]>]
 [-SmbKerberosTicketEncryption <string[]>] [-SmbEncryptionInTransitRequired <bool>]
 [-NfsEncryptionInTransitRequired <bool>] [-CorsRule <PSCorsRule[]>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Update-AzStorageFileServiceProperty** cmdlet modifies the service properties for the Azure Storage File service.

## EXAMPLES

### Example 1: Enable File share softdelete

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -EnableShareDeleteRetentionPolicy $true -ShareRetentionDays 5
```

```output
StorageAccountName                            : mystorageaccount
ResourceGroupName                             : myresourcegroup
ShareDeleteRetentionPolicy.Enabled            : True
ShareDeleteRetentionPolicy.Days               : 5
ProtocolSettings.Smb.Multichannel.Enabled     : False
ProtocolSettings.Smb.Versions                 :
ProtocolSettings.Smb.AuthenticationMethods    :
ProtocolSettings.Smb.KerberosTicketEncryption :
ProtocolSettings.Smb.ChannelEncryption        :
```

This command enables File share softdelete delete with retention days as 5

### Example 2: Enable Smb Multichannel

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -EnableSmbMultichannel $true
```

```output
StorageAccountName                            : mystorageaccount
ResourceGroupName                             : myresourcegroup
ShareDeleteRetentionPolicy.Enabled            : True
ShareDeleteRetentionPolicy.Days               : 5
ProtocolSettings.Smb.Multichannel.Enabled     : True
ProtocolSettings.Smb.Versions                 :
ProtocolSettings.Smb.AuthenticationMethods    :
ProtocolSettings.Smb.KerberosTicketEncryption :
ProtocolSettings.Smb.ChannelEncryption        :
```

This command enables Smb Multichannel, only supported on Premium FileStorage account.

### Example 3: Updates secure smb settings

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" `
			-SMBProtocolVersion SMB2.1,SMB3.0,SMB3.1.1  `
			-SMBAuthenticationMethod Kerberos,NTLMv2 `
			-SMBKerberosTicketEncryption RC4-HMAC,AES-256 `
			-SMBChannelEncryption AES-128-CCM,AES-128-GCM,AES-256-GCM
```

```output
StorageAccountName                            : mystorageaccount
ResourceGroupName                             : myresourcegroup
ShareDeleteRetentionPolicy.Enabled            : True
ShareDeleteRetentionPolicy.Days               : 5
ProtocolSettings.Smb.Multichannel.Enabled     : True
ProtocolSettings.Smb.Versions                 : {SMB2.1, SMB3.0, SMB3.1.1}
ProtocolSettings.Smb.AuthenticationMethods    : {Kerberos, NTLMv2}
ProtocolSettings.Smb.KerberosTicketEncryption : {RC4-HMAC, AES-256}
ProtocolSettings.Smb.ChannelEncryption        : {AES-128-CCM, AES-128-GCM, AES-256-GCM}
```

This command updates secure smb settings.

### Example 4: Clear secure smb settings

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" `
			-SMBProtocolVersion @() `
			-SMBAuthenticationMethod @() `
			-SMBKerberosTicketEncryption @() `
			-SMBChannelEncryption @()
```

```output
StorageAccountName                            : mystorageaccount
ResourceGroupName                             : myresourcegroup
ShareDeleteRetentionPolicy.Enabled            : True
ShareDeleteRetentionPolicy.Days               : 5
ProtocolSettings.Smb.Multichannel.Enabled     : True
ProtocolSettings.Smb.Versions                 :
ProtocolSettings.Smb.AuthenticationMethods    :
ProtocolSettings.Smb.KerberosTicketEncryption :
ProtocolSettings.Smb.ChannelEncryption        :
```

This command clears secure smb settings.

### Example 5: Update CORS rules

```powershell
$CorsRules = (@{
    AllowedHeaders=@("x-ms-blob-content-type","x-ms-blob-content-disposition");
    ExposedHeaders=@();
    AllowedOrigins=@("*");
    AllowedMethods=@("TRACE","CONNECT")},
    @{
    AllowedOrigins=@("http://www.fabrikam.com","http://www.contoso.com");
    ExposedHeaders=@("x-ms-meta-data*","x-ms-meta-customheader");
    AllowedHeaders=@("x-ms-meta-target*","x-ms-meta-customheader");
    MaxAgeInSeconds=30;
    AllowedMethods=@("PUT")})

$property = Update-AzStorageFileServiceProperty -ResourceGroupName myresourcegroup -StorageAccountName mystorageaccount -CorsRule $CorsRules
$property.Cors.CorsRulesProperty
```

```output
AllowedOrigins  : {*}
AllowedMethods  : {TRACE, CONNECT}
MaxAgeInSeconds : 0
ExposedHeaders  : {}
AllowedHeaders  : {x-ms-blob-content-type, x-ms-blob-content-disposition}

AllowedOrigins  : {http://www.fabrikam.com, http://www.contoso.com}
AllowedMethods  : {PUT}
MaxAgeInSeconds : 30
ExposedHeaders  : {x-ms-meta-customheader, x-ms-meta-data*}
AllowedHeaders  : {x-ms-meta-customheader, x-ms-meta-target*}
```

The first command assigns an array of rules to the $CorsRules variable. This command uses standard extends over several lines in this code block.
The second command sets the rules in $CorsRules to the File service of a Storage account.

### Example 6: Clean up CORS rules

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName myresourcegroup -StorageAccountName mystorageaccount -CorsRule @()
```

This command cleans up the CORS rules of a Storage account by inputting @() to parameter CorsRule

### Example 7: Enable SMB encryption in transit

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName myresourcegroup -StorageAccountName mystorageaccount -SmbEncryptionInTransitRequired $true
```

This command enabled SMB encryption in transit for the specified storage account.

### Example 8: Enable NFS encryption in transit

```powershell
Update-AzStorageFileServiceProperty -ResourceGroupName myresourcegroup -StorageAccountName mystorageaccount -NfsEncryptionInTransitRequired $true
```

This command enabled NFS encryption in transit for the specified storage account.

## PARAMETERS

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
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

### -CorsRule

Specifies CORS rules for the File service.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSCorsRule[]
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

### -EnableShareDeleteRetentionPolicy

Enable share Delete Retention Policy for the storage account by set to $true, disable share Delete Retention Policy  by set to $false.

```yaml
Type: System.Boolean
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

### -EnableSmbMultichannel

Enable Multichannel by set to $true, disable Multichannel by set to $false. Applies to Premium FileStorage only.

```yaml
Type: System.Boolean
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

### -NfsEncryptionInTransitRequired

Enable Multichannel by set to $true, disable Multichannel by set to $false. Applies to Premium FileStorage only.

```yaml
Type: System.Boolean
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

### -ShareRetentionDays

Sets the number of retention days for the share DeleteRetentionPolicy.
The value should only be set when enable share Delete Retention Policy.
Sets the number of retention days for the share DeleteRetentionPolicy. The value should only be set when enable share Delete Retention Policy.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases:
- Days
- RetentionDays
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

### -SmbAuthenticationMethod

Gets or sets SMB authentication methods supported by server. Valid values are NTLMv2, Kerberos.

```yaml
Type: System.String[]
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
- Kerberos
- NTLMv2
HelpMessage: ''
```

### -SmbChannelEncryption

Gets or sets SMB channel encryption supported by server. Valid values are AES-128-CCM, AES-128-GCM, AES-256-GCM.

```yaml
Type: System.String[]
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
- AES-128-CCM
- AES-128-GCM
- AES-256-GCM
HelpMessage: ''
```

### -SmbEncryptionInTransitRequired

Enable Multichannel by set to $true, disable Multichannel by set to $false. Applies to Premium FileStorage only.

```yaml
Type: System.Boolean
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

### -SmbKerberosTicketEncryption

Gets or sets kerberos ticket encryption supported by server. Valid values are RC4-HMAC, AES-256.

```yaml
Type: System.String[]
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
- AES-256
- RC4-HMAC
HelpMessage: ''
```

### -SmbProtocolVersion

Gets or sets SMB protocol versions supported by server. Valid values are SMB2.1, SMB3.0, SMB3.1.1.

```yaml
Type: System.String[]
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
- SMB2.1
- SMB3.0
- SMB3.1.1
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

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.
Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
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

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

### System.String

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSFileServiceProperties

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

