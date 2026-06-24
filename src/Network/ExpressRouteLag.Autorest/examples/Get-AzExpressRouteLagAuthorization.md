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
