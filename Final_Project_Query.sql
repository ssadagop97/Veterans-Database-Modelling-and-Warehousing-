drop table Pay_Slip
drop table Bank_Details
drop table MVPPI_Veterans
drop table  Nominees
drop table MOPI
drop table Pension_Slab
drop table Allowance_Slab

CREATE TABLE Pension_Slab (
PenID NUMERIC(5,0) PRIMARY KEY,
Pension_Amount int NOT NULL,
last_update date
);

CREATE TABLE Allowance_Slab (
Allowance_ID NUMERIC(5,0) PRIMARY KEY,
Sub_types VARCHAR(300) NOT NULL,
Amount int not null,
last_update date
);

CREATE TABLE MOPI(
Service_ID NUMERIC(5,0) PRIMARY KEY,
Department_Serving VARCHAR(30) NOT NULL,
Commission_years NUMERIC(2,0) NOT NULL,
Commission_location VARCHAR(20) NOT NULL,
DoB date not null,
RetiredorMartyr_Flag NUMERIC(1,0) NOT NULL,
Retirement_DateorMartyr_Date Date ,
PayId NUMERIC(5,0) ,
AllowanceID NUMERIC(5,0) FOREIGN KEY REFERENCES Allowance_Slab( Allowance_ID),
last_update date
);

CREATE TABLE MVPPI_Veterans(
Veteran_ID NUMERIC(5,0) PRIMARY KEY,
SSN NUMERIC(10,0) NOT NULL,
Name VARCHAR(30) NOT NULL,
Department_Served VARCHAR(30) NOT NULL,
Commission_years NUMERIC(2,0) NOT NULL,
Commission_location VARCHAR(20) NOT NULL,
DoB date not null,
DoD date ,
Martyred_Flag NUMERIC(1,0) not null,
ServiceID  NUMERIC(5,0) FOREIGN KEY REFERENCES MOPI(Service_ID),
PenID NUMERIC(5,0) FOREIGN KEY REFERENCES Pension_slab (PenID),
AllowanceID NUMERIC(5,0) FOREIGN KEY REFERENCES Allowance_Slab( Allowance_ID),
last_update date
);


CREATE TABLE Nominees (
NomiID  NUMERIC(5,0) PRIMARY KEY,
Service_ID NUMERIC(5,0) FOREIGN KEY REFERENCES MOPI(Service_ID),
Name VARCHAR(30) NOT NULL,
SSN NUMERIC(10,0) NOT NULL,
Nominee_Status NUMERIC(1,0) NOT NULL,
last_update date
);

CREATE TABLE Bank_Details(
Veteran_ID NUMERIC(5,0) FOREIGN KEY REFERENCES MVPPI_Veterans(Veteran_ID),
NomiID  NUMERIC(5,0)  FOREIGN KEY REFERENCES Nominees(NomiId),
Self_acc_no NUMERIC(9,0) NOT NULL,
Nominee_acc_no NUMERIC(9,0) NOT NULL,
Self_IFSC_Code VARCHAR(10) NOT NULL,
Nominee_IFSC_Code VARCHAR(10) NOT NULL,
last_update date
CONSTRAINT Bank_Details_PK PRIMARY KEY (Veteran_ID, NomiID)
);
--CREATE TABLE Pay_Slip(
--PaySlipID NUMERIC(5,0) PRIMARY KEY,
--Year_on_Slip NUMERIC(1,0) NOT NULL,
--Month_on_Slip NUMERIC(1,0) NOT NULL,
--Veteran_ID NUMERIC(5,0)  FOREIGN KEY REFERENCES MVPPI_Veterans(Veteran_ID) ,
--PenID NUMERIC(5,0)  FOREIGN KEY REFERENCES Pension_Slab(PenID) ,
--AllownaceID NUMERIC(5,0)  FOREIGN KEY REFERENCES Allowance_Slab(Allowance_ID) ,
--Pension_Gross int not null,
--Allowance_Amount int not null,
--Deductions int not null,
--Total_Gross int not Null,
--Total_Net int not null,
--Payment_account_type numeric(1,0) not null,
--Payment_Account_Number int not null,
--last_update date
--);


INSERT INTO Pension_Slab VALUES (10001, 4500,getdate());
INSERT INTO Pension_Slab VALUES (10002, 2100, getdate() );
INSERT INTO Pension_Slab VALUES (10003,2200, getdate() );
INSERT INTO Pension_Slab VALUES (10004,2500, getdate() );
INSERT INTO Pension_Slab VALUES (10005,2500, getdate() );
INSERT INTO Pension_Slab VALUES (10006,3000, getdate() );
INSERT INTO Pension_Slab VALUES (10007,4500, getdate() );


