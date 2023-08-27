CREATE VIEW dbo.vw_SKUPrice AS
SELECT *, dbo.udf_GetSKUPrice(s.ID) AS Price
FROM dbo.SKU s;