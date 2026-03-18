---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/new-azstorageblobqueryconfig
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageBlobQueryConfig

## SYNOPSIS

Creates a blob query configuration object, which can be used in Get-AzStorageBlobQueryResult.

## SYNTAX

### Csv (Default)

```
New-AzStorageBlobQueryConfig -AsCsv] [-RecordSeparator <string>] [-ColumnSeparator <string>]
 [-QuotationCharacter <char>] [-EscapeCharacter <char>] [-HasHeader] [-AsJob] [<CommonParameters>]
```

### Json

```
New-AzStorageBlobQueryConfig -AsJson] [-RecordSeparator <string>] [-AsJob] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageBlobQueryConfig** cmdlet creates a blob query configuration object, which can be used in Get-AzStorageBlobQueryResult.

## EXAMPLES

### Example 1: Create blob query configures , and query a blob

```powershell
$inputconfig = New-AzStorageBlobQueryConfig -AsCsv -ColumnSeparator "," -QuotationCharacter """" -EscapeCharacter "\" -RecordSeparator "`n" -HasHeader

$outputconfig = New-AzStorageBlobQueryConfig -AsJson -RecordSeparator "`n"

$queryString = "SELECT * FROM BlobStorage WHERE Name = 'a'"

$result = Get-AzStorageBlobQueryResult -Container $containerName -Blob $blobName -QueryString $queryString -ResultFile "c:\resultfile.json" -InputTextConfiguration $inputconfig -OutputTextConfiguration $outputconfig -Context $ctx

$result
```

```output
BytesScanned FailureCount BlobQueryError
------------ ------------ --------------
         449            0
```

This command first create input configuration object as csv, and output configuration object as json, then use the 2 configurations to query blob.

## PARAMETERS

### -AsCsv

Indicate to create a Blob Query Configuration for CSV.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

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

### -AsJson

Indicate to create a Blob Query Configuration for Json.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Json
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ColumnSeparator

Optional.
The string used to separate columns.
Optional. The string used to separate columns.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EscapeCharacter

Optional.
The char used as an escape character.
Optional. The char used as an escape character.

```yaml
Type: System.Nullable`1[System.Char]
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -HasHeader

Optional.
Indicate it represent the data has headers.
Optional. Indicate it represent the data has headers.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -QuotationCharacter

Optional.
The char used to quote a specific field.
Optional. The char used to quote a specific field.

```yaml
Type: System.Char
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -RecordSeparator

Optional.
The string used to separate records.
Optional. The string used to separate records.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Csv
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Json
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

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.PSBlobQueryTextConfiguration

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

