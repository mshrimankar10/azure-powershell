---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/new-azstorageaccountsastoken
Module Name: Az.Storage
ms.assetid: BCCBB05B-A5D7-4796-BE55-6BE5E18E07FC
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# New-AzStorageAccountSASToken

## SYNOPSIS

Creates an account-level SAS token.

## SYNTAX

### Default (Default)

```
New-AzStorageAccountSASToken -Service <SharedAccessAccountServices>
 -ResourceType <SharedAccessAccountResourceTypes> [-Permission <String>]
 [-Protocol <SharedAccessProtocol>] [-IPAddressOrRange <String>] [-StartTime <DateTime>]
 [-ExpiryTime <DateTime>] [-EncryptionScope <String>] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### __AllParameterSets

```
New-AzStorageAccountSASToken -Service <SharedAccessAccountServices>
 -ResourceType <SharedAccessAccountResourceTypes> [-Permission <string>]
 [-Protocol <SharedAccessProtocol>] [-IPAddressOrRange <string>] [-StartTime <datetime>]
 [-ExpiryTime <datetime>] [-EncryptionScope <string>] [-Context <IStorageContext>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **New-AzStorageAccountSASToken** cmdlet creates an account-level shared access signature (SAS) token for an Azure Storage account.
You can use the SAS token to delegate permissions for multiple services, or to delegate permissions for services not available with an object-level SAS token.
An account SAS is secured using the storage account key. To create an account SAS, a client application must possess the account key.

## EXAMPLES

### Example 1: Create an account-level SAS token with full permission

```powershell
New-AzStorageAccountSASToken -Service Blob,File,Table,Queue -ResourceType Service,Container,Object -Permission "racwdlup"
```

This command creates an account-level SAS token with full permission.

### Example 2: Create an account-level SAS token for a range of IP addresses and EncryptionScope

```powershell
New-AzStorageAccountSASToken -Service Blob,File,Table,Queue -ResourceType Service,Container,Object -Permission "racwdlup" -Protocol HttpsOnly -IPAddressOrRange 168.1.5.60-168.1.5.70 -EncryptionScope scopename
```

This command creates an account-level SAS token for HTTPS-only requests from the specified range of IP addresses, with a specific EncryptionScope.

### Example 3: Create an account-level SAS token valid for 24 hours

```powershell
New-AzStorageAccountSASToken -Service Blob -ResourceType Service,Container,Object -Permission "rl" -ExpiryTime (Get-Date).AddDays(1)
```

This command creates an read-only account-level SAS token that is valid for 24 hours.

## PARAMETERS

### -Context

Specifies the Azure storage context.
You can use the New-AzStorageContext cmdlet to get an **AzureStorageContext** object.
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

### -EncryptionScope

Encryption scope to use when sending requests authorized with this SAS URI.

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

Specifies the permissions for Storage account.
Permissions are valid only if they match the specified resource type.
It is important to note that this is a string, like `rwd` (for Read, Write and Delete).
For more information about acceptable permission values, see Constructing an Account SAS http://go.microsoft.com/fwlink/?LinkId=799514
Permissions.

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

### -Protocol

Specifies the protocol permitted for a request made with the account SAS.
The acceptable values for this parameter are:
- HttpsOnly
- HttpsOrHttp
The default value is HttpsOrHttp.
Protocol can be used in the request with this SAS token.

```yaml
Type: System.Nullable`1[Microsoft.Azure.Storage.SharedAccessProtocol]
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

### -ResourceType

Specifies the resource types that are available with the SAS token.
The acceptable values for this parameter are:
- None
- Service
- Container
- Object
Resource type that this SAS token applies to.

```yaml
Type: Microsoft.Azure.Storage.SharedAccessAccountResourceTypes
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- None
- Service
- Container
- Object
HelpMessage: ''
```

### -Service

Specifies the service.
The acceptable values for this parameter are:
- None
- Blob
- File
- Queue
- Table
Service type that this SAS token applies to.

```yaml
Type: Microsoft.Azure.Storage.SharedAccessAccountServices
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues:
- None
- Blob
- File
- Queue
- Table
HelpMessage: ''
```

### -StartTime

Specifies the time, as a **DateTime** object, at which the SAS becomes valid.
To get a **DateTime** object, use the Get-Date cmdlet.
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

### Microsoft.Azure.Commands.Common.Authentication.Abstractions.IStorageContext

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

- [New-AzStorageBlobSASToken](./New-AzStorageBlobSASToken.md)
- [New-AzStorageContainerSASToken](./New-AzStorageContainerSASToken.md)
- [New-AzStorageFileSASToken](./New-AzStorageFileSASToken.md)
- [New-AzStorageQueueSASToken](./New-AzStorageQueueSASToken.md)
- [New-AzStorageShareSASToken](./New-AzStorageShareSASToken.md)
- [New-AzStorageTableSASToken](./New-AzStorageTableSASToken.md)
