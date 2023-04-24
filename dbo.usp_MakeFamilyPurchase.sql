use PracticData
go

CREATE PROCEDURE usp_MakeFamilyPurchase (@FamilySurName nvarchar) AS
BEGIN TRY
		Declare @cost money

		SELECT @cost = BudgetValue - SUM(Basket.[Value])
		FROM Family INNER JOIN Basket on Family.ID = Basket.ID_Family
		WHERE SurName = @FamilySurName AND Basket.ID_Family in 
		(SELECT ID FROM Family WHERE SurName = @FamilySurName)
		Group BY BudgetValue, Basket.[Value]

		UPDATE Family
		SET BudgetValue = @cost
		
END TRY
BEGIN CATCH
		SELECT 'FamilySurName not exists'
END CATCH