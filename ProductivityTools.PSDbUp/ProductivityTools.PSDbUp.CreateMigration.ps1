function GetLastScriptNumer
{
	[cmdletbinding()]
	param (
	[Parameter(Mandatory=$false)]
	[string]$Path)

	$sqls=@(Get-ChildItem -Path $Path -Filter '*.sql')
	$maximumNumber=99999
	foreach($sql in $sqls)
	{
		$name=$sql.BaseName
		$numberString=$name.SubString(0,5)
		$number=[convert]::ToInt32($numberString, 10)
		
		if($number -lt $maximumNumber)
		{
			$maximumNumber=$number
		}
	}

	return $number
}

function GenerateScriptName
{
	[cmdletbinding()]
	param (
	[Parameter(Mandatory=$true)]
	[int]$LastNumber,
	
	[Parameter(Mandatory=$true)]
	[string]$Name
	)
	
	$nextNumer=$LastNumber+1
	$resultName=$nextNumer.ToString().PadLeft(5,'0')+'.'+$Name+'.sql'
	return $resultName
}


function Create-Migration{
	[cmdletbinding()]
	param (
	[Parameter(Mandatory=$true)]
	[string]$Name, 
	
	[Parameter(Mandatory=$true)]
	[string]$Content, 

	[Parameter(Mandatory=$false)]
	[string]$Path)

	Write-Verbose "Create-Migration started"
	
	if ($Path -eq '')
	{
		$Path=Get-Location
	}

	$lastScriptNumber=GetLastScriptNumer $Path
	$nextScriptName=GenerateScriptName $lastScriptNumber $Name
	
	
	New-Item -Path $Path -Name $nextScriptName -ItemType File -Value $Content
}