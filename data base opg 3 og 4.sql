USE [A_DB14_2018]
CREATE TABLE PET_OWNER(
OwnerID			int				NOT NULL IDENTITY(1,1),
OwnerLastName	nVARCHAR (25)	NOT NULL,
OwnerFirstName	nVARCHAR (25)	NOT NULL,
OwnerPhone		nVARCHAR (12)	NULL,
OwnerEmail		nVARCHAR (100)	NULL,
CONSTRAINT Pet_Owner_PK PRIMARY KEY (OwnerID) 
);
CREATE TABLE PET(
PetID			INT				NOT NULL IDENTITY(1,1),
PetName			Nvarchar (50)	NULL,
PetType			Nvarchar (50)	NULL,
PetBreed		Nvarchar (50)	NULL,
PetWeight		Nvarchar (50)	NULL,
PetDob			DateTime2		NULL,
OwnerID			INT				NOT NULL,
CONSTRAINT PET_PK PRIMARY KEY (PetID),
CONSTRAINT PET_OwnerID_FK FOREIGN KEY (OwnerID) REFERENCES PET_OWNER (OwnerID)
);
CREATE TABLE INVOICE(
--int valgt da man ikke kan have en halv invoce
InvoiceNumber Int NOT NULL,
--datetime2 valgt fordi vi har med en dato
InvoiceDate Datetime2 NOT NULL,
--Float valgt da vi har et muligt decimal tal precision valgt til 4. decimal
SubTotal Float(4) NOT NULL,
--Float valgt da vi kan have med et decimal tal 
TaxPct Float (4) NOT NULL,
-- Float valgt da vi mulighvis har med en liste der ikke er speciferet og at den kan indeholde decimaltal
Total Float (4) NOT NULL, 
CONSTRAINT INVOICE_PK PRIMARY KEY (InvoiceNumber)
);
CREATE TABLE PRODUCT(
ProductNumber Int NOT NULL,
ProductType Int NOT NULL,
ProductDescription nvarchar (50) NULL,
UnitPrice Float (2) not null,
CONSTRAINT PRODUCT_PK PRIMARY KEY (ProductNumber)
);
CREATE TABLE LINE_ITEM(
InvoiceNumber Int NOT NULL,
LineNumber Int NOT NULL,
ProductNumber Int NOT NULL,
Quantity Int NOT NULL,
UnitPrice Float (2) NOT NULL,
Total Float (4) NOT NULL,
CONSTRAINT LINE_ITEM_PK PRIMARY KEY (InvoiceNumber, LineNumber),
CONSTRAINT INVOICE_FK FOREIGN KEY (InvoiceNumber)
	REFERENCES INVOICE (InvoiceNumber)
		ON UPDATE CASCADE,
CONSTRAINT PRODUCT_FK FOREIGN KEY (ProductNumber)
	REFERENCES PRODUCT (ProductNumber)
		ON UPDATE CASCADE
);
CREATE TABLE SEMINAR(
SeminarId INT NOT NULL,
SeminarDate DateTime2 NOT NULL,
Location NVARCHAR (50) NOT NULL,
SeminarTitel NVARCHAR (50) NOT NULL,
CONSTRAINT SEMINAR_PK PRIMARY KEY (SeminarId)
);
CREATE TABLE ZIP_CITY(
Zip INT NOT NULL,
City NVARCHAR (50) NULL
CONSTRAINT ZIP_CITY_PK PRIMARY KEY (Zip)
);
CREATE TABLE CUSTOMER(
CustomerId INT NOT NULL,
FirstName NVARCHAR (50) NULL,
LastName NVARCHAR (50) NULL,
Street NVARCHAR (50) NULL,
Zip INT NOT NULL,
CONSTRAINT CUSTOMER_PK PRIMARY KEY (CustomerId),
CONSTRAINT ZIP_CITY_FK FOREIGN KEY (Zip)
	REFERENCES ZIP_CITY (Zip)
		ON UPDATE CASCADE
);
CREATE TABLE SEMINAR_CUSTOMER(
SeminarId INT NOT NULL,
CustomerId INT NOT NULL,
CONSTRAINT SEMINAR_CUSTOMER_PK PRIMARY KEY (CustomerId, SeminarID),
CONSTRAINT CUSTOMER_FK FOREIGN KEY (CustomerId)
	REFERENCES CUSTOMER (CustomerId)
		ON UPDATE CASCADE,
CONSTRAINT SEMINAR_FK FOREIGN KEY (SeminarId)
	REFERENCES SEMINAR (SeminarId)
		ON UPDATE CASCADE
);