$global:BaseDirectory =  Get-Location
$global:ConfigFile = "$BaseDirectory\deployment\config.json"

try {
	$global:Config = Get-Content "$ConfigFile" -Raw -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue | ConvertFrom-Json -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue
} catch {
	Write-Error -Message "The Base configuration file is missing!"
}

if (!($Config)) {
	Write-Error -Message "The Base configuration file is missing!"
}

pac auth create -u $Config.deployment.'dataverse-environment-url'