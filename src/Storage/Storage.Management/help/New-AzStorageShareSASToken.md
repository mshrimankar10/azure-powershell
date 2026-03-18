---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azstoragesharesastoken
Module Name: Az.Storage
ms.assetid: BDF42420-3616-4A64-9562-1A896F828728
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageShareSASToken

## SYNOPSIS

Generate Shared Access Signature token for Azure Storage share.

## SYNTAX

### SasPolicy

```
New-AzStorageShareSASToken [-ShareName] <String> -Policy <String> [-Protocol <String>]
 [-IPAddressOrRange <String>] [-StartTime <DateTime>] [-ExpiryTime <DateTime>] [-FullUri]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### SasPermission

```
New-AzStorageShareSASToken [-ShareName] <String> [-Permission <String>] [-Protocol <String>]
 [-IPAddressOrRange <String>] [-StartTime <DateTime>] [-ExpiryTime <DateTime>] [-FullUri]
 [-Context <IStorageContext>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageShareSASToken** cmdlet generates a shared access signature token for an Azure Storage share.

## EXAMPLES

### Example 1: Generate a shared access signature token for a share

```powershell
New-AzStorageShareSASToken -ShareName "ContosoShare" -Permission "rwdl"
```

This command creates a shared access signature token for the share named ContosoShare.

### Example 2: Generate multiple shared access signature token by using the pipeline

```powershell
Get-AzStorageShare -Prefix "test" | New-AzStorageShareSASToken -Permission "rwdl"
```

This command gets all the Storage shares that match the prefix test.
The command passes them to the current cmdlet by using the pipeline operator.
The current cmdlet creates a shared access token for each Storage share that has the specified permissions.

### Example 3: Generate a shared access signature token that uses a shared access policy

```powershell
New-AzStorageShareSASToken -ShareName "ContosoShare" -Policy "ContosoPolicy03"
```

This command creates a shared access signature token for the Storage share named ContosoShare that has the policy named ContosoPolicy03.

## PARAMETERS

### -Context

Specifies an Azure Storage context.
To obtain a context, use the New-AzStorageContext cmdlet.
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

### -ExpiryTime

Specifies the time at which the shared access signature becomes invalid.
Expiry Time

```yaml
Type: System.Nullable`1[System.DateTime]
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

### -FullUri

Indicates that this cmdlet return the full blob URI and the shared access signature token.
Display full uri with sas token

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

### -IPAddressOrRange

Specifies the IP address or range of IP addresses from which to accept requests, such as 168.1.5.65 or 168.1.5.60-168.1.5.70.
The range is inclusive.
IP, or IP range ACL (access control list) that the request would be accepted by Azure Storage.

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

### -Permission

Specifies the permissions in the token to access the share and files under the share.
It is important to note that this is a string, like `rwd` (for Read, Write and Delete).
Permissions for a share. Permissions can be any subset of "rwdl".

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SasPermission
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Policy

Specifies the stored access policy for a share.
Policy Identifier

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SasPolicy
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Protocol

Specifies the protocol permitted for a request.
The acceptable values for this parameter are:
* HttpsOnly
* HttpsOrHttp
The default value is HttpsOrHttp.
Protocol can be used in the request with this SAS token.

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
- HttpsOnly
- HttpsOrHttp
HelpMessage: ''
```

### -ShareName

Specifies the name of the Storage share.
Share Name

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases:
- N
- Name
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StartTime

Specifies the time at which the shared access signature becomes valid.
Start Time

```yaml
Type: System.Nullable`1[System.DateTime]
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

### System.String

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.String

## NOTES

* Keywords: common, azure, services, data, storage, blob, queue, table

## RELATED LINKS

- [Get-AzStorageShare](./Get-AzStorageShare.md)
- [New-AzStorageFileSASToken](./New-AzStorageFileSASToken.md)
