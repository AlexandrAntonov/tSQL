CREATE PROCEDURE dbo.usp_MakeFamilyPurchase @FamilySurName varchar(255) AS
BEGIN
DECLARE @s int;
SELECT @s = SUM(b.Value)
			FROM dbo.Basket b join dbo.Family f on b.ID_Family = f.ID
			WHERE f.SurName = @FamilySurName
			GROUP BY b.ID_Family
UPDATE dbo.Family
SET BudgetValue = BudgetValue - @s
IF @FamilySurName NOT IN (SELECT SurName FROM dbo.Family)
    PRINT N'No such family'; 
END;
