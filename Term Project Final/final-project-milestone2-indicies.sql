USE dogAdoption;
GO
CREATE INDEX idx_Zipcode ON Customers(Zipcode);
GO
CREATE INDEX idx_Location ON Adoption(LocationID);
CREATE INDEX idx_Customer ON Adoption(CustomerID);
GO
CREATE INDEX idx_Adoption ON AdoptionDetails(Adoption);
GO
CREATE INDEX idx_DogID ON AdoptionDetails(DogID);
