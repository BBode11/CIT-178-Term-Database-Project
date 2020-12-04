/* Count

USE dogAdoption;
SELECT Zipcode.State, COUNT(DISTINCT Customers.ID) AS [Customers per State]
FROM Customers JOIN Zipcode ON Customers.Zipcode = Zipcode.Zipcode
GROUP BY Zipcode.State 
ORDER BY Zipcode.State ASC;

Count, AVG 

SELECT COUNT(Dogs.Description) AS [Number of Dogs],
		AVG(Dogs.Fee) AS [Average Adoption Fee]
FROM Dogs;

Max/Min 

SELECT MIN(Dogs.Fee) AS [Lowest Adoption Fee], 
	   MAX(Dogs.Fee) AS [Highest Adoption Fee]
FROM Dogs;

SUM 

SELECT SUM(Dogs.Fee) AS [Total Fees Under Four]
FROM Dogs
WHERE Age BETWEEN 1 AND 4;*/