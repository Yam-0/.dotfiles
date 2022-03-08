$elevated = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

cls
$Date = Get-Date -Format 'dddd HH:mm'
Write-Host ($Date)

function prompt
{
	Write-Host ("")

	$CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
	$bracketcolor = ( $(if($elevated) { 'red' } else { 'blue' }) )

	Write-Host ($(if ($elevated) { 'ELEVATED' } else { '' })) -foregroundcolor RED -nonewline
	Write-Host ($(if ($elevated) { '' } else { 'PS' })) -foregroundcolor BLUE -nonewline
	Write-Host (" ") -nonewline -foregroundcolor White

    Write-Host ("[ ") -nonewline -foregroundcolor $bracketcolor
	Write-Host ($CmdPromptCurrentFolder)  -foregroundcolor White -nonewline
	Write-Host (" ]") -nonewline -foregroundcolor $bracketcolor
	Write-Host (" :") -nonewline -foregroundcolor White
    return " "
}

function elevate
{
	if ($elevated)
	{
		Write-Host ("Already elevated dumbass")
	}
	else
	{
		Start-Process powershell.exe -Verb RunAs
	}
}

