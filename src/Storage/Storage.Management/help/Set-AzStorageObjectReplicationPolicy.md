---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageobjectreplicationpolicy
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageObjectReplicationPolicy

## SYNOPSIS

Creates or updates the specified object replication policy in a Storage account.

## SYNTAX

### AccountName (Default)

```
Set-AzStorageObjectReplicationPolicy [-ResourceGroupName] <string> [-StorageAccountName] <string>
 -SourceAccount <string> -Rule <PSObjectReplicationPolicyRule[]> [-PolicyId <string>]
 [-DestinationAccount <string>] [-EnableMetric <bool>] [-EnablePriorityReplication <bool>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### PolicyObject

```
Set-AzStorageObjectReplicationPolicy [-ResourceGroupName] <String> [-StorageAccountName] <String>
 -InputObject <PSObjectReplicationPolicy> [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountObject

```
Set-AzStorageObjectReplicationPolicy -StorageAccount <PSStorageAccount> -SourceAccount <string>
 -Rule <PSObjectReplicationPolicyRule[]> [-PolicyId <string>] [-DestinationAccount <string>]
 [-EnableMetric <bool>] [-EnablePriorityReplication <bool>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageObjectReplicationPolicy** cmdlet creates or updates the specified object replication policy in a Storage account.

## EXAMPLES

### Example 1: Set object replication policy to both destination and source account.

<!-- Skip: Output cannot be splitted from code -->


```
$rule1 = New-AzStorageObjectReplicationPolicyRule -SourceContainer src1 -DestinationContainer dest1

$rule2 = New-AzStorageObjectReplicationPolicyRule -SourceContainer src -DestinationContainer dest -MinCreationTime 2019-01-01T16:00:00Z -PrefixMatch a,abc,dd

$srcAccount = Get-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mysourceaccount"

Set-AzStorageObjectReplicationPolicy -ResourceGroupName "myresourcegroup" -AccountName "mydestaccount" -PolicyId default -SourceAccount $srcAccount.Id  -Rule $rule1,$rule2 -EnableMetric $true -EnablePriorityReplication $true

ResourceGroupName StorageAccountName PolicyId                             EnabledTime SourceAccount   DestinationAccount Metrics PriorityReplication Rules
----------------- ------------------ --------                             ----------- -------------   ------------------ ------- ------------------- -----
myresourcegroup   mydestaccount      56bfa11c-81ef-4f8d-b307-5e5386e16fba             mysourceaccount mydestaccount      Enabled Enabled             [5fa8b1d6-4985-4abd-a0b3-ec4d07295a43,...]

$destPolicy = Get-AzStorageObjectReplicationPolicy -ResourceGroupName "myresourcegroup" -AccountName "mydestaccount"

Set-AzStorageObjectReplicationPolicy -ResourceGroupName "myresourcegroup" -AccountName "mysourceaccount" -InputObject $destPolicy

ResourceGroupName StorageAccountName PolicyId                             EnabledTime SourceAccount   DestinationAccount Metrics PriorityReplication Rules
----------------- ------------------ --------                             ----------- -------------   ------------------ ------- ------------------- -----
myresourcegroup   mysourceaccount    56bfa11c-81ef-4f8d-b307-5e5386e16fba             mysourceaccount mydestaccount      Enabled Enabled             [5fa8b1d6-4985-4abd-a0b3-ec4d07295a43,...]
```

This command sets object replication policy to both destination and source account.
First create 2 object replication policy rules, and set policy to destination account with the 2 rules and source account resource Id, and enable metrics, enable priority replication. Then get the object replication policy from destination account and set to source account.
Please note, when storage account has AllowCrossTenantReplication as false, SourceAccount and DestinationAccount should be account resource Id.

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

### -DestinationAccount

Object Replication Policy DestinationAccount, if SourceAccount is account name it should be account name, else should be account resource id. Default value will be the input StorageAccountName, or the resourceID of the account.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EnableMetric

Indicates whether object replication metrics feature is enabled for the policy.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EnablePriorityReplication

Indicates whether object replication priority replication feature is enabled for the policy.
This feature provides enhanced replication performance and reduces recovery time objectives (RTO) for critical data replication scenarios.
Indicates whether object replication priority replication feature is enabled for the policy.

```yaml
Type: System.Boolean
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
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

Object Replication Policy Object to Set to the specified Account.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSObjectReplicationPolicy
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: PolicyObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PolicyId

Object Replication Policy Id.
It should be a GUID or 'default'.
If not input the PolicyId, will use 'default', which means to create a new policy and the Id of the new policy will be returned in the created policy.
Object Replication Policy Id. It should be a GUID or 'default'. If not input the PolicyId, will use 'default', which means to create a new policy and the Id of the new policy will be returned in the created policy.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
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
- Name: PolicyObject
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Rule

Object Replication Policy Rules.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSObjectReplicationPolicyRule[]
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SourceAccount

Object Replication Policy SourceAccount. It should be resource id if allowCrossTenantReplication is false..
Object Replication Policy SourceAccount. It should be resource id if storage account property allowCrossTenantReplication set to false.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObject
  Position: Named
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
- Name: PolicyObject
  Position: 1
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

### Microsoft.Azure.Commands.Management.Storage.Models.PSObjectReplicationPolicy

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSObjectReplicationPolicy

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

