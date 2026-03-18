---
document type: cmdlet
external help file: Microsoft.Azure.PowerShell.Cmdlets.Storage.Management.dll-Help.xml
HelpUri: https://learn.microsoft.com/powershell/module/Az.storage/set-Azstorageaccountmanagementpolicy
Module Name: Az.Storage
ms.date: 03/18/2026
PlatyPS schema version: 2024-05-01
---

# Set-AzStorageAccountManagementPolicy

## SYNOPSIS

Creates or modifies the management policy of an Azure Storage account.

## SYNTAX

### AccountNamePolicyRule (Default)

```
Set-AzStorageAccountManagementPolicy [-ResourceGroupName] <String> [-StorageAccountName] <String>
 -Rule <PSManagementPolicyRule[]> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountNamePolicyObject

```
Set-AzStorageAccountManagementPolicy [-ResourceGroupName] <String> [-StorageAccountName] <String>
 -Policy <PSManagementPolicy> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountObjectPolicyRule

```
Set-AzStorageAccountManagementPolicy -StorageAccount <PSStorageAccount>
 -Rule <PSManagementPolicyRule[]> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountObjectPolicyObject

```
Set-AzStorageAccountManagementPolicy -StorageAccount <PSStorageAccount> -Policy <PSManagementPolicy>
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AccountResourceIdPolicyRule

```
Set-AzStorageAccountManagementPolicy [-StorageAccountResourceId] <String>
 -Rule <PSManagementPolicyRule[]> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### AccountResourceIdPolicyObject

```
Set-AzStorageAccountManagementPolicy [-StorageAccountResourceId] <String>
 -Policy <PSManagementPolicy> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The **Set-AzStorageAccountManagementPolicy** cmdlet creates or modifies the management policy of an Azure Storage account.

## EXAMPLES

### Example 1: Create or update the management policy of a Storage account with ManagementPolicy rule objects.

```powershell
$action1 = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -DaysAfterCreationGreaterThan 100
$action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -BaseBlobAction TierToArchive -daysAfterModificationGreaterThan 50 -DaysAfterLastTierChangeGreaterThan 30
$action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -BaseBlobAction TierToCool -DaysAfterLastAccessTimeGreaterThan 30 -EnableAutoTierToHotFromCool
$action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -SnapshotAction Delete -daysAfterCreationGreaterThan 100
$action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -BlobVersionAction TierToArchive -daysAfterCreationGreaterThan 100 -DaysAfterLastTierChangeGreaterThan 14
$filter1 = New-AzStorageAccountManagementPolicyFilter -PrefixMatch ab,cd
$rule1 = New-AzStorageAccountManagementPolicyRule -Name Test -Action $action1 -Filter $filter1

$action2 = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -daysAfterCreationGreaterThan 100
$blobindexmatch1 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag1" -Value "value1"
$blobindexmatch2 = New-AzStorageAccountManagementPolicyBlobIndexMatchObject -Name "tag2" -Value "value2"
$filter2 = New-AzStorageAccountManagementPolicyFilter -BlobType appendBlob,blockBlob -BlobIndexMatch $blobindexmatch1,$blobindexmatch2
$rule2 = New-AzStorageAccountManagementPolicyRule -Name Test2 -Action $action2 -Filter $filter2

Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Rule $rule1,$rule2
```

