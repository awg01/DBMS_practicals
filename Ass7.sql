use ass7;
Database changed
mysql> Create Table Stud_Marks(Roll_No Int,Name Varchar(15),Total_Marks Int);
Query OK, 0 rows affected (1.65 sec)

mysql> Create Table result(Roll_No Int,Class Varchar (15));
Query OK, 0 rows affected (0.48 sec)

mysql> insert into Stud_Marks values(101,"sneha",830);
Query OK, 1 row affected (0.08 sec)

mysql> insert into Stud_Marks values(102,"sneha",900);
Query OK, 1 row affected (0.09 sec)

mysql> insert into Stud_Marks values(103,"sneha",100);
Query OK, 1 row affected (0.03 sec)

mysql> delimiter //
       Create Procedure Pro_Grade()
       Begin
        Declare rno Int;
     	Declare tmarks Int;
      	Declare noMoreRows int;
      	
       Declare Grade_Check cursor for select Roll_No,Total_Marks from Stud_Marks ;
	
        Declare continue handler for not found set noMoreRows = 1;
        Set noMoreRows = 0;
      
        Open Grade_Check;
      
        fetch_loop:Loop
          Fetch Grade_Check into rno,tmarks;
          If noMoreRows Then
           Leave fetch_loop;
          End If;
      
         If (tmarks>=990 && tmarks<=1500)
         Then
      	    Insert into result values(rno,'Distinction');
         End If;
      
         If(tmarks>=900 && tmarks<=989)
         Then
            Insert Into result values(rno,'First Class');
         End If;
      
         If(tmarks>=825 && tmarks<=899)
         Then
            Insert Into result values(rno,'Higher Sec.Class');
         End If;
      
       End loop fetch_loop;
      Close Grade_Check;
      End;
      //


mysql> Call Pro_Grade()//
Query OK, 0 rows affected (0.19 sec)

mysql> select * from result;
      //
+---------+-----------------+
| Roll_No | Class           |
+---------+-----------------+
|     101 | Higher Sec.Clas |
|     102 | First Class     |
+---------+-----------------+
2 rows in set (0.00 sec)

mysql> select * from Stud_Marks;
      //
+---------+-------+-------------+
| Roll_No | Name  | Total_Marks |
+---------+-------+-------------+
|     101 | sneha |         830 |
|     102 | sneha |         900 |
|     103 | sneha |         100 |
+---------+-------+-------------+
3 rows in set (0.00 sec)

mysql> 

