/*
 Assignment 7 Source Code
 1. Create Stud_Marks table and Result Table
 2. Insert values into Stud_Marks
 3. Call Procedure
*/
create table Stud_Marks(rollno int(3), name varchar(30), total_marks int(3));
create table Result(rollno int(3),class varchar(30));

insert into Stud_Marks values(1, 'Student1', 850);
insert into Stud_Marks values(2, 'Student2', 925);
insert into Stud_Marks values(3, 'Student3', 1499);

delimiter //
  create procedure Pro_Grade()
   begin
    # Declare variables for storing rollno and marks and loop values
    declare rno integer;
    declare tmarks integer;
    declare noMoreRows integer;
   
    # Cursor declaration 
    declare grCur cursor for select rollno, total_marks from Stud_Marks;
    
    # Exception handling
    declare continue handler for not found set noMoreRows = 1;
    Set noMoreRows = 0;
      
    # Open a cursor
    open grCur; 

    # fetch records from cursor with the help of loop
    fetchloop:loop
      fetch grCur into rno, tmarks;
    if noMoreRows 
    then 
      leave fetchloop;
    end if;

    # compare conditions
    if(tmarks<=1500 && tmarks>=990)
    then 
      insert into Result values(rno, "Distinction");
    end if;  

    if(tmarks>=900 && tmarks<=989)
    then 
      insert into Result values(rno, "First Class");
    end if;  

    if(tmarks>=825 && tmarks<=899)
    then 
      insert into Result values(rno, "Higher Second Class");
    end if;  

    # end loop
    end loop fetchloop;

    # close cursor
    close grCur;
  end; //
delimiter ;

call Pro_Grade;
select * from Result;
