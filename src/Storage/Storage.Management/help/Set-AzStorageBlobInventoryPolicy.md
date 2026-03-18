---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/az.storage/set-azstorageblobinventorypolicy
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageBlobInventoryPolicy

## SYNOPSIS

Creates or updates blob inventory policy in a Storage account.

## SYNTAX

### AccountNamePolicyRule (Default)

```
Set-AzStorageBlobInventoryPolicy [-ResourceGroupName] <String> [-StorageAccountName] <String>
 -Rule <PSBlobInventoryPolicyRule[]> [-Disabled] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountNamePolicyObject

```
Set-AzStorageBlobInventoryPolicy [-ResourceGroupName] <String> [-StorageAccountName] <String>
 -Policy <PSBlobInventoryPolicy> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountObjectPolicyRule

```
Set-AzStorageBlobInventoryPolicy -StorageAccount <PSStorageAccount>
 -Rule <PSBlobInventoryPolicyRule[]> [-Disabled] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountObjectPolicyObject

```
Set-AzStorageBlobInventoryPolicy -StorageAccount <PSStorageAccount> -Policy <PSBlobInventoryPolicy>
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountResourceIdPolicyRule

```
Set-AzStorageBlobInventoryPolicy [-StorageAccountResourceId] <String>
 -Rule <PSBlobInventoryPolicyRule[]> [-Disabled] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountResourceIdPolicyObject

```
Set-AzStorageBlobInventoryPolicy [-StorageAccountResourceId] <String>
 -Policy <PSBlobInventoryPolicy> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageBlobInventoryPolicy** cmdlet creates or updates blob inventory policy in a Storage account.

## EXAMPLES

### Example 1: Create or update the blob inventory policy with BlobInventoryPolicy rule objects.

<!-- Skip: Output cannot be splitted from code -->


```
$rule1 = New-AzStorageBlobInventoryPolicyRule -Name Test1 -Destination $containerName -Disabled -Format Csv -Schedule Daily -ContainerSchemaField Name,Metadata,PublicAccess,Last-mOdified,LeaseStatus,LeaseState,LeaseDuration,HasImmutabilityPolicy,HasLegalHold -PrefixMatch con1,con2

$rule2 = New-AzStorageBlobInventoryPolicyRule -Name Test2 -Destination $containerName -Format Parquet -Schedule Weekly -IncludeBlobVersion -IncludeSnapshot -BlobType blockBlob,appendBlob -PrefixMatch aaa,bbb `
                -BlobSchemaField name,Creation-Time,Last-Modified,Content-Length,Content-MD5,BlobType,AccessTier,AccessTierChangeTime,Expiry-Time,hdi_isfolder,Owner,Group,Permissions,Acl,Metadata

$rule3 = New-AzStorageBlobInventoryPolicyRule -Name Test3 -Destination $containerName -Format Parquet -Schedule Weekly -IncludeBlobVersion -IncludeSnapshot -IncludeDeleted -BlobType blockBlob,appendBlob -PrefixMatch aaa,bbb `
                -ExcludePrefix ccc,ddd -BlobSchemaField name,Last-Modified,BlobType,AccessTier,AccessTierChangeTime,Content-Type,Content-CRC64,CopyId,x-ms-blob-sequence-number,TagCount

$policy = Set-AzStorageBlobInventoryPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Disabled -Rule $rule1,$rule2,$rule3

$policy

StorageAccountName : mystorageaccount
ResourceGroupName  : myresourcegroup
Name               : DefaultInventoryPolicy
Id                 : /subscriptions/{subscription-Id}/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/mystorageaccount/inventoryPolicies/default
Type               : Microsoft.Storage/storageAccounts/inventoryPolicies
LastModifiedTime   : 5/12/2021 8:53:38 AM
Enabled            : False
Rules              : {Test1, Test2, Test3}

$policy.Rules

Name  Enabled Destination   ObjectType Format  Schedule IncludeSnapshots IncludeBlobVersions IncludeDeleted BlobTypes               PrefixMatch ExcludePrefix  SchemaFields
----  ------- -----------   ---------- ------  -------- ---------------- ------------------- -------------- ---------               ----------- -------------  ------------
Test1 False   containername Container  Csv     Daily                                                                                {con1, con2}               {Name, Metadata, PublicAccess, Last-Modified...}
Test2 True    containername Blob       Parquet Weekly   True             True                               {blockBlob, appendBlob} {aaa, bbb}                 {Name, Creation-Time, Last-Modified, Content-Length...}
Test3 True    containername Blob       Parquet Weekly   True             True                True           {blockBlob, appendBlob} {aaa, bbb}  {ccc, ddd}     {Name, Content-Type, Content-CRC64, Last-Modified...}
```

This first 2 commands create 3 BlobInventoryPolicy rule objects: rule "Test1" for container inventory; rule "Test2" and "Test3" for blob inventory.
The following command sets blob inventory policy to a Storage account with the 2 rule objects, then show the updated policy and rules properties.

### Example 2: Create or update the blob inventory policy of a Storage account with a Json format policy.

<!-- Skip: Output cannot be splitted from code -->


