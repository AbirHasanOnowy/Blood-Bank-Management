

-- procedure to find out the order numbers and dates of a hospital --

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE getinfo (id Orders.H_Id%Type) IS

CURSOR order_list IS SELECT * FROM Orders WHERE H_Id = id;
each_order order_list%RowType;
BEGIN
	OPEN order_list;
		LOOP
			FETCH order_list INTO each_order;
			EXIT WHEN order_list%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('The date of the order no ' || each_order.Order_number || ' is '|| each_order.Order_date);
		END LOOP;
	CLOSE order_list;
END getinfo;
/
SHOW ERRORS

BEGIN
	getinfo(1);
END;
/





-- function to find out the total amount of blood ordered by a hospital --

SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION getamount (id Orders.H_Id%Type) RETURN Orders.Order_amount%Type IS

CURSOR order_list IS SELECT * FROM Orders WHERE H_Id = id;
each_order order_list%RowType;
amount Orders.Order_amount%Type := 0;  
BEGIN
	OPEN order_list;
		LOOP
			FETCH order_list INTO each_order;
			EXIT WHEN order_list%NOTFOUND;
			amount := amount + each_order.Order_amount;
		END LOOP;
	CLOSE order_list;
	RETURN amount;
END;
/
SHOW ERRORS


SET SERVEROUTPUT ON
BEGIN
	DBMS_OUTPUT.PUT_LINE('The total amount of blood ordered by Hospital no 1 is ' || getamount(1));
END;
/


