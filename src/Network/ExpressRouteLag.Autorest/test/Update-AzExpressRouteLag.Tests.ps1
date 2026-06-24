if(($null -eq $TestName) -or ($TestName -contains 'Update-AzExpressRouteLag'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-AzExpressRouteLag.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-AzExpressRouteLag' {
    It 'UpdateExpanded' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $lag | Should -Not -BeNullOrEmpty
        $updatedLag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -Tag @{ 'env' = 'test' }
        $updatedLag.Name | Should -Be $env.expressRouteLagName
        $updatedLag.Tag['env'] | Should -Be 'powershell'
    }

    It 'UpdateNumberOfPorts' -skip {
        $lag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -NumberOfPort 2
        $lag.NumberOfPort | Should -Be 2
    }

    It 'UpdateMinimumActivePortsRequired' -skip {
        $lag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -MinimumActivePortsRequired 1
        $lag.MinimumActivePortsRequired | Should -Be 1
    }

    It 'UpdateLacpTimer' -skip {
        $lag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -LacpTimer 'Slow'
        $lag.LacpTimer | Should -Be 'Slow'
    }

    It 'UpdateLinkAdminState' -skip {
        $lag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -Link @(@{ AdminState = 'Disabled' })
        $lag.Link[0].AdminState | Should -Be 'Disabled'
    }

    It 'UpdateMemberAdminState' -skip {
        $lag = Update-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName -Link @(@{ AdminState = 'Enabled'; Member = @(@{ AdminState = 'Disabled' }) })
        $lag.Link[0].Member[0].AdminState | Should -Be 'Disabled'
    }

    It 'UpdateViaIdentityExpanded' -skip {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $updatedLag = Update-AzExpressRouteLag -InputObject $lag -Tag @{ 'env' = 'prod' }
        $updatedLag.Tag['env'] | Should -Be 'prod'
    }
}
