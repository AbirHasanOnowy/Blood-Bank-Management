DESC donor;

--adding column--
ALTER TABLE Donor add FathersName VARCHAR(50);
DESC Donor;
SELECT * FROM Donor;

--modifying column data type--
ALTER TABLE Donor modify FathersName CHAR(60);
DESC Donor;
SELECT * FROM Donor;

-- renaming column --
ALTER TABLE Donor rename column FathersName to F_Name;
DESC Donor;
SELECT * FROM Donor;

--updating a value--
UPDATE Donor SET F_Name = 'Saidur Rahman' WHERE Did=2;
DESC Donor;
SELECT * FROM Donor;

-- dropping column --
ALTER TABLE Donor drop column F_Name;
DESC Donor;
SELECT * FROM Donor;

INSERT INTO Donor (Did,Donorname,Blood_type,Age,Address,Phone_no) values(7,'sakib','B-',25,'Khalishpur',01764727430);
 
 --delete a row drom table--
SELECT * FROM Donor;
DELETE FROM Donor WHERE Did=7;
SELECT * FROM Donor;

