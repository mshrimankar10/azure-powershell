### Example 1: Create a new ExpressRouteLag
```powershell
New-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup' -Location 'eastus' -PeeringLocation 'Silicon Valley' -BandwidthInGbps 100 -Encapsulation 'Dot1Q' -BillingType 'MeteredData'
```

```output
Name        Location  BandwidthInGbps Encapsulation BillingType  ProvisioningState
----        --------  --------------- ------------- -----------  -----------------
myLag1      eastus    100             Dot1Q         MeteredData  Succeeded
```

Creates a new ExpressRouteLag resource with Dot1Q encapsulation and metered billing at the Silicon Valley peering location.

### Example 2: Create a new ExpressRouteLag with tags
```powershell
New-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup' -Location 'eastus' -PeeringLocation 'Silicon Valley' -BandwidthInGbps 100 -Encapsulation 'QinQ' -BillingType 'UnlimitedData' -Tag @{ 'env' = 'production' }
```

```output
Name        Location  BandwidthInGbps Encapsulation BillingType    ProvisioningState
----        --------  --------------- ------------- -----------    -----------------
myLag1      eastus    100             QinQ          UnlimitedData  Succeeded
```

Creates a new ExpressRouteLag resource with QinQ encapsulation, unlimited data billing, and a tag.
