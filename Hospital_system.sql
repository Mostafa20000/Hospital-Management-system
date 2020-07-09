create table tb_patient(
patient_id int primary key,
patient_fname nvarchar(50),
patient_lname nvarchar(50),
patient_age int,
patient_address nvarchar(50),
patient_phone int,
patient_email nvarchar(50)
);

create table tb_Doctor(
Doctor_id int primary key,
Doctor_fname nvarchar(50),
Doctor_lname nvarchar(50),
Doctor_specialization nvarchar(50)
);

create table tb_test(
test_id int primary key,
test_date date,
test_duration nvarchar(50),
test_reason nvarchar(50),
patient_id int foreign key references tb_patient(patient_id),
Doctor_id int foreign key references tb_Doctor(Doctor_id)
);

--INSERT STATEMENT

insert into tb_patient values(1,'ahmed','mohamed',40,'manshia street',01145390856,'ahmed@gmail.com');
insert into tb_patient values(2,'gamal','ismail',43,'gamal abdelnasr street 2',01239675849,'gamal@gmail.com');
insert into tb_patient values(3,'saber','fouda',20,'mandara mohamed atia street',01593776849,'saber@gmail.com');
insert into tb_patient values(4,'adham','gaber',33,'elsouq street',01205098234,'adham@gmail.com');
insert into tb_patient values(5,'abdelrhman','mohamed',15,'khalifa street',0344288,'abderhman@gmail.com');
insert into tb_patient values(6,'galal','anas',17,'napoli street',01146657934,'galal@gmail.com');
insert into tb_patient values(7,'yasser','momen',10,'asafra street 11',01223976587,'yasser@gmail.com');

select *from tb_patient


insert into tb_Doctor values(10,'fares','ahmed','dermatologists');
insert into tb_Doctor values(11,'saed','nagy','endocrinologists');
insert into tb_Doctor values(12,'Ali','khaled','cardiologists');
insert into tb_Doctor values(13,'ibrahem','tamer','allergists');
insert into tb_Doctor values(14,'gamal','morsy','anethesiologists');
insert into tb_Doctor values(15,'loay','elkady','emergency medicine specialists');
insert into tb_Doctor values(16,'ashraf','ahmed','internists');

select*from tb_Doctor

insert into tb_test values(20,'1-8-2020','1 week','suffer from hands',1,10);
insert into tb_test values(21,'2-8-2020','2 week','suffer from legs',2,11);
insert into tb_test values(22,'3-8-2020','3 week','suffer from skin',3,12);
insert into tb_test values(23,'4-8-2020','2 week','suffer from head',4,13);
insert into tb_test values(24,'5-8-2020','4 week','suffer from eyes',5,14);

select*from tb_test


--SELECT STATMENTS


--1-what is the usage of the NCHAR function?
SELECT NCHAR(65) AS NumberCodeToUnicode;
--2-how to know the number of position of any letter?
SELECT PATINDEX('o', 'doctor');
--3-what is the usage of the QUOTENAME function?
SELECT QUOTENAME('uyt');
--4-how to replace two letters in word?
SELECT REPLACE('mohamed', 'e', 's');
--5-how to reverse the letters of the word?
SELECT REVERSE('Fouda');
--6-what is the usage of the RIGHT function?
SELECT RIGHT('manshia', 3) AS ExtractString;
--7-what is the usage of the RTRIM function?
SELECT RTRIM('patient    ') AS RightTrimmedString;
--8-what is the usage of the SPACE function?
SELECT SPACE(17);
--9-what is the usage of the UNICODE function?
SELECT UNICODE('ibrahem');
--10-what is the usage of the UPPER function?
SELECT UPPER('suffer from hands');
--11-what is the usage of the ASCII function ?
SELECT ASCII(Doctor_fname) AS NumCodeOfFirstChar
FROM tb_Doctor;
--12-what is the usage of the CHAR function ?
SELECT CHAR(65) AS CodeToCharacter;
--13-how to know the position of any letter in any word?
SELECT CHARINDEX('t', 'patient') AS MatchPosition;
--14-how to contact between two words?
SELECT CONCAT('Ali', 'ibrahim');
--15-what is the usage of the DATALENGTH function?
SELECT DATALENGTH('suffer from nose');
--16-what is the usage of the DIFFERENCE function?
SELECT DIFFERENCE('ssed', 'gamal');
--17-how to shift left letters in the word?
SELECT LEFT('patient', 3) AS ExtractString;
--18-what is the usage of the LEN function?
SELECT LEN('suffer from eyes');
--19-how to make the letters of words lower?
SELECT LOWER('Ali');
--20-what is the usage of the LTRIM function?
SELECT LTRIM('     patient') AS LeftTrimmedString;


--SUP QUERY STATEMENT 


SELECT Doctor_fname FROM tb_Doctor WHERE Doctor_id in (SELECT Doctor_id FROM tb_test WHERE test_id >21)
SELECT patient_lname FROM tb_patient WHERE patient_id in (SELECT patient_id FROM tb_patient WHERE patient_id >2)
SELECT test_duration FROM tb_test WHERE test_id in (SELECT test_id FROM tb_patient WHERE patient_id >4)

select*from tb_Doctor
select*from tb_patient
select*from tb_test


-- DIFFERENT JOIN STATEMENT 


 SELECT  patient_fname, Doctor_lname
   FROM tb_patient
   INNER JOIN tb_Doctor
   ON tb_patient.patient_id = tb_Doctor.Doctor_id;

SELECT Patient_age, Doctor_specialization
   FROM tb_patient
   LEFT JOIN tb_Doctor
   ON tb_patient.patient_id = tb_Doctor.Doctor_id;

SELECT patient_phone, test_reason
  FROM tb_patient
  RIGHT JOIN tb_test
  ON tb_patient.patient_id = tb_test.test_id;

SELECT Patient_address, test_reason
  FROM tb_patient
  FULL JOIN tb_test
  ON tb_patient.patient_id = tb_test.test_id;


SELECT Doctor_fname,test_date
  FROM tb_Doctor,tb_test
  WHERE tb_Doctor.Doctor_id=tb_test.test_id


--COUNT AND GROUP STATEMENTS


--what is the number of patient ?
SELECT COUNT(patient_id)
  FROM tb_patient
--what is the number of doctor ?
SELECT COUNT(Doctor_id)
  FROM tb_Doctor

SELECT COUNT(patient_id),patient_fname
  FROM tb_patient
 GROUP BY patient_fname


--UPDATE STATEMENTS


UPDATE tb_patient
set patient_fname='yasser' where patient_id=1
UPDATE tb_Doctor
set Doctor_lname='hany' where Doctor_id=12
UPDATE tb_patient
set patient_address='kafr' where patient_id=3
UPDATE tb_test
set test_duration='5week' where test_id=21
UPDATE tb_Doctor
set Doctor_fname='kamal' where Doctor_id=13

select*from tb_Doctor
select*from tb_test
select*from tb_patient


--DELETE STATEMENTS


DELETE from tb_Doctor where Doctor_id=16
DELETE from tb_patient where patient_id=7
DELETE from tb_test where test_id=24
DELETE from tb_patient where patient_id=6
DELETE from tb_test where test_reason='suffer from head'

select*from tb_Doctor
select*from tb_test
select*from tb_patient