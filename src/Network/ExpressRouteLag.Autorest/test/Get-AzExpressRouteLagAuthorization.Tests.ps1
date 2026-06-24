if(($null -eq $TestName) -or ($TestName -contains 'Get-AzExpressRouteLagAuthorization'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzExpressRouteLagAuthorization.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzExpressRouteLagAuthorization' {
    It 'List' {
        $auths = Get-AzExpressRouteLagAuthorization -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $auths | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $auth = Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $auth.Name | Should -Be $env.authorizationName
    }

    It 'GetViaIdentityExpressRouteLag' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $auth = Get-AzExpressRouteLagAuthorization -ExpressRouteLagInputObject $lag -AuthorizationName $env.authorizationName
        $auth.Name | Should -Be $env.authorizationName
    }

    It 'GetViaIdentity' {
        $auth = Get-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $authResult = Get-AzExpressRouteLagAuthorization -InputObject $auth
        $authResult.Name | Should -Be $env.authorizationName
    }
}
