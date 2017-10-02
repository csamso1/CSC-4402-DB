drop table ER;
drop table EP;
drop table PR;
drop table CR;
drop table EM;
drop table CM;

Create table CM
(	Division varchar(20),
	 DEPT  varchar(20), 
	 Budget integer,
	 primary key  (DEPT)
	);

create table EM 
	(ID  varchar(20),
	 Name varchar(20),
	 City varchar(20),
         DEPT  varchar(20),
         Salary integer,
	 primary key (ID)
	);
create table PR
        (Pnum  varchar(20),
         Director_id varchar(20),
         City   varchar(20),
         DEPT   varchar(20),
         primary key(Pnum)
         );
        
create table EP
      (Pnum varchar(20),
      ID    varchar(20),
      Hour  integer,
      primary key(Pnum, ID)
     );


 create table CR
    ( Cnum varchar(20),
      Title varchar(20),
      DEPT  varchar(20),
      Teacher_id varchar(20),
     primary key (Cnum)
   );       
create table ER
	(Cnum   varchar(20),
         ID		varchar(20),
	 Grade integer,
	 primary key (Cnum, ID)
);
