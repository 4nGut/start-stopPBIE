# Use of Azure Automation to automatically start and stop Power BI Embedded

## Steps to deploy

### Prerrequisites
Before starting the configuration, we’ll need to have access to an Azure Subscription with the appropriate permissions to follow up the instructions, as well as a Power BI Embedded resource deployed, in this example we’ll be working with the Contributor Role assigned. The creation of the Power BI Embedded resource and configuration of a restricted role are out of the scope of this document.
### Steps to configure an Azure Automation Account
1.	Generate an Azure Automation Account from the portal with a Managed Identity of the type System Assigned
2.  Update the PowerShell modules Az.Accounts and Az.PowerBIEmbedded
3.	Once created, we’ll start creating the following 4 variables:
    1.	pbie with the value of Power BI Embedded’s name
    2.	pbierg with the value of the Resource Group’s name where the Power BI Embedded resource resides
    3.	TenantID with the value of your Azure Tenant ID
    4.	SubscriptionID with the value of your Azure Subscription ID
4.	Generate Schedules for the start and stop of the Power BI Embedded resource, let’s say you want the service to be available Monday to Friday from 8am to 7pm, we’ll configure first the Schedule for starting the resource at 7:50am, select our appropriate time zone, select recurring, then weekly and then select the days Monday to Friday. For stopping the resource, the next Schedule will be at 7:10pm, make sure the correct time zone is selected, select recurring, then weekly and lastly select the days Monday to Friday.
5.	At the subscription level we will grant the Contributor Role to the Managed Identity related to our Automation Account
6.	Download from github the scripts Start-PBIE and Stop PBIE for the start and stop of the Power BI Embedded resource respectively
7.	Configure a Runbook for each script either importing the ps1 files or copying and pasting the code inside the scripts, run the scripts to validate they work correctly
8.	After the validation is successful, we’ll configure to each Runbook the appropriate Schedule

Created by Antonio Gutiérrez
2022-Jul-10
CC0 1.0 Universal (CC0 1.0)
Public Domain Dedication 
