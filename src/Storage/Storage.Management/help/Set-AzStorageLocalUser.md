---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstoragelocaluser
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageLocalUser

## SYNOPSIS

Creates or updates a specified local user in a storage account.

## SYNTAX

### AccountName (Default)

```
Set-AzStorageLocalUser [-ResourceGroupName] <string> [-StorageAccountName] <string>
 -UserName <string> [-HomeDirectory <string>] [-SshAuthorizedKey <PSSshPublicKey[]>]
 [-PermissionScope <PSPermissionScope[]>] [-HasSharedKey <bool>] [-HasSshKey <bool>]
 [-HasSshPassword <bool>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountObject

```
Set-AzStorageLocalUser -StorageAccount <PSStorageAccount> -UserName <string>
 [-HomeDirectory <string>] [-SshAuthorizedKey <PSSshPublicKey[]>]
 [-PermissionScope <PSPermissionScope[]>] [-HasSharedKey <bool>] [-HasSshKey <bool>]
 [-HasSshPassword <bool>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageLocalUser** cmdlet creates or updates a specified local user in a storage account.
To run this cmdlet, the storage account must has already set EnableLocalUser as true.

## EXAMPLES

### Example 1: Create or update a local user

<!-- Skip: Output cannot be splitted from code -->


```
$sshkey1 = New-AzStorageLocalUserSshPublicKey -Key "ssh-rsa base64encodedkey=" -Description "sshpublickey name1"

$permissionScope1 = New-AzStorageLocalUserPermissionScope -Permission rw -Service blob -ResourceName container1

$localuser = Set-AzStorageLocalUser -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -UserName testuser1 -HomeDirectory "/" -SshAuthorizedKey $sshkey1 -PermissionScope $permissionScope1 -HasSharedKey $true -HasSshKey $true -HasSshPassword $true

$localuser

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      Sid                                          HomeDirectory HasSharedKey HasSshKey HasSshPassword PermissionScopes
----      ---                                          ------------- ------------ --------- -------------- ----------------
testuser1 S-1-2-0-0000000000-000000000-0000000000-0000 /             True         True      True           [container1]

$localuser.SshAuthorizedKeys

Description       Key
-----------       ---
sshpublickey name1 ssh-rsa base64encodedkey=

$localuser.PermissionScopes

Permissions Service ResourceName
----------- ------- ------------
rw          blob    container1
```

The first command creates a local SSH public key object. Note that the key follows the format of `<algorithm> <data>` where data is the base64 encoded contents of the public key.
The second command creates a local permission scope object that defines the container level access for the local user.
The third command creates or updates the local user, using the local objects from the first 2 commands.
The final command shows the local user properties.

### Example 2: Create or update a local user by input permission scope and ssh key with json

```powershell
Set-AzStorageLocalUser -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -UserName testuser1 -HomeDirectory "/" -HasSharedKey $true -HasSshKey $true -HasSshPassword $true `
            -SshAuthorizedKey (@{
                Description="sshpublickey name1";
                Key="ssh-rsa base64encodedkey=";
            },
            @{
                Description="sshpublickey name2";
                Key="ssh-rsa otherbase64encodedkey=";
            }) `
            -PermissionScope (@{
                Permissions="rw";
                Service="blob";
                ResourceName="container1";
            },
            @{
                Permissions="rwd";
                Service="share";
                ResourceName="share1";
            })
```

```output
ResourceGroupName: weitry, StorageAccountName: weisftp3

Name      Sid                                          HomeDirectory HasSharedKey HasSshKey HasSshPassword PermissionScopes
----      ---                                          ------------- ------------ --------- -------------- ----------------
testuser1 S-1-2-0-0000000000-000000000-0000000000-0000 /             True         True      True           [container1,...]
```

This command creates or updates a local user by input permission scope and ssh key with json.

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

### -HasSharedKey

Whether shared key exists.
Set it to false to remove existing shared key.
Whether shared key exists. Set it to false to remove existing shared key.

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

### -HasSshKey

Whether SSH key exists.
Set it to false to remove existing SSH key.
Whether SSH key exists. Set it to false to remove existing SSH key.

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

### -HasSshPassword

Whether SSH password exists.
Set it to false to remove existing SSH password.
Whether SSH password exists. Set it to false to remove existing SSH password.

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

### -HomeDirectory

Local user home directory

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

### -PermissionScope

The permission scopes of the local user. Get the object with New-AzStorageLocalUserPermissionScope cmdlet.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSPermissionScope[]
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

### -SshAuthorizedKey

Local user ssh authorized keys for SFTP. Get the object with New-AzStorageLocalUserSshPublicKey cmdlet.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSSshPublicKey[]
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

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSLocalUser

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

