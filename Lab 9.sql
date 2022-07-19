-- TRiggers --

CREATE OR REPLACE TRIGGER Check_donorinfo_in_blood_table
BEFORE INSERT OR UPDATE ON Blood
FOR EACH ROW
DECLARE
	check_rows number := 0;
	check_resip number := 0;
	bloodtype Donor.Blood_type%type;
BEGIN
	select count(*) into check_rows from Donor where did = :NEW.Did;
	select count(*) into check_resip from Receiptionist where Rid = :NEW.Rid;
	
	if  check_rows = 0 then

		-- checking if there is any donor register with this id --
		RAISE_APPLICATION_ERROR(-20000,'Please register as a Donor first');

	elsif check_resip = 0 then

		-- checking Rid validity --
		RAISE_APPLICATION_ERROR(-20000,'Please enter the proper Receiptionist id');
	
	else 
		select Blood_type into bloodtype from Donor where did = :NEW.Did;

		-- checking if the bloodtype matches --
		if bloodtype != :NEW.Blood_type then
			RAISE_APPLICATION_ERROR(-20001,'Wrong Information about Blood_type');
		else

			-- updating total amount of blood in bloodbank after receiving blood from a donor --
			select count(*) into check_rows from Blood where Code = :NEW.Code;
			if check_rows = 0 then

				-- updating Bloodbank data only when there is a new insert on Blood table --
				UPDATE BloodBank SET Amount = Amount + 1 WHERE Blood_type = bloodtype;
			end if;
		end if;
	end if;
end;
/
show errors


SELECT * FROM Blood;
SELECT * FROM BloodBank;

INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(15,18,'AB+',9,'16-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(15,9,'B+',9,'19-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(15,9,'B+',1,'19-JUN-22');
INSERT INTO Blood (Code,Did,Blood_type,Rid,Donation_date) values(15,9,'O+',1,'19-JUN-22');

SELECT * FROM Blood;
SELECT * FROM BloodBank;



CREATE OR REPLACE TRIGGER Check_orders_from_hospitals
BEFORE INSERT OR UPDATE ON Orders
FOR EACH ROW
DECLARE
	check_rows number := 0;
	bloodtype BloodBank.Blood_type%type;
	amnt Orders.Order_amount%type;
BEGIN
	select count(*) into check_rows from Hospital where H_Id = :NEW.H_Id;
	if  check_rows = 0 then

		-- checking if there is any hospital register with this id --
		RAISE_APPLICATION_ERROR(-20002,'Please register your hospital first');
	else 
		select Amount into amnt from BloodBank where Blood_type = :NEW.Blood_type;

		-- checking if the bank has enough blood of that bloodtype --
		if amnt < :NEW.Order_amount then
			RAISE_APPLICATION_ERROR(-20003,'BloodBank does not have enough blood of that Blood_type');
		else
			-- updating Bloodbank data only when there is a new insert on Blood table --
			UPDATE BloodBank SET Amount = Amount - :NEW.Order_amount WHERE Blood_type = :NEW.Blood_type;
			
		end if;
	end if;
end;
/



SELECT * FROM Orders;
SELECT * FROM BloodBank;

INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(17,12,'B+',2,'09-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(18,5,'A-',56,'09-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(18,2,'A+',10,'10-JUL-22');

SELECT * FROM Orders;
SELECT * FROM BloodBank;
