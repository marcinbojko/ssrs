$ErrorActionPreference = 'Stop';

$packageName        = 'ssrs'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url64              = "https://download.microsoft.com/download/E/6/4/E6477A2A-9B58-40F7-8AD6-62BB8491EA78/SQLServerReportingServices.exe"
$checksum64         = "51e84ba4105a3162fe7bfaa5fc44ea5fc84c8bd63d98b98bb53994a4d51d8d60"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"
[regex]$editionparams = “(?i)^(Dev|Eval|Expr)$”


$pp=Get-PackageParameters
if (!$pp['Edition']) {$pp['Edition']='Dev'}
else {
    if ($pp['Edition'] -notmatch $editionparams)
        { Write-Output "Wrong parameter $($pp.Edition)"
         exit (1) }
}

Write-Output "Installing for SQL Server 2017 $($pp.Edition) Edition"
#Let's check your TEMP derectory
    $statusCode = Test-Path $logdir
    if ($statusCode) {
        $logfile = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
    }
    else {
        $logfile = "$env:WINDIR\TEMP\chocolatey\$($packageName).MsiInstall.log"

    }

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  silentArgs    = "/quiet /norestart /IAcceptLicenseTerms /Edition=$($pp.Edition)"
  validExitCodes= @(0, 3010,1641)
  url64bit      = $url64
  checksumType64= 'sha256'
  checksum64    = $checksum64
}

Install-ChocolateyPackage @packageArgs
