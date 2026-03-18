---
document type: cmdlet
external help file: Az.Storage-help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragetaskassignmentinstancesreport
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageTaskAssignmentInstancesReport

## SYNOPSIS

Fetch the report summary of a single storage task assignment's instances

## SYNTAX

### List (Default)

```
Get-AzStorageTaskAssignmentInstancesReport -AccountName <string> -ResourceGroupName <string>
 [-SubscriptionId <string[]>] [-Filter <string>] [-Maxpagesize <int>] [-DefaultProfile <psobject>]
 [-Break] [-HttpPipelineAppend <SendAsyncStep[]>] [-HttpPipelinePrepend <SendAsyncStep[]>]
 [-Proxy <uri>] [-ProxyCredential <pscredential>] [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### Get

```
Get-AzStorageTaskAssignmentInstancesReport -AccountName <string> -ResourceGroupName <string>
 -StorageTaskAssignmentName <string> [-SubscriptionId <string[]>] [-Filter <string>]
 [-Maxpagesize <int>] [-DefaultProfile <psobject>] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>] [-ProxyCredential <pscredential>]
 [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### GetViaIdentityStorageAccount

```
Get-AzStorageTaskAssignmentInstancesReport -StorageTaskAssignmentName <string>
 -StorageAccountInputObject <IStorageIdentity> [-Filter <string>] [-Maxpagesize <int>]
 [-DefaultProfile <psobject>] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>] [-ProxyCredential <pscredential>]
 [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

### GetViaIdentity

```
Get-AzStorageTaskAssignmentInstancesReport -InputObject <IStorageIdentity> [-Filter <string>]
 [-Maxpagesize <int>] [-DefaultProfile <psobject>] [-Break] [-HttpPipelineAppend <SendAsyncStep[]>]
 [-HttpPipelinePrepend <SendAsyncStep[]>] [-Proxy <uri>] [-ProxyCredential <pscredential>]
 [-ProxyUseDefaultCredentials] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Fetch the report summary of a single storage task assignment's instances

## EXAMPLES

### Example 1: List the reports of a task assignment in an account

```powershell
Get-AzStorageTaskAssignmentInstancesReport -AccountName myaccount -ResourceGroupName myresourcegroup -StorageTaskAssignmentName mytaskassignment
```

```output
FinishTime             : 2024-07-02T08:19:51.9238839Z
Id                     : /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/storageTaskAssignments/mytaskassignment/reports/instance1
Name                   : instance1
ObjectFailedCount      : 0
ObjectsOperatedOnCount : 0
ObjectsSucceededCount  : 0
ObjectsTargetedCount   : 0
RunResult              : Succeeded
RunStatusEnum          : Finished
RunStatusError         : 0x0
StartTime              : 2024-07-02T08:10:55.0000000Z
StorageAccountId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount
SummaryReportPath      : https://myaccount.blob.core.windows.net/testc2/mytask/assignment1/2024-07-02T08:11:20/SummaryReport.json
TaskAssignmentId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/storageTaskAssignments/mytaskassignment
TaskId                 : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.StorageActions/storageTasks/mytask
TaskVersion            : 1
Type                   : Microsoft.Storage/storageAccounts/storageTaskAssignments/reports
```

This command lists the reports of task assignment "mytaskassignment".

### Example 2: List the reports of all storage task assignments and instances in an account

```powershell
Get-AzStorageTaskAssignmentInstancesReport -AccountName myaccount -ResourceGroupName myresourcegroup
```

```output
FinishTime             : 2024-07-03T08:19:23.1774164Z
Id                     : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/reports/instance1
Name                   : instance1
ObjectFailedCount      : 0
ObjectsOperatedOnCount : 0
ObjectsSucceededCount  : 0
ObjectsTargetedCount   : 0
RunResult              : Succeeded
RunStatusEnum          : Finished
RunStatusError         : 0x0
StartTime              : 2024-07-03T08:10:11.0000000Z
StorageAccountId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount
SummaryReportPath      : https://myaccount.blob.core.windows.net/testc2/mytask/mytaskassignment/2024-07-03T08:10:41/SummaryReport.json
TaskAssignmentId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/storageTaskAssignments/mytaskassignment
TaskId                 : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.StorageActions/storageTasks/mytask
TaskVersion            : 1
Type                   : Microsoft.Storage/storageAccounts/reports

FinishTime             : 2024-07-02T08:19:51.9238839Z
Id                     : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/reports/instance2
Name                   : instance2
ObjectFailedCount      : 0
ObjectsOperatedOnCount : 0
ObjectsSucceededCount  : 0
ObjectsTargetedCount   : 0
RunResult              : Succeeded
RunStatusEnum          : Finished
RunStatusError         : 0x0
StartTime              : 2024-07-02T08:10:55.0000000Z
StorageAccountId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount
SummaryReportPath      : https://myaccount.blob.core.windows.net/testc2/mytaskassignment2/assignment1/2024-07-02T08:11:20/SummaryReport.json
TaskAssignmentId       : /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount/storageTaskAssignments/mytaskassignment2
TaskId                 : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.StorageActions/storageTasks/mytask
TaskVersion            : 1
Type                   : Microsoft.Storage/storageAccounts/reports
```

This command lists the reports of all storage task assignments and instances under storage account "myaccount".

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

### -Filter

Optional.
When specified, it can be used to query using reporting properties.
See [Constructing Filter Strings](https://learn.microsoft.com/rest/api/storageservices/querying-tables-and-entities#constructing-filter-strings) for details.

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

### -Maxpagesize

Optional, specifies the maximum number of storage task assignment instances to be included in the list response.

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

### -StorageTaskAssignmentName

The name of the storage task assignment within the specified resource group.
Storage task assignment names must be between 3 and 24 characters in length and use numbers and lower-case letters only.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
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

### Microsoft.Azure.PowerShell.Cmdlets.Storage.Models.IStorageTaskReportInstance

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

