#Requires -Modules Microsoft.PowerShell.PlatyPS

function New-AzMarkdownHelp {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$HelpFolderPath
    )

    $HelpFolder = Get-Item $HelpFolderPath
    $ModuleFolder = $HelpFolder.Parent
    $ModuleFolderPath = $ModuleFolder.FullName
    if ($ModuleFolder.Name -eq "Azure.AnalysisServices") {
        return
    }

    $NewHelpFolderPath = "$ModuleFolderPath\temp_help"
    $psd1 = Get-ChildItem $ModuleFolderPath | where { $_.Name -eq "$($ModuleFolder.Name).psd1" }
    Import-Module $psd1.FullName -Scope Global
    New-Item -Path $NewHelpFolderPath -ItemType Directory -Force | Out-Null
    Copy-Item -Path "$HelpFolderPath\*" -Destination $NewHelpFolderPath
    Update-MarkdownCommandHelp -Path "$NewHelpFolderPath\*-*.md" | Out-Null
    $updatedHelp = Import-MarkdownCommandHelp -Path "$NewHelpFolderPath\*-*.md"
    $moduleFilePath = Get-ChildItem -Path $NewHelpFolderPath -Filter "Az.*.md" | Where-Object { $_.Name -notlike "*-*" } | Select-Object -First 1
    if ($moduleFilePath) {
        Update-MarkdownModuleFile -Path $moduleFilePath.FullName -CommandHelp $updatedHelp | Out-Null
    }
    $errors = Compare-AzMarkdownHelp $HelpFolderPath $NewHelpFolderPath
    if ($errors.Length -gt 0) {
        $errorMessage = @()
        $errorMessage += "ERROR: The following files have not been updated with the latest module changes.`n"
        $errorMessage += "Please make sure to run Update-MarkdownHelpModule to update the markdown files.`n"
        $errors | foreach { $errorMessage += "- $_`n" }
        throw $errorMessage
    }

    Remove-Item $NewHelpFolderPath -Recurse
}

function Compare-AzMarkdownHelp {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$OldHelpFolderPath,
        [Parameter(Mandatory = $true, Position = 1)]
        [String]$NewHelpFolderPath
    )

    $comparatorInstance = New-Object MarkdownComparator.Comparator
    $OldHelpFolder = Get-Item $OldHelpFolderPath
    $errors = @()
    foreach ($oldFile in Get-ChildItem $OldHelpFolder) {
        $newFilePath = "$NewHelpFolderPath\$($oldFile.Name)"
        if ($oldFile.Name -notlike "*-*") {
            continue
        }

        try {
            $result = $comparatorInstance.Compare($oldFile.FullName, $newFilePath)
            if ($result -ne 0) {
                $errors += $oldFile.Name
            }
        }
        catch {
            $_.Exception.InnerException
        }
    }

    return $errors
}

