[![GitHub](http://cdn.productivitytools.tech/Github40px.png)](https://github.com/pwujczyk/ProductivityTools.PSDbUp)
[![PowershellGallery](http://cdn.productivitytools.tech/Powershell40px.png)](https://www.powershellgallery.com/packages/ProductivityTools.PSDbUp/)
[![ProductivityTools](http://cdn.productivitytools.tech/Blog40px.png)](http://www.productivitytools.tech/psdbup/)

# ProductivityTools.PSDbUp

Module invokes DBUp from given directory.

Go to the directory with the scripts and call  Invoke-DbUpMigration

```
Invoke-DbUpMigration -SqlInstance '.\SQL2017' -DatabaseName 'xxx1' -SchemaName pawel
```

One not obvious param is SchemaName. Setting it will impact schema under which DBUp Log will be saved.

#New-DbUpMigration

Module also exposes cmdlet which help in creating the new migration. When executed in the directory with previous scripts it checks last number assigned to migration and create new one with provided content.