INSERT INTO Allowance_Slab VALUES (1,'Cadre 1',50, getdate() );
INSERT INTO Allowance_Slab VALUES (2,'Cadre 2',60, getdate() );
INSERT INTO Allowance_Slab VALUES (3,'Cadre 3',70, getdate() );
INSERT INTO Allowance_Slab VALUES (4,'Cadre 4',80, getdate() );
INSERT INTO Allowance_Slab VALUES (5,'Cadre 5',90, getdate() );
INSERT INTO Allowance_Slab VALUES (6,'Cadre 6',100, getdate() );
INSERT INTO Allowance_Slab VALUES  (7,'Cadre 7',200, getdate() );
INSERT INTO Allowance_Slab VALUES  (8,'Unmarried Martyred + Cadre(1-3, getdate() )',300, getdate() );
INSERT INTO Allowance_Slab VALUES  (9,'Unmarried Martyred + Cadre(4-7, getdate() )',350, getdate() );
INSERT INTO Allowance_Slab VALUES  (10,'Widowed_Nominee+Cadre(1-3, getdate() )',500, getdate() );
INSERT INTO Allowance_Slab VALUES  (11,'Widowed_Nominee+Cadre(4-7, getdate() )',700, getdate() );
INSERT INTO Allowance_Slab VALUES (12,'Widowered_Nominee+Cadre(1-3, getdate() )',450, getdate() );
INSERT INTO Allowance_Slab VALUES (13,'Widowered_Nominee+Cadre(4-7, getdate() )',650, getdate() );




INSERT INTO MOPI VALUES (1101,'Medical',23,'Afghanistan','06-08-1978',1,'8-03-2009',1007,7, getdate() ); --Retired
INSERT INTO MOPI VALUES (1102,'Medical',20,'Afghanistan','08-09-1980',1,'09-17-2009',1007,6, getdate() ); --Retired
INSERT INTO MOPI VALUES (1103,'Medical',16,'Afghanistan','11-12-1988',0,NULL,1006,6, getdate() );
INSERT INTO MOPI VALUES (1104,'Medical',16,'Afghanistan','10-14-1985',0,NULL,1007,5, getdate() );
INSERT INTO MOPI VALUES (1201,'Stratergy',32,'Afghanistan','03-11-1965',1,'03-11-2015',1009,7, getdate() ); --Reitred
INSERT INTO MOPI VALUES (1202,'Stratergy',20,'Afghanistan','11-07-1980',0,NULL,1006,6, getdate() );
INSERT INTO MOPI VALUES (1203,'Stratergy',12,'Afghanistan','01-18-1988',0,NULL,1007,3, getdate() );
INSERT INTO MOPI VALUES (1204,'Stratergy',2,'Afghanistan','01-05-1995',1,'05-06-2014',1002,8, getdate() ); --Martyred
INSERT INTO MOPI VALUES (1301,'Armory',35,'Afghanistan','11-13-1962',1,'11-13-2017',1009,7, getdate() ); --Reitred
INSERT INTO MOPI VALUES (1302,'Armory',30,'Afghanistan','05-31-1968',0,NULL,1007,7, getdate() );
INSERT INTO MOPI VALUES (1303,'Armory',15,'Afghanistan','10-02-1986',1,'01-20-2015',1007,13, getdate() ); --Martyred
INSERT INTO MOPI VALUES (1304,'Armory',10,'Afghanistan','01-05-1995',1,'05-06-2014',1002,11, getdate() ); --Martyred

INSERT INTO MOPI VALUES (2101,'Medical',35,'Iraq','06-08-1967',1,'12-01-2019',1009,13, getdate() ); --Martyred
INSERT INTO MOPI VALUES (2102,'Medical',20,'Iraq','05-18-1980',0,NULL,1007,6, getdate() ); 
INSERT INTO MOPI VALUES (2103,'Medical',30,'Iraq','05-31-1968',1,'1-20-2012',1006,13, getdate() ); --Martyred
INSERT INTO MOPI VALUES (2104,'Medical',30,'Iraq','02-14-1973',0,NULL,1007,7, getdate() ); 
INSERT INTO MOPI VALUES (2201,'Stratergy',32,'Iraq','03-11-1965',1,'03-11-2015',1009,7, getdate() ); --Reitred
INSERT INTO MOPI VALUES (2202,'Stratergy',20,'Iraq','08-09-1981',0,NULL,1006,6, getdate() ); 
INSERT INTO MOPI VALUES (2203,'Stratergy',22,'Iraq','01-18-1988',1,'05-06-2016',1007,11, getdate() ); --Martyred
INSERT INTO MOPI VALUES (2204,'Stratergy',5,'Iraq','01-05-1995',0,NULL,1002,2, getdate() ); 
INSERT INTO MOPI VALUES (2301,'Armory',12,'Iraq','11-14-1992',0,null,1004,5, getdate() ); 
INSERT INTO MOPI VALUES (2302,'Armory',34,'Iraq','05-31-1968',1,'01-20-2015',1009,7, getdate() ); --Retired
INSERT INTO MOPI VALUES (2303,'Armory',3,'Iraq','11-12-1998',0,NULL,1007,3, getdate() );
INSERT INTO MOPI VALUES (2304,'Armory',5,'Iraq','4-13-1997',1,'05-02-2019',1003,9, getdate() ); --Martyred


INSERT INTO Nominees VALUES (10011, 1301, 'Shreyas Talpade',3248434 , 1, getdate() );
INSERT INTO Nominees VALUES (10012, 1301, 'Willam Wordsworth',332894 , 2, getdate() );
INSERT INTO Nominees VALUES (10021, 1201, 'Michael Scorcesse',313584 , 1, getdate() );
INSERT INTO Nominees VALUES (10031, 2201, 'Vicky kaushal',34328442 , 1, getdate() );
INSERT INTO Nominees VALUES (10041, 2101, 'Vignesh Matunga',3431284 , 1, getdate() );
INSERT INTO Nominees VALUES (10051, 1302, 'John Karsinki',324443184 , 2, getdate() );
INSERT INTO Nominees VALUES (10052, 1302, 'Michael Scott',33628344 , 1, getdate() );
INSERT INTO Nominees VALUES (10061, 2103, 'Draco Malfoy',3135354 , 1, getdate() );
INSERT INTO Nominees VALUES (10071, 2302, 'Harry Potter',34325564 , 1, getdate() );
INSERT INTO Nominees VALUES (10081, 2104, 'Kevin Malone',3431684 , 1, getdate() );
INSERT INTO Nominees VALUES (10091, 1101, 'Gerard Butler',326684 , 1, getdate() );
INSERT INTO Nominees VALUES (10101, 2102, 'Ayerton Senna',34584 , 1, getdate() );
INSERT INTO Nominees VALUES (10111, 1102, 'Big Show',324384 , 1, getdate() );
INSERT INTO Nominees VALUES (10112, 1102, 'Vince Gilligan',3233284 , 2, getdate() );
INSERT INTO Nominees VALUES (10121, 1202, 'Walter White',3431564 , 1, getdate() );
INSERT INTO Nominees VALUES (10131, 2202, 'Jesse Pinkman',34328432 , 1, getdate() );
INSERT INTO Nominees VALUES (10141, 1104, 'Alan Donald',34316544 , 1, getdate() );
INSERT INTO Nominees VALUES (10151, 1303, 'Ben Affleck',34312484 , 1, getdate() );
INSERT INTO Nominees VALUES (10161, 1203, 'kevin Spacey',34323244 , 1, getdate() );
INSERT INTO Nominees VALUES (10171, 2203, 'Pam Beesley',3431124 , 1, getdate() );
INSERT INTO Nominees VALUES (10181, 1103, 'Frank Underwood',343231284 , 1, getdate() );
INSERT INTO Nominees VALUES (10191, 2301, 'Michael Hussey',34354 , 1, getdate() );
INSERT INTO Nominees VALUES (10201, 2204, 'Gereard Pique',34312454 , 1, getdate() );
INSERT INTO Nominees VALUES (10211, 1204, 'Lou Vincent',34312543, 1, getdate() );
INSERT INTO Nominees VALUES (10221, 1304, 'Kelly kapur',3432321 , 1, getdate() );
INSERT INTO Nominees VALUES (10231, 2304, 'Ted Murphy',343123 , 1, getdate() );
INSERT INTO Nominees VALUES (10241, 2303, 'Ned Stark',343128 , 1, getdate() );
INSERT INTO Nominees VALUES (10242, 2303, 'Saul Goodman',312334 , 2, getdate() );
 
