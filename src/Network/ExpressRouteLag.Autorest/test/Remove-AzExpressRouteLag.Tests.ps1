if(($null -eq $TestName) -or ($TestName -contains 'Remove-AzExpressRouteLag'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-AzExpressRouteLag.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-AzExpressRouteLag' {
    It 'Delete' {
        Remove-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        { Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName } | Should -Throw
    }

    It 'DeleteViaIdentity' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName1 -ResourceGroupName $env.resourceGroupName
        Remove-AzExpressRouteLag -InputObject $lag
        { Get-AzExpressRouteLag -Name $env.expressRouteLagName1 -ResourceGroupName $env.resourceGroupName } | Should -Throw
    }
}
