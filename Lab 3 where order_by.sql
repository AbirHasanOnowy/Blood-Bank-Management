-- finding distinct bloodtypes from donor --
SELECT DISTINCT (Blood_type) FROM Donor;

-- finding donors with B+ blood type --
SELECT Did,DonorName FROM Donor WHERE Blood_type='B+';


-- finding donors with id between 3 and 6 --
SELECT Did,DonorName
FROM Donor
WHERE Did BETWEEN 3 AND 6;


-- finding donors without A+ and B+ blood type --
SELECT Did,DonorName
FROM Donor
WHERE Blood_type NOT IN ('B+','A+');


-- finding hospitals where Hospitalname is starting with Khulna --
SELECT H_Id,Hospitalname,Address
FROM Hospitals
WHERE Hospitalname LIKE 'Khulna%';


-- showing donors by their id in decresing order --
SELECT Did,DonorName
FROM Donor
ORDER BY Did desc;
