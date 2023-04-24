USE PracticData
go
CREATE FUNCTION CostProduct(@ID_SKU int)
RETURNS DECIMAL(18,2)
BEGIN
	DECLARE @Value decimal(18,2)
	SELECT @Value = [Value]/Quantity
	FROM dbo.Basket
	Where ID_SKU = @ID_SKU

	RETURN @Value
END