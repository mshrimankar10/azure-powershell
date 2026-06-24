---
external help file:
Module Name: Az.Network
online version: https://learn.microsoft.com/powershell/module/az.network/get-azexpressroutelaglink
schema: 2.0.0
---

# Get-AzExpressRouteLagLink

## SYNOPSIS
Retrieves the specified ExpressRouteLagLink resource.

## SYNTAX

### List (Default)
```
Get-AzExpressRouteLagLink -ExpressRouteLagName <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzExpressRouteLagLink -ExpressRouteLagName <String> -LinkName <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzExpressRouteLagLink -InputObject <IExpressRouteLagIdentity> [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

### GetViaIdentityExpressRouteLag
```
Get-AzExpressRouteLagLink -ExpressRouteLagInputObject <IExpressRouteLagIdentity> -LinkName <String>
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves the specified ExpressRouteLagLink resource.

## EXAMPLES

### Example 1: List all links for an ExpressRouteLag
```powershell
Get-AzExpressRouteLagLink -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name    RouterName   InterfaceName AdminState ProvisioningState
----    ----------   ------------- ---------- -----------------
link1   router1      eth0          Enabled    Succeeded
link2   router2      eth1          Enabled    Succeeded
```

Lists all links associated with the specified ExpressRouteLag.

### Example 2: Get a specific link
```powershell
Get-AzExpressRouteLagLink -Name 'link1' -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name    RouterName   InterfaceName AdminState ProvisioningState
----    ----------   ------------- ---------- -----------------
link1   router1      eth0          Enabled    Succeeded
```

Gets a specific link for the ExpressRouteLag.

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

### -LinkName
The name of the ExpressRouteLagLink resource.

```yaml
Type: System.String
Parameter Sets: Get, GetViaIdentityExpressRouteLag
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

### Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagLink

## NOTES

## RELATED LINKS

