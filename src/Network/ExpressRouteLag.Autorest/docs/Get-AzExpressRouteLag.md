---
external help file:
Module Name: Az.Network
online version: https://learn.microsoft.com/powershell/module/az.network/get-azexpressroutelag
schema: 2.0.0
---

# Get-AzExpressRouteLag

## SYNOPSIS
Retrieves the requested ExpressRouteLag resource.

## SYNTAX

### List1 (Default)
```
Get-AzExpressRouteLag [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzExpressRouteLag -Name <String> -ResourceGroupName <String> [-SubscriptionId <String[]>]
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzExpressRouteLag -InputObject <IExpressRouteLagIdentity> [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

### List
```
Get-AzExpressRouteLag -ResourceGroupName <String> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieves the requested ExpressRouteLag resource.

## EXAMPLES

### Example 1: List all ExpressRouteLag resources in a subscription
```powershell
Get-AzExpressRouteLag
```

```output
Name        Location  BandwidthInGbps Encapsulation ProvisioningState
----        --------  --------------- ------------- -----------------
myLag1      eastus    100             Dot1Q         Succeeded
myLag2      westus    100             QinQ          Succeeded
```

Lists all ExpressRouteLag resources in the current subscription.

### Example 2: Get a specific ExpressRouteLag by name
```powershell
Get-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name        Location  BandwidthInGbps Encapsulation ProvisioningState
----        --------  --------------- ------------- -----------------
myLag1      eastus    100             Dot1Q         Succeeded
```

Gets a specific ExpressRouteLag resource by name and resource group.

### Example 3: List ExpressRouteLag resources in a resource group
```powershell
Get-AzExpressRouteLag -ResourceGroupName 'myResourceGroup'
```

```output
Name        Location  BandwidthInGbps Encapsulation ProvisioningState
----        --------  --------------- ------------- -----------------
myLag1      eastus    100             Dot1Q         Succeeded
```

Lists all ExpressRouteLag resources in the specified resource group.

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

### -Name
The name of ExpressRouteLag.

```yaml
Type: System.String
Parameter Sets: Get
Aliases: ExpressRouteLagName

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
Parameter Sets: Get, List, List1
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

### Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLag

## NOTES

## RELATED LINKS

