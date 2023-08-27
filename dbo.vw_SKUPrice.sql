CREATE VIEW dbo.vw_SKUPrice AS
SELECT *, dbo.udf_GetSKUPrice(s.ID)
FROM dbo.SKU s;