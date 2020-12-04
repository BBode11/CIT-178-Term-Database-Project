/* Final Project Views 
(View #1)
USE dogAdoption;
GO
CREATE VIEW CurrentDogs
AS
SELECT DogID, Description, Gender, Fee
FROM Dogs;
GO

SELECT * FROM CurrentDogs;

GO
UPDATE CurrentDogs
SET Fee = 70.00
WHERE DogID = 5;
GO

SELECT * FROM CurrentDogs;

View #2 
GO
CREATE VIEW CustomerCheck
AS
SELECT Customers.ID, Name, Cell#
FROM Customers;
GO

SELECT * FROM CustomerCheck;

View #3 

GO
CREATE VIEW BiggestDogs
AS 
SELECT DogID, Description, Size
FROM Dogs
WHERE Size = 'Large';
GO

SELECT * FROM BiggestDogs;

View #4 

GO 
CREATE VIEW YoungDogs
AS
SELECT DogID, Description, Age
FROM Dogs
WHERE Age < 4;
GO

SELECT * FROM YoungDogs;*/