INSERT INTO MVPPI_Veterans VALUES  (1001,234242,'Girish Matunga', 'Medical',35,'Iraq', '1967-06-08','12-01-2019',1,2101,10007,13, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1002,234243,'Paul Murphy', 'Armory',5,'Iraq', '1997-04-13','2019-05-02',1,2304,10002,9, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1003,234244,'Priyanka Talpade', 'Armory',35,'Aghanistan', '1962-11-13',NULL,0,1301,10007,7, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1004,234254,'Jim Beesley', 'Stratergy',22,'Iraq', '1988-01-18','2016-05-06',1,2203,10006,11, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1005,234255,'Mahesh Kaushal', 'Stratergy',32,'Iraq', '1965-03-11',NULL,0,2201,10007,7, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1006,234256,'Jade Scorcesse', 'Stratergy',22,'Afghanistan', '1965-03-11',NULL,0,1201,10005,7, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1007,234257,'Kiara Affleck', 'Armory',15,'Afghanistan', '1986-10-02','2015-01-20',1,1303,10005,13, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1008,234261,'Albert Black Potter', 'Armory',34,'Iraq', '1968-05-31',NULL,0,2302,10006,7, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1009,234262,'Adam Kapur', 'Armory',10,'Afghanistan', '1995-01-05','2014-05-06',1,1304,10004,11, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1010,234259,'Drake Vincent', 'Stratergy',2,'Afghanistan', '1995-01-05',NULL,0,1204,10001,8, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1011,234260,'Narcissa Malfoy', 'Medical',30,'Iraq', '1968-05-31','2012-01-20',1,2103,10007,13, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1012,234263,'Lucas Giligan', 'Medical',20,'Afghanistan', '1980-08-09',NULL,0,1102,10005,6, getdate() );
INSERT INTO MVPPI_Veterans VALUES  (1013,234264,'Mark Butler', 'Medical',23,'Afghanistan', '1978-06-08',NULL,0,1101,10007,7, getdate() );

INSERT INTO Bank_Details VALUES (1003,10011,123456,42342,23423,54545, getdate() );
INSERT INTO Bank_Details VALUES (1005,10031,433420,39234,4324324,435, getdate() );
INSERT INTO Bank_Details VALUES (1006,10021,433423,392344,4314324,3345, getdate() );
INSERT INTO Bank_Details VALUES (1001,10041,1234256,452342,2234243,4524, getdate() );
INSERT INTO Bank_Details VALUES (1011,10061,1232334,2345,13434,1331, getdate() );
INSERT INTO Bank_Details VALUES (1008,10071,43220,546546,23321,43242, getdate() );
INSERT INTO Bank_Details VALUES (1013,10091,463420,3954,42345,65434, getdate() );
INSERT INTO Bank_Details VALUES (1012,10111,23451,86754,8767,87987, getdate() );
INSERT INTO Bank_Details VALUES (1004,10171,23423,543,65533,7656, getdate() );
INSERT INTO Bank_Details VALUES (1010,10211,345341,344324,534,3456, getdate() );
INSERT INTO Bank_Details VALUES (1009,10221,23435,21212,645,3432, getdate() );
INSERT INTO Bank_Details VALUES (1002,10231,254,341224,34,45534, getdate() );
INSERT INTO Bank_Details VALUES (1007,10151,54345,32412,1234,768534, getdate() );


drop table Pay_Slip
select row_number() over (partition by Year(getdate()), month(getdate()) order by Year(getdate()), month(getdate()), A.Veteran_ID)  as PaySlipID,
	   Year(getdate()) as Year_on_slip, month(getdate()) as Month_on_slip,
	   A.Veteran_ID , A.PenID, A.AllowanceID,
	   B.Pension_Amount as Pension_Gross , C.Amount as Allowance_Amount ,(B.Pension_Amount + C.Amount) as Total_Gross ,
	   0.3*(B.Pension_Amount + C.Amount)  as Deductions,0.7*(B.Pension_Amount +C.Amount) as Total_net , 
	   case when A.Martyred_Flag =1 then 'Nominee_Account' else 'Veteran_Account' end  as Payment_account_type,
	   case when A.Martyred_Flag =0 then D.self_acc_no else D.Nominee_acc_no end  as Payment_Account_Number
into Pay_Slip
from MVPPI_Veterans A
left join Pension_Slab B
on A.PenID= B.PenID
left join Allowance_Slab C
on A.AllowanceID=C.Allowance_ID
left join Bank_Details D
on A.Veteran_ID=D.Veteran_ID

select * from Pay_Slip
												
--Update Nominee must affect 