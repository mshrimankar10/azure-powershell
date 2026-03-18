---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/new-Azstorageaccountmanagementpolicyrule
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageAccountManagementPolicyRule

## SYNOPSIS

Creates a ManagementPolicy rule object, which can be used in Set-AzStorageAccountManagementPolicy.

## SYNTAX

### Default (Default)

```
New-AzStorageAccountManagementPolicyRule [-Name] <String> -Action <PSManagementPolicyActionGroup>
 [-Disabled] [-Filter <PSManagementPolicyRuleFilter>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageAccountManagementPolicyRule [-Name] <string> -Action <PSManagementPolicyActionGroup>
 [-Disabled] [-Filter <PSManagementPolicyRuleFilter>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageAccountManagementPolicyRule** cmdlet creates a ManagementPolicy rule object, which can be used in Set-AzStorageAccountManagementPolicy.

## EXAMPLES

### Example 1: Creates a ManagementPolicy rule object, then set to a Storage Account

<!-- Skip: Output cannot be splitted from code -->


```
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -daysAfterModificationGreaterThan 100
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToArchive -daysAfterModificationGreaterThan 50  -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToCool -daysAfterModificationGreaterThan 30 -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -SnapshotAction Delete -daysAfterCreationGreaterThan 100 -InputObject $action

$filter = New-AzStorageAccountManagementPolicyFilter -PrefixMatch blobprefix1,blobprefix2

$rule = New-AzStorageAccountManagementPolicyRule -Name rule1 -Action $action -Filter $filter
$rule

Enabled    : True
Name       : rule1
Definition : {
                 "Actions":  {
                                 "BaseBlob":  {
                                                  "TierToCool":  {
                                                                     "DaysAfterModificationGreaterThan":  30
                                                                 },
                                                  "TierToArchive":  {
                                                                        "DaysAfterModificationGreaterThan":  50
                                                                    },
                                                  "Delete":  {
                                                                 "DaysAfterModificationGreaterThan":  100
                                                             }
                                              },
                                 "Snapshot":  {
                                                  "Delete":  {
                                                                 "DaysAfterCreationGreaterThan":  100
                                                             }
                                              }
                             },
                 "Filters":  {
                                 "PrefixMatch":  [
                                                     "blobprefix1",
                                                     "blobprefix2"
                                                 ],
                                 "BlobTypes":  [
                                                   "blockBlob"
                                               ]
                             }
             }

$policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Rule $rule
```

This command create a ManagementPolicy rule object, with a ManagementPolicy action group object contains 4 actions, a ManagementPolicy rule filter object, then set the rule to a Storage Account.

## PARAMETERS

### -Action

An object that defines the action set.
Get the Object with cmdlet Add-AzureStorageAccountManagementPolicyAction
An object that defines the action set. Get the Object with cmdlet Add-AzureStorageAccountManagementPolicyAction

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyActionGroup
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
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

### -Disabled

The rule is disabled if set it.

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

### -Filter

An object that defines the filter set.
Get the Object with cmdlet New-AzureStorageAccountManagementPolicyFilter
An object that defines the filter set. Get the Object with cmdlet New-AzureStorageAccountManagementPolicyFilter

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRuleFilter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Name

A rule name can contain any combination of alpha numeric characters.
Rule name is case-sensitive.
It must be unique within a policy.
A rule name can contain any combination of alpha numeric characters. Rule name is case-sensitive. It must be unique within a policy.

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

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyActionGroup

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRuleFilter

{{ Fill in the Description }}

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRule

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

