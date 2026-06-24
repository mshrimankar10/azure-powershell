if(($null -eq $TestName) -or ($TestName -contains 'Remove-AzExpressRouteLagAuthorization'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-AzExpressRouteLagAuthorization.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-AzExpressRouteLagAuthorization' {
    It 'Delete' {
        Remove-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        { Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName } | Should -Throw
    }

    It 'DeleteViaIdentityExpressRouteLag' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        Remove-AzExpressRouteLagAuthorization -ExpressRouteLagInputObject $lag -AuthorizationName $env.authorizationName2
        { Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName2 -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName } | Should -Throw
    }

    It 'DeleteViaIdentity' {
        $auth = Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName3 -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        Remove-AzExpressRouteLagAuthorization -InputObject $auth
        { Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName3 -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName } | Should -Throw
    }
}
