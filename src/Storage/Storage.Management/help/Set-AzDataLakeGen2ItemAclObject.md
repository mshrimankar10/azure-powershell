---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azdatalakegen2itemaclobject
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzDataLakeGen2ItemAclObject

## SYNOPSIS

Creates/Updates a DataLake gen2 item ACL object, which can be used in Update-AzDataLakeGen2Item cmdlet.

## SYNTAX

### Default (Default)

```
Set-AzDataLakeGen2ItemAclObject -Permission <String> -AccessControlType <AccessControlType>
 [-EntityId <String>] [-DefaultScope] [-InputObject <PSPathAccessControlEntry[]>]
 [<CommonParameters>]
```

### __AllParameterSets

```
Set-AzDataLakeGen2ItemAclObject -Permission <string> -AccessControlType <AccessControlType>
 [-EntityId <string>] [-DefaultScope] [-InputObject <PSPathAccessControlEntry[]>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzDataLakeGen2ItemAclObject** cmdlet creates/updates a DataLake gen2 item ACL object, which can be used in Update-AzDataLakeGen2Item cmdlet.
If the new ACL entry with same AccessControlType/EntityId/DefaultScope not exist in the input ACL, will create a new ACL entry, else update permission of existing ACL entry.

## EXAMPLES

### Example 1: Create an ACL object with 3 ACL entry, and update ACL on a directory

```powershell
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -Permission rwx -DefaultScope
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType group -Permission rw- -InputObject $acl
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType other -Permission "rw-" -InputObject $acl
Update-AzDataLakeGen2Item -FileSystem "filesystem1" -Path "dir1/dir3" -ACL $acl
```

```output
FileSystem Name: filesystem1

Path                 IsDirectory  Length          LastModified         Permissions  Owner                Group
----                 -----------  ------          ------------         -----------  -----                -----
dir1/dir3            True                         2020-03-23 09:34:31Z rwxrw-rw-+   $superuser           $superuser
```

This command creates an ACL object with 3 ACL entries (use -InputObject parameter to add acl entry to existing acl object), and updates ACL on a directory.

### Example 2: Create an ACL object with 4 ACL entries, and update permission of an existing ACL entry

<!-- Skip: Output cannot be splitted from code -->


```
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -Permission rwx -DefaultScope
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType group -Permission rw- -InputObject $acl
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType other -Permission "rwt" -InputObject $acl
$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -EntityId $id -Permission rwx -InputObject $acl
$acl

DefaultScope AccessControlType EntityId                             Permissions
------------ ----------------- --------                             -----------
True         User                                                   rwx
False        Group                                                  rw-
False        Other                                                  rwt
False        User              ********-****-****-****-************ rwx

$acl = Set-AzDataLakeGen2ItemAclObject -AccessControlType user -EntityId $id -Permission r-x -InputObject $acl
$acl

DefaultScope AccessControlType EntityId                             Permissions
------------ ----------------- --------                             -----------
True         User                                                   rwx
False        Group                                                  rw-
False        Other                                                  rw-
False        User              ********-****-****-****-************ r-x
```

This command first creates an ACL object with 4 ACL entries, then run the cmdlet again with different permission but same AccessControlType/EntityId/DefaultScope of an existing ACL entry.
Then the permission of the ACL entry is updated, but no new ACL entry is added.

## PARAMETERS

### -AccessControlType

There are four types: "user" grants rights to the owner or a named user, "group" grants rights to the owning group or a named group, "mask" restricts rights granted to named users and the members of groups, and "other" grants rights to all users not found in any of the other entries.

```yaml
Type: Azure.Storage.Files.DataLake.Models.AccessControlType
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
AcceptedValues:
- User
- Group
- Mask
- Other
HelpMessage: ''
```

### -DefaultScope

Set this parameter to indicate the ACE belongs to the default ACL for a directory; otherwise scope is implicit and the ACE belongs to the access ACL.

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

### -EntityId

The user or group identifier.
It is omitted for entries of AccessControlType "mask" and "other".
The user or group identifier is also omitted for the owner and owning group.
The user or group identifier. It is omitted for entries of AccessControlType "mask" and "other". The user or group identifier is also omitted for the owner and owning group.

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

### -InputObject

If input the PSPathAccessControlEntry\[\] object, will add the new ACL as a new element of the input PSPathAccessControlEntry\[\] object.
If input the PSPathAccessControlEntry[] object, will add the new ACL entry as a new element of the input PSPathAccessControlEntry[] object. If an ACL entry when same AccessControlType, EntityId, DefaultScope exist, will update permission of it.

```yaml
Type: Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSPathAccessControlEntry[]
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

### -Permission

The permission field is a 3-character sequence where the first character is 'r' to grant read access, the second character is 'w' to grant write access, and the third character is 'x' to grant execute permission.
If access is not granted, the '-' character is used to denote that the permission is denied.
The sticky bit is also supported and its represented either by the letter t or T in the final character-place depending on whether the execution bit for the others category is set or unset respectively,
absence of t or T indicates sticky bit not set.
The permission field is a 3-character sequence where the first character is 'r' to grant read access, the second character is 'w' to grant write access, and the third character is 'x' to grant execute permission. If access is not granted, the '-' character is used to denote that the permission is denied. The sticky bit is also supported and its represented either by the letter t or T in the final character-place depending on whether the execution bit for the others category is set or unset respectively, absence of t or T indicates sticky bit not set.

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

### Microsoft.WindowsAzure.Commands.Storage.Model.ResourceModel.PSPathAccessControlEntry

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

