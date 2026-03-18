---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azrmstoragecontainer
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzRmStorageContainer

## SYNOPSIS

Creates a Storage blob container

## SYNTAX

### AccountName (Default)

```
New-AzRmStorageContainer [-ResourceGroupName] <String> [-StorageAccountName] <String> -Name <String>
 [-PublicAccess <PSPublicAccess>] [-Metadata <Hashtable>] [-RootSquash <String>]
 [-EnableImmutableStorageWithVersioning] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountNameEncryptionScope

```
New-AzRmStorageContainer [-ResourceGroupName] <string> [-StorageAccountName] <string> -Name <string>
 -DefaultEncryptionScope <string> -PreventEncryptionScopeOverride <bool>
 [-PublicAccess <PSPublicAccess>] [-Metadata <hashtable>] [-RootSquash <string>]
 [-EnableImmutableStorageWithVersioning] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountObject

```
New-AzRmStorageContainer -StorageAccount <PSStorageAccount> -Name <String>
 [-PublicAccess <PSPublicAccess>] [-Metadata <Hashtable>] [-RootSquash <String>]
 [-EnableImmutableStorageWithVersioning] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountObjectEncryptionScope

```
New-AzRmStorageContainer -StorageAccount <PSStorageAccount> -Name <string>
 -DefaultEncryptionScope <string> -PreventEncryptionScopeOverride <bool>
 [-PublicAccess <PSPublicAccess>] [-Metadata <hashtable>] [-RootSquash <string>]
 [-EnableImmutableStorageWithVersioning] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzRmStorageContainer** cmdlet creates a Storage blob container

## EXAMPLES

### Example 1: Create a Storage blob container with Storage account name and container name, with metadata

```powershell
New-AzRmStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -ContainerName "myContainer" -Metadata @{tag0="value0";tag1="value1";tag2="value2"}
```

This command creates a Storage blob container with Storage account name and container name, with metadata.

### Example 2: Create a Storage blob container with Storage account object and container name, with public access as Blob

```powershell
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount"
New-AzRmStorageContainer -StorageAccount $accountObject -ContainerName "myContainer" -PublicAccess Blob
```

This command creates a Storage blob container with Storage account object and container name, with public access as Blob.

### Example 3: Create a storage container with EncryptionScope setting

<!-- Skip: Output cannot be splitted from code -->


```
$c = New-AzRmStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "mystorageaccount" -Name testcontainer -DefaultEncryptionScope "testscope" -PreventEncryptionScopeOverride $true

$c

   ResourceGroupName: myResourceGroup, StorageAccountName: mystorageaccount

Name          PublicAccess LastModified HasLegalHold HasImmutabilityPolicy
----          ------------ ------------ ------------ ---------------------
testcontainer                           False        False

$c.DefaultEncryptionScope
testscope

$c.DenyEncryptionScopeOverride
True
```

This command creates a storage container with a default encryptionScope, and blocks override of encryption scope from the container default.
Then show the related container properties.

### Example 4: Create an Azure storage container with RootSquash

<!-- Skip: Output cannot be splitted from code -->


```
$container = New-AzRmStorageContainer -ResourceGroupName "myrsourcegroup" -AccountName "mystorageaccount" -Name "mycontainer" -RootSquash AllSquash

$container.EnableNfsV3AllSquash
True

$container.EnableNfsV3RootSquash
False
```

This command creates a storage container, with RootSquash property set as AllSquash.  RootSquash only works on a storage account that enabled NfsV3.

### Example 5: Create a storage container and enable immutable Storage with versioning

```powershell
$c = New-AzRmStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "mystorageaccount" -Name testcontainer -EnableImmutableStorageWithVersioning

$c
```

```output
ResourceGroupName: myResourceGroup, StorageAccountName: mystorageaccount

Name          PublicAccess LastModified         HasLegalHold HasImmutabilityPolicy Deleted VersionId ImmutableStorageWithVersioning
----          ------------ ------------         ------------ --------------------- ------- --------- ------------------------------
testcontainer None         2021-07-19 08:26:19Z False        False                 False             True
```

This command creates a storage container and enable immutable Storage with versioning.
The command only works when the Storage account has already enabled blob versioning.

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

### -DefaultEncryptionScope

Default the container to use specified encryption scope for all writes.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountNameEncryptionScope
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObjectEncryptionScope
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DefaultProfile

The credentials, account, tenant, and subscription used for communication with azure.

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

### -EnableImmutableStorageWithVersioning

Enable immutable Storage with versioning at the container level.
Enable object level immutability at the container level.

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

Container Metadata

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

### -Name

Container Name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- ContainerName
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PreventEncryptionScopeOverride

Block override of encryption scope from the container default.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountNameEncryptionScope
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObjectEncryptionScope
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PublicAccess

Container PublicAccess

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSPublicAccess
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
- Container
- Blob
- None
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
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountNameEncryptionScope
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -RootSquash

Sets reduction of the access rights for the remote superuser. Possible values include: 'NoRootSquash', 'RootSquash', 'AllSquash'

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
- NoRootSquash
- RootSquash
- AllSquash
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
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountObjectEncryptionScope
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountNameEncryptionScope
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

Shows what would happen if the cmdlet runs. The cmdlet is not run.
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

### System.String

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSContainer

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

