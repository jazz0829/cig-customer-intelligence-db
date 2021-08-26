Function RunScripts($directory) {

  foreach($file in Get-ChildItem $directory)
  {
    $filePath = $directory + "\" + $file
    sqlcmd -S LT-17-587\MSSQL_DEV2017 -i $filePath
  }

  Write-Host "---------------------------------------------------------"
}

# First of all let's create CustomerIntelligence database

Write-Host "Creating CustomerIntelligence database on local SQL Server instance ..." -ForegroundColor "Green"

sqlcmd -S LT-17-587\MSSQL_DEV2017 -i src\CustomerIntelligence.Database.sql

Write-Host "CustomerIntelligence database was successfully created." -ForegroundColor "Green"

$rolesDirectory = ".\src\Roles";
$usersDirectory = ".\src\Users";
$schemasDirectory = ".\src\Schemas";
$tablesDirectory = ".\src\Tables";
$viewsDirectory = ".\src\Views";
$functionsDirectory = ".\src\Functions";
$storedProceduresDirectory = ".\src\Stored Procedures";

Write-Host "Now let's create database roles..." -ForegroundColor "Green"
RunScripts($rolesDirectory)

Write-Host "Now let's create database users..." -ForegroundColor "Green"
RunScripts($usersDirectory)

Write-Host "Now let's create database schemas..." -ForegroundColor "Green"
RunScripts($schemasDirectory)

Write-Host "Now let's create database tables..." -ForegroundColor "Green"
RunScripts($tablesDirectory)

Write-Host "Now let's create database views..." -ForegroundColor "Green"
RunScripts($viewsDirectory)

Write-Host "Now let's create database functions..." -ForegroundColor "Green"
RunScripts($functionsDirectory)

Write-Host "Now let's create database stored procedures..." -ForegroundColor "Green"
RunScripts($storedProceduresDirectory)

Write-Host "The database CustomerIntelligence and its all objects were successfully created." -ForegroundColor "Green"