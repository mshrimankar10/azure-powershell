---
external help file:
Module Name: Az.Network
online version: https://learn.microsoft.com/powershell/module/az.network/get-azexpressroutelagmember
schema: 2.0.0
---

# Get-AzExpressRouteLagMember

## SYNOPSIS
Retrieves the specified ExpressRouteLagMember resource.

## SYNTAX

### List (Default)
```
Get-AzExpressRouteLagMember -ExpressRouteLagName <String> -LinkName <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzExpressRouteLagMember -ExpressRouteLagName <String> -LinkName <String> -MemberName <String>
 -ResourceGroupName <String> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzExpressRouteLagMember -InputObject <IExpressRouteLagIdentity> [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

### GetViaIdentityExpressRouteLag
```
Get-AzExpressRouteLagMember -ExpressRouteLagInputObject <IExpressRouteLagIdentity> -LinkName <String>
 -MemberName <String> [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentityLink
```
Get-AzExpressRouteLagMember -LinkInputObject <IExpressRouteLagIdentity> -MemberName <String>
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the specified ExpressRouteLagMember resource.

## EXAMPLES

### Example 1: List all members for an ExpressRouteLag link
```powershell
Get-AzExpressRouteLagMember -ExpressRouteLagName 'myLag1' -LinkName 'link1' -ResourceGroupName 'myResourceGroup'
```

```output
Name      InterfaceName ConnectorType AdminState ProvisioningState
----      ------------- ------------- ---------- -----------------
member1   eth0          LC            Enabled    Succeeded
member2   eth1          LC            Enabled    Succeeded
```

Lists all members for the specified link of an ExpressRouteLag.

### Example 2: Get a specific member
```powershell
Get-AzExpressRouteLagMember -Name 'member1' -ExpressRouteLagName 'myLag1' -LinkName 'link1' -ResourceGroupName 'myResourceGroup'
```

```output
Name      InterfaceName ConnectorType AdminState ProvisioningState
----      ------------- ------------- ---------- -----------------
member1   eth0          LC            Enabled    Succeeded
```

Gets a specific member of an ExpressRouteLag link.

## PARAMETERS

### -DefaultProfile
The DefaultProfile parameter is not functional.
Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpressRouteLagInputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagIdentity
Parameter Sets: GetViaIdentityExpressRouteLag
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ExpressRouteLagName
The name of the ExpressRouteLag resource.

```yaml
Type: System.String
Parameter Sets: Get, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagIdentity
Parameter Sets: GetViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -LinkInputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagIdentity
Parameter Sets: GetViaIdentityLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -LinkName
The name of the ExpressRouteLagLink resource.

```yaml
Type: System.String
Parameter Sets: Get, GetViaIdentityExpressRouteLag, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemberName
The name of the ExpressRouteLagMember resource.

```yaml
Type: System.String
Parameter Sets: Get, GetViaIdentityExpressRouteLag, GetViaIdentityLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group.

```yaml
Type: System.String
Parameter Sets: Get, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The subscription credentials which uniquely identify the Microsoft Azure subscription.
The subscription ID forms part of the URI for every service call.

```yaml
Type: System.String[]
Parameter Sets: Get, List
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagMember

## NOTES

## RELATED LINKS

