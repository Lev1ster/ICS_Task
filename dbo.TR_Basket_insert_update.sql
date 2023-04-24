use PracticData
go

CREATE TRIGGER TR_Basket_insert_update ON dbo.Basket
AFTER INSERT
AS
IF (SELECT COUNT(ID_SKU) FROM inserted) > 1
BEGIN
	UPDATE dbo.Basket
	SET DiscountValue = 5 * (SELECT COUNT(ID_SKU) FROM inserted)
END
ELSE
BEGIN
	UPDATE dbo.Basket
	SET DiscountValue = 0
END