---
document type: cmdlet
external help file: Az.Storage-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/invoke-azstoragereconcilenetworksecurityperimeterconfiguration
Locale: en-US
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
title: Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration
---

# Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration

## SYNOPSIS

Refreshes any information about the association.

## SYNTAX

### Reconcile (Default)

```
Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration -AccountName <string>
 -NetworkSecurityPerimeterConfigurationName <string> -ResourceGroupName <string>
 [-SubscriptionId <string>] [-DefaultProfile <psobject>] [-AsJob] [-Break]
 [-HttpPipelineAppend <SendAsyncStep[]>] [-HttpPipelinePrepend <SendAsyncStep[]>] [-NoWait]
 [-PassThru] [-Proxy <uri>] [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ReconcileViaIdentityStorageAccount

```
Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration
 -NetworkSecurityPerimeterConfigurationName <string> -StorageAccountInputObject <IStorageIdentity>
 [-DefaultProfile <psobject>] [-AsJob] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-NoWait] [-PassThru] [-Proxy <uri>]
 [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### ReconcileViaIdentity

```
Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration -InputObject <IStorageIdentity>
 [-DefaultProfile <psobject>] [-AsJob] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-NoWait] [-PassThru] [-Proxy <uri>]
 [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Refreshes any information about the association.

## EXAMPLES

### EXAMPLE 1

Invoke-AzStorageReconcileNetworkSecurityPerimeterConfiguration -ResourceGroupName "nsprg" -AccountName "nspaccount" -NetworkSecurityPerimeterConfigurationName "00000000-0000-0000-0000-000000000000.associationame"

## PARAMETERS

### -AccountName

The name of the storage account within the specified resource group.
Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Reconcile
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -AsJob

Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### -Break

Wait for .NET debugger to attach

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
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

The DefaultProfile parameter is not functional.
Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.

```yaml
Type: System.Management.Automation.PSObject
DefaultValue: ''
SupportsWildcards: false
Aliases:
- AzureRMContext
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

### -HttpPipelineAppend

SendAsync Pipeline Steps to be appended to the front of the pipeline

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Storage.Runtime.SendAsyncStep[]
DefaultValue: ''
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

### -HttpPipelinePrepend

SendAsync Pipeline Steps to be prepended to the front of the pipeline

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Storage.Runtime.SendAsyncStep[]
DefaultValue: ''
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

Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Storage.Models.IStorageIdentity
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ReconcileViaIdentity
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -NetworkSecurityPerimeterConfigurationName

The name for Network Security Perimeter configuration

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ReconcileViaIdentityStorageAccount
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Reconcile
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -NoWait

Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### -PassThru

Returns true when the command succeeds

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

### -Proxy

The URI for the proxy server to use

```yaml
Type: System.Uri
DefaultValue: ''
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

### -ProxyCredential

Credentials for a proxy server to use for the remote call

```yaml
Type: System.Management.Automation.PSCredential
DefaultValue: ''
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

### -ProxyUseDefaultCredentials

Use the default credentials for the proxy

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
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

The name of the resource group.
The name is case insensitive.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Reconcile
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StorageAccountInputObject

Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Storage.Models.IStorageIdentity
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ReconcileViaIdentityStorageAccount
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SubscriptionId

The ID of the target subscription.
The value must be an UUID.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Reconcile
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WhatIf

Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
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

### Microsoft.Azure.PowerShell.Cmdlets.Storage.Models.IStorageIdentity

{{ Fill in the Description }}

## OUTPUTS

### System.Boolean

{{ Fill in the Description }}

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties.
For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IStorageIdentity>: Identity Parameter
  [AccountName <String>]: The name of the storage account within the specified resource group.
Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
  [BlobInventoryPolicyName <String>]: The name of the storage account blob inventory policy.
It should always be 'default'
  [ContainerName <String>]: The name of the blob container within the specified storage account.
Blob container names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [DeletedAccountName <String>]: Name of the deleted storage account.
  [EncryptionScopeName <String>]: The name of the encryption scope within the specified storage account.
Encryption scope names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [Id <String>]: Resource identity path
  [Location <String>]: The name of the Azure region.
  [ManagementPolicyName <String>]: The name of the Storage Account Management Policy.
It should always be 'default'
  [MigrationName <String>]: The name of the Storage Account Migration.
It should always be 'default'
  [NetworkSecurityPerimeterConfigurationName <String>]: The name for Network Security Perimeter configuration
  [ObjectReplicationPolicyId <String>]: For the destination account, provide the value 'default'.
Configure the policy on the destination account first.
For the source account, provide the value of the policy ID that is returned when you download the policy that was defined on the destination account.
The policy is downloaded as a JSON file.
  [PrivateEndpointConnectionName <String>]: The name of the private endpoint connection associated with the Azure resource
  [QueueName <String>]: A queue name must be unique within a storage account and must be between 3 and 63 characters.The name must comprise of lowercase alphanumeric and dash(-) characters only, it should begin and end with an alphanumeric character and it cannot have two consecutive dash(-) characters.
  [ResourceGroupName <String>]: The name of the resource group.
The name is case insensitive.
  [ShareName <String>]: The name of the file share within the specified storage account.
File share names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [StorageTaskAssignmentName <String>]: The name of the storage task assignment within the specified resource group.
Storage task assignment names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
  [SubscriptionId <String>]: The ID of the target subscription.
The value must be an UUID.
  [TableName <String>]: A table name must be unique within a storage account and must be between 3 and 63 characters.The name must comprise of only alphanumeric characters and it cannot begin with a numeric character.
  [Username <String>]: The name of local user.
The username must contain lowercase letters and numbers only.
It must be unique only within the storage account.

STORAGEACCOUNTINPUTOBJECT <IStorageIdentity>: Identity Parameter
  [AccountName <String>]: The name of the storage account within the specified resource group.
Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
  [BlobInventoryPolicyName <String>]: The name of the storage account blob inventory policy.
It should always be 'default'
  [ContainerName <String>]: The name of the blob container within the specified storage account.
Blob container names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [DeletedAccountName <String>]: Name of the deleted storage account.
  [EncryptionScopeName <String>]: The name of the encryption scope within the specified storage account.
Encryption scope names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [Id <String>]: Resource identity path
  [Location <String>]: The name of the Azure region.
  [ManagementPolicyName <String>]: The name of the Storage Account Management Policy.
It should always be 'default'
  [MigrationName <String>]: The name of the Storage Account Migration.
It should always be 'default'
  [NetworkSecurityPerimeterConfigurationName <String>]: The name for Network Security Perimeter configuration
  [ObjectReplicationPolicyId <String>]: For the destination account, provide the value 'default'.
Configure the policy on the destination account first.
For the source account, provide the value of the policy ID that is returned when you download the policy that was defined on the destination account.
The policy is downloaded as a JSON file.
  [PrivateEndpointConnectionName <String>]: The name of the private endpoint connection associated with the Azure resource
  [QueueName <String>]: A queue name must be unique within a storage account and must be between 3 and 63 characters.The name must comprise of lowercase alphanumeric and dash(-) characters only, it should begin and end with an alphanumeric character and it cannot have two consecutive dash(-) characters.
  [ResourceGroupName <String>]: The name of the resource group.
The name is case insensitive.
  [ShareName <String>]: The name of the file share within the specified storage account.
File share names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.
Every dash (-) character must be immediately preceded and followed by a letter or number.
  [StorageTaskAssignmentName <String>]: The name of the storage task assignment within the specified resource group.
Storage task assignment names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
  [SubscriptionId <String>]: The ID of the target subscription.
The value must be an UUID.
  [TableName <String>]: A table name must be unique within a storage account and must be between 3 and 63 characters.The name must comprise of only alphanumeric characters and it cannot begin with a numeric character.
  [Username <String>]: The name of local user.
The username must contain lowercase letters and numbers only.
It must be unique only within the storage account.


## RELATED LINKS

- [](https://learn.microsoft.com/powershell/module/az.storage/invoke-azstoragereconcilenetworksecurityperimeterconfiguration)
