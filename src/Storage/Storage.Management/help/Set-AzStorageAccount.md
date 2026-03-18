---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageaccount
Module Name: Az.Storage
ms.assetid: 4D7EEDD7-89D4-4B1E-A9A1-B301E759CE72
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageAccount

## SYNOPSIS

Modifies a Storage account.

## SYNTAX

### StorageEncryption (Default)

```
Set-AzStorageAccount [-ResourceGroupName] <string> [-Name] <string> [-Force] [-SkuName <string>]
 [-AccessTier <string>] [-CustomDomainName <string>] [-UseSubDomain <bool>] [-Tag <hashtable>]
 [-EnableHttpsTrafficOnly <bool>] [-StorageEncryption] [-AssignIdentity]
 [-UserAssignedIdentityId <string>] [-KeyVaultUserAssignedIdentityId <string>]
 [-KeyVaultFederatedClientId <string>] [-IdentityType <string>] [-NetworkRuleSet <PSNetworkRuleSet>]
 [-UpgradeToStorageV2] [-EnableAzureActiveDirectoryDomainServicesForFile <bool>]
 [-EnableLargeFileShare] [-PublishMicrosoftEndpoint <bool>] [-PublishInternetEndpoint <bool>]
 [-EnableSmbOAuth <bool>] [-AllowBlobPublicAccess <bool>] [-MinimumTlsVersion <string>]
 [-AllowSharedKeyAccess <bool>] [-SasExpirationPeriod <timespan>] [-SasExpirationAction <string>]
 [-KeyExpirationPeriodInDay <int>] [-AllowCrossTenantReplication <bool>]
 [-DefaultSharePermission <string>] [-PublicNetworkAccess <string>] [-ImmutabilityPeriod <int>]
 [-ImmutabilityPolicyState <string>] [-EnableSftp <bool>] [-EnableLocalUser <bool>]
 [-AllowedCopyScope <string>] [-Zone <string[]>] [-ZonePlacementPolicy <string>]
 [-EnableBlobGeoPriorityReplication <bool>] [-AsJob] [-DefaultProfile <IAzureContextContainer>]
 [-RoutingChoice <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### KeyvaultEncryption

```
Set-AzStorageAccount [-ResourceGroupName] <string> [-Name] <string> -KeyName <string>
 -KeyVaultUri <string> [-Force] [-SkuName <string>] [-AccessTier <string>]
 [-CustomDomainName <string>] [-UseSubDomain <bool>] [-Tag <hashtable>]
 [-EnableHttpsTrafficOnly <bool>] [-KeyvaultEncryption] [-KeyVersion <string>] [-AssignIdentity]
 [-UserAssignedIdentityId <string>] [-KeyVaultUserAssignedIdentityId <string>]
 [-KeyVaultFederatedClientId <string>] [-IdentityType <string>] [-NetworkRuleSet <PSNetworkRuleSet>]
 [-UpgradeToStorageV2] [-EnableAzureActiveDirectoryDomainServicesForFile <bool>]
 [-EnableLargeFileShare] [-PublishMicrosoftEndpoint <bool>] [-PublishInternetEndpoint <bool>]
 [-EnableSmbOAuth <bool>] [-AllowBlobPublicAccess <bool>] [-MinimumTlsVersion <string>]
 [-AllowSharedKeyAccess <bool>] [-SasExpirationPeriod <timespan>] [-SasExpirationAction <string>]
 [-KeyExpirationPeriodInDay <int>] [-AllowCrossTenantReplication <bool>]
 [-DefaultSharePermission <string>] [-PublicNetworkAccess <string>] [-ImmutabilityPeriod <int>]
 [-ImmutabilityPolicyState <string>] [-EnableSftp <bool>] [-EnableLocalUser <bool>]
 [-AllowedCopyScope <string>] [-Zone <string[]>] [-ZonePlacementPolicy <string>]
 [-EnableBlobGeoPriorityReplication <bool>] [-AsJob] [-DefaultProfile <IAzureContextContainer>]
 [-RoutingChoice <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AzureActiveDirectoryKerberosForFile

```
Set-AzStorageAccount [-ResourceGroupName] <string> [-Name] <string> [-Force] [-SkuName <string>]
 [-AccessTier <string>] [-CustomDomainName <string>] [-UseSubDomain <bool>] [-Tag <hashtable>]
 [-EnableHttpsTrafficOnly <bool>] [-AssignIdentity] [-UserAssignedIdentityId <string>]
 [-KeyVaultUserAssignedIdentityId <string>] [-KeyVaultFederatedClientId <string>]
 [-IdentityType <string>] [-NetworkRuleSet <PSNetworkRuleSet>] [-UpgradeToStorageV2]
 [-EnableLargeFileShare] [-PublishMicrosoftEndpoint <bool>] [-PublishInternetEndpoint <bool>]
 [-EnableAzureActiveDirectoryKerberosForFile <bool>] [-ActiveDirectoryDomainName <string>]
 [-ActiveDirectoryDomainGuid <string>] [-EnableSmbOAuth <bool>] [-AllowBlobPublicAccess <bool>]
 [-MinimumTlsVersion <string>] [-AllowSharedKeyAccess <bool>] [-SasExpirationPeriod <timespan>]
 [-SasExpirationAction <string>] [-KeyExpirationPeriodInDay <int>]
 [-AllowCrossTenantReplication <bool>] [-DefaultSharePermission <string>]
 [-PublicNetworkAccess <string>] [-ImmutabilityPeriod <int>] [-ImmutabilityPolicyState <string>]
 [-EnableSftp <bool>] [-EnableLocalUser <bool>] [-AllowedCopyScope <string>] [-Zone <string[]>]
 [-ZonePlacementPolicy <string>] [-EnableBlobGeoPriorityReplication <bool>] [-AsJob]
 [-DefaultProfile <IAzureContextContainer>] [-RoutingChoice <string>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ActiveDirectoryDomainServicesForFile

```
Set-AzStorageAccount [-ResourceGroupName] <string> [-Name] <string>
 -EnableActiveDirectoryDomainServicesForFile <bool> [-Force] [-SkuName <string>]
 [-AccessTier <string>] [-CustomDomainName <string>] [-UseSubDomain <bool>] [-Tag <hashtable>]
 [-EnableHttpsTrafficOnly <bool>] [-AssignIdentity] [-UserAssignedIdentityId <string>]
 [-KeyVaultUserAssignedIdentityId <string>] [-KeyVaultFederatedClientId <string>]
 [-IdentityType <string>] [-NetworkRuleSet <PSNetworkRuleSet>] [-UpgradeToStorageV2]
 [-EnableLargeFileShare] [-PublishMicrosoftEndpoint <bool>] [-PublishInternetEndpoint <bool>]
 [-ActiveDirectoryDomainName <string>] [-ActiveDirectoryNetBiosDomainName <string>]
 [-ActiveDirectoryForestName <string>] [-ActiveDirectoryDomainGuid <string>]
 [-ActiveDirectoryDomainSid <string>] [-ActiveDirectoryAzureStorageSid <string>]
 [-ActiveDirectorySamAccountName <string>] [-ActiveDirectoryAccountType <string>]
 [-EnableSmbOAuth <bool>] [-AllowBlobPublicAccess <bool>] [-MinimumTlsVersion <string>]
 [-AllowSharedKeyAccess <bool>] [-SasExpirationPeriod <timespan>] [-SasExpirationAction <string>]
 [-KeyExpirationPeriodInDay <int>] [-AllowCrossTenantReplication <bool>]
 [-DefaultSharePermission <string>] [-PublicNetworkAccess <string>] [-ImmutabilityPeriod <int>]
 [-ImmutabilityPolicyState <string>] [-EnableSftp <bool>] [-EnableLocalUser <bool>]
 [-AllowedCopyScope <string>] [-Zone <string[]>] [-ZonePlacementPolicy <string>]
 [-EnableBlobGeoPriorityReplication <bool>] [-AsJob] [-DefaultProfile <IAzureContextContainer>]
 [-RoutingChoice <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageAccount** cmdlet modifies an Azure Storage account.
You can use this cmdlet to modify the account type, update a customer domain, or set tags on a Storage account.

## EXAMPLES

### Example 1: Set the Storage account type

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -SkuName "Standard_RAGRS"
```

This command sets the Storage account type to Standard_RAGRS.

### Example 2: Set a custom domain for a Storage account

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -CustomDomainName "www.contoso.com" -UseSubDomain $true
```

This command sets a custom domain for a Storage account.

### Example 3: Set the access tier value

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -AccessTier Cool
```

The command sets the Access Tier value to be cool.

### Example 4: Set the custom domain and tags

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -CustomDomainName "www.domainname.com" -UseSubDomain $true -Tag @{tag0="value0";tag1="value1";tag2="value2"}
```

The command sets the custom domain and tags for a Storage account.

### Example 5: Set Encryption KeySource to Keyvault

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -AssignIdentity
$account = Get-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount"

$keyVault = New-AzKeyVault -VaultName "MyKeyVault" -ResourceGroupName "MyResourceGroup" -Location "EastUS2"
$key = Add-AzKeyVaultKey -VaultName "MyKeyVault" -Name "MyKey" -Destination 'Software'
Set-AzKeyVaultAccessPolicy -VaultName "MyKeyVault" -ObjectId $account.Identity.PrincipalId -PermissionsToKeys wrapkey,unwrapkey,get

# In case to enable key auto rotation, don't set KeyVersion
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -KeyvaultEncryption -KeyName $key.Name -KeyVersion $key.Version -KeyVaultUri $keyVault.VaultUri

# In case to enable key auto rotation after set keyvault properties with KeyVersion, can update account by set KeyVersion to empty
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -KeyvaultEncryption -KeyName $key.Name -KeyVersion "" -KeyVaultUri $keyVault.VaultUri
```

This command set Encryption KeySource with a new created Keyvault.
If want to enable key auto rotation, don't set keyversion when set Keyvault properties for the first time, or clean up it by set keyvault properties again with keyversion as empty.

### Example 6: Set Encryption KeySource to "Microsoft.Storage"

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -StorageEncryption
```

This command set Encryption KeySource to "Microsoft.Storage"

### Example 7: Set NetworkRuleSet property of a Storage account with JSON

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -NetworkRuleSet (@{bypass="Logging,Metrics";
    ipRules=(@{IPAddressOrRange="20.11.0.0/16";Action="allow"},
            @{IPAddressOrRange="10.0.0.0/7";Action="allow"});
    virtualNetworkRules=(@{VirtualNetworkResourceId="/subscriptions/s1/resourceGroups/g1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1";Action="allow"},
                        @{VirtualNetworkResourceId="/subscriptions/s1/resourceGroups/g1/providers/Microsoft.Network/virtualNetworks/vnet2/subnets/subnet2";Action="allow"});
    defaultAction="allow"})
```

This command sets NetworkRuleSet property of a Storage account with JSON

### Example 8: Get NetworkRuleSet property from a Storage account, and set it to another Storage account

```powershell
$networkRuleSet = (Get-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount").NetworkRuleSet
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount2" -NetworkRuleSet $networkRuleSet
```

This first command gets NetworkRuleSet property from a Storage account, and the second command sets it to another Storage account

### Example 9: Upgrade a Storage account with Kind "Storage" or "BlobStorage" to "StorageV2" kind Storage account

```powershell
Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -UpgradeToStorageV2
```

The command upgrade a Storage account with Kind "Storage" or "BlobStorage" to "StorageV2" kind Storage account.

### Example 10: Update a Storage account by enable Azure Files Microsoft Entra Domain Services Authentication and set DefaultSharePermission.

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -EnableAzureActiveDirectoryDomainServicesForFile $true -DefaultSharePermission StorageFileDataSmbShareContributor

$account.AzureFilesIdentityBasedAuth
```

```output
DirectoryServiceOptions ActiveDirectoryProperties                                                      DefaultSharePermission
----------------------- -------------------------                                                      ----------------------
AADDS                   Microsoft.Azure.Commands.Management.Storage.Models.PSActiveDirectoryProperties StorageFileDataSmbShareContributor
```

The command update a Storage account by enable Azure Files Microsoft Entra Domain Services Authentication.

### Example 11: Update a Storage account by enable Files Active Directory Domain Service Authentication, and then show the File Identity Based authentication setting

<!-- Skip: Output cannot be splitted from code -->


```
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -EnableActiveDirectoryDomainServicesForFile $true `
        -ActiveDirectoryDomainName "mydomain.com" `
        -ActiveDirectoryNetBiosDomainName "mydomain.com" `
        -ActiveDirectoryForestName "mydomain.com" `
        -ActiveDirectoryDomainGuid "12345678-1234-1234-1234-123456789012" `
        -ActiveDirectoryDomainSid "S-1-5-21-1234567890-1234567890-1234567890" `
        -ActiveDirectoryAzureStorageSid "S-1-5-21-1234567890-1234567890-1234567890-1234" `
        -ActiveDirectorySamAccountName "samaccountname" `
        -ActiveDirectoryAccountType Computer

$account.AzureFilesIdentityBasedAuth.DirectoryServiceOptions
AD

$account.AzureFilesIdentityBasedAuth.ActiveDirectoryProperties

DomainName        : mydomain.com
NetBiosDomainName : mydomain.com
ForestName        : mydomain.com
DomainGuid        : 12345678-1234-1234-1234-123456789012
DomainSid         : S-1-5-21-1234567890-1234567890-1234567890
AzureStorageSid   : S-1-5-21-1234567890-1234567890-1234567890-1234
SamAccountName    : samaccountname
AccountType       : Computer
```

The command updates a Storage account by enable Azure Files Active Directory Domain Service Authentication, and then shows the File Identity Based authentication setting

### Example 12: Set MinimumTlsVersion, AllowBlobPublicAccess and AllowSharedKeyAccess

<!-- Skip: Output cannot be splitted from code -->


```
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -MinimumTlsVersion TLS1_1 -AllowBlobPublicAccess $false -AllowSharedKeyAccess $true

$account.MinimumTlsVersion
TLS1_1

$account.AllowBlobPublicAccess
False

$a.AllowSharedKeyAccess
True
```

The command sets MinimumTlsVersion, AllowBlobPublicAccess and AllowSharedKeyAccess, and then show the the 3 properties of the account

### Example 13: Update a Storage account with RoutingPreference setting

<!-- Skip: Output cannot be splitted from code -->


```powershell
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -PublishMicrosoftEndpoint $false -PublishInternetEndpoint $true -RoutingChoice InternetRouting

$account.RoutingPreference

RoutingChoice   PublishMicrosoftEndpoints PublishInternetEndpoints
-------------   ------------------------- ------------------------
InternetRouting                     False                     True

$account.PrimaryEndpoints

Blob               : https://mystorageaccount.blob.core.windows.net/
Queue              : https://mystorageaccount.queue.core.windows.net/
Table              : https://mystorageaccount.table.core.windows.net/
File               : https://mystorageaccount.file.core.windows.net/
Web                : https://mystorageaccount.z2.web.core.windows.net/
Dfs                : https://mystorageaccount.dfs.core.windows.net/
MicrosoftEndpoints :
InternetEndpoints  : {"Blob":"https://mystorageaccount-internetrouting.blob.core.windows.net/","File":"https://mystorageaccount-internetrouting.file.core.windows.net/","Web":"https://mystorageaccount-internetrouting.z2.web.core.windows.net/","Dfs":"https://w
                     eirp3-internetrouting.dfs.core.windows.net/"}
```

This command updates a Storage account with RoutingPreference setting: PublishMicrosoftEndpoint as false, PublishInternetEndpoint as true, and RoutingChoice as MicrosoftRouting.

### Example 14: Update a Storage account with KeyExpirationPeriod and SasExpirationPeriod with SasExpirationAction

<!-- Skip: Output cannot be splitted from code -->


```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -KeyExpirationPeriodInDay 5 -SasExpirationPeriod "1.12:05:06" -SasExpirationAction Log

$account.KeyPolicy.KeyExpirationPeriodInDays
5

$account.SasPolicy.SasExpirationPeriod

SasExpirationPeriod ExpirationAction
------------------- ----------------
1.12:05:06          Log
```

This command updates a Storage account with KeyExpirationPeriod and SasExpirationPeriod with SasExpirationAction, then show the updated account related properties.

### Example 15: Update a Storage account to Keyvault encryption, and access Keyvault with user assigned identity

<!-- Skip: Output cannot be splitted from code -->


```powershell
# Create KeyVault (no need if using exist keyvault)
$keyVault = New-AzKeyVault -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -Location eastus2euap -EnablePurgeProtection
$key = Add-AzKeyVaultKey -VaultName $keyvaultName -Name $keyname -Destination 'Software'

# create user assigned identity and grant access to keyvault (no need if using exist user assigned identity)
$userId = New-AzUserAssignedIdentity -ResourceGroupName $resourceGroupName -Name $userIdName
Set-AzKeyVaultAccessPolicy -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -ObjectId $userId.PrincipalId -PermissionsToKeys get,wrapkey,unwrapkey -BypassObjectIdValidation
$useridentityId= $userId.Id

# Update Storage account with Keyvault encryption and access Keyvault with user assigned identity, then show properties
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName `
                -IdentityType UserAssigned  -UserAssignedIdentityId $useridentityId  `
                -KeyVaultUri $keyVault.VaultUri -KeyName $keyname -KeyVaultUserAssignedIdentityId $useridentityId

$account.Encryption.EncryptionIdentity.EncryptionUserAssignedIdentity
/subscriptions/{subscription-id}/resourceGroups/myresourcegroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myuserid

$account.Encryption.KeyVaultProperties

KeyName                       : wrappingKey
KeyVersion                    :
KeyVaultUri                   : https://mykeyvault.vault.azure.net:443
CurrentVersionedKeyIdentifier : https://mykeyvault.vault.azure.net/keys/wrappingKey/8e74036e0d534e58b3bd84b319e31d8f
LastKeyRotationTimestamp      : 4/12/2021 8:17:57 AM
```

This command first creates a keyvault and a user assigned identity, then updates a storage account with keyvault encryption, the storage access access keyvault with the user assigned identity.

### Example 16: Update a Keyvault encrypted Storage account, from access Keyvault with user assigned identity, to access Keyvault with system assigned identity

<!-- Skip: Output cannot be splitted from code -->


```powershell
# Assign System identity to the account, and give the system assigned identity access to the keyvault
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName  -IdentityType SystemAssignedUserAssigned
Set-AzKeyVaultAccessPolicy -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -ObjectId $account.Identity.PrincipalId -PermissionsToKeys get,wrapkey,unwrapkey -BypassObjectIdValidation

# Update account from access Keyvault with user assigned identity to access Keyvault with system assigned identity
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -IdentityType SystemAssignedUserAssigned -KeyName $keyname -KeyVaultUri $keyvaultUri -KeyVaultUserAssignedIdentityId ""

# EncryptionUserAssignedIdentity is empty, so the account access keyvault with system assigned identity
$account.Encryption.EncryptionIdentity

EncryptionUserAssignedIdentity
------------------------------

$account.Encryption.KeyVaultProperties

KeyName                       : wrappingKey
KeyVersion                    :
KeyVaultUri                   : https://mykeyvault.vault.azure.net:443
CurrentVersionedKeyIdentifier : https://mykeyvault.vault.azure.net/keys/wrappingKey/8e74036e0d534e58b3bd84b319e31d8f
LastKeyRotationTimestamp      : 4/12/2021 8:17:57 AM
```

This command first assigns System identity to the account, and give the system assigned identity access to the keyvault; then updates the Storage account to access Keyvault with system assigned identity.

### Example 17: Update both Keyvault and the user assigned identity to access keyvault

```powershell
# Update to another user assigned identity
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -IdentityType SystemAssignedUserAssigned -UserAssignedIdentityId $useridentity2 -KeyVaultUserAssignedIdentityId $useridentity2

# Update to encrypt with another keyvault
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -KeyVaultUri $keyvaultUri2 -KeyName $keyname2 -KeyVersion $keyversion2
```

This command first update the user assigned identity to access keyvault, then update the keyvault for encryption.
To update both both Keyvault and the user assigned identity, we need update with the above 2 steps.

### Example 18: Update a Storage account with AllowCrossTenantReplication

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -AllowCrossTenantReplication $false -EnableHttpsTrafficOnly $true

$account.AllowCrossTenantReplication
```

```output
False
```

This command updates a Storage account by set AllowCrossTenantReplication to false, then show the updated account related properties.

### Example 18: Update a Storage account by enable PublicNetworkAccess

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -PublicNetworkAccess Enabled

$account.PublicNetworkAccess
```

```output
Enabled
```

This command updates a Storage account by set PublicNetworkAccess as enabled.

### Example 19: Update account level immutability policy

<!-- Skip: Output cannot be splitted from code -->


```
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -ImmutabilityPeriod 2 -ImmutabilityPolicyState Unlocked

$account.ImmutableStorageWithVersioning.Enabled
True

$account.ImmutableStorageWithVersioning.ImmutabilityPolicy

ImmutabilityPeriodSinceCreationInDays State
------------------------------------- -----
                                    2 Unlocked
```

The command updates account-level immutability policy properties on an existing storage account, and show the result.
The storage account must be created with enable account level immutability with versioning.
The account-level immutability policy will be inherited and applied to objects that do not possess an explicit immutability policy at the object level.

### Example 20: Update a Storage account by enable Sftp and localuser

<!-- Skip: Output cannot be splitted from code -->


```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -EnableSftp $true -EnableLocalUser $true

$account.EnableSftp
True

$account.EnableLocalUser
True
```

This command updates a Storage account by enable Sftp and localuser.
To run the command successfully, the Storage account should already enable Hierarchical Namespace.

### Example 21: Update a Storage account with Keyvault from another tenant (access Keyvault with FederatedClientId)

<!-- Skip: Output cannot be splitted from code -->


```powershell
# create Storage account with Keyvault encryption (access Keyvault with FederatedClientId), then show properties
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName  `
                -KeyVaultUri $keyVault.VaultUri -KeyName $keyname -KeyVaultUserAssignedIdentityId $useridentityId -KeyVaultFederatedClientId $federatedClientId

$account.Encryption.EncryptionIdentity

EncryptionUserAssignedIdentity                                                                                                      EncryptionFederatedIdentityClientId
------------------------------                                                                                                      -----------------------------------
/subscriptions/{subscription-id}/resourceGroups/myresourcegroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myuserid ********-****-****-****-************

$account.Encryption.KeyVaultProperties

KeyName                       : wrappingKey
KeyVersion                    :
KeyVaultUri                   : https://mykeyvault.vault.azure.net:443
CurrentVersionedKeyIdentifier : https://mykeyvault.vault.azure.net/keys/wrappingKey/8e74036e0d534e58b3bd84b319e31d8f
LastKeyRotationTimestamp      : 3/3/2022 2:07:34 AM
```

This command updates a storage account with Keyvault from another tenant (access Keyvault with FederatedClientId).

### Example 22: Update a Storage account by enabling SMB Oauth

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -EnableSmbOAuth $true

$account.AzureFilesIdentityBasedAuth.SmbOAuthSettings.IsSmbOAuthEnabled
```

```output
True
```

This command updates a Storage account by setting EnableSmbOAuth to true, then shows the updated account related properties.

### Example 23: Update a Storage account with zone placement policy

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "myaccount" -Zone 1 -ZonePlacementPolicy "Any"
```

This command updates a Storage account by setting Zone to 1 and ZonePlacementPolicy to Any, then shows the updated account related properties.

### Example 24: Enable Blob Geo Priority Replication on a Storage account

```powershell
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -EnableBlobGeoPriorityReplication $true

$account.GeoPriorityReplicationStatus.IsBlobEnabled
```

```output
True
```

This command enables Blob Geo Priority Replication on a Storage account.

## PARAMETERS

### -AccessTier

Specifies the access tier of the Storage account that this cmdlet modifies.
The acceptable values for this parameter are: Hot and Cool.
If you change the access tier, it may result in additional charges. For more information, see
[Azure Blob Storage: Hot and cool storage tiers](https://azure.microsoft.com/pricing/details/storage/blobs/).
If the Storage account has Kind as StorageV2 or BlobStorage, you can specify the *AccessTier* parameter.
If the Storage account has Kind as Storage, do not specify the *AccessTier* parameter.
Storage Account Access Tier.

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
- Hot
- Cool
- Cold
HelpMessage: ''
```

### -ActiveDirectoryAccountType

Specifies the Active Directory account type for Azure Storage. Possible values include: 'User', 'Computer'.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryAzureStorageSid

Specifies the security identifier (SID) for Azure Storage. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryDomainGuid

Specifies the domain GUID. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.
Specifies the domain GUID. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile or -EnableAzureActiveDirectoryKerberosForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AzureActiveDirectoryKerberosForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryDomainName

Specifies the primary domain that the AD DNS server is authoritative for. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.
Specifies the primary domain that the AD DNS server is authoritative for. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile or -EnableAzureActiveDirectoryKerberosForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AzureActiveDirectoryKerberosForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryDomainSid

Specifies the security identifier (SID). This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryForestName

Specifies the Active Directory forest to get. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectoryNetBiosDomainName

Specifies the NetBIOS domain name. This parameter must be set when -EnableActiveDirectoryDomainServicesForFile is set to true.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ActiveDirectorySamAccountName

Specifies the Active Directory SAMAccountName for Azure Storage.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -AllowBlobPublicAccess

Allow or disallow anonymous access to all blobs or containers in the storage account.

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

### -AllowCrossTenantReplication

Gets or sets allow or disallow cross Microsoft Entra tenant object replication. The default interpretation is true for this property.

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

### -AllowedCopyScope

Set restrict copy to and from Storage Accounts within a Microsoft Entra tenant or with Private Links to the same VNet. Possible values include: 'PrivateLink', 'AAD'

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

### -AllowSharedKeyAccess

Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Microsoft Entra ID. The default value is null, which is equivalent to true.

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

### -AsJob

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

### -AssignIdentity

Generate and assign a new Storage account Identity for this Storage account for use with key management services like Azure KeyVault.

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

### -CustomDomainName

Specifies the name of the custom domain.
Storage Account Custom Domain.

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

### -DefaultSharePermission

Default share permission for users using Kerberos authentication if RBAC role is not assigned.

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
- None
- StorageFileDataSmbShareContributor
- StorageFileDataSmbShareReader
- StorageFileDataSmbShareElevatedContributor
HelpMessage: ''
```

### -EnableActiveDirectoryDomainServicesForFile

Enable Azure Files Active Directory Domain Service Authentication for the storage account.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ActiveDirectoryDomainServicesForFile
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EnableAzureActiveDirectoryDomainServicesForFile

Enable Azure Files Azure Active Directory Domain Service Authentication for the storage account.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: StorageEncryption
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: KeyvaultEncryption
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EnableAzureActiveDirectoryKerberosForFile

Enable Azure Files Active Directory Domain Service Kerberos Authentication for the storage account.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AzureActiveDirectoryKerberosForFile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EnableBlobGeoPriorityReplication

Indicates whether Blob Geo Priority Replication is enabled for the storage account.
This feature provides enhanced geo-replication with service level agreement for priority replication to improve recovery time objectives (RTO).
Only available for geo-redundant storage account types (GRS, GZRS, RAGRS, RAGZRS).
Status indicating whether Geo Priority Replication is enabled for the account.

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

### -EnableHttpsTrafficOnly

Indicates whether or not the Storage account only enables HTTPS traffic.
Storage Account EnableHttpsTrafficOnly.

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

### -EnableLargeFileShare

Indicates whether or not the storage account can support large file shares with more than 5 TiB capacity.
Once the account is enabled, the feature cannot be disabled.
Currently only supported for LRS and ZRS replication types, hence account conversions to geo-redundant accounts would not be possible.
Learn more in https://go.microsoft.com/fwlink/?linkid=2086047
Indicates whether or not the storage account can support large file shares with more than 5 TiB capacity. Once the account is enabled, the feature cannot be disabled. Currently only supported for LRS and ZRS replication types, hence account conversions to geo-redundant accounts would not be possible. Learn more in https://go.microsoft.com/fwlink/?linkid=2086047

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

### -EnableLocalUser

Enable local users feature for the Storage account.

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

### -EnableSftp

Enable Secure File Transfer Protocol for the Storage account.

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

### -EnableSmbOAuth

Specifies if managed identities can access SMB shares using OAuth.

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

### -Force

Forces the change to be written to the Storage account.
Force to Set the Account

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

### -IdentityType

Set the new Storage Account Identity type, the identity is for use with key management services like Azure KeyVault.

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
- SystemAssigned
- UserAssigned
- SystemAssignedUserAssigned
- None
HelpMessage: ''
```

### -ImmutabilityPeriod

The immutability period for the blobs in the container since the policy creation in days.
This property can only be changed when account is created with '-EnableAccountLevelImmutability'.
The immutability period for the blobs in the container since the policy creation in days. This property can only be changed when account is created with '-EnableAccountLevelImmutability'.

```yaml
Type: System.Int32
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

### -ImmutabilityPolicyState

The mode of the policy. Possible values include: 'Unlocked', 'Locked', 'Disabled.
Disabled state disables the policy.
Unlocked state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property.
Locked state only allows the increase of the immutability retention time.
A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted.
This property can only be changed when account is created with '-EnableAccountLevelImmutability'.
The mode of the policy. Possible values include: 'Unlocked', 'Locked', 'Disabled. Disabled state disables the policy. Unlocked state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property. Locked state only allows the increase of the immutability retention time. A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted. This property can only be changed when account is created with '-EnableAccountLevelImmutability'.

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

### -KeyExpirationPeriodInDay

The Key expiration period of this account, it is accurate to days.

```yaml
Type: System.Int32
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

### -KeyName

If using -KeyvaultEncryption to enable encryption with Key Vault, specify the Keyname property with this option.
Storage Account encryption keySource KeyVault KeyName

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: KeyvaultEncryption
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -KeyvaultEncryption

Indicates whether or not to use Microsoft KeyVault for the encryption keys when using Storage Service Encryption.
If KeyName, KeyVersion, and KeyVaultUri are all set, KeySource will be set to Microsoft.Keyvault whether this parameter is set or not.
Whether to set Storage Account encryption keySource to Microsoft.Keyvault or not. If you specify KeyName, KeyVersion and KeyvaultUri, Storage Account Encryption KeySource will also be set to Microsoft.Keyvault weather this parameter is set or not.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: KeyvaultEncryption
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -KeyVaultFederatedClientId

Set ClientId of the multi-tenant application to be used in conjunction with the user-assigned identity for cross-tenant customer-managed-keys server-side encryption on the storage account.

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

### -KeyVaultUri

When using Key Vault Encryption by specifying the -KeyvaultEncryption parameter, use this option to specify the URI to the Key Vault.
Storage Account encryption keySource KeyVault KeyVaultUri

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: KeyvaultEncryption
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -KeyVaultUserAssignedIdentityId

Set resource id for user assigned Identity used to access Azure KeyVault of Storage Account Encryption, the id must in the storage account's UserAssignIdentityId.

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

### -KeyVersion

When using Key Vault Encryption by specifying the -KeyvaultEncryption parameter, use this option to specify the URI to the Key Version.
Storage Account encryption keySource KeyVault KeyVersion

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: KeyvaultEncryption
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -MinimumTlsVersion

The minimum TLS version to be permitted on requests to storage.

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
- TLS1_0
- TLS1_1
- TLS1_2
- TLS1_3
HelpMessage: ''
```

### -Name

Specifies the name of the Storage account to modify.
Storage Account Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- StorageAccountName
- AccountName
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

### -NetworkRuleSet

NetworkRuleSet is used to define a set of configuration rules for firewalls and virtual networks, as well as to set values for network properties such as services allowed to bypass the rules and how to handle requests that don't match any of the defined rules.
Storage Account NetworkRule

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSNetworkRuleSet
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

### -PublicNetworkAccess

Allow or disallow public network access to Storage Account.Possible values include: 'Enabled', 'Disabled'.

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

### -PublishInternetEndpoint

Indicates whether internet  routing storage endpoints are to be published

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

### -PublishMicrosoftEndpoint

Indicates whether microsoft routing storage endpoints are to be published

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

Specifies the name of the resource group in which to modify the Storage account.
Resource Group Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -RoutingChoice

Routing Choice defines the kind of network routing opted by the user. Possible values include: 'MicrosoftRouting', 'InternetRouting'

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
- MicrosoftRouting
- InternetRouting
HelpMessage: ''
```

### -SasExpirationAction

The action to be performed when SasExpirationPeriod is violated. The 'Log' action can be used for audit purposes and the 'Block' action can be used to block and deny the usage of SAS tokens that do not adhere to the sas policy expiration period.

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

### -SasExpirationPeriod

The SAS expiration period of this account, it is a timespan and accurate to seconds.

```yaml
Type: System.TimeSpan
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

### -SkuName

Specifies the SKU name of the Storage account.
The acceptable values for this parameter are:
- Standard_LRS - Locally-redundant storage.
- Standard_ZRS - Zone-redundant storage.
- Standard_GRS - Geo-redundant storage.
- Standard_RAGRS - Read access geo-redundant storage.
- Premium_LRS - Premium locally-redundant storage.
- Standard_GZRS - Geo-redundant zone-redundant storage.
- Standard_RAGZRS - Read access geo-redundant zone-redundant storage.
- StandardV2_LRS - Locally-redundant storage for File Provision v2.
- StandardV2_GRS - Geo-redundant storage for File Provision v2.
- StandardV2_ZRS - Zone-redundant storage for File Provision v2.
- StandardV2_GZRS - Geo-redundant zone-redundant storage for File Provision v2.
- PremiumV2_LRS - Premium locally-redundant storage for File Provision v2.
- PremiumV2_ZRS - Premium zone-redundant storage for File Provision v2.
You cannot change Standard_ZRS and Premium_LRS types to other account types.
You cannot change other account types to Standard_ZRS or Premium_LRS.
Storage Account Sku Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- StorageAccountType
- AccountType
- Type
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Standard_LRS
- Standard_ZRS
- Standard_GRS
- Standard_RAGRS
- Premium_LRS
- Standard_GZRS
- Standard_RAGZRS
- StandardV2_LRS
- StandardV2_ZRS
- StandardV2_GZRS
- StandardV2_GRS
- PremiumV2_LRS
- PremiumV2_ZRS
HelpMessage: ''
```

### -StorageEncryption

Indicates whether or not to set the Storage account encryption to use Microsoft-managed keys.
Whether to set Storage Account Encryption KeySource to Microsoft.Storage or not.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: StorageEncryption
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

Key-value pairs in the form of a hash table set as tags on the server. For example:
@{key0="value0";key1=$null;key2="value2"}
Storage Account Tags.

```yaml
Type: System.Collections.Hashtable
DefaultValue: None
SupportsWildcards: false
Aliases:
- Tags
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -UpgradeToStorageV2

Upgrade Storage account Kind from  Storage or BlobStorage to StorageV2.
Upgrade Storage Account Kind to StorageV2.

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

### -UserAssignedIdentityId

Set resource ids for the the new Storage Account user assigned Identity, the identity will be used with key management services like Azure KeyVault.

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

### -UseSubDomain

Indicates whether to enable indirect CName validation.
To Use Sub Domain.

```yaml
Type: System.Nullable`1[System.Boolean]
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

### -Zone

Describes the available zones for the product where storage account resource can be created

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
AcceptedValues: []
HelpMessage: ''
```

### -ZonePlacementPolicy

The availability zone pinning policy for the storage account.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### System.Collections.Hashtable

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

## NOTES

## RELATED LINKS

- [Get-AzStorageAccount](./Get-AzStorageAccount.md)
- [New-AzStorageAccount](./New-AzStorageAccount.md)
- [Remove-AzStorageAccount](./Remove-AzStorageAccount.md)
