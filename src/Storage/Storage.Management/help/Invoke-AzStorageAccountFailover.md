---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/invoke-Azstorageaccountfailover
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Invoke-AzStorageAccountFailover

## SYNOPSIS

Invokes failover of a Storage account.

## SYNTAX

### AccountName (Default)

```
Invoke-AzStorageAccountFailover [-ResourceGroupName] <String> [-Name] <String>
 [-FailoverType <String>] [-Force] [-AsJob] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### AccountObject

```
Invoke-AzStorageAccountFailover -InputObject <PSStorageAccount> [-FailoverType <string>] [-Force]
 [-AsJob] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Invokes failover of a Storage account. Failover request can be triggered for a storage account in case of availability issues.
The failover occurs from the storage account's primary cluster to secondary cluster for RA-GRS accounts. The secondary cluster will become primary after failover.
Please understand the following impact to your storage account before you initiate the failover:
1.1. Please check the Last Sync Time using GET Blob Service Stats (https://learn.microsoft.com/rest/api/storageservices/get-blob-service-stats), GET Table Service Stats (https://learn.microsoft.com/rest/api/storageservices/get-table-service-stats) and GET Queue Service Stats (https://learn.microsoft.com/rest/api/storageservices/get-queue-service-stats) for your account. This is the data you may lose if you initiate the failover.
2.After the failover, your storage account type will be converted to locally redundant storage(LRS). You can convert your account to use geo-redundant storage(GRS).
3.Once you re-enable GRS for your storage account, Microsoft will replicate data to your new secondary region. Replication time is dependent on the amount of data to replicate. Please note that there are bandwidth charges for the bootstrap. https://azure.microsoft.com/en-us/pricing/details/bandwidth/

## EXAMPLES

### Example 1: Invoke an unplanned failover of a Storage account

<!-- Skip: Output cannot be splitted from code -->


```
$account = Get-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -IncludeGeoReplicationStats
$account.GeoReplicationStats

Status                        : Live
LastSyncTime                  : 10/21/2025 3:42:38 AM
CanFailover                   : True
CanPlannedFailover            : True
PostFailoverRedundancy        : Standard_LRS
PostPlannedFailoverRedundancy : Standard_GRS

$job = Invoke-AzStorageAccountFailover -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -Force -AsJob
$job | Wait-Job
```

This command check the last sync time of a Storage account then invokes failover of it, the secondary cluster will become primary after failover. Since failover takes a long time, suggest to run it in the backend with -Asjob parameter, and then wait for the job complete.

### Example 2: Invoke a planned failover of a Storage account

<!-- Skip: Output cannot be splitted from code -->
```
PS C:\>$account = Get-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -IncludeGeoReplicationStats
PS C:\>$account.GeoReplicationStats

Status                        : Live
LastSyncTime                  : 10/21/2025 3:42:38 AM
CanFailover                   : True
CanPlannedFailover            : True
PostFailoverRedundancy        : Standard_LRS
PostPlannedFailoverRedundancy : Standard_GRS

PS C:\>$job = Invoke-AzStorageAccountFailover -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -FailoverType Planned -Force -AsJob
PS C:\>$job | Wait-Job
```
This command check the last sync time and canFailover status of a Storage account and then invokes a planned failover of it.

### Example 3: Invoke an unplanned failover of a Storage account with FailoverType set to Unplanned

<!-- Skip: Output cannot be splitted from code -->
```
PS C:\>$account = Get-AzStorageAccount -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -IncludeGeoReplicationStats
PS C:\>$account.GeoReplicationStats

Status                        : Live
LastSyncTime                  : 10/21/2025 3:42:38 AM
CanFailover                   : True
CanPlannedFailover            : True
PostFailoverRedundancy        : Standard_LRS
PostPlannedFailoverRedundancy : Standard_GRS

PS C:\>$job = Invoke-AzStorageAccountFailover -ResourceGroupName "MyResourceGroup" -Name "mystorageaccount" -FailoverType Unplanned -Force -AsJob
PS C:\>$job | Wait-Job
```
This command check the last sync time and canFailover status of a Storage account and then invokes an unplanned failover of it.

## PARAMETERS

### -AsJob

Run cmdlet in the background

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

### -FailoverType

Specify the failover type. Possible values are: Unplanned, Planned. If not specified, the default failover type is Unplanned.

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

### -Force

Force to Failover the Account

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

### -InputObject

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

### -Name

Storage Account Name.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- StorageAccountName
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

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

