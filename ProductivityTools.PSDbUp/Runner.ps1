clear
Import-Module "$PSScriptRoot\ProductivityTools.PSDbUp.psm1" -Force

#Invoke-DbUp

Invoke-DbUp '.\SQL2017' 'PawelDT' 'schedule' -Verbose