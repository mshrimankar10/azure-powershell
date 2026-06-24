if(($null -eq $TestName) -or ($TestName -contains 'Get-AzExpressRouteLagLink'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzExpressRouteLagLink.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzExpressRouteLagLink' {
    It 'List' {
        $links = Get-AzExpressRouteLagLink -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $links | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $link = Get-AzExpressRouteLagLink -LinkName $env.link1Name  -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $link | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $link = Get-AzExpressRouteLagLink -LinkName $env.link2Name  -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $link | Should -Not -BeNullOrEmpty
    }

    It 'GetViaIdentityExpressRouteLag' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $link = Get-AzExpressRouteLagLink -ExpressRouteLagInputObject $lag -LinkName $env.link1Name
        $link | Should -Not -BeNullOrEmpty
    }

    It 'GetViaIdentity' {
        $link = Get-AzExpressRouteLagLink -LinkName $env.link1Name -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $linkResult = Get-AzExpressRouteLagLink -InputObject $link
        $linkResult | Should -Not -BeNullOrEmpty
    }
}
