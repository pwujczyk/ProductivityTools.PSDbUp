function LibPath()
{
	$path="$PSScriptRoot\lib\"
	return $path
}

function DbUpDlls()
{
	$libPath=LibPath
	$path=$libPath+"dbup-sqlserver.dll"
	Write-Verbose "DbUp dlls are taken from following path: $path"
	return $path
}


function PerformDbUp()
{
	[cmdletbinding()]
	param ([string]$SqlInstance, [string]$DatabaseName, [string]$SchemaName, $scriptPath)

	New-SqlSchema -SqlInstance $SqlInstance -DatabaseName $DatabaseName -SchemaName $SchemaName
	
	$dbUpDlls=DbUpDlls
	Add-Type -Path $dbUpDlls
	
	$connectionstring="Server=$SqlInstance;database=$DatabaseName;Trusted_Connection=Yes;Connection Timeout=10;"
	Write-Verbose "Follwing connection string will be used: $connectionstring"
	
	$dbUp = [DbUp.DeployChanges]::To
	$dbUp = [SqlServerExtensions]::SqlDatabase($dbUp, $connectionstring)
	$dbUp = [StandardExtensions]::WithScriptsFromFileSystem($dbUp, $scriptPath)
	$dbUp = [SqlServerExtensions]::JournalToSqlTable($dbUp, "$SchemaName", 'DbUp')
	$dbUp = [StandardExtensions]::LogToConsole($dbUp)
	$upgradeResult = $dbUp.Build().PerformUpgrade()
	$upgradeResult |ConvertTo-Json
}



function Invoke-DbUp {
	[cmdletbinding()]
	param (
	[Parameter(Mandatory=$true)]
	[string]$SqlInstance, 
	
	[Parameter(Mandatory=$true)]
	[string]$DatabaseName, 
	
	[Parameter(Mandatory=$false)]
	[string]$SchemaName, 
	
	[Parameter(Mandatory=$false)]
	[string]$scriptPath)

	Write-Verbose "Invoke-DbUp started"
	
	if ($scriptPath -eq '')
	{
		$scriptPath=Get-Location
	}
	
	Write-Verbose "Scripts will be taken from $scriptPath"
	
	New-SqlSchema -DatabaseName $DatabaseName -SqlInstance $SqlInstance -SchemaName $SchemaName -Verbose:$VerbosePreference
	PerformDbUp $SqlInstance $DatabaseName $SchemaName $scriptPath 
	Write-Verbose "finished"
}