CREATE TABLE Pet_Owner 
(
	OwnerId			INT				NOT NULL	IDENTITY (1,1),
	OwnerLastName	NVARCHAR(50)	NOT NULL,
	OwnerFirstName	NVARCHAR(50)	NOT NULL,
	OwnerPhone		NVARCHAR(10)	NOT NULL,
	OwnerEmail		NVARCHAR(100)	NOT NULL,
CONSTRAINT	Pet_Owner_PK PRIMARY KEY (OwnerId)
);


CREATE TABLE Pet
(
	PetId			INT				NOT NULL,
	PetName			NVARCHAR(50)	NOT NULL,
	PetType			NVARCHAR(50)	NOT NULL,
	PetBreed		NVARCHAR(10)	NOT NULL,
	PetDOB			DATE			NOT NULL,
	PetWeight		FLOAT			NOT NULL,
	OwnerId			INT				NOT NULL,
CONSTRAINT Pet_PK PRIMARY KEY (PetId),
CONSTRAINT Pet_Owner_FK Foreign KEY (OwnerId)
	REFERENCES Pet_Owner (OwnerId) 
		ON UPDATE CASCADE
);

CREATE TABLE Invoice
(
	InvoiceNumber	INT				NOT NULL,
	InvoiceDate		DATE			NOT NULL,
	SubTotal		INT				NOT NULL,
	TaxPct			FLOAT			NOT NULL,
	Total			INT				NOT NULL,
CONSTRAINT Invoice_PK PRIMARY KEY (InvoiceNumber)
);

CREATE TABLE Product
(
	ProductNumber	INT				NOT NULL,
	ProductType		NVARCHAR(100)	NOT NULL,
	ProductDescription	NVARCHAR(1000)	NOT NULL,
	UnitPrice		FLOAT			NOT NULL,
CONSTRAINT Product_PK PRIMARY KEY (ProductNumber)
);

CREATE TABLE Line_Item
(
	InvoiceNumber	INT				NOT NULL,
	LineNumber		INT				NOT NULL,
	ProductNumber	INT				NOT NULL,
	Quantity		INT				NOT NULL,
	Unitprice		FLOAT			NOT NULL,
	Total			INT				NOT NULL,
CONSTRAINT Line_Item_PK PRIMARY KEY (InvoiceNumber, LineNumber),
CONSTRAINT Line_Invo_FK Foreign KEY (InvoiceNumber)
	REFERENCES Invoice (InvoiceNumber) 
		ON UPDATE CASCADE,
CONSTRAINT Line_Prod_FK Foreign KEY (ProductNumber)
	REFERENCES Product (ProductNumber) 
		ON UPDATE CASCADE
);

CREATE TABLE Zip
(
	Zip				INT				NOT NULL,
	City			NVARCHAR(20)	NOT NULL,
CONSTRAINT Zip_PK PRIMARY KEY (Zip)
);

CREATE TABLE Seminar
(
	SeminarId		INT				NOT NULL,
	SeminarDate		DATE			NOT NULL,
	Location		NVARCHAR(99)	NOT NULL, 
	SeminarTitle	NVARCHAR(20)	NOT NULL,
CONSTRAINT Seminar_PK PRIMARY KEY (SeminarId)
);

CREATE TABLE Customer
(
	CustomerId		INT				NOT NULL,
	FirstName		NVARCHAR(20)	NOT NULL,
	LastName		NVARCHAR(30)	NOT NULL,
	Street			NVARCHAR(50)	NOT NULL,
	Zip				INT				NOT NULL,
CONSTRAINT Customer_PK PRIMARY KEY (CustomerId),
CONSTRAINT Customer_FK Foreign KEY (Zip)
	REFERENCES Zip (Zip) 
		ON UPDATE CASCADE
);

CREATE TABLE Seminar_Customer
(
	SeminarId		INT				NOT NULL,
	CustomerId		INT				NOT NULL,
CONSTRAINT Seminar_Customer_PK PRIMARY KEY (SeminarId, CustomerId),
CONSTRAINT Sc_Seminar_FK Foreign KEY (SeminarId)
	REFERENCES Seminar (SeminarId) 
		ON UPDATE CASCADE,
CONSTRAINT Sc_Customer_FK Foreign KEY (CustomerId)
	REFERENCES Customer (CustomerId) 
		ON UPDATE CASCADE
);