---
document type: cmdlet
external help file: Az.Storage-help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragenetworksecurityperimeterconfiguration
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageNetworkSecurityPerimeterConfiguration

## SYNOPSIS

Gets effective NetworkSecurityPerimeterConfiguration for association

## SYNTAX

### List (Default)

```
Get-AzStorageNetworkSecurityPerimeterConfiguration -AccountName <string> -ResourceGroupName <string>
 [-SubscriptionId <string[]>] [-DefaultProfile <psobject>] [-Break]
 [-HttpPipelineAppend <SendAsyncStep[]>] [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>]
 [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### Get

```
Get-AzStorageNetworkSecurityPerimeterConfiguration -AccountName <string> -Name <string>
 -ResourceGroupName <string> [-SubscriptionId <string[]>] [-DefaultProfile <psobject>] [-Break]
 [-HttpPipelineAppend <SendAsyncStep[]>] [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>]
 [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### GetViaIdentityStorageAccount

```
Get-AzStorageNetworkSecurityPerimeterConfiguration -Name <string>
 -StorageAccountInputObject <IStorageIdentity> [-DefaultProfile <psobject>] [-Break]
 [-HttpPipelineAppend <SendAsyncStep[]>] [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>]
 [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### GetViaIdentity

```
Get-AzStorageNetworkSecurityPerimeterConfiguration -InputObject <IStorageIdentity>
 [-DefaultProfile <psobject>] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>] [-ProxyCredential <pscredential>]
 [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Gets effective NetworkSecurityPerimeterConfiguration for association

## EXAMPLES

### Example 1: Get a NetworkSecurityPerimeterConfiguration associated with a storage account

```powershell
Get-AzStorageNetworkSecurityPerimeterConfiguration -ResourceGroupName "nsprg" -AccountName "nspaccount" -Name "00000000-0000-0000-0000-000000000000.associationame"
```

```output
Id                               : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/nsprg/providers/Microsoft.Storage/storageAccounts/nspaccount/networkSecurityPerimeterConfigurations/00000000-0000-0000-0000-000000000000.associationame
Name                             : 00000000-0000-0000-0000-000000000000.associationame
NetworkSecurityPerimeterGuid     : 00000000-0000-0000-0000-000000000000
NetworkSecurityPerimeterId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/nsprg/providers/Microsoft.Network/networkSecurityPerimeters/nspname
NetworkSecurityPerimeterLocation : eastus
ProfileAccessRule                : {}
ProfileAccessRulesVersion        : 0
ProfileDiagnosticSettingsVersion : 0
ProfileEnabledLogCategory        : {}
ProfileName                      : nsptest
ProvisioningIssue                :
ProvisioningState                : Succeeded
ResourceAssociationAccessMode    : Learning
ResourceAssociationName          : associationame
ResourceGroupName                : nsprg
SystemDataCreatedAt              :
SystemDataCreatedBy              :
SystemDataCreatedByType          :
SystemDataLastModifiedAt         :
SystemDataLastModifiedBy         :
SystemDataLastModifiedByType     :
Type                             : Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations
```

This command gets a NetworkSecurityPerimeterConfiguration associated with a storage account "nspaccount" with the nspConfig Name.

### Example 2: List NetworkSecurityPerimeterConfiguration associated with a storage account

```powershell
Get-AzStorageNetworkSecurityPerimeterConfiguration -ResourceGroupName "nsprg" -AccountName "nspaccount"
```

```output
Id                               : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/nsprg/providers/Microsoft.Storage/storageAccounts/nspaccount/networkSecurityPerimeterConfigurations/00000000-0000-0000-0000-000000000000.associationame
Name                             : 00000000-0000-0000-0000-000000000000.associationame
NetworkSecurityPerimeterGuid     : 00000000-0000-0000-0000-000000000000
NetworkSecurityPerimeterId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/nsprg/providers/Microsoft.Network/networkSecurityPerimeters/nspname
NetworkSecurityPerimeterLocation : eastus
ProfileAccessRule                : {}
ProfileAccessRulesVersion        : 0
ProfileDiagnosticSettingsVersion : 0
ProfileEnabledLogCategory        : {}
ProfileName                      : nsptest
ProvisioningIssue                :
ProvisioningState                : Succeeded
ResourceAssociationAccessMode    : Learning
ResourceAssociationName          : associationame
ResourceGroupName                : nsprg
SystemDataCreatedAt              :
SystemDataCreatedBy              :
SystemDataCreatedByType          :
SystemDataLastModifiedAt         :
SystemDataLastModifiedBy         :
SystemDataLastModifiedByType     :
Type                             : Microsoft.Storage/storageAccounts/networkSecurityPerimeterConfigurations
```

This command lists all NetworkSecurityPerimeterConfiguration associated with a storage account "nspaccount".

## PARAMETERS

### -AccountName

The name of the storage account within the specified resource group.
Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: List
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Get
  Position: Named
  IsRequired: true
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

### -DefaultProfile

The DefaultProfile parameter is not functional.
Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.

```yaml
Type: System.Management.Automation.PSObject
DefaultValue: None
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
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: GetViaIdentity
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Name

The name for Network Security Perimeter configuration

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- NetworkSecurityPerimeterConfigurationName
ParameterSets:
- Name: GetViaIdentityStorageAccount
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Get
  Position: Named
  IsRequired: true
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
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: List
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Get
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
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: GetViaIdentityStorageAccount
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
Type: System.String[]
DefaultValue: (Get-AzContext).Subscription.Id
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: List
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Get
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

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Storage.Models.INetworkSecurityPerimeterConfiguration

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

