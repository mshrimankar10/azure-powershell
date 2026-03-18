---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/get-azstoragequeue
Module Name: Az.Storage
ms.assetid: C2EBCCF0-56CE-4D49-A138-74E52FC3A9AC
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Get-AzStorageQueue

## SYNOPSIS

Lists storage queues.

## SYNTAX

### QueueName (Default)

```
Get-AzStorageQueue [[-Name] <String>] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### QueuePrefix

```
Get-AzStorageQueue -Prefix <String> [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Get-AzStorageQueue** cmdlet lists storage queues associated with an Azure Storage account.

## EXAMPLES

### Example 1: List all Azure Storage queues

```powershell
Get-AzStorageQueue
```

This command gets a list of all storage queues for the current Storage account.

### Example 2: List Azure Storage queues using a wildcard character

```powershell
Get-AzStorageQueue -Name queue*
```

This command uses a wildcard character to get a list of storage queues whose name starts with queue.

### Example 3: List Azure Storage queues using queue name prefix

```powershell
Get-AzStorageQueue -Prefix "queue"
```

This example uses the *Prefix* parameter to get a list of storage queues whose name starts with queue.

## PARAMETERS

### -Context

Specifies the Azure storage context.
You can create it by using the **New-AzStorageContext** cmdlet.
Azure Storage Context Object

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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

### -Name

Specifies a name.
If no name is specified, the cmdlet gets a list of all the queues.
If a full or partial name is specified, the cmdlet gets all queues that match the name pattern.
Queue name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: true
Aliases:
- N
- Queue
ParameterSets:
- Name: QueueName
  Position: 0
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Prefix

Specifies a prefix used in the name of the queues you want to get.
Queue Prefix

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: QueuePrefix
  Position: Named
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

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageQueue

## NOTES

## RELATED LINKS

- [New-AzStorageQueue](./New-AzStorageQueue.md)
- [Remove-AzStorageQueue](./Remove-AzStorageQueue.md)
