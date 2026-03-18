---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/update-azrmstorageshare
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Update-AzRmStorageShare

## SYNOPSIS

Modifies a Storage file share.

## SYNTAX

### AccountName (Default)

```
Update-AzRmStorageShare [-ResourceGroupName] <string> [-StorageAccountName] <string>
 [-Name] <string> [-QuotaGiB <int>] [-Metadata <hashtable>] [-AccessTier <string>]
 [-RootSquash <string>] [-ProvisionedBandwidthMibps <int>] [-ProvisionedIops <int>]
 [-PaidBurstingEnabled <bool>] [-PaidBurstingMaxIops <int>] [-PaidBurstingMaxBandwidthMibps <int>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountObject

```
Update-AzRmStorageShare -Name <string> -StorageAccount <PSStorageAccount> [-QuotaGiB <int>]
 [-Metadata <hashtable>] [-AccessTier <string>] [-RootSquash <string>]
 [-ProvisionedBandwidthMibps <int>] [-ProvisionedIops <int>] [-PaidBurstingEnabled <bool>]
 [-PaidBurstingMaxIops <int>] [-PaidBurstingMaxBandwidthMibps <int>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ShareResourceId

```
Update-AzRmStorageShare [-ResourceId] <string> [-QuotaGiB <int>] [-Metadata <hashtable>]
 [-AccessTier <string>] [-RootSquash <string>] [-ProvisionedBandwidthMibps <int>]
 [-ProvisionedIops <int>] [-PaidBurstingEnabled <bool>] [-PaidBurstingMaxIops <int>]
 [-PaidBurstingMaxBandwidthMibps <int>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### ShareObject

```
Update-AzRmStorageShare -InputObject <PSShare> [-QuotaGiB <int>] [-Metadata <hashtable>]
 [-AccessTier <string>] [-RootSquash <string>] [-ProvisionedBandwidthMibps <int>]
 [-ProvisionedIops <int>] [-PaidBurstingEnabled <bool>] [-PaidBurstingMaxIops <int>]
 [-PaidBurstingMaxBandwidthMibps <int>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzRmStorageShare** cmdlet modifies a Storage file share.

## EXAMPLES

### Example 1: Modifies a Storage file share's metadata and share quota with Storage account name and share name

<!-- Skip: Output cannot be splitted from code -->


```
$share = Update-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -QuotaGiB 200 -Metadata @{tag0="value0";tag1="value1"}

$share

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
myshare  200

$share.Metadata

Key  Value
---  -----
tag0 value0
tag1 value1
```

This command modifies a Storage file share's metadata and share quota with Storage account name and share name, and show the modify result with the returned file share object.

### Example 2: Modifies metadata on a Storage file share with Storage account object and share name

```powershell
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -StorageAccountName "myStorageAccount"
$share = Update-AzRmStorageShare -StorageAccount $accountObject -Name "myshare" -Metadata @{tag0="value0";tag1="value1"}
```

This command modifies metadata on a Storage file share with Storage account object and share name.

### Example 3: Modifies share quota for all Storage file shares in a Storage account with pipeline

```powershell
Get-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" | Update-AzRmStorageShare -QuotaGiB 5000
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
share1   5000
share2   5000
```

This command modifies share quota as 5000 GiB for all Storage file shares in a Storage account with pipeline.

### Example 4: Modify a Storage file share with accesstier as Cool

```powershell
$share = Update-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -AccessTier Cool
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
myshare                            Cool
```

This command modifies a Storage file share with accesstier as Cool.

### Example 5: Modifies rootsquash for a file shares in a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
$share = Update-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -RootSquash NoRootSquash

$share

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
myshare

$share.RootSquash
NoRootSquash
```

This command modifies share RootSquash property to NoRootSquash. RootSquash property is only available on share with EnabledProtocol as NFS.

### Example 6: Modifies a Storage file share with provisioned bandwidth and IOPS

```powershell
New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -ProvisionedBandwidthMibps 129 -ProvisionedIops 3032
```

This command modifies a Storage file share with provisioned bandwidth and IOPS, it only work on Files Provisioned v2 account type.

### Example 7: Modifies a Storage file share with paid bursting bandwidth and IOPS

```powershell
New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -PaidBurstingEnabled -PaidBurstingMaxBandwidthMibps 129 -PaidBurstingMaxIops 3032
```

This command modifies a Storage file share with paid bursting bandwidth and IOPS, it only work on Files Provisioned v1 account type.

## PARAMETERS

### -AccessTier

Access tier for specific share. StorageV2 account can choose between TransactionOptimized (default), Hot, and Cool. FileStorage account can choose Premium.

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
AcceptedValues:
- TransactionOptimized
- Premium
- Hot
- Cool
HelpMessage: ''
```

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

### -InputObject

Storage Share object

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSShare
DefaultValue: None
SupportsWildcards: false
Aliases:
- Share
ParameterSets:
- Name: ShareObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Metadata

Share Metadata

```yaml
Type: System.Collections.Hashtable
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

### -Name

Share Name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- ShareName
ParameterSets:
- Name: AccountObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountName
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PaidBurstingEnabled

Indicates whether paid bursting is enabled for the share. This property is only for file shares created under Files Provisioned v1 SSD account type.

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

### -PaidBurstingMaxBandwidthMibps

The maximum paid bursting bandwidth for the share, in mebibytes per second. This property is only for file shares created under Files Provisioned v1 SSD account type. The maximum allowed value is 10340 which is the maximum allowed bandwidth for a share.

```yaml
Type: System.Int32
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

### -PaidBurstingMaxIops

The maximum paid bursting IOPS for the share. This property is only for file shares created under Files Provisioned v1 SSD account type. The maximum allowed value is 102400 which is the maximum allowed IOPS for a share.

```yaml
Type: System.Int32
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

### -ProvisionedBandwidthMibps

The provisioned bandwidth of the share, in mebibytes per second. This property is only for file shares created under Files Provisioned v2 account type. Please refer to the Get-AzStorageFileServiceUsage cmdlet output for the minimum and maximum allowed value for provisioned bandwidth.

```yaml
Type: System.Int32
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

### -ProvisionedIops

The provisioned IOPS of the share. This property is only for file shares created under Files Provisioned v2 account type. Please refer to the Get-AzStorageFileServiceUsage cmdlet output for the minimum and maximum allowed value for provisioned IOPS.

```yaml
Type: System.Int32
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

### -QuotaGiB

Share Quota in Gibibyte.

```yaml
Type: System.Int32
DefaultValue: None
SupportsWildcards: false
Aliases:
- Quota
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

### -ResourceId

Input a File Share Resource Id.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareResourceId
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -RootSquash

Sets reduction of the access rights for the remote superuser. Possible values include: 'NoRootSquash', 'RootSquash', 'AllSquash'

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
AcceptedValues:
- NoRootSquash
- RootSquash
- AllSquash
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

### System.String

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

### Microsoft.Azure.Commands.Management.Storage.Models.PSShare

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSShare

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

