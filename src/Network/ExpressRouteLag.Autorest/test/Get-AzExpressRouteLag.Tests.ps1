if(($null -eq $TestName) -or ($TestName -contains 'Get-AzExpressRouteLag'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzExpressRouteLag.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzExpressRouteLag' {
    It 'List1' -skip {
        $lags = Get-AzExpressRouteLag
        $lags | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $lag.Name | Should -Be $env.expressRouteLagName
    }

    It 'List' {
        $lags = Get-AzExpressRouteLag -ResourceGroupName $env.resourceGroupName
        $lags | Should -Not -BeNullOrEmpty
    }

    It 'GetViaIdentity' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $lagResult = Get-AzExpressRouteLag -InputObject $lag
        $lagResult.Name | Should -Be $env.expressRouteLagName
    }
}
