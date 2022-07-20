
-- PL/SQL --


-- Finding age and phone no of donor named argho -- 
SET SERVEROUTPUT ON
DECLARE
	Donor_age Donor.Age%Type;
	Donor_name Donor.Donorname%Type := 'kowshik';
	Donor_phone_no Donor.Phone_no%Type;
BEGIN
	SELECT Age INTO Donor_age 
	FROM Donor
	WHERE Donorname = Donor_name;

	SELECT Phone_no INTO Donor_phone_no 
	FROM Donor
	WHERE Donorname = Donor_name; 

	DBMS_OUTPUT.PUT_LINE('The age of the donor named ' || Donor_name || ' is '|| Donor_age || 
	' and phone no is 0' || Donor_phone_no);
END;
/
show errors


-- finding out the oldest donor without using max() --
-- used CURSOR, LOOP, IF --
SET SERVEROUTPUT ON
DECLARE
	max_age Donor.Age%Type := 0;
	name Donor.Donorname%Type;
	CURSOR donor_list IS SELECT Age FROM Donor;
	each_donor donor_list%Rowtype;
BEGIN
	OPEN donor_list;
		LOOP
			FETCH donor_list INTO each_donor;

				IF max_age < each_donor.Age THEN
					max_age := each_donor.Age;
				END IF;

			EXIT WHEN donor_list%RowCount > 10;
		END LOOP;
	CLOSE donor_list;

	SELECT Donorname INTO name FROM Donor WHERE Age = max_age;

	DBMS_OUTPUT.PUT_LINE('The name of the oldest donor is ' || name || ' and his age is '|| max_age);
END;
/
