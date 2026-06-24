if(($null -eq $TestName) -or ($TestName -contains 'Get-AzExpressRouteLagAuthorizationKey'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzExpressRouteLagAuthorizationKey.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzExpressRouteLagAuthorizationKey' {
    It 'List' {
        $keys = Get-AzExpressRouteLagAuthorizationKey -AuthorizationName $env.authorizationName -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $keys | Should -Not -BeNullOrEmpty
    }
}
