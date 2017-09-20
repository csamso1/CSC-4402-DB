/* create table statments */
create table patient
	(Pnum varchar(20),
	Pname varchar(20),
	City varchar(20),
	Street varchar(20),
	Age smallint,
	Primary_Dnum varchar(20),
	primary key (Pnum));

create table doctor
	(Dnum varchar(20),
	Dname varchar(20),
	City varchar(20),
	Street varchar(20),
	Speciality varchar(20),
	primary key (Dnum));

create table visit
	(Pnum varchar(20),
	Dnum varchar(20),
	Date varchar(20),
	Bill_Amount smallint,
	Paid_Amount smallint,
	primary key (Date, Pnum, Dnum));

/* insert statments */

insert into doctor (Dnum, Dname, City, Street, Speciality) values (001, 'Dr. Hill', 'Baton Rouge', 'Perkins Rd.', 'Ear Nose and Throat');
insert into doctor (Dnum, Dname, City, Street, Speciality) values (002, 'Dr. Miller', 'New Orleans', 'Canal St.', 'Bone and Joint');
insert into doctor (Dnum, Dname, City, Street, Speciality) values (003, 'Dr. Stevens', 'Shreveport', 'College St.', 'Cardio');
insert into doctor (Dnum, Dname, City, Street, Speciality) values (004, 'Dr. Langley', 'Lafayette', 'Hwy 51', 'Pulmonology');

insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (001, 'Clayton Samson', 'Baton Rouge', 'Mancuso Ln.', 25, 001);
insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (002, 'Leighton Firnberg', 'New Orleans', 'Poydras St.', 24, 002);
insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (003, 'Sean Marino', 'Lafayette', 'I-10', 23, 003);
insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (004, 'Grammy', 'Baton Rouge', 'Route 66', 85, 003);
insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (005, 'Nancy', 'Atlanta', 'Senic Hwy', 60, 004);
insert into patient (Pnum, Pname, City, Street, Age, Primary_Dnum) values (006, 'Zach', 'Baton Rouge', 'I-12', 23, 004);

insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (001, 001, '9/10/2017', 200, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (002, 002, '9/12/2017', 150, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (003, 003, '9/14/2017', 300, 100);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (003, 003, '9/15/2017', 100, 100);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (003, 003, '9/16/2017', 200, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (004, 003, '8/16/2017', 200, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (004, 002, '8/16/2017', 200, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (004, 001, '8/16/2017', 200, 150);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (002, 003, '9/19/2017', 400, 200);
insert into visit (Pnum, Dnum, Date, Bill_Amount, Paid_Amount) values (006, 001, '9/20/2017', 200, 200);

select distinct visit.Dnum, Dname from patient, doctor, visit
where patient.Pnum = visit.Pnum and doctor.Dnum = visit.Dnum and Speciality='Cardio' and patient.City='Lafayette'
group by visit.Dnum, Dname, visit.Pnum
having count(*) >= 3;

select patient.Pnum, Pname, count (distinct visit.Dnum) as num_doctors, sum(Bill_Amount - Paid_Amount) as amt_owed from patient, visit, doctor
where patient.Age >= 80 and patient.City = 'Baton Rouge'
order by amt_owed desc;

select distinct visit.Pnum, visit.Dnum from visit
join doctor on visit.Dnum=doctor.Dnum
join patient on visit.Pnum=patient.Pnum
where doctor.City<>patient.City;

select distinct patient.Pnum from patient, doctor, visit
where patient.City='Baton Rouge' or doctor.City='Baton Rouge' and visit.Bill_Amount > 400;

/* working on #5 */
select doctor.Dnum, Dname from doctor, patient, visit
where patient.Pnum=visit.Pnum and doctor.Dnum=visit.Dnum and patient.City=doctor.City
having count(distinct visit.Pnum) >= 3;

select doctor.Dnum, Dname from doctor
join visit on visit.Dnum=doctor.Dnum
join patient on visit.Pnum=patient.Pnum
having count(distinct visit.Dnum) >= 3;

select distinct visit.Pnum, visit.Dnum from visit
join doctor on visit.Dnum=doctor.Dnum
join patient on visit.Pnum=patient.Pnum
having count(distinct doctor.City=patient.City) >= 3;

select doctor.Dnum, Dname from (select visit.Dnum, Dname count(distinct Pnum) from visit, doctor, patient
where doctor.City=patient.City
group by visit.Dnum);

/* correct answer for #5 */
select doctor.Dnum, Dname
from doctor, patient, visit
where patient.Pnum=visit.Pnum and doctor.Dnum=visit.Dnum and patient.City=doctor.City
having count(distinct visit.Pnum) >3;
/* end #5 */

/* #6, this works */
select distinct Pnum, Pname, patient.City from patient, doctor
where patient.Primary_Dnum=(select Dnum from doctor where Speciality='Pulmonology');

/* #7 this works */
select doctor.Dnum, Dname from doctor, patient, visit
where visit.Dnum=doctor.Dnum and visit.Pnum=patient.Pnum and patient.age > 35;