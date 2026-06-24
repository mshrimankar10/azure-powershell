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