```output
ResourceGroupName  : myresourcegroup
StorageAccountName : mystorageaccount
Id                 : /subscriptions/{subscription-id}/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/mystorageaccount/managementPolicies/default
Type               : Microsoft.Storage/storageAccounts/managementPolicies
LastModifiedTime   : 7/12/2022 8:32:09 AM
Rules              : [
                         {
                             "Enabled":  true,
                             "Name":  "Test",
                             "Definition":  {
                                                "Actions":  {
                                                                "BaseBlob":  {
                                                                                 "TierToCool":  {
                                                                                                    "DaysAfterModificationGreaterThan":  null,
                                                                                                    "DaysAfterLastAccessTimeGreaterThan":  30,
                                                                                                    "DaysAfterCreationGreaterThan":  null,
                                                                                                    "DaysAfterLastTierChangeGreaterThan":  null
                                                                                                },
                                                                                 "TierToArchive":  {
                                                                                                       "DaysAfterModificationGreaterThan":  50,
                                                                                                       "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                       "DaysAfterCreationGreaterThan":  null,
                                                                                                       "DaysAfterLastTierChangeGreaterThan":  30
                                                                                                   },
                                                                                 "Delete":  {
                                                                                                "DaysAfterModificationGreaterThan":  null,
                                                                                                "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "EnableAutoTierToHotFromCool":  true
                                                                             },
                                                                "Snapshot":  {
                                                                                 "Delete":  {
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "TierToCool":  null,
                                                                                 "TierToArchive":  null
                                                                             },
                                                                "Version":  {
                                                                                "Delete":  null,
                                                                                "TierToCool":  null,
                                                                                "TierToArchive":  {
                                                                                                      "DaysAfterCreationGreaterThan":  100,
                                                                                                      "DaysAfterLastTierChangeGreaterThan":  14
                                                                                                  }
                                                                            }
                                                            },
                                                "Filters":  {
                                                                "PrefixMatch":  [
                                                                                    "ab",
                                                                                    "cd"
                                                                                ],
                                                                "BlobTypes":  [
                                                                                  "blockBlob"
                                                                              ],
                                                                "BlobIndexMatch":  null
                                                            }
                                            }
                         },
                         {
                             "Enabled":  true,
                             "Name":  "Test2",
                             "Definition":  {
                                                "Actions":  {
                                                                "BaseBlob":  {
                                                                                 "TierToCool":  null,
                                                                                 "TierToArchive":  null,
                                                                                 "Delete":  {
                                                                                                "DaysAfterModificationGreaterThan":  null,
                                                                                                "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "EnableAutoTierToHotFromCool":  null
                                                                             },
                                                                "Snapshot":  null,
                                                                "Version":  null
                                                            },
                                                "Filters":  {
                                                                "PrefixMatch":  null,
                                                                "BlobTypes":  [
                                                                                  "appendBlob",
                                                                                  "blockBlob"
                                                                              ],
                                                                "BlobIndexMatch":  [
                                                                                       {
                                                                                           "Name":  "tag1",
                                                                                           "Op":  "==",
                                                                                           "Value":  "value1"
                                                                                       },
                                                                                       {
                                                                                           "Name":  "tag2",
                                                                                           "Op":  "==",
                                                                                           "Value":  "value2"
                                                                                       }
                                                                                   ]
                                                            }
                                            }
                         }
                     ]
```

This command first create 2 ManagementPolicy rule objects, then creates or updates the management policy of a Storage account with the 2 ManagementPolicy rule objects.

### Example 2: Create or update the management policy of a Storage account with a Json format policy.

```powershell
Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -Policy (@{
    Rules=(@{
        Enabled=$true;
        Name="Test";
        Definition=(@{
            Actions=(@{
                BaseBlob=(@{
                    TierToCool=@{DaysAfterLastAccessTimeGreaterThan=30};
                    TierToArchive=@{DaysAfterModificationGreaterThan=50;DaysAfterLastTierChangeGreaterThan=30};
                    Delete=@{DaysAfterCreationGreaterThan=100};
                    EnableAutoTierToHotFromCool="true";
                });
                Snapshot=(@{
                    Delete=@{DaysAfterCreationGreaterThan=100}
                    TierToArchive=@{DaysAfterCreationGreaterThan=50};
                    TierToCool=@{DaysAfterCreationGreaterThan=60};
                });
                Version=(@{
                    Delete=@{DaysAfterCreationGreaterThan=100};
                    TierToArchive=@{DaysAfterCreationGreaterThan=50;DaysAfterLastTierChangeGreaterThan=20};
                    TierToCool=@{DaysAfterCreationGreaterThan=60};
                });
            });
            Filters=(@{
                BlobTypes=@("blockBlob");
                PrefixMatch=@("prefix1","prefix2");
            })
        })
    },
    @{
        Enabled=$false;
        Name="Test2";
        Definition=(@{
            Actions=(@{
                BaseBlob=(@{
                    Delete=@{DaysAfterCreationGreaterThan=100};
                });
            });
            Filters=(@{
                BlobTypes=@("blockBlob","appendBlob");
                BlobIndexMatch=(@{Name="tag1";Op="==";Value ="value1"},@{Name="tag2";Op="==";Value="value2"})
            })
        })
    })
})
```

