CREATE FUNCTION  dbo.udf_GetSKUPrice(@ID_SKU int)
RETURNS decimal(18, 2) AS
BEGIN
	DECLARE @res int, @sv int, @sq int;
	SELECT @sv = SUM(b.Value)
	FROM dbo.Basket b
	WHERE b.ID_SKU = @ID_SKU
	GROUP BY b.ID_SKU;
	SELECT @sq = SUM(b.Quantity)
	FROM dbo.Basket b
	WHERE b.ID_SKU = @ID_SKU
	GROUP BY b.ID_SKU;
	SET @res = @sv/@sq
	RETURN @res;
END;