if(($null -eq $TestName) -or ($TestName -contains 'New-AzExpressRouteLagAuthorization'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-AzExpressRouteLagAuthorization.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-AzExpressRouteLagAuthorization' {
    It 'CreateExpanded' {
        $auth = New-AzExpressRouteLagAuthorization -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $auth.Name | Should -Be $env.authorizationName
        $auth.ProvisioningState | Should -Not -BeNullOrEmpty
    }

    It 'CreateViaJsonString' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'CreateViaJsonFilePath' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'CreateViaIdentityExpressRouteLagExpanded' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $auth = New-AzExpressRouteLagAuthorization -ExpressRouteLagInputObject $lag -AuthorizationName $env.authorizationName2
        $auth.Name | Should -Be $env.authorizationName2
        $auth.ProvisioningState | Should -Not -BeNullOrEmpty
    }
}
