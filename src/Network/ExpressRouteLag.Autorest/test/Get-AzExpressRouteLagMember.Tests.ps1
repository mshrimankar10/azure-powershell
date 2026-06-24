if(($null -eq $TestName) -or ($TestName -contains 'Get-AzExpressRouteLagMember'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzExpressRouteLagMember.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzExpressRouteLagMember' {
    It 'List' {
        $members = Get-AzExpressRouteLagMember -ExpressRouteLagName $env.expressRouteLagName -LinkName $env.link1Name -ResourceGroupName $env.resourceGroupName
        $members | Should -Not -BeNullOrEmpty
    }

    It 'List' {
        $members = Get-AzExpressRouteLagMember -ExpressRouteLagName $env.expressRouteLagName -LinkName $env.link2Name -ResourceGroupName $env.resourceGroupName
        $members | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $member = Get-AzExpressRouteLagMember -MemberName $env.member1Name -ExpressRouteLagName $env.expressRouteLagName -LinkName $env.link1Name -ResourceGroupName $env.resourceGroupName
        $member | Should -Not -BeNullOrEmpty
    }

    It 'Get' {
        $member = Get-AzExpressRouteLagMember -MemberName $env.member1Name -ExpressRouteLagName $env.expressRouteLagName -LinkName $env.link2Name -ResourceGroupName $env.resourceGroupName
        $member | Should -Not -BeNullOrEmpty
    }


    It 'GetViaIdentityExpressRouteLag' {
        $lag = Get-AzExpressRouteLag -Name $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $member = Get-AzExpressRouteLagMember -ExpressRouteLagInputObject $lag -LinkName $env.link1Name -MemberName $env.member1Name
        $member | Should -Not -BeNullOrEmpty
    }

    It 'GetViaIdentityLink' {
        $link = Get-AzExpressRouteLagLink -LinkName $env.link1Name -ExpressRouteLagName $env.expressRouteLagName -ResourceGroupName $env.resourceGroupName
        $member = Get-AzExpressRouteLagMember -LinkInputObject $link -MemberName $env.member1Name
        $member | Should -Not -BeNullOrEmpty
    }

    It 'GetViaIdentity' {
        $member = Get-AzExpressRouteLagMember -MemberName $env.member1Name -ExpressRouteLagName $env.expressRouteLagName -LinkName $env.link1Name -ResourceGroupName $env.resourceGroupName
        $memberResult = Get-AzExpressRouteLagMember -InputObject $member
        $memberResult | Should -Not -BeNullOrEmpty
    }
}
