
-- Nested Query --

-- Finding donor with age over 24 -- 
SELECT * FROM Donor
WHERE Did IN (
	SELECT Did FROM Donor
	WHERE Age > 24
	);


-- Selecting donors with blood type O+ and age over 24 --
SELECT Did,Donorname FROM (
	SELECT Did,Donorname,Age FROM Donor
	WHERE Blood_type = 'O+'
	)
WHERE  Age > 24;


-- Selecting Donors with A+ and O+ Blood type using Union --
SELECT Did,Donorname FROM Donor
WHERE Blood_type = 'A+'	
UNION ALL
SELECT Did,Donorname FROM Donor
WHERE Blood_type = 'O+';


-- Merging result of two select operation using Union -- 
SELECT Did,Donorname,Age FROM Donor
WHERE Age > 27 	
UNION 
SELECT Did,Donorname,Age FROM Donor
WHERE Age > 22;

-- Finging common results from 2 select operation using intersection --
SELECT Did,Donorname FROM Donor
WHERE Did < 8
INTERSECT
SELECT Did,Donorname FROM Donor
WHERE Did > 5;

-- Removing the common result of two select operation from first select operstion using Minus -- 
SELECT Did,Donorname,Age FROM Donor
WHERE Age > 22 	
MINUS
SELECT Did,Donorname,Age FROM Donor
WHERE Age > 27;

-- Multiple operation --
SELECT Did,Donorname,Age FROM Donor
WHERE Did < 7 	
UNION
SELECT Did,Donorname,Age FROM Donor
WHERE Did > 7
INTERSECT
SELECT Did,Donorname,Age FROM Donor
WHERE Did BETWEEN 4 AND 10; 