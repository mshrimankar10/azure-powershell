function RandomString([bool]$allChars, [int32]$len) {
    if ($allChars) {
        return -join ((33..126) | Get-Random -Count $len | % {[char]$_})
    } else {
        return -join ((48..57) + (97..122) | Get-Random -Count $len | % {[char]$_})
    }
}
function Start-TestSleep {
    [CmdletBinding(DefaultParameterSetName = 'SleepBySeconds')]
    param(
        [parameter(Mandatory = $true, Position = 0, ParameterSetName = 'SleepBySeconds')]
        [ValidateRange(0.0, 2147483.0)]
        [double] $Seconds,

        [parameter(Mandatory = $true, ParameterSetName = 'SleepByMilliseconds')]
        [ValidateRange('NonNegative')]
        [Alias('ms')]
        [int] $Milliseconds
    )

    if ($TestMode -ne 'playback') {
        switch ($PSCmdlet.ParameterSetName) {
            'SleepBySeconds' {
                Start-Sleep -Seconds $Seconds
            }
            'SleepByMilliseconds' {
                Start-Sleep -Milliseconds $Milliseconds
            }
        }
    }
}

$env = @{}
if ($UsePreviousConfigForRecord) {
    $previousEnv = Get-Content (Join-Path $PSScriptRoot 'env.json') | ConvertFrom-Json
    $previousEnv.psobject.properties | Foreach-Object { $env[$_.Name] = $_.Value }
}
# Add script method called AddWithCache to $env, when useCache is set true, it will try to get the value from the $env first.
# example: $val = $env.AddWithCache('key', $val, $true)
$env | Add-Member -Type ScriptMethod -Value { param( [string]$key, [object]$val, [bool]$useCache) if ($this.Contains($key) -and $useCache) { return $this[$key] } else { $this[$key] = $val; return $val } } -Name 'AddWithCache'
function setupEnv() {

    # Set your Azure context to the desired subscription
    Set-AzContext -SubscriptionId '7d747eed-b44c-4257-8d43-df9ebd94546b'

    # Preload subscriptionId and tenant from context, which will be used in test
    # as default. You could change them if needed.
    $env.SubscriptionId = (Get-AzContext).Subscription.Id
    $env.Tenant = (Get-AzContext).Tenant.Id

    # Create the test resource group
    $resourceGroupName = 'expressroutelag-rg-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('resourceGroupName', $resourceGroupName, $UsePreviousConfigForRecord)
    New-AzResourceGroup -Name $env.resourceGroupName -Location 'eastus2euap'

    # ExpressRouteLag names for test
    $lagName = 'lag-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('expressRouteLagName', $lagName, $UsePreviousConfigForRecord)

    $link1Name = 'link1'
    $env.AddWithCache('link1Name', $link1Name, $UsePreviousConfigForRecord)

    $link2Name = 'link2'
    $env.AddWithCache('link2Name', $link2Name, $UsePreviousConfigForRecord)

    $member1Name = 'member1'
    $env.AddWithCache('member1Name', $member1Name, $UsePreviousConfigForRecord)

    $authName = 'auth-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('authorizationName', $authName, $UsePreviousConfigForRecord)

    $lagName1 = 'lag-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('expressRouteLagName1', $lagName1, $UsePreviousConfigForRecord)

    $authName2 = 'auth2-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('authorizationName2', $authName2, $UsePreviousConfigForRecord)

    $authName3 = 'auth3-' + (RandomString -allChars $false -len 6)
    $env.AddWithCache('authorizationName3', $authName3, $UsePreviousConfigForRecord)

    $env.AddWithCache('location', 'eastus2euap', $UsePreviousConfigForRecord)

    $env.AddWithCache('peeringLocation', 'OnPrem', $UsePreviousConfigForRecord)
    $env.AddWithCache('encapType', 'QinQ', $UsePreviousConfigForRecord)
    $env.AddWithCache('bandwidthInGbps', 10, $UsePreviousConfigForRecord)
    $env.AddWithCache('billingType', 'MeteredData', $UsePreviousConfigForRecord)
    $env.AddWithCache('noOfPorts', 1, $UsePreviousConfigForRecord)
    $env.AddWithCache('minLinks', 1, $UsePreviousConfigForRecord)
    $env.AddWithCache('lacpTimer', 'FAST', $UsePreviousConfigForRecord)

    $envFile = 'env.json'
    if ($TestMode -eq 'live') {
        $envFile = 'localEnv.json'
    }
    set-content -Path (Join-Path $PSScriptRoot $envFile) -Value (ConvertTo-Json $env)
}
function cleanupEnv() {
    # Clean resources you create for testing
    # Uncomment below when done with iterative testing
    # Remove-AzResourceGroup -Name $env.resourceGroupName -ErrorAction SilentlyContinue
}
