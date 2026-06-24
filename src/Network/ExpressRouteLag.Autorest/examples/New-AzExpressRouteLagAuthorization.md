### Example 1: Create a new authorization for an ExpressRouteLag
```powershell
New-AzExpressRouteLagAuthorization -Name 'myAuth1' -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
Name      AuthorizationUseStatus ProvisioningState
----      ---------------------- -----------------
myAuth1   Available              Succeeded
```

Creates a new authorization for the specified ExpressRouteLag resource.
