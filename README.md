<!--Category:Powershell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.PSDbUp/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/psdbup/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.PSDbUp"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# ProductivityTools.PSDbUp

Module invokes DBUp from PowerShell for  given directory.

Often I am starting application with gathering data. First I am creating database, next I create some simple form in Microsoft Access and later if whole idea make sense I am adding Windows application. This module helps me to create database in structured way and later use written scripts in final application.

## New-DbUpMigration

Module exposes cmdlet which help in creating the new migration. When executed in the directory with previous scripts it checks last number assigned to migration and create new one with provided content.

![New migration](Images/NewMigration.png)

```PowerShell
New-DbUpMigration -Name "init" -Content "CREATE TABLE Test(TestId INT" -Verbose
```

Above command will create in directory SQL file with provided content.

![New migration](Images/ResultOfMigration.png)

## Invoke-DbUpMigration

If scripts are created we can go to the directory with them and call  Invoke-DbUpMigration

```
Invoke-DbUpMigration -SqlInstance '.\sql2019' -DatabaseName "Test123" -SchemaName "dbup" -Verbose
```

![Lock screen](Images/resultofdbup.png)

Scripts should be invoked. 

**Module doesn't create the database**, you need to create it manually.

![Lock screen](Images/schema.png)

### SchemaName - parameter tell in which schema migration log table should be created
