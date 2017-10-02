delete from ER;
delete from CR;
delete from EP;
delete from PR;
delete from EM;
delete from CM;

insert into CM values ('Finance', 'Accounting', 180000);
insert into CM values ('Finance', 'Marketing', 550000);
insert into CM values ('Operation', 'Production', 250000);
insert into CM values ('Operation', 'Research', 280000);

insert into EM values ('E1', 'John', 'Baton Rouge', 'Accounting', 78900);
insert into EM values ('E2', 'Johnson', 'Baton Rouge', 'Accounting', 72850);
Insert into EM values ('E3',   'Mary', 'New Orleans', 'Marketing', 67890);

Insert into EM values ('E4',   'Elizabeth', 'Lafayette', 'Marketing', 76840);
Insert into EM values ('E5',   'David', 'Baton Rouge', 'Marketing', 56500);
Insert into EM values ('E6',   'Eric', 'New Orleans', 'Marketing',  86500);
Insert into EM values ('E7',   'Richard', 'Houston', 'Marketing',  76500);
Insert into EM values ('E8',   'Robert', 'Memphis', 'Marketing',  56760);
Insert into EM values ('E9',   'Rose', 'Baton Rouge', 'Production',  66790);
Insert into EM values ('E10',   'Jasmin', 'Baton Rouge', 'Production',  79790);
Insert into EM values ('E11',   'Joseph', 'Atlanta', 'Production',  69250);
Insert into EM values ('E12',   'Matthew', 'New Orleans', 'Research',  82590);
Insert into EM values ('E13',   'Jonathan', 'Lafayette', 'Research',  85270);
Insert into EM values ('E14',   'James', 'Baton Rouge', 'Research',  69190);

Insert into PR values ('P1', 'E1', 'Baton Rouge',  'Accounting');
Insert into PR values ('P2', 'E6', 'Baton Rouge',  'Marketing');
Insert into PR values ('P3', 'E12', 'New Orleans',  'Research');
Insert into PR values ('P4', 'E13', 'Baton Rouge',  'Research');
Insert into PR values ('P5', 'E12', 'Baton Rouge',  'Research');
Insert into PR values ('P6', 'E7', 'Houston',  'Marketing');
Insert into EP values ('P1', 'E1', 30);
Insert into EP values ('P1', 'E2', 25);
Insert into EP values ('P1', 'E4', 10);
Insert into EP values ('P1', 'E10', 15);
Insert into EP values ('P1', 'E12', 10);
Insert into EP values ('P1', 'E14', 10);
Insert into EP values ('P2', 'E6', 35);
Insert into EP values ('P2', 'E4', 20);
Insert into EP values ('P3', 'E12', 30);
Insert into EP values ('P3', 'E14', 20);

Insert into EP values ('P3', 'E13', 10);
Insert into EP values ('P3', 'E5',17);
Insert into EP values ('P4', 'E12', 20);
Insert into EP values ('P4', 'E13', 25);
Insert into EP values ('P5', 'E6', 8);
Insert into EP values ('P5', 'E12',  28);
Insert into EP values ('P5', 'E13',  18);
Insert into EP values ('P6', 'E7', 36);
Insert into EP values ('P6', 'E10', 23);
Insert into EP values ('P6', 'E11', 26);
 Insert into EP values ('P6', 'E14', 27);

Insert into CR values ('C1', 'Database', 'Research', 'E12');
 Insert into CR values ('C2', 'Market Analysis', 'Marketing', 'E4');
Insert into CR values ('C3', 'Big Data', 'Research', 'E13');
Insert into CR values ('C4', 'Audit', 'Accounting', 'E2');
Insert into CR values ('C5', 'Cloud Computing', 'Research', 'E12');
Insert into ER values ('C1', 'E1', 89);
Insert into ER values ('C1', 'E2', 87);
Insert into ER values ('C1', 'E4', 93);
Insert into ER values ('C2', 'E3', 82);
Insert into ER values ('C2', 'E7', 80);
Insert into ER values ('C2', 'E6', 78);
Insert into ER values ('C3', 'E9',91);
Insert into ER values ('C3', 'E10',95);
Insert into ER values ('C3', 'E2', 94);
Insert into ER values ('C3', 'E14',91);
Insert into ER values ('C3', 'E4',  88);
Insert into ER values ('C4', 'E1', 71);
Insert into ER values ('C4', 'E7',  84);
Insert into ER values ('C4', 'E8',  77);
Insert into ER values ('C4', 'E10',  85);
Insert into ER values ('C4', 'E11',  95);
Insert into ER values ('C5', 'E1',  85);
Insert into ER values ('C5', 'E3',  79);
Insert into ER values ('C5', 'E10',  97);


