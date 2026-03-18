---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azstoragelocalusersshpublickey
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageLocalUserSshPublicKey

## SYNOPSIS

Creates a SSH public key object, which can be used in Set-AzStorageLocalUser.

## SYNTAX

### Default (Default)

```
New-AzStorageLocalUserSshPublicKey -Key <String> [-Description <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageLocalUserSshPublicKey -Key <string> [-Description <string>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageLocalUserSshPublicKey** cmdlet creates a SSH public key object, which can be used in Set-AzStorageLocalUser.

## EXAMPLES

### Example 1: Create SSH public key objects, then create or update local user with the SSH public key objects.

<!-- Skip: Output cannot be splitted from code -->


```
$sshkey1 = New-AzStorageLocalUserSshPublicKey -Key "ssh-rsa keykeykeykeykey=" -Description "sshpulickey name1"

$sshkey2 = New-AzStorageLocalUserSshPublicKey -Key "ssh-rsa keykeykeykeykew=" -Description "sshpulickey name2"

$localuser = Set-AzStorageLocalUser -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -UserName testuser1 -HomeDirectory "/" -SshAuthorizedKey $sshkey1,$sshkey2

$localuser

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name      Sid                                          HomeDirectory HasSharedKey HasSshKey HasSshPassword PermissionScopes SshAuthorizedKeys
----      ---                                          ------------- ------------ --------- -------------- ---------------- -----------------
testuser1 S-1-2-0-0000000000-000000000-0000000000-0000 /                                                                    [ssh-rsa keykeykeykeykey=,...]

$localuser.SshAuthorizedKeys

Description       Key
-----------       ---
sshpulickey name1 ssh-rsa keykeykeykeykey=
sshpulickey name2 ssh-rsa keykeykeykeykew=
```

This first 2 commands create 2 SSH public key objects.
The following commands create or update a local user with the SSH public key objects, then show the updated local user properties.

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

### -Description

The description of the key.
It is used to store the function/usage of the key.
The description of the key. It is used to store the function/usage of the key.

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

### -Key

Specify ssh public key, the key data is base64 encoded.
The format should be: '\<keyType\> \<keyData\>', e.g.
ssh-rsa AAAABBBB
Specify ssh public key, which is base64 encoded. The format should be: '<keyType> <keyData>', e.g. ssh-rsa AAAABBBB

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSSshPublicKey

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

