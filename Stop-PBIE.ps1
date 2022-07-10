<#
    .DESCRIPTION
        This script stops a Power BI Embedded resource using PowerShell 5.1 and an Azure Automation Account,
        before using it the modules Az.Accounts and Az.PowerBIEmbedded should be updated, as well as
        generate the 4 variables used below, and assign the appropiate permissions to the Automation Account
        System Generated Identity

    .NOTES
        AUTHOR: Antonio Gutiérrez 4nGut
        LASTEDIT: Jul 10, 2022
        CC0 1.0 Universal (CC0 1.0)
        Public Domain Dedication
#>

"Please enable appropriate RBAC permissions to the system identity of this automation account. Otherwise, the runbook may fail..."

$tid = Get-AutomationVariable -Name 'TenantID'
$sid = Get-AutomationVariable -Name 'SubscriptionID'
$pbie = Get-AutomationVariable -Name 'pbie'
$pbierg = Get-AutomationVariable -Name 'pbierg'

try
{
    "Logging in to Azure..."
    Connect-AzAccount -Tenant $tid -Subscription $sid -Identity
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}


try
{
	Resume-AzPowerBIEmbeddedCapacity -Name $pbie -ResourceGroupName $pbierg -PassThru
	Write-Output "Power BI Embedded Service Successfully Stopped"
}
catch
{
	Write-Error -Message $_.Exception
	throw  $_.Exception
}