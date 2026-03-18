---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstorageencryptionscope
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageEncryptionScope

## SYNOPSIS

Get or list encryption scopes from a Storage account.

## SYNTAX

### AccountName (Default)

```
Get-AzStorageEncryptionScope [-ResourceGroupName] <string> [-StorageAccountName] <string>
 [-EncryptionScopeName <string>] [-MaxPageSize <int>] [-Filter <string>] [-Include <string>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### AccountObject

```
Get-AzStorageEncryptionScope -StorageAccount <PSStorageAccount> [-EncryptionScopeName <string>]
 [-MaxPageSize <int>] [-Filter <string>] [-Include <string>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageEncryptionScope** cmdlet gets or lists encryption scopes from a Storage account.

## EXAMPLES

### Example 1: Get a single encryption scope

```powershell
Get-AzStorageEncryptionScope -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -EncryptionScopeName $scopename
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      State    Source             KeyVaultKeyUri
----      -----    ------             --------------
testscope Disabled Microsoft.Keyvault https://keyvalutname.vault.azure.net:443/keys/keyname
```

This command gets a single encryption scope.

### Example 2: List all encryption scopes of a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
Get-AzStorageEncryptionScope -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount"


   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      State    Source             KeyVaultKeyUri
----      -----    ------             --------------
testscope Disabled Microsoft.Keyvault https://keyvalutname.vault.azure.net:443/keys/keyname
scope2    Enabled  Microsoft.Storage
```

This command lists all encryption scopes of a Storage account.

### Example 3: List all enabled encryption scopes of a Storage account with a max page size of 10 for each request

```powershell
Get-AzStorageEncryptionScope -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -MaxPageSize 10 -Include Enabled
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      State    Source             KeyVaultKeyUri
----      -----    ------             --------------
scope1    Enabled  Microsoft.Keyvault https://keyvalutname.vault.azure.net:443/keys/keyname
scope2    Enabled  Microsoft.Storage
```

This command lists all enabled encryption scopes of a Storage account, with a max page size of 10 encryption scopes included in each list response.
If there are more than 10 encryption scopes to be listed, the command will still list all the encryption scopes, but with multiple requests sent and responses received.

### Example 4: List all disabled encryption scopes with names starting with "test" of a Storage account

```powershell
Get-AzStorageEncryptionScope -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Include Disabled -Filter "startswith(name, test)"
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name          State      Source             KeyVaultKeyUri
----          -----      ------             --------------
testscope1    Disabled   Microsoft.Keyvault https://keyvalutname.vault.azure.net:443/keys/keyname
testscope2    Disabled   Microsoft.Storage
```

This command lists all disabled encryption scopes with names starting with "test" of a Storage account.
The parameter "Filter" specifies the prefix of the encryption scopes listed, and it should be in format of "startswith(name, {prefixValue})".

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

### -EncryptionScopeName

Azure Storage EncryptionScope name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- Name
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

### -Filter

The filter of encryption scope name. When specified, only encryption scope names starting with the filter will be listed.
The filter of encryption scope name. When specified, only encryption scope names starting with the filter will be listed. The filter must be in format: startswith(name, <prefix>)

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

### -Include

The filter of encryption scope name. When specified, only encryption scope names starting with the filter will be listed.
Optional, when specified, will list encryption scopes with the specific state. Defaults to All.

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
- All
- Enabled
- Disabled
HelpMessage: ''
```

### -MaxPageSize

The maximum number of encryption scopes that will be included in the list response

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

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSEncryptionScope

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

