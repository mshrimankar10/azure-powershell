### Example 1: Get authorization keys for an ExpressRouteLag authorization
```powershell
Get-AzExpressRouteLagAuthorizationKey -AuthorizationName 'myAuth1' -ExpressRouteLagName 'myLag1' -ResourceGroupName 'myResourceGroup'
```

```output
AuthorizationKey
----------------
xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

Retrieves the authorization keys for the specified ExpressRouteLag authorization.
