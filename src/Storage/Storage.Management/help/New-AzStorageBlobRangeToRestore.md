---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azstorageblobrangetorestore
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageBlobRangeToRestore

## SYNOPSIS

Creates a Blob Range object to restores a Storage account.

## SYNTAX

### Default (Default)

```
New-AzStorageBlobRangeToRestore [-StartRange <String>] [-EndRange <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageBlobRangeToRestore [-StartRange <string>] [-EndRange <string>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageBlobRangeToRestore** cmdlet creates a Blob range object, which can be used in Restore-AzStorageBlobRange.

## EXAMPLES

### Example 1: Creates a blob range to restore

```powershell
$range = New-AzStorageBlobRangeToRestore -StartRange container1/blob1 -EndRange container2/blob2
```

This command creates a blob range to restore, which starts at container1/blob1 (include), and ends at container2/blob2 (exclude).

### Example 2: Creates a blob range which will restore from first blob in alphabetical order, to a specific blob (exclude)

```powershell
$range = New-AzStorageBlobRangeToRestore -StartRange "" -EndRange container2/blob2
```

This command creates a blob range which will restore from first blob of alphabetical order, to a specific blob container2/blob2 (exclude)

### Example 3: Creates a blob range which will restore from a specific blob (include), to the last blob in alphabetical order

```powershell
$range = New-AzStorageBlobRangeToRestore -StartRange container1/blob1 -EndRange ""
```

This command creates a blob range which will restore from a specific blob container1/blob1 (include), to the last blob in alphabetical order.

### Example 4: Creates a blob range which will restore all blobs

```powershell
$range = New-AzStorageBlobRangeToRestore -StartRange "" -EndRange ""
```

This command creates a blob range which will restore all blobs.

## PARAMETERS

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

### -EndRange

Specify the blob restore End range.
End range will be excluded in restore blobs.
Set it as empty string to restore to the end.
Specify the blob restore End range. Leave it as empty to restore to the end.

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

### -StartRange

Specify the blob restore start range.
Start range will be included in restore blobs.
Set it as empty string to restore from beginning.
Specify the blob restore start range. Leave it as empty to restore from beginning.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSBlobRestoreRange

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

