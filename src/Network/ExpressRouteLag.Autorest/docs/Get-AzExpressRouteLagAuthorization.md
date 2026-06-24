---
external help file:
Module Name: Az.Network
online version: https://learn.microsoft.com/powershell/module/az.network/get-azexpressroutelagauthorization
schema: 2.0.0
---

# Get-AzExpressRouteLagAuthorization

## SYNOPSIS
Gets the specified authorization from the specified express route lag.

## SYNTAX

### List (Default)
```
Get-AzExpressRouteLagAuthorization -ExpressRouteLagName <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzExpressRouteLagAuthorization -AuthorizationName <String> -ExpressRouteLagName <String>
 -ResourceGroupName <String> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzExpressRouteLagAuthorization -InputObject <IExpressRouteLagIdentity> [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

### GetViaIdentityExpressRouteLag
```
Get-AzExpressRouteLagAuthorization -AuthorizationName <String>
 -ExpressRouteLagInputObject <IExpressRouteLagIdentity> [-DefaultProfile <PSObject>] [<CommonParameters>]
```

## DESCRIPTION
Gets the specified authorization from the specified express route lag.

## EXAMPLES

### Example 1: List all authorizations for an ExpressRouteLag
```powershell
Get-AzExpressRouteLagAuthorization -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name      AuthorizationUseStatus ProvisioningState
----      ---------------------- -----------------
myAuth1   Available              Succeeded
myAuth2   InUse                  Succeeded
```

Lists all authorizations for the specified ExpressRouteLag.

### Example 2: Get a specific authorization
```powershell
Get-AzExpressRouteLagAuthorization -Name 'myAuth1' -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name      AuthorizationUseStatus ProvisioningState
----      ---------------------- -----------------
myAuth1   Available              Succeeded
```

Gets a specific authorization for the ExpressRouteLag.

## PARAMETERS

### -AuthorizationName
The name of the authorization.

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
The name of the express route lag.

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

### Microsoft.Azure.PowerShell.Cmdlets.ExpressRouteLag.Models.IExpressRouteLagAuthorization

## NOTES

## RELATED LINKS

