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
