### Example 1: Remove an ExpressRouteLag
```powershell
Remove-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup'
```

Removes the specified ExpressRouteLag resource.

### Example 2: Remove an ExpressRouteLag by piping
```powershell
Get-AzExpressRouteLag -Name 'myLag1' -ResourceGroupName 'myResourceGroup' | Remove-AzExpressRouteLag
```

Gets and removes the specified ExpressRouteLag resource using pipeline input.