```output
ResourceGroupName  : myresourcegroup
StorageAccountName : mystorageaccount
Id                 : /subscriptions/{subscription-id}/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/mystorageaccount/managementPolicies/default
Type               : Microsoft.Storage/storageAccounts/managementPolicies
LastModifiedTime   : 7/12/2022 8:34:05 AM
Rules              : [
                         {
                             "Enabled":  true,
                             "Name":  "Test",
                             "Definition":  {
                                                "Actions":  {
                                                                "BaseBlob":  {
                                                                                 "TierToCool":  {
                                                                                                    "DaysAfterModificationGreaterThan":  null,
                                                                                                    "DaysAfterLastAccessTimeGreaterThan":  30,
                                                                                                    "DaysAfterCreationGreaterThan":  null,
                                                                                                    "DaysAfterLastTierChangeGreaterThan":  null
                                                                                                },
                                                                                 "TierToArchive":  {
                                                                                                       "DaysAfterModificationGreaterThan":  50,
                                                                                                       "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                       "DaysAfterCreationGreaterThan":  null,
                                                                                                       "DaysAfterLastTierChangeGreaterThan":  30
                                                                                                   },
                                                                                 "Delete":  {
                                                                                                "DaysAfterModificationGreaterThan":  null,
                                                                                                "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "EnableAutoTierToHotFromCool":  true
                                                                             },
                                                                "Snapshot":  {
                                                                                 "Delete":  {
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "TierToCool":  {
                                                                                                    "DaysAfterCreationGreaterThan":  60,
                                                                                                    "DaysAfterLastTierChangeGreaterThan":  null
                                                                                                },
                                                                                 "TierToArchive":  {
                                                                                                       "DaysAfterCreationGreaterThan":  50,
                                                                                                       "DaysAfterLastTierChangeGreaterThan":  null
                                                                                                   }
                                                                             },
                                                                "Version":  {
                                                                                "Delete":  {
                                                                                               "DaysAfterCreationGreaterThan":  100,
                                                                                               "DaysAfterLastTierChangeGreaterThan":  null
                                                                                           },
                                                                                "TierToCool":  {
                                                                                                   "DaysAfterCreationGreaterThan":  60,
                                                                                                   "DaysAfterLastTierChangeGreaterThan":  null
                                                                                               },
                                                                                "TierToArchive":  {
                                                                                                      "DaysAfterCreationGreaterThan":  50,
                                                                                                      "DaysAfterLastTierChangeGreaterThan":  20
                                                                                                  }
                                                                            }
                                                            },
                                                "Filters":  {
                                                                "PrefixMatch":  [
                                                                                    "prefix1",
                                                                                    "prefix2"
                                                                                ],
                                                                "BlobTypes":  [
                                                                                  "blockBlob"
                                                                              ],
                                                                "BlobIndexMatch":  null
                                                            }
                                            }
                         },
                         {
                             "Enabled":  false,
                             "Name":  "Test2",
                             "Definition":  {
                                                "Actions":  {
                                                                "BaseBlob":  {
                                                                                 "TierToCool":  null,
                                                                                 "TierToArchive":  null,
                                                                                 "Delete":  {
                                                                                                "DaysAfterModificationGreaterThan":  null,
                                                                                                "DaysAfterLastAccessTimeGreaterThan":  null,
                                                                                                "DaysAfterCreationGreaterThan":  100,
                                                                                                "DaysAfterLastTierChangeGreaterThan":  null
                                                                                            },
                                                                                 "EnableAutoTierToHotFromCool":  null
                                                                             },
                                                                "Snapshot":  null,
                                                                "Version":  null
                                                            },
                                                "Filters":  {
                                                                "PrefixMatch":  null,
                                                                "BlobTypes":  [
                                                                                  "blockBlob",
                                                                                  "appendBlob"
                                                                              ],
                                                                "BlobIndexMatch":  [
                                                                                       {
                                                                                           "Name":  "tag1",
                                                                                           "Op":  "==",
                                                                                           "Value":  "value1"
                                                                                       },
                                                                                       {
                                                                                           "Name":  "tag2",
                                                                                           "Op":  "==",
                                                                                           "Value":  "value2"
                                                                                       }
                                                                                   ]
                                                            }
                                            }
                         }
                     ]
```

This command creates or updates the management policy of a Storage account with a json format policy.

### Example 3: Get the management policy from a Storage account, then set it to another Storage account.

```powershell
$outputPolicy = Get-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" | Set-AzStorageAccountManagementPolicy -ResourceGroupName "myresourcegroup2" -AccountName "mystorageaccount2"
```

This command first gets the management policy from a Storage account, then set it to another Storage account.

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

### -Policy

Management Policy Object to Set

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicy
DefaultValue: None
SupportsWildcards: false
Aliases:
- ManagementPolicy
ParameterSets:
- Name: AccountNamePolicyObject
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
- Name: AccountResourceIdPolicyObject
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
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

The Management Policy rules. Get the object with New-AzStorageAccountManagementPolicyRule cmdlet.

```yaml
Type: Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRule[]
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

### System.String

### Microsoft.Azure.Commands.Management.Storage.Models.PSStorageAccount

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRule

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicy

{{ Fill in the Description }}

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicyRule[]

{{ Fill in the Description }}

## OUTPUTS

### Microsoft.Azure.Commands.Management.Storage.Models.PSManagementPolicy

## NOTES

## RELATED LINKS

- [New-AzStorageAccountManagementPolicyRule](./New-AzStorageAccountManagementPolicyRule.md)
- [Add-AzStorageAccountManagementPolicyAction](./Add-AzStorageAccountManagementPolicyAction.md)
- [New-AzStorageAccountManagementPolicyFilter](./New-AzStorageAccountManagementPolicyFilter.md)
- [New-AzStorageAccountManagementPolicyBlobIndexMatchObject](./New-AzStorageAccountManagementPolicyBlobIndexMatchObject.md)
- [Get-AzStorageAccountManagementPolicy](./Get-AzStorageAccountManagementPolicy.md)
- [Remove-AzStorageAccountManagementPolicy](./Remove-AzStorageAccountManagementPolicy.md)
