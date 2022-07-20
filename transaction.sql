savepoint old;


INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(21,3,'B+',2,'06-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(22,5,'A-',5,'07-JUL-22');
INSERT INTO Orders (Order_number,H_Id,Blood_type,Order_amount,Order_date) values(23,2,'A+',10,'07-JUL-22');

select * from Orders;

rollback to old;

select * from Orders

