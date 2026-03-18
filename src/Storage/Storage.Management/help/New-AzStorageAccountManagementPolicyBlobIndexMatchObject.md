---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/new-Azstorageaccountmanagementpolicyblobindexmatchobject
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageAccountManagementPolicyBlobIndexMatchObject

## SYNOPSIS

Creates a ManagementPolicy BlobIndexMatch object, which can be used in New-AzStorageAccountManagementPolicyFilter.

## SYNTAX

### Default (Default)

```
New-AzStorageAccountManagementPolicyBlobIndexMatchObject [-Name <String>] [-Value <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageAccountManagementPolicyBlobIndexMatchObject [-Name <string>] [-Value <string>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageAccountManagementPolicyBlobIndexMatchObject** cmdlet creates a ManagementPolicy BlobIndexMatch object, which can be used in New-AzStorageAccountManagementPolicyFilter.

## EXAMPLES

### Example 1: Creates 2 ManagementPolicy BlobIndexMatch object3, then add them to a management policy rule filter

<!-- Skip: Output cannot be splitted from code -->


```
$blobindexmatch1 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag1" -Value "value1"
$blobindexmatch1

Name Op Value
---- -- -----
tag1 == value1

$blobindexmatch2 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag2" -Value "value2"

New-AzStorageAccountManagementPolicyFilter -PrefixMatch prefix1,prefix2 -BlobType blockBlob `
        -BlobIndexMatch $blobindexmatch1,$blobindexmatch2

PrefixMatch        BlobTypes   BlobIndexMatch
-----------        ---------   --------------
{prefix1, prefix2} {blockBlob} {tag1, tag2}
```

This command creates 2 ManagementPolicy BlobIndexMatch objects, then add them to a management policy rule filter.

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

### -Name

Gets or sets this is the filter tag name, it can have 1 - 128 characters

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

### -Value

Gets or sets this is the filter tag value field used for tag based filtering, it can have 0 - 256 characters.

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

### None

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSTagFilter

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

