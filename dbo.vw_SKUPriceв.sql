USE PracticData
GO

CREATE VIEW Sku_View
AS
SELECT ID, Code, [Name], dbo.CostProduct(ID) as CostProduct
FROM dbo.SKU
GO

