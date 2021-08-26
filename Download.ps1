# Base Directory
# This must match with the UpdateService/LocalePath entry ($Config.UpdateService.LocalePath)
# in the JSON configuration file if you want to use the automated update/Distribution features!
$global:BaseDirectory =  Get-Location
$global:ConfigFile = "$BaseDirectory\deployment\config.json"

# Load and parse the JSON configuration file
try {
	$global:Config = Get-Content "$ConfigFile" -Raw -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue | ConvertFrom-Json -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue
} catch {
	Write-Error -Message "The Base configuration file is missing!"
}

# Check the configuration
if (!($Config)) {
	Write-Error -Message "The Base configuration file is missing!"
}

pac paportal download --overwrite --path $Config.deployment.'portal-directory' --webSiteId $Config.deployment.'website-id'