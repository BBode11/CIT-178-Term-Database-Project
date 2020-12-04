/* Final Project Procedures 

-- stored procedure that retrieves and displays data
USE dogAdoption;
GO 
CREATE PROC spCustomers
AS
SELECT * FROM Customers
ORDER BY Name;
GO

EXEC spCustomers;

--Stored procedure that takes an input parameter
USE dogAdoption;
GO
CREATE PROC spGetDogs
		@DogID int
AS
BEGIN
		SELECT * FROM Dogs
		WHERE DogID = @DogID;
END
GO
EXEC spGetDogs 3

--Stored procedure that returns an output parameter
USE dogAdoption;
GO
CREATE PROC spAdoptionContact
		@ID int,
		@Name varchar(30) OUTPUT,
		@Cell# varchar(15) OUTPUT
AS
SELECT @Name = Name, @Cell# = Cell#
FROM Customers
WHERE ID = @ID
GO

DECLARE @Name varchar(30);
DECLARE @Cell# varchar(15);
EXEC spAdoptionContact 2, @Name OUTPUT, @Cell# OUTPUT;
SELECT @Name AS [Adopter], @Cell# AS [Phone Number];

--Stored procedure with a return value
USE dogAdoption;
GO
CREATE PROC spDogCount
AS
DECLARE @DogCount int;
SELECT @DogCount = COUNT(*)
FROM Dogs
RETURN @DogCount;
GO

DECLARE @DogCount int;
EXEC @DogCOunt = spDogCount;
PRINT 'There are' + CONVERT(varchar, @DogCount) + ' dogs in your database';
GO*/

/* Final Project User Defined Functions 

--Create function
USE dogAdoption;
GO
CREATE FUNCTION fnGetDog
	(@Description varchar(200) = '%')
	RETURNS int
BEGIN
	RETURN (SELECT DogID FROM Dogs WHERE Description LIKE @Description);
END;

SELECT DogID, Size, Fee FROM Dogs
WHERE DogID = dbo.fnGetDog('Rottweiler');

--table function
USE dogAdoption;
GO
CREATE FUNCTION fnDogSize
		(@Size varchar(20) = '%')
		RETURNS table
RETURN
		(SELECT * FROM Dogs WHERE Size LIKE @Size);
GO
SELECT * FROM dbo.fnDogSize('%S%');*/

/* Final Project Triggers 

--Create a trigger that will add deleted data from one of your tables into an archive or transaction table 
USE dogAdoption;
GO
SELECT * INTO TempDogs
FROM Dogs
WHERE 1 = 0; 

ALTER TABLE TempDogs
ADD Activity varchar(50);
GO

CREATE TRIGGER TempDogs_INSERT ON DOGS
	AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @DogID int
		DECLARE @Description varchar(200)
		DECLARE @Fur varchar(20)
		DECLARE @Size varchar(20)
		DECLARE @Age int
		DECLARE @Gender varchar(20)
		DECLARE @Fee money

	SELECT @DogID = INSERTED.DogID, @Description = INSERTED.Description, @Fur = INSERTED.Fur, @Size = INSERTED.Size, @Age = INSERTED.Age, @Gender = INSERTED.Gender, @Fee = INSERTED.Fee
		FROM INSERTED

	INSERT INTO TempDogs VALUES(@DogID, @Description, @Fur, @Size, @Age, @Gender, @Fee, 'Inserted')
	END
	GO
	INSERT INTO Dogs VALUES(11, 'Saint Bernard', 'Long', 'Large', 4, 'Male', 60.00);
	GO
	SELECT * FROM TempDogs;

CREATE TRIGGER TempDogs_DELETE ON Dogs
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DogID int
		DECLARE @Description varchar(200)
		DECLARE @Fur varchar(20)
		DECLARE @Size varchar(20)
		DECLARE @Age int
		DECLARE @Gender varchar(20)
		DECLARE @Fee money

	SELECT @DogID = DELETED.DogID, @Description = DELETED.Description, @Fur = DELETED.Fur, @Size = DELETED.Size, @Age = DELETED.Age, @Gender = DELETED.Gender, @Fee = DELETED.Fee
		FROM DELETED

	INSERT INTO TempDogs VALUES(@DogID, @Description, @Fur, @Size, @Age, @Gender, @Fee, 'Deleted')
	END
	GO

	DELETE FROM Dogs WHERE DogID = 11;
	GO

	SELECT * FROM TempDogs;
	

CREATE TRIGGER TempDogs_UPDATE ON Dogs
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DogID int
		DECLARE @Description varchar(200)
		DECLARE @Fur varchar(20)
		DECLARE @Size varchar(20)
		DECLARE @Age int
		DECLARE @Gender varchar(20)
		DECLARE @Fee money

	SELECT @DogID = INSERTED.DogID, @Description = INSERTED.Description, @Fur = INSERTED.Fur, @Size = INSERTED.Size, @Age = INSERTED.Age, @Gender = INSERTED.Gender, @Fee = INSERTED.Fee
		FROM INSERTED

	INSERT INTO TempDogs VALUES(@DogID, @Description, @Fur, @Size, @Age, @Gender, @Fee, 'Inserted')
	END
	GO

INSERT INTO Dogs VALUES(11, 'Mountain Dog', 'Long', 'Large', 5, 'Male', 60.00);
GO
UPDATE Dogs
SET Description = 'Wolf Dog'
WHERE DogID = 11;
GO

SELECT * FROM TempDogs;*/