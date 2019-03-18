CD d:\Tech\Pawel\Schedule\
CD d:\Tech\Pawel\Sallaries\
CD D:\Tech\Pawel\PawelDT\MyExpences
clear
Import-Module d:\GitHub\ProductivityTools.PSSQLCommands\ProductivityTools.PSSQLCommands\ProductivityTools.PSSQLCommands.psd1
Import-Module "$PSScriptRoot\ProductivityTools.PSDbUp.psm1" -Force

. d:\GitHub\ProductivityTools.PSDbUp\ProductivityTools.PSDbUp\ProductivityTools.PSDbUp.CreateMigration.ps1
Create-Migration 'pawel' 'fdsa'

#Invoke-DbUp

#Invoke-DbUp '.\SQL2017' 'PawelDT' 'schedule' -Verbose

#Invoke-DbUp '.\SQL2017' 'PawelDT' 'salary' -Verbose

Invoke-DbUp '.\SQL2017' 'xxx1' 'me' -Verbose