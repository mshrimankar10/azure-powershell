---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/lock-azrmstoragecontainerimmutabilitypolicy
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Lock-AzRmStorageContainerImmutabilityPolicy

## SYNOPSIS

Locks ImmutabilityPolicy of a Storage blob containers

## SYNTAX

### AccountName (Default)

```
Lock-AzRmStorageContainerImmutabilityPolicy [-ResourceGroupName] <string>
 [-StorageAccountName] <string> [-ContainerName] <string> -Etag <string> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountObject

```
Lock-AzRmStorageContainerImmutabilityPolicy -ContainerName <String>
 -StorageAccount <PSStorageAccount> -Etag <String> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ContainerObject

```
Lock-AzRmStorageContainerImmutabilityPolicy -Container <PSContainer> -Etag <String> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ImmutabilityPolicyObject

```
Lock-AzRmStorageContainerImmutabilityPolicy [-InputObject] <PSImmutabilityPolicy> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Lock-AzRmStorageContainerImmutabilityPolicy** cmdlet locks ImmutabilityPolicy of a Storage blob containers.

## EXAMPLES

### Example 1: Lock ImmutabilityPolicy of a Storage blob container with Storage account name and container name

```powershell
$policy = Get-AzRmStorageContainerImmutabilityPolicy -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -ContainerName "myContainer"
Lock-AzRmStorageContainerImmutabilityPolicy -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -ContainerName "myContainer" -Etag $policy.Etag
```

This command Locks ImmutabilityPolicy of a Storage blob container with Storage account name and container name.

### Example 2: Lock ImmutabilityPolicy of a Storage blob container, with Storage account object

```powershell
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount"
$policy = Get-AzRmStorageContainerImmutabilityPolicy -StorageAccount $accountObject -ContainerName "myContainer"
Lock-AzRmStorageContainerImmutabilityPolicy -StorageAccount $accountObject -ContainerName "myContainer" -Etag $policy.Etag -Force
```

This command locks ImmutabilityPolicy of a Storage blob container, with Storage account object.

### Example 3: Lock ImmutabilityPolicy of a Storage blob container, with container object

```powershell
$containerObject = Get-AzRmStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -Name "myContainer"
$policy = Get-AzRmStorageContainerImmutabilityPolicy -Container $containerObject
Lock-AzRmStorageContainerImmutabilityPolicy -Container $containerObject -Etag $policy.Etag -Force
```

This command locks ImmutabilityPolicy of a Storage blob container with Storage container object.

### Example 4: Lock ImmutabilityPolicy of a Storage blob container, with ImmutabilityPolicy object

```powershell
Get-AzRmStorageContainerImmutabilityPolicy -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -ContainerName "myContainer" | Lock-AzRmStorageContainerImmutabilityPolicy -Force
```

This command locks ImmutabilityPolicy of a Storage blob container, with ImmutabilityPolicy object.

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

### -Container

Storage container object

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSContainer
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ContainerObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ContainerName

Container Name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
ParameterSets:
- Name: AccountObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountName
  Position: 2
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DefaultProfile

The credentials, account, tenant, and subscription used for communication with azure.

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

### -Etag

Immutability policy etag.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- IfMatch
ParameterSets:
- Name: AccountObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ContainerObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountName
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Force

Force to remove the ImmutabilityPolicy.

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

ImmutabilityPolicy Object to Remove

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSImmutabilityPolicy
DefaultValue: None
SupportsWildcards: false
Aliases:
- ImmutabilityPolicy
ParameterSets:
- Name: ImmutabilityPolicyObject
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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
  ValueFromPipelineByPropertyName: true
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
  ValueFromPipelineByPropertyName: true
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
  ValueFromPipelineByPropertyName: true
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

### Microsoft.Azure.Commands.Management.Storage.Models.PSContainer

### Microsoft.Azure.Commands.Management.Storage.Models.PSImmutabilityPolicy

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSImmutabilityPolicy

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

