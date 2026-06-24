### Example 1: Update tags on an ExpressRouteLag
```powershell
Update-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup' -Tag @{ 'env' = 'test'; 'team' = 'networking' }
```

```output
Name        Location  BandwidthInGbps Encapsulation ProvisioningState
----        --------  --------------- ------------- -----------------
myLag1      eastus    100             Dot1Q         Succeeded
```

Updates the tags on an existing ExpressRouteLag resource.
