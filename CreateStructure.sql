use master
DROP DATABASE IF EXISTS PracticData
go

CREATE DATABASE PracticData
go

use PracticData

CREATE TABLE dbo.SKU
(
	ID int identity PRIMARY KEY,
	Code as ('s'+ID) UNIQUE,
	[Name] nvarchar,
)
go

CREATE TABLE dbo.Family
(
	ID int identity PRIMARY KEY,
	SurName nvarchar,
	BudgetValue money
)
go

CREATE TABLE dbo.Basket
(
	ID int identity PRIMARY KEY,
	ID_SKU int,
	ID_Family int,
	Quantity int,
	[Value] money,
	PurchaseDate date DEFAULT(GETDATE()),
	DiscountValue int,

	CONSTRAINT QuantityCheck CHECK(Quantity >= 0),
	CONSTRAINT ValueCheck CHECK([Value] >= 0),
	CONSTRAINT ID_SKU_Key FOREIGN KEY(ID_SKU) References dbo.SKU(ID) ON DELETE CASCADE,
	CONSTRAINT ID_Family_Key FOREIGN KEY(ID_Family) References dbo.Family(ID) ON DELETE CASCADE
)