CREATE DATABASE dogAdoption;

GO
USE dogAdoption;
CREATE TABLE Dogs(
	DogID int NOT NULL,
	Description varchar(200) NOT NULL,
	Fur varchar(20),
	Size varchar(20),
	Age int, 
	Gender varchar(20),
	Fee money,
	PRIMARY KEY(DogID)
);
GO
CREATE TABLE Customers(
	ID int NOT NULL,
	Name varchar(30) NOT NULL,
	Address varchar(50) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Cell# varchar(15),
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)
);
GO
CREATE TABLE Locations(
	ID int NOT NULL,
	Name varchar(30) NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Adoption(
	ID int NOT NULL,
	Date datetime,
	LocationID int NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE AdoptionDetails(
	ID int NOT NULL,
	Adoption int NOT NULL,
	DogID int NOT NULL,
	pay varchar(10),
	PRIMARY KEY(ID)
);