function Test-AzMarkdownHelp {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$HelpFolderPath,
        [Parameter(Mandatory = $true, Position = 1)]
        [String]$SuppressedExceptionsPath,
        [Parameter(Mandatory = $true, Position = 2)]
        [String]$NewExceptionsPath
    )

    PROCESS {
        $HelpFolder = Get-Item $HelpFolderPath
        $Exceptions = Import-Csv "$SuppressedExceptionsPath\ValidateHelpIssues.csv"
        [String[]]$errors = @()
        $MarkdownFiles = Get-ChildItem -Path $HelpFolder -Filter "*.md"
        $HelpFolderPath = $HelpFolder.FullName.Replace("\", "/")
        if ($HelpFolderPath -match "/artifacts/") {
            $ModuleName = $HelpFolderPath.split('/artifacts/')[1].split('/')[1]
        }
        else {
            $ModuleName = "Az." + $HelpFolderPath.split('src/')[1].split('/')[0]
        }
        foreach ($file in $MarkdownFiles) {
            # Ignore the module page
            if ($file.Name -notlike "*-*") {
                continue
            }

            $CmdletName = $file.BaseName

            $fileErrors = @()
            $content = Get-Content $file.FullName

            # Detect schema version: new schema uses "PlatyPS schema version:" in YAML front matter
            $isNewSchema = ($content | Where-Object { $_ -match "PlatyPS schema version:" }) -ne $null

            for ($idx = 0; $idx -lt $content.Length; $idx++) {
                switch -Regex ($content[$idx]) {
                    "## SYNOPSIS" {
                        $foundSynopsis = $False
                        $idx++

                        # Check each line between SYNOPSIS and SYNTAX for any text
                        for (; ; ) {
                            $foundSynopsis = $foundSynopsis -or (!([string]::IsNullOrWhiteSpace("$($content[$idx])")))
                            if ($content[$idx + 1] -notcontains "## SYNTAX") {
                                $idx++
                                if ($idx -ge $content.Length) {
                                    $errors += "$($file.Name),Missing SYNTAX section"
                                    break
                                }
                            }
                            elseif ($content[$idx] -match "\{\{\s*Fill in the Synopsis\s*\}\}") {
                                $foundSynopsis = $false
                                break
                            }
                            else {
                                break
                            }
                        }

                        if (!($foundSynopsis)) {
                            $fileErrors += "Missing SYNOPSIS content"
                        }
                    }
                    "## DESCRIPTION" {
                        $foundDescription = $False
                        $idx++

                        # Check each line between DESCRIPTION and EXAMPLES for any text
                        for (; ; ) {
                            $foundDescription = $foundDescription -or (!([string]::IsNullOrWhiteSpace("$($content[$idx])")))
                            if ($content[$idx + 1] -notcontains "## EXAMPLES") {
                                $idx++
                                if ($idx -ge $content.Length) {
                                    $errors += "$($file.Name),Missing EXAMPLES section"
                                    break
                                }
                            }
                            elseif ($content[$idx] -match "\{\{\s*Fill in the Description\s*\}\}") {
                                $foundDescription = $false
                                break
                            }
                            else {
                                break
                            }
                        }

                        if (!($foundDescription)) {
                            $fileErrors += "Missing DESCRIPTION content"
                        }
                    }
                    "@{Text=}" {
                        # Old schema: empty parameter description
                        $parameter = $content[$idx - 1].Substring(5)
                        $fileErrors += "Missing description for parameter '$parameter'"
                    }
                    "\{\{\s*Fill \w+ Description\s*\}\}" {
                        # New schema: empty parameter description placeholder like {{ Fill ParamName Description }}
                        if ($content[$idx - 1] -match "^### -(.+)") {
                            $parameter = $Matches[1]
                        }
                        else {
                            $parameter = "(unknown)"
                        }
                        $fileErrors += "Missing description for parameter '$parameter'"
                    }
                    ".``````yaml" {
                        $parameter = $content[$idx - 1].Substring(5)
                        $fileErrors += "Malformed YAML in description for parameter '$parameter'"
                    }
                    "\{\{\s*Add example description here\s*\}\}" {
                        # New schema: example placeholder not filled in
                        $fileErrors += "Example description contains placeholder text"
                    }
                    "\{\{\s*Fill in the Notes\s*\}\}" {
                        # New schema: notes placeholder not filled in
                        $fileErrors += "NOTES section contains placeholder text"
                    }
                    "\{\{\s*Fill in the related links here\s*\}\}" {
                        # New schema: related links placeholder not filled in
                        $fileErrors += "RELATED LINKS section contains placeholder text"
                    }
                    "\{\{\s*Insert list of aliases\s*\}\}" {
                        # New schema: aliases placeholder not filled in
                        $fileErrors += "Aliases section contains placeholder text"
                    }
                    "online version:" {
                        # Old schema (schema: 2.0.0): online version in YAML front matter
                        if (-not $isNewSchema) {
                            $onlineString = "https://learn.microsoft.com/powershell/module/$($ModuleName.ToLower())/$($CmdletName.ToLower())"
                            $split = $content[$idx] -split "online version:"
                            if ([string]::IsNullOrWhiteSpace($split[1]) -or $split[1] -notlike "*$onlineString*") {
                                $fileErrors += "Invalid 'online version' URL, expected: $onlineString"
                            }
                        }
                    }
                    "^HelpUri:" {
                        # New schema (PlatyPS schema version: 2024-05-01): HelpUri in YAML front matter
                        if ($isNewSchema) {
                            $onlineString = "https://learn.microsoft.com/powershell/module/$($ModuleName.ToLower())/$($CmdletName.ToLower())"
                            $split = $content[$idx] -split "HelpUri:"
                            $helpUri = $split[1].Trim().Trim("'").Trim('"')
                            if ([string]::IsNullOrWhiteSpace($helpUri) -or $helpUri -notlike "*$onlineString*") {
                                $fileErrors += "Invalid 'HelpUri' URL, expected: $onlineString"
                            }
                        }
                    }
                    default {

                    }
                }
            }

            # If the markdown file had any missing help, add them to the list to be printed later
            if ($fileErrors.Count -gt 0) {
                $fileExceptions = $Exceptions | where { $_.Target -eq "$($file.Name)" }
                $fileErrors | foreach {
                    $error = $_

                    if (($fileExceptions | where { $_.Description -eq "$error" }) -ne $null) {
                        # "Caught error - $file,$error"
                    }
                    else {
                        $errors += "$($file.Name),$error"
                    }
                }
            }
        }

        # If there were any errors recorded, print them out and throw
        if ($errors.Count -gt 0) {
            $errors | foreach { Add-Content "$NewExceptionsPath\ValidateHelpIssues.csv" $_ }
        }
    }
}

function New-AzMamlHelp {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$HelpFolderPath
    )

    $HelpFolder = Get-Item $HelpFolderPath

    # Generate the MAML help from the markdown files
    $cmdHelp = Import-MarkdownCommandHelp -Path "$HelpFolderPath\*-*.md"
    Export-MamlCommandHelp -CommandHelp $cmdHelp -OutputFolder $HelpFolder.Parent.FullName -Force
}


# ------------
# Start
# ------------

Import-Module -Name Microsoft.PowerShell.PlatyPS -Scope Global
