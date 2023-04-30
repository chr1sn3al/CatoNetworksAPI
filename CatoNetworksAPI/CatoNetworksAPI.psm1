
<#
.SYNOPSIS  
    A Powershell module for using the CatoNetwoks API 
.DESCRIPTION  
    This module uses the PHPIPAM REST API
.NOTES  
    File Name    : CatoNetworsAPI.psm1
    Author       : chr1sn3al
#>

# file path in linux is case sensive,make sure 
$FunctionFolder = join-path -path $PSScriptRoot -ChildPath "Functions"
if (test-path $FunctionFolder) {
    Get-ChildItem $FunctionFolder -Filter *.ps1 -Recurse -Exclude "*.Tests.ps1", "*.tests.ps1" | Select-Object -Expand FullName | ForEach-Object {
        $ScriptPath = $_
        try {
            . $ScriptPath
        }
        catch {
            Write-Error -Message "Failed to import function in $ScriptPath"
        }   
    }
}else {
    Write-Error "check path $FunctionFolder exist and whether there is a typo"
}

# make convertto-json depth to max 100 defaults

$Script:PSDefaultParameterValues['convertto-json:Depth'] = 100
#endregion