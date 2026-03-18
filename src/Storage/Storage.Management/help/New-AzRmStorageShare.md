---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azrmstorageshare
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzRmStorageShare

## SYNOPSIS

Creates a Storage file share.

## SYNTAX

### AccountName (Default)

```
New-AzRmStorageShare [-ResourceGroupName] <string> [-StorageAccountName] <string> -Name <string>
 [-QuotaGiB <int>] [-Metadata <hashtable>] [-AccessTier <string>] [-Snapshot]
 [-EnabledProtocol <string>] [-RootSquash <string>] [-ProvisionedBandwidthMibps <int>]
 [-ProvisionedIops <int>] [-PaidBurstingEnabled] [-PaidBurstingMaxIops <int>]
 [-PaidBurstingMaxBandwidthMibps <int>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountObject

```
New-AzRmStorageShare -StorageAccount <PSStorageAccount> -Name <string> [-QuotaGiB <int>]
 [-Metadata <hashtable>] [-AccessTier <string>] [-Snapshot] [-EnabledProtocol <string>]
 [-RootSquash <string>] [-ProvisionedBandwidthMibps <int>] [-ProvisionedIops <int>]
 [-PaidBurstingEnabled] [-PaidBurstingMaxIops <int>] [-PaidBurstingMaxBandwidthMibps <int>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzRmStorageShare** cmdlet creates a Storage file share.

## EXAMPLES

### Example 1: Create a Storage file share with Storage account name and share name, with metadata and share quota as 100 GiB.

```powershell
New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -QuotaGiB 100 -Metadata @{"tag1" = "value1"; "tag2" = "value2" }
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocol AccessTier Deleted Version ShareUsageBytes
----     -------- --------------- ---------- ------- ------- ---------------
myshare
```

This command creates a Storage file share with metadata and share quota as 100 GiB.

### Example 2: Create a Storage file share with Storage account object

```powershell
Get-AzStorageAccount -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" | New-AzRmStorageShare -Name "myshare"
```

```output
ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocol AccessTier Deleted Version ShareUsageBytes
----     -------- --------------- ---------- ------- ------- ---------------
myshare
```

This command creates a Storage file share with Storage account object and share name.

### Example 3: Create a Storage file share with accesstier as Hot

<!-- Skip: Output cannot be splitted from code -->


```
$share = New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -AccessTier Hot

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
myshare                            Hot
```

This command creates a Storage file share with accesstier as Hot.

### Example 4: Create a Storage file share snapshot of an existing share

<!-- Skip: Output cannot be splitted from code -->


```
$shareSnapshot = New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -Snapshot

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes snapshotTime
----     -------- ---------------- ---------- ------- ------- --------------- ------------
myshare                                                                       2021-05-10T08:04:08
```

This command creates a Storage file share snapshot of an existing base file share.

### Example 5: Create a Storage file share with EnabledProtocol property as NFS, and RootSquash property as NoRootSquash

<!-- Skip: Output cannot be splitted from code -->


```
$share = New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -EnabledProtocol NFS -RootSquash NoRootSquash

$share

   ResourceGroupName: myresourcegroup, StorageAccountName: mystorageaccount

Name     QuotaGiB EnabledProtocols AccessTier Deleted Version ShareUsageBytes
----     -------- ---------------- ---------- ------- ------- ---------------
myshare           NFS

$share.RootSquash
NoRootSquash
```

This command creates a Storage file share with EnabledProtocol property as NFS, and RootSquash property as NoRootSquash.

### Example 6: Create a Storage file share with provisioned bandwidth and IOPS

```powershell
New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -ProvisionedBandwidthMibps 129 -ProvisionedIops 3032
```

This command creates a Storage file share with provisioned bandwidth and IOPS, it only work on Files Provisioned v2 account type.

### Example 7: Create a Storage file share with paid bursting bandwidth and IOPS

```powershell
New-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -PaidBurstingEnabled -PaidBurstingMaxBandwidthMibps 129 -PaidBurstingMaxIops 3032
```

This command creates a Storage file share with paid bursting bandwidth and IOPS, it only work on Files Provisioned v1 account type.

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

### -EnabledProtocol

Sets protocols for file shares. It cannot be changed after file share creation. Possible values include: 'SMB', 'NFS'

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
- NFS
- SMB
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

Azure File share name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- ShareName
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

### -PaidBurstingEnabled

Indicates whether paid bursting is enabled for the share. This property is only for file shares created under Files Provisioned v1 SSD account type.

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

### -Snapshot

Create a snapshot of existing share with same name.

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

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSShare

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

