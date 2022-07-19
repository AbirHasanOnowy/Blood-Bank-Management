create view donor_list as 
select did,donorname,blood_type,age from donor;

select * from donor_list;

update donor_list set donorname = 'simanto' where did = 8;
select * from donor_list;

delete from donor_list where did = 5;
select * from donor_list;

drop view donor_list;
select * from donor_list;