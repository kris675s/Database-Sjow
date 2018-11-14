USE [A_DB14_2018]
DROP TABLE PET_OWNER
CREATE TABLE PET_OWNER(
OwnerID int NOT NULL,
OwnerLastName Nvarchar NULL,
OwnerFirstName Nvarchar NULL,
OwnerPhone Nvarchar NULL,
OwnerEmail Nvarchar NULL,
CONSTRAINT Pet_Owner_PK PRIMARY KEY (OwnerID) 
);
DROP TABLE PET
CREATE TABLE PET(
PetID int NOT NULL,
PetName Nvarchar NULL,
PetType Nvarchar NULL,
PetBreed Nvarchar NULL,
PetWeight Nvarchar NULL,
PetDob DateTime2 NULL,
OwnerID INT NOT NULL,
CONSTRAINT PET_PK PRIMARY KEY (PetID),
CONSTRAINT PET_OwnerID_FK FOREIGN KEY (OwnerID) REFERENCES PET_OWNER (OwnerID)
);
CREATE TABLE INVOICE(
--int valgt da man ikke kan have en halv invoce
InvoiceNumber int,
--datetime2 valgt fordi vi har med en dato
InvoiceDate Datetime2,
--Float valgt da vi har et muligt decimal tal precision valgt til 4. decimal
SubTotal Float(4),
--Float valgt da vi kan have med et decimal tal 
TaxPct Float (4),
-- Float valgt da vi mulighvis har med en liste der ikke er speciferet og at den kan indeholde decimaltal
Total Float (4)
);
