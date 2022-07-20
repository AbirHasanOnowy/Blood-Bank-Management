
--- Dropping tables according to relation constraints ---
DROP TABLE Blood;
DROP TABLE Donor;
DROP TABLE Receiptionist;
DROP TABLE Orders;
DROP TABLE Hospital;
DROP TABLE BloodBank;


--- Creating tables ---
CREATE TABLE Donor (
	Did INTEGER PRIMARY KEY,
	Donorname VARCHAR(15) NOT NULL,
	Blood_type VARCHAR(10) NOT NULL,
	Age NUMBER(2),
	Address VARCHAR(20),
	Phone_no NUMBER(11) UNIQUE
);

CREATE TABLE Receiptionist (
	Rid INTEGER PRIMARY KEY,
	Rname VARCHAR(15) NOT NULL,
	Hospitalname VARCHAR(40) NOT NULL,
	Address VARCHAR(20),
	Phone_no NUMBER(11) UNIQUE
);

CREATE TABLE Blood (
	Code NUMBER(8) PRIMARY KEY,
	Did INTEGER NOT NULL,
	Blood_type VARCHAR(10) NOT NULL,
	Rid INTEGER NOT NULL,
	Donation_date DATE,	
	FOREIGN KEY (Did) REFERENCES Donor ON DELETE CASCADE,
	FOREIGN KEY (Rid) REFERENCES Receiptionist ON DELETE SET NULl
);

CREATE TABLE BloodBank (
	Blood_type VARCHAR(10) PRIMARY KEY,
	Amount INTEGER NOT NULL
);

CREATE TABLE Hospital (
	H_Id INTEGER PRIMARY KEY,
	Hospitalname VARCHAR(40) NOT NULL,
	Address VARCHAR(20),
	Phone_no NUMBER(11) UNIQUE
);

CREATE TABLE Orders (
    Order_number INTEGER PRIMARY KEY,
	H_Id INTEGER NOT NULL,
	Blood_type VARCHAR(10) NOT NULL,
	Order_amount INTEGER NOT NULL,
	Order_date DATE,
    Foreign KEY (H_Id) REFERENCES Hospital ON DELETE CASCADE,
    Foreign KEY (Blood_type) REFERENCES Bloodbank ON DELETE CASCADE
);

--- Describing tables ---
DESCRIBE Blood;
DESCRIBE Bloodbank;
DESCRIBE Receiptionist;
DESCRIBE Donor;
DESCRIBE Hospital;
DESCRIBE Orders;


--- Inserting data ---
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(1,'Farhan','B+',34,'Teligati',01954398721);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(2,'Jami','AB+',21,'Khalishpur',01512345678);
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(3,'uday','B+',26,'Daulatpur',01747923720);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(4,'mishu','O+',29,'Fulpur',01863826349);
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(5,'abir','O+',22,'Sherpur',01638723454);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(6,'saimon','AB-',27,'Khalishpur',01398727430);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(7,'argho','A+',18,'Boyra',01543728467);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(8,'sabbir','O+',29,'Sonadanga',01354798246);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(9,'kowshik','O+',31,'Daulatpur',01874154795);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(10,'rafi','B-',25,'Khalishpur',01654983215);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(11,'rifat','A+',24,'Shibbari',01741852963);	
INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(12,'shihab','B+',20,'Daulatpur',01654865784);


INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(1,'Borsha','Khulna BNSB Hospital','Daulatpur',01684521478);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(2,'Minu','Khulna City Hospital','Shibbari',01357894247);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(3,'Tuna','Khulna Medical College Hospital','Khalishpur',01987475787);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(4,'Sejuti','Khulna Sadar Hospital','Sonadanga',01578436512);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(5,'Tanni','Khulna Shisu Hospital','Daulatpur',018654254789);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(6,'Mou','Cure Home General Hospital','Teligati',01465423545);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(7,'Tanvir','Khulna Pongu and General Hospital','Fulpur',01754126854);
INSERT INTO Receiptionist (Rid,Rname,Hospitalname,Address,Phone_no) values(8,'Fayaz','Islami Bank Hospital','Shibbari',01658745879);


INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(1,3,'B+',4,'11-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(2,4,'O+',5,'11-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(3,5,'O+',2,'12-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(4,6,'AB-',3,'12-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(5,8,'O+',1,'12-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(6,2,'AB+',8,'12-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(7,10,'B-',3,'13-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(8,7,'A+',6,'15-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(9,11,'A+',2,'15-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(10,2,'AB+',7,'16-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(11,9,'O+',1,'17-JUN-22');


INSERT INTO Bloodbank (Blood_type,Amount) values('A+',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('A-',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('B+',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('B-',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('AB+',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('AB-',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('O+',50);
INSERT INTO Bloodbank (Blood_type,Amount) values('O-',50);


INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(1,'Khulna Medical College Hospital','khulna',01578235432);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(2,'Khulna City Hospital','khulna',01864520371);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(3,'Khulna Shisu Hospital','khulna',01736451290);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(4,'Khulna BNSB Hospital','khulna',01945756875);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(5,'Khulna Sadar Hospital','khulna',01846382743);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(6,'Islami Bank Hospital','khulna',01378459323);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(7,'Khulna Pongu and General Hospital','khulna',01587409898);
INSERT INTO Hospital (H_Id,Hospitalname,Address,Phone_no) values(8,'Cure Home General Hospital','khulna',01541257854);


INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(1,1,'A+',10,'01-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(2,2,'B-',7,'01-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(3,3,'O+',18,'01-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(4,4,'B+',5,'02-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(5,5,'A+',10,'02-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(6,6,'O+',7,'04-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(7,4,'O-',5,'04-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(8,2,'B-',3,'04-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(9,4,'B-',6,'04-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(10,1,'O+',10,'05-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(11,5,'AB+',6,'05-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(12,4,'O-',5,'06-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(13,6,'AB-',5,'06-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(14,3,'B+',2,'06-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(15,5,'A-',5,'07-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(16,2,'A+',10,'07-JUL-22');
