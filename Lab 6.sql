
-- Normal join operation --

-- joining Blood and Donor table via Donor id --
SELECT b.Code,d.Did,d.Donorname,b.Donation_date FROM Blood b,Donor d
WHERE b.Did = d.Did
ORDER BY b.Code;

-- joining Blood and Donor table via Donor id --
SELECT b.Code,Did,d.Donorname,b.Donation_date FROM Blood b JOIN Donor d
USING (Did)
ORDER BY b.Code;


-- joining Blood and Donor table via Donor id --
SELECT b.Code,b.Did,d.Donorname,b.Donation_date FROM Blood b JOIN Donor d
ON b.Did = d.Did
ORDER BY b.Code;

-- finding out total amount of orders of each hospital that has atleast 1 order for blood --
SELECT H_Id,h.Hospitalname,SUM(o.Order_amount) 
FROM Orders o JOIN Hospital h
USING (H_Id)
GROUP BY H_Id,h.Hospitalname
ORDER BY H_Id;

-- this time by natural join --
SELECT b.Code,Did,d.Donorname,b.Donation_date 
FROM Donor d NATURAL JOIN Blood b 
ORDER BY b.Code;


-- note --
-- natural join makes join based on only those columns which has same name on both table 
-- if there is more than 1 column than it will join based on all of those columns 


-- cross join between Blood bank and Hospital --
SELECT * FROM Bloodbank CROSS JOIN Hospital;


-- inner join is exactly same as join --



-- finding out the order description of each hospital using left outer join --
SELECT * FROM Hospital LEFT OUTER JOIN Orders
USING (H_Id)
ORDER BY H_Id;


-- finding out donation description of each donor using right outer join --
SELECT Did,Donorname,Blood_type,Code,Donation_date
FROM Blood RIGHT OUTER JOIN Donor
USING (Did,Blood_type)
ORDER BY Did;

-- full outer join --
SELECT * FROM Blood FULL OUTER JOIN Donor
USING (Did,Blood_type);

-- finding other donors of same blood type by doing self join --
SELECT a.Did,a.Donorname,a.Blood_type,b.Did,b.Donorname
FROM Donor a LEFT OUTER JOIN Donor b
ON a.Blood_type = b.Blood_type and a.Did != b.Did;
