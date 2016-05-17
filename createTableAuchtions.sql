
CREATE TABLE Product(
P_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
Name VARCHAR (50) NOT NULL, 
Image VARCHAR (100) NOT NULL,
ImageAlt VARCHAR(100) NOT NULL,
Producer VARCHAR(80) NOT NULL,
AuctionEnd DATE,
Year INTEGER,
Expired BOOLEAN NOT NULL);

CREATE TABLE User (
U_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
FirstName VARCHAR (50) NOT NULL, 
LastName VARCHAR (50) NOT NULL,
Email VARCHAR (50) NOT NULL,
Password VARCHAR (50) NOT NULL,
Salutation VARCHAR (50) NOT NULL,
DateOfBirth DATE, 
Balance INTEGER NOT NULL,
WonAuctionCount INTEGER NOT NULL,
RunningAuctionCount INTEGER NOT NULL, 
LostAuctionCount INTEGER NOT NULL);

CREATE TABLE RelatedProduct (
R_ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
NameDe VARCHAR NOT NULL,
P_ID Integer references Product(P_ID));

CREATE TABLE BID(
ID INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
Amount INTEGER NOT NULL,
U_ID Integer references User(U_ID),
P_ID Integer references Product(P_ID));
