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
