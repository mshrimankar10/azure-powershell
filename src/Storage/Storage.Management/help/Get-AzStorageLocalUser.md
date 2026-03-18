---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragelocaluser
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageLocalUser

## SYNOPSIS

Gets a specified local user or lists all local users in a storage account.

## SYNTAX

### AccountName (Default)

```
Get-AzStorageLocalUser [-ResourceGroupName] <String> [-StorageAccountName] <String>
 [-UserName <String>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### AccountObject

```
Get-AzStorageLocalUser -StorageAccount <PSStorageAccount> [-UserName <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageLocalUser** cmdlet gets a specified local user or lists all local users in a storage account.

## EXAMPLES

### Example 1: Get a specified local user

<!-- Skip: Output cannot be splitted from code -->


```
$localUser = Get-AzStorageLocalUser -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -UserName testuser1

$localUser

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      Sid                                          HomeDirectory HasSharedKey HasSshKey HasSshPassword PermissionScopes
----      ---                                          ------------- ------------ --------- -------------- ----------------
testuser1 S-1-2-0-0000000000-000000000-0000000000-0000 /             True         True      True           [container1,...]

$localUser.PermissionScopes

Permissions Service ResourceName
----------- ------- ------------
rw          blob    container1
rw          file    share2
```

This command gets a specified local user, and show the properties of it.

### Example 2: List all local users in a storage account

```powershell
Get-AzStorageLocalUser -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount"
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      Sid                                          HomeDirectory HasSharedKey HasSshKey HasSshPassword PermissionScopes SshAuthorizedKeys
----      ---                                          ------------- ------------ --------- -------------- ---------------- -----------------
testuser1 S-1-2-0-0000000000-000000000-0000000000-0000 /             True         True      True           [container1,...]
testuser2 S-1-2-0-0000000000-000000000-0000000000-0002 /dir          True         True      False
```

This command lists all local users in a storage account.

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

### -UserName

The name of local user.
The username must contain lowercase letters and numbers only.
It must be unique only within the storage account.
The name of local user. The username must contain lowercase letters and numbers only. It must be unique only within the storage account.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSLocalUser

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

