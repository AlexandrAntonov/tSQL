CREATE TABLE dbo.SKU
(
	ID int PRIMARY KEY IDENTITY
	, Code AS 's'+ID UNIQUE
	, Name varchar(30)
	);

CREATE TABLE dbo.Family
(
	ID int PRIMARY KEY IDENTITY
	, SurName varchar(30)
	, BudgetValue int
	);

CREATE TABLE dbo.Basket
(
	ID int PRIMARY KEY IDENTITY
	, ID_SKU int REFERENCES dbo.SKU (ID)
	, ID_Family int REFERENCES dbo.Family (ID)
	, Quantity int CHECK(Quantity > 0)
	, Value int CHECK(Value > 0)
	, PurchaseDate date DEFAULT GETDATE()
	, DiscountValue int
	);