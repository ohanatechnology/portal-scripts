$global:BaseDirectory =  Get-Location
$global:ConfigFile = "$BaseDirectory\deployment\config.json"

# Load and parse the JSON configuration file
try {
	$global:Config = Get-Content "$ConfigFile" -Raw -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue | ConvertFrom-Json -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue
} catch {
	Write-Error -Message "The Base configuration file is missing!"
}

if (!($Config)) {
	Write-Error -Message "The Base configuration file is missing!"
}

pac paportal upload --path "$BaseDirectory"