$path="$PSScriptRoot\Functions\ProductivityTools.PSDbUp.NewDbUpMigration.ps1"
. $path

$path="$PSScriptRoot\Functions\ProductivityTools.PSDbUp.InvokeDbUpMigration.ps1"
. $path

Export-ModuleMember New-DbUpMigration
Export-ModuleMember Invoke-DbUpMigration