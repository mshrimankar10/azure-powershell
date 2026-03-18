---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/new-Azstorageaccountmanagementpolicyfilter
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageAccountManagementPolicyFilter

## SYNOPSIS

Creates a ManagementPolicy rule filter object, which can be used in New-AzStorageAccountManagementPolicyRule.

## SYNTAX

### Default (Default)

```
New-AzStorageAccountManagementPolicyFilter [-PrefixMatch <String[]>] [-BlobType <String[]>]
 [-BlobIndexMatch <PSTagFilter[]>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageAccountManagementPolicyFilter [-PrefixMatch <string[]>] [-BlobType <string[]>]
 [-BlobIndexMatch <PSTagFilter[]>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageAccountManagementPolicyFilter** cmdlet creates a ManagementPolicy rule filter object, which can be used in New-AzStorageAccountManagementPolicyRule.

## EXAMPLES

### Example 1: Creates a ManagementPolicy rule filter object, then add it to a management policy rule and set to a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
$blobindexmatch1 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag1" -Value "value1"
$blobindexmatch2 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag2" -Value "value2"
$filter = New-AzStorageAccountManagementPolicyFilter -PrefixMatch blobprefix1,blobprefix2 -BlobType appendBlob,blockBlob -BlobIndexMatch $blobindexmatch1,$blobindexmatch2
$filter

PrefixMatch                BlobTypes               BlobIndexMatch
-----------                ---------               --------------
{blobprefix1, blobprefix2} {appendBlob, blockBlob} {tag1, tag2}

$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -daysAfterModificationGreaterThan 100
$rule = New-AzStorageAccountManagementPolicyRule -Name Test -Action $action -Filter $filter
$policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Rule $rule
```

This command create a ManagementPolicy rule filter object. Then add it to a management policy rule and set to a Storage account.

## PARAMETERS

### -BlobIndexMatch

An array of blob index tag based filters, there can be at most 10 tag filters.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSTagFilter[]
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

### -BlobType

An array of strings for blobtypes to be match. Currently blockBlob supports all tiering and delete actions. Only delete actions are supported for appendBlob.

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
- blockBlob
- appendBlob
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

### -PrefixMatch

An array of strings for prefixes to be match.
A prefix string must start with a container name.
An array of strings for prefixes to be match. A prefix string must start with a container name.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRuleFilter

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