```
$policy = Set-AzStorageBlobInventoryPolicy -ResourceGroupName $resourceGroupName  -StorageAccountName $accountName -Policy (@{
                Enabled=$true;
                Rules=(@{
                    Enabled=$true;
                    Name="Test1";
                    Destination=$containerName;
                    Definition=(@{
                        ObjectType="Blob";
                        Format="Csv";
                        Schedule="Weekly";
                        SchemaFields=@("name","Content-Length","BlobType","Snapshot","VersionId","IsCurrentVersion");
                        Filters=(@{
                            BlobTypes=@("blockBlob","appendBlob");
                            PrefixMatch=@("prefix1","prefix2");
                            IncludeSnapshots=$true;
                            IncludeBlobVersions=$true;
                        })
                    })
                },
                @{
                    Enabled=$false;
                    Name="Test2";
                    Destination=$containerName;
                    Definition=(@{
                        ObjectType="Container";
                        Format="Parquet";
                        Schedule="Daily";
                        SchemaFields=@("name","Metadata","PublicAccess","DefaultEncryptionScope","DenyEncryptionScopeOverride");
                        Filters=(@{
                            PrefixMatch=@("conpre1","conpre2");
                        })
                    })
                },
                @{
                    Enabled=$false;
                    Name="Test3";
                    Destination=$containerName;
                    Definition=(@{
                        ObjectType="Blob";
                        Format="Csv";
                        Schedule="Weekly";
                        SchemaFields=@("name","Deleted","RemainingRetentionDays","Content-Type","Content-Language","Cache-Control","Content-Disposition");
                        Filters=(@{
                            BlobTypes=@("blockBlob","appendBlob");
                            PrefixMatch=@("conpre1","conpre2");
                            ExcludePrefix=@("expre1","expre2");
                            IncludeDeleted=$true
                        })
                    })
                })
            })


$policy

StorageAccountName : weiadlscanary1
ResourceGroupName  : weitry
Name               : DefaultInventoryPolicy
Id                 : /subscriptions/{subscription-Id}/resourceGroups/weitry/providers/Microsoft.Storage/storageAccounts/weiadlscanary1/inventoryPolicies/default
Type               : Microsoft.Storage/storageAccounts/inventoryPolicies
LastModifiedTime   : 5/12/2021 9:02:21 AM
Enabled            : True
Rules              : {Test1, Test2, Test3}

$policy.Rules

Name  Enabled Destination   ObjectType Format  Schedule IncludeSnapshots IncludeBlobVersions IncludeDeleted BlobTypes               PrefixMatch        ExcludePrefix    SchemaFields
----  ------- -----------   ---------- ------  -------- ---------------- ------------------- -------------- ---------               -----------        -------------    ------------
Test1 True    containername Blob       Csv     Weekly   True             True                               {blockBlob, appendBlob} {prefix1, prefix2}                  {Name, Content-Length, BlobType, Snapshot...}
Test2 False   containername Container  Parquet Daily                                                                                {conpre1, conpre2}                  {Name, Metadata, PublicAccess}
Test3 False   containername Blob       Csv     Weekly                                        True           {blockBlob, appendBlob} {conpre1, conpre2} {expre1, expre2} {Name, Content-Type, Content-Cache, Content-Language...}                                                                                    {name, Metadata, PublicAccess}
```

This command creates or updates the blob inventory policy of a Storage account with a json format policy.

### Example 3: Get the blob inventory policy from a Storage account, then set it to another Storage account.

```powershell
$policy = Get-AzStorageBlobInventoryPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" | Set-AzStorageBlobInventoryPolicy -ResourceGroupName "myresourcegroup2" -AccountName "mystorageaccount2"
```

This command first gets the blob inventory policy from a Storage account, then set it to another Storage account.
The properties： Destination, Enabled, and Rules of the policy will be set to the destination account.

### Example 4: Get the blob inventory policy rules from a Storage account, then set it to another Storage account.

```powershell
$policy = ,((Get-AzStorageBlobInventoryPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount").Rules) | Set-AzStorageBlobInventoryPolicy -ResourceGroupName "myresourcegroup2" -AccountName "mystorageaccount2" -Disabled
```

This command first gets the blob inventory policy from a Storage account, then set it's rules to another Storage account.

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

### -Disabled

The Blob Inventory Policy is enabled by default, specify this parameter to disable it.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountNamePolicyRule
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObjectPolicyRule
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountResourceIdPolicyRule
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

Blob Inventory Policy Object to Set

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicy
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountNamePolicyObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountObjectPolicyObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountResourceIdPolicyObject
  Position: Named
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
- Name: AccountNamePolicyRule
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountNamePolicyObject
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Rule

The Blob Inventory  Policy rules.
Get the object with New-AzStorageBlobInventoryPolicyRule cmdlet.
The Blob Inventory  Policy rules. Get the object with New-AzStorageBlobInventoryPolicyRule cmdlet.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicyRule[]
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountNamePolicyRule
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObjectPolicyRule
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountResourceIdPolicyRule
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
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
- Name: AccountObjectPolicyRule
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountObjectPolicyObject
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
- Name: AccountNamePolicyRule
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AccountNamePolicyObject
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StorageAccountResourceId

Storage Account Resource Id.

```yaml
Type: System.String
DefaultValue: None
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AccountResourceIdPolicyRule
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: AccountResourceIdPolicyObject
  Position: 0
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

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

### System.String

### Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicyRule

### Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicySchema

### Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicy

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Management.Storage.Models.PSBlobInventoryPolicyRule[]

{{ Fill in the Description }}

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicy

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

