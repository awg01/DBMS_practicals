/*Title: Write a PL/SQL block of code using parameterized Cursor that will merge the data available in the
newly created table with the data available in the table old table. If the data in the first table already exist in the
second table then that data should be skipped.*/

Create Table Provisional (Roll_No Int Primary Key , Name Varchar(15), DOB Date, Status Varchar(15));
Create Table Stud_Data (Roll_No Int Primary Key , Name Varchar(15), DOB Date, Status Varchar(15));

Insert Into Provisional Values(1,'Amit','Provisional'),(3,'Gopal','Provisional'),(4,'Rohan','Provisional'),(5,'Meena','Provisional'),(7,'Sonali','Provisional');


Insert Into Stud_Data Values(1,'Amit','Provisional'),(2,'Ketan','Regular'),(3,'Gopal','Provisional'),(4,'Rohan','Provisional'),
(5,'Meena','Provisional'),(6,'Sumit','Regular');

Create Table Result_Temp(Roll_No Int , Name Varchar(15), Status Varchar(15));

delimiter //
Create Procedure BRN_CUR1()
Begin
Declare uRoll Integer;
Declare uName Varchar(15);
Declare uStat Varchar(15);

Declare numrows integer;
Declare noMoreRows int;

Declare Cur_BRN cursor for select * from (select * from Stud_Data UNION select * from Provisional);

Declare continue handler for not found set noMoreRows = 1;
Set noMoreRows = 0;

Set numRows = 0;

Open Cur_BRN;

Loop_Name:Loop
Fetch Cur_BRN into uRoll,uName,uStat;
If noMoreRows Then
Leave Loop_Name;
End If;

Set numrows=numrows+1;
Insert into Result_Temp Values(uRoll,uName,uStat);

End loop Loop_Name;

Close Cur_BRN;

End;
//

Call procedure BRN_CUR1()//
