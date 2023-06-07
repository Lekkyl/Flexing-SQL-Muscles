# Flexing-SQL-Muscles
This project explored advanced SQL techniques such as Joins, Creating Views, Stored Procedures.

## Objectives

* Use joins to query data from multiple tables
* Create and query views
* Write and run stored procedures

## Dataset
The dataset used in this project were all downloaded from the links below and stored in my DB2 database on cloud. Dataset links:
* [Chicago Census Data](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoCensusData.csv)
* [Chicago Public Schools](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoPublicSchools.csv)
* [Chicago Crime Data](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoCrimeData.csv)

## Exercises
### Using Joins
Using SQL join queries to access data stored across multiple tables.

### Creating a View
I assumed a situation where some portion of the data is meant to be kept private. By providing a view, I ensured that users of my database cannot see the actual scores given to a school, just the icon associated with their score. I defined new names for the view columns to obscure the use of scores and icons in the original table.

### Creating a Stored Procedure
The icon fields are calculated based on the value in the corresponding score field. I needed to make sure that when a score field is updated, the icon field is updated too. To do this, I wrote a stored procedure that receives the school id and a leaders score as input parameters, calculates the icon setting and updates the fields appropriately.

**All questions answered in this project are written as comments in the sql script**
