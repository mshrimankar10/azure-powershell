---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/add-Azstorageaccountmanagementpolicyaction
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Add-AzStorageAccountManagementPolicyAction

## SYNOPSIS

Adds an action to the input ManagementPolicy Action Group object, or creates a ManagementPolicy Action Group object with the action. The object can be used in New-AzStorageAccountManagementPolicyRule.

## SYNTAX

### BaseBlob (Default)

```
Add-AzStorageAccountManagementPolicyAction -BaseBlobAction <string>
 -DaysAfterModificationGreaterThan <int> [-DaysAfterLastTierChangeGreaterThan <int>]
 [-InputObject <PSManagementPolicyActionGroup>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### BaseBlobLastAccessTime

```
Add-AzStorageAccountManagementPolicyAction -BaseBlobAction <string>
 -DaysAfterLastAccessTimeGreaterThan <int> [-EnableAutoTierToHotFromCool]
 [-InputObject <PSManagementPolicyActionGroup>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### BaseBlobCreationTime

```
Add-AzStorageAccountManagementPolicyAction -BaseBlobAction <string>
 -DaysAfterCreationGreaterThan <int> [-InputObject <PSManagementPolicyActionGroup>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### Snapshot

```
Add-AzStorageAccountManagementPolicyAction -SnapshotAction <string>
 -DaysAfterCreationGreaterThan <int> [-DaysAfterLastTierChangeGreaterThan <int>]
 [-InputObject <PSManagementPolicyActionGroup>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### BlobVersion

```
Add-AzStorageAccountManagementPolicyAction -BlobVersionAction <string>
 -DaysAfterCreationGreaterThan <int> [-DaysAfterLastTierChangeGreaterThan <int>]
 [-InputObject <PSManagementPolicyActionGroup>] [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Add-AzStorageAccountManagementPolicyAction** cmdlet adds an action to the input ManagementPolicy Action Group object, or creates a ManagementPolicy Action Group object with the action.

## EXAMPLES

### Example 1: Creates a ManagementPolicy Action Group object with 4 actions, then add it to a management policy rule and set to a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -DaysAfterCreationGreaterThan 100
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToArchive -daysAfterModificationGreaterThan 50  -DaysAfterLastTierChangeGreaterThan 40 -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToCool -DaysAfterLastAccessTimeGreaterThan 30  -EnableAutoTierToHotFromCool -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToHot -DaysAfterCreationGreaterThan 100 -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -SnapshotAction Delete -daysAfterCreationGreaterThan 100 -InputObject $action
$action

BaseBlob.TierToCool.DaysAfterModificationGreaterThan      :
BaseBlob.TierToCool.DaysAfterLastAccessTimeGreaterThan    : 30
BaseBlob.TierToCool.DaysAfterCreationGreaterThan          :
BaseBlob.EnableAutoTierToHotFromCool                      : True
BaseBlob.TierToArchive.DaysAfterModificationGreaterThan   : 50
BaseBlob.TierToArchive.DaysAfterLastAccessTimeGreaterThan :
BaseBlob.TierToArchive.DaysAfterCreationGreaterThan       :
BaseBlob.TierToArchive.DaysAfterLastTierChangeGreaterThan : 40
BaseBlob.Delete.DaysAfterModificationGreaterThan          :
BaseBlob.Delete.DaysAfterLastAccessTimeGreaterThan        :
BaseBlob.Delete.DaysAfterCreationGreaterThan              : 100
BaseBlob.TierToCold.DaysAfterModificationGreaterThan      :
BaseBlob.TierToCold.DaysAfterLastAccessTimeGreaterThan    :
BaseBlob.TierToCold.DaysAfterCreationGreaterThan          :
BaseBlob.TierToHot.DaysAfterModificationGreaterThan       :
BaseBlob.TierToHot.DaysAfterLastAccessTimeGreaterThan     :
BaseBlob.TierToHot.DaysAfterCreationGreaterThan           : 100
Snapshot.TierToCool.DaysAfterCreationGreaterThan          :
Snapshot.TierToArchive.DaysAfterCreationGreaterThan       :
Snapshot.TierToArchive.DaysAfterLastTierChangeGreaterThan :
Snapshot.Delete.DaysAfterCreationGreaterThan              : 100
Snapshot.TierToCold.DaysAfterCreationGreaterThan          :
Snapshot.TierToHot.DaysAfterCreationGreaterThan           :
Version.TierToCool.DaysAfterCreationGreaterThan           :
Version.TierToArchive.DaysAfterCreationGreaterThan        :
Version.TierToArchive.DaysAfterLastTierChangeGreaterThan  :
Version.Delete.DaysAfterCreationGreaterThan               :
Version.TierToCold.DaysAfterCreationGreaterThan           :
Version.TierToHot.DaysAfterCreationGreaterThan            :

$filter = New-AzStorageAccountManagementPolicyFilter
$rule = New-AzStorageAccountManagementPolicyRule -Name Test -Action $action -Filter $filter
$policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Rule $rule
```

The first command create a ManagementPolicy Action Group object, the following 3 commands add 3 actions to the object. Then add it to a management policy rule and set to a Storage account.

### Example 2: Creates a ManagementPolicy Action Group object with 7 actions on snapshot and blob version, then add it to a management policy rule and set to a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
$action = Add-AzStorageAccountManagementPolicyAction  -SnapshotAction Delete -daysAfterCreationGreaterThan 40
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -SnapshotAction TierToArchive -daysAfterCreationGreaterThan 50
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -SnapshotAction TierToCool -daysAfterCreationGreaterThan 60
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -BlobVersionAction Delete -daysAfterCreationGreaterThan 70
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -BlobVersionAction TierToArchive -daysAfterCreationGreaterThan 80
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -BlobVersionAction TierToCool -daysAfterCreationGreaterThan 90
$action = Add-AzStorageAccountManagementPolicyAction -InputObject $action -BlobVersionAction TierToCold -daysAfterCreationGreaterThan 100
$action

BaseBlob.TierToCool.DaysAfterModificationGreaterThan      :
BaseBlob.TierToCool.DaysAfterLastAccessTimeGreaterThan    :
BaseBlob.TierToCool.DaysAfterCreationGreaterThan          :
BaseBlob.EnableAutoTierToHotFromCool                      :
BaseBlob.TierToArchive.DaysAfterModificationGreaterThan   :
BaseBlob.TierToArchive.DaysAfterLastAccessTimeGreaterThan :
BaseBlob.TierToArchive.DaysAfterCreationGreaterThan       :
BaseBlob.TierToArchive.DaysAfterLastTierChangeGreaterThan :
BaseBlob.Delete.DaysAfterModificationGreaterThan          :
BaseBlob.Delete.DaysAfterLastAccessTimeGreaterThan        :
BaseBlob.Delete.DaysAfterCreationGreaterThan              :
BaseBlob.TierToCold.DaysAfterModificationGreaterThan      :
BaseBlob.TierToCold.DaysAfterLastAccessTimeGreaterThan    :
BaseBlob.TierToCold.DaysAfterCreationGreaterThan          :
BaseBlob.TierToHot.DaysAfterModificationGreaterThan       :
BaseBlob.TierToHot.DaysAfterLastAccessTimeGreaterThan     :
BaseBlob.TierToHot.DaysAfterCreationGreaterThan           :
Snapshot.TierToCool.DaysAfterCreationGreaterThan          : 60
Snapshot.TierToArchive.DaysAfterCreationGreaterThan       : 50
Snapshot.TierToArchive.DaysAfterLastTierChangeGreaterThan :
Snapshot.Delete.DaysAfterCreationGreaterThan              : 40
Snapshot.TierToCold.DaysAfterCreationGreaterThan          :
Snapshot.TierToHot.DaysAfterCreationGreaterThan           :
Version.TierToCool.DaysAfterCreationGreaterThan           : 90
Version.TierToArchive.DaysAfterCreationGreaterThan        : 80
Version.TierToArchive.DaysAfterLastTierChangeGreaterThan  :
Version.Delete.DaysAfterCreationGreaterThan               : 70
Version.TierToCold.DaysAfterCreationGreaterThan           : 100
Version.TierToHot.DaysAfterCreationGreaterThan            :

$filter = New-AzStorageAccountManagementPolicyFilter
$rule = New-AzStorageAccountManagementPolicyRule -Name Test -Action $action -Filter $filter
$policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Rule $rule
```

The first command create a ManagementPolicy Action Group object, the following 5 commands add 5 actions on snapshot and blob version to the object. Then add it to a management policy rule and set to a Storage account.

## PARAMETERS

### -BaseBlobAction

The management policy action for baseblob.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BaseBlob
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BaseBlobLastAccessTime
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BaseBlobCreationTime
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Delete
- TierToArchive
- TierToCool
- TierToCold
- TierToHot
HelpMessage: ''
```

### -BlobVersionAction

The management policy action for blob version.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BlobVersion
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Delete
- TierToArchive
- TierToCool
- TierToCold
- TierToHot
HelpMessage: ''
```

### -DaysAfterCreationGreaterThan

Integer value indicating the age in days after creation.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Snapshot
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobVersion
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BaseBlobCreationTime
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DaysAfterLastAccessTimeGreaterThan

Integer value indicating the age in days after last blob access. This property can only be used in conjunction with last access time tracking policy.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BaseBlobLastAccessTime
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DaysAfterLastTierChangeGreaterThan

Integer value indicating the age in days after last blob tier change time. This property is only applicable for tierToArchive actions. It requires daysAfterModificationGreaterThan to be set for baseBlobs based actions, or daysAfterModificationGreaterThan to be set for snapshots and blob version based actions.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BaseBlob
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Snapshot
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: BlobVersion
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DaysAfterModificationGreaterThan

Integer value indicating the age in days after last modification.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BaseBlob
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

### -EnableAutoTierToHotFromCool

Enables auto tiering of a blob from cool to hot on a blob access. It only works with TierToCool action and DaysAfterLastAccessTimeGreaterThan.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BaseBlobLastAccessTime
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

If input the ManagementPolicy Action object, will set the action to the input action object.
If not input, will create a new action object.
If input the ManagementPolicy Action object, will set the action to the input action object. If not input, will create a new action object.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyActionGroup
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

### -SnapshotAction

The management policy action for snapshot.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Snapshot
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- Delete
- TierToArchive
- TierToCool
- TierToCold
- TierToHot
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyActionGroup

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyActionGroup

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

