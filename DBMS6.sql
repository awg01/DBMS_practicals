/*Title: Write a PL/SQL block of code using parameterized Cursor that will merge the data available in the
newly created table with the data available in the table old table. If the data in the first table already exist in the
second table then that data should be skipped.*/

Create Table Provisional (Roll_No Int Primary Key , Name Varchar(15), Status Varchar(15));
Create Table Stud_Data (Roll_No Int Primary Key , Name Varchar(15), Status Varchar(15));
Create Table Result_Temp(Roll_No Int , Name Varchar(15), Status Varchar(15));

Insert Into Provisional Values(1,'Amit','Provisional');
Insert Into Provisional Values(3,'Gopal','Provisional');
Insert Into Provisional Values(4,'Rohan','Provisional');
Insert Into Provisional Values(5,'Meena','Provisional');
Insert Into Provisional Values(7,'Sonali','Provisional');

Insert Into Stud_Data Values(1,'Amit','Provisional');
Insert Into Stud_Data Values(2,'Ketan','Regular');
Insert Into Stud_Data Values(3,'Gopal','Provisional');
Insert Into Stud_Data Values(4,'Rohan','Provisional');
Insert Into Stud_Data Values(5,'Meena','Provisional');
Insert Into Stud_Data Values(6,'Sumit','Regular');



delimiter //
Create Procedure uniProc()
Begin
 # 1. Declare variables
 Declare sroll Integer;
 Declare sname Varchar(15);
 Declare sstatus Varchar(15);
 Declare noMoreRows int; -- used for denoting that cursor is empty or not (0-not empty, 1-empty)
  
 # 2. Cursor declare 
 Declare uniCur cursor for select Roll_No,Name,Status from (select * from Stud_Data UNION select * from Provisional) as T1;

 # 3. Exception handling 
 Declare continue handler for not found set noMoreRows = 1;
 Set noMoreRows = 0;

 # 4. Open Cursor
 Open uniCur;
 
 # 5. Use loop for fetching 
 fetch_loop:Loop
   # 6. Fetching values from cursor into local variable 
   Fetch uniCur into sroll,sname,sstatus;
   If noMoreRows 
   Then
     Leave fetch_loop;
   End If;

   # 7. Inserting local variable values table2
   Insert into Result_Temp Values(sroll,sname,sstatus); 
 End loop fetch_loop;
 Close uniCur;
End;
//

delimiter ;
Call uniProc();
