/*Asmita Shelke*/
/*Homework 6*/

create database shelke_ACMEOnline;
use shelke_ACMEOnline;

/*Table Item*/

create table ITEM(Item_Number SMALLINT UNSIGNED AUTO_INCREMENT, Item_Name VARCHAR(35) NOT NULL, Description VARCHAR(255),
Model VARCHAR(50) NOT NULL,Price DECIMAL(8,2) NOT NULL, CONSTRAINT ITEM_pk PRIMARY KEY(Item_Number));

/*Table Customer*/
create table CUSTOMER(CustomerID SMALLINT UNSIGNED AUTO_INCREMENT, CustomerName VARCHAR(50) NOT NULL,Address VARCHAR(150)
NOT NULL,Email varchar(80),Customer_Type ENUM('Business','Home'),CONSTRAINT CUSTOMER_pk PRIMARY KEY(CustomerID));

/*Table Ordered*/
create table ORDERED(OrderID SMALLINT UNSIGNED AUTO_INCREMENT, total_cost DECIMAL(8,2), CustomerID SMALLINT UNSIGNED NOT NULL,
CONSTRAINT ORDERED_pk PRIMARY KEY(OrderID), CONSTRAINT ORDERED_CustomerID_fk FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID) ON UPDATE CASCADE);

/*Table Line_ITEM*/
create table LINE_ITEM(Item_Number SMALLINT UNSIGNED, OrderID SMALLINT UNSIGNED NOT NULL, Quantity TINYINT UNSIGNED NOT NULL,  
CONSTRAINT LINE_ITEM_pk PRIMARY KEY(Item_Number,OrderID),  
CONSTRAINT LINE_ITEM_ItemNumber_fk FOREIGN KEY(Item_Number) REFERENCES ITEM(Item_Number) ON UPDATE CASCADE, 
CONSTRAINT LINE_ITEM_OrderID_fk FOREIGN KEY(OrderID) REFERENCES ORDERED(OrderID) ON UPDATE CASCADE ON DELETE CASCADE);

/*Table Home*/
create table HOME(CustomerID SMALLINT UNSIGNED NOT NULL, CreditCardNum char(16) NOT NULL, CardExpirationDate char(6) NOT NULL,
CONSTRAINT HOME_pk PRIMARY KEY(CustomerID),CONSTRAINT HOME_CustomerID_fk FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID) ON UPDATE CASCADE);

/*Table Business*/
create table BUSINESS(CustomerID SMALLINT UNSIGNED NOT NULL, PaymentTerms varchar(50) NOT NULL,CONSTRAINT BUSINESS_pk PRIMARY KEY(CustomerID), 
CONSTRAINT BUSINESS_CustomerID_fk FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID) ON UPDATE CASCADE);

/*Inserting values in table ITEM*/
INSERT INTO ITEM(Item_Name,Description,Model,Price) VALUES('Cabbage Patch Doll','Baby boy doll','Boy',39.95);

INSERT INTO ITEM(Item_Name,Model,Price) VALUES('The Last Lecture','Hardcover',9.95);

INSERT INTO ITEM(Item_Name,Description,Model,Price) VALUES('Keurig Beverage Maker','Keurig Platinum edition Beverage Maker in Red','Platinum Edition',299.95);

/*Alter Customer table*/
alter table CUSTOMER modify Address varchar(100) NULL;

/*add columns to customer table*/
alter table CUSTOMER add (City varchar(60),State char(2),Zipcode varchar(10));

/*deleting keurig beverage maker entry from database*/
delete from ITEM where Item_Name='Keurig Beverage Maker';

/*update description*/
UPDATE ITEM SET Description="Written by Randy Pausch" WHERE Item_Name="The Last Lecture";

/*Updating Data for Janine Jeffers*/
INSERT INTO CUSTOMER(CustomerName,Address,City,State,Zipcode,Email) values ('Janine Jeffers','152 Lomb Memorial Dr.','Rochester','NY','14623','jxj1234@rit.edu');

INSERT INTO HOME(CustomerID,CreditCardNum,CardExpirationDate) values ((SELECT CustomerID from CUSTOMER WHERE CustomerName = 'Janine Jeffers'),"1234567890123456","012014");

UPDATE CUSTOMER set Customer_Type='Home' where CustomerName='Janine Jeffers';

INSERT INTO ORDERED values (1,113.74,(select CustomerID from CUSTOMER where CustomerName='Janine Jeffers'));

INSERT INTO LINE_ITEM values(1,1,2);

INSERT INTO LINE_ITEM values(2,1,3);