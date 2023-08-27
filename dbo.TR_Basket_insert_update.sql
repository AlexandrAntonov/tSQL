CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT AS
IF @@ROWCOUNT > 1
BEGIN
	UPDATE dbo.Basket
	SET DiscountValue = dbo.Basket.Value * 0.05
	FROM inserted  
	WHERE dbo.Basket.ID_SKU = inserted.ID_SKU  
END
ELSE
BEGIN
	UPDATE dbo.Basket
	SET DiscountValue = 0
	FROM inserted  
	WHERE dbo.Basket.ID_SKU = inserted.ID_SKU
END;