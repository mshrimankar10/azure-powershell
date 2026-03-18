---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
title: New-AzStorageDirectory
---

# New-AzStorageDirectory

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### ShareName (Default)

```
New-AzStorageDirectory [-ShareName] <string> [-Path] <string> [-FileMode <string>] [-Owner <string>]
 [-Group <string>] [-DisAllowTrailingDot] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Share

```
New-AzStorageDirectory [-ShareClient] <ShareClient> [-Path] <string> [-FileMode <string>]
 [-Owner <string>] [-Group <string>] [-Context <IStorageContext>] [-ServerTimeoutPerRequest <int>]
 [-ClientTimeoutPerRequest <int>] [-DefaultProfile <IAzureContextContainer>]
 [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

### Directory

```
New-AzStorageDirectory [-ShareDirectoryClient] <ShareDirectoryClient> [-Path] <string>
 [-FileMode <string>] [-Owner <string>] [-Group <string>] [-Context <IStorageContext>]
 [-ServerTimeoutPerRequest <int>] [-ClientTimeoutPerRequest <int>]
 [-DefaultProfile <IAzureContextContainer>] [-ConcurrentTaskCount <int>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

{{ Add example description here }}

## PARAMETERS

### -ClientTimeoutPerRequest

The client side maximum execution time for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases:
- ClientTimeoutPerRequestInSeconds
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

### -ConcurrentTaskCount

The total amount of concurrent async tasks. The default value is 10.

```yaml
Type: System.Nullable`1[System.Int32]
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

### -Context

Azure Storage Context Object

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext
DefaultValue: ''
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
DefaultValue: ''
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

### -DisAllowTrailingDot

Disallow trailing dot (.) to suffix directory and file names.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FileMode

Only applicable to NFS Directory. The mode permissions to be set on the directory. Symbolic (rwxrw-rw-) is supported.

```yaml
Type: System.String
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

### -Group

Only applicable to NFS Directory. The owner group identifier (GID) to be set on the directory. The default value is 0 (root group).

```yaml
Type: System.String
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

### -Owner

Only applicable to NFS Directory. The owner user identifier (UID) to be set on the directory. The default value is 0 (root).

```yaml
Type: System.String
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

### -Path

Path of the directory to be created.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ServerTimeoutPerRequest

The server time out for each request in seconds.

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases:
- ServerTimeoutPerRequestInSeconds
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

### -ShareClient

ShareClient object indicated the share where the files/directories would be listed.

```yaml
Type: Azure.Storage.Files.Shares.ShareClient
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Share
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareDirectoryClient

ShareDirectoryClient object indicated the base folder where the files/directories would be listed.

```yaml
Type: Azure.Storage.Files.Shares.ShareDirectoryClient
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Directory
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ShareName

Name of the file share where the directory would be created.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ShareName
  Position: 0
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

### Azure.Storage.Files.Shares.ShareClient

{{ Fill in the Description }}

### Azure.Storage.Files.Shares.ShareDirectoryClient

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

{{ Fill in the Description }}

## OUTPUTS

### Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel.AzureStorageFileDirectory

{{ Fill in the Description }}

## NOTES

{{ Fill in the Notes }}

## RELATED LINKS

{{ Fill in the related links here }}

