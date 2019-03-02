/*
  Assignment 5 Source Code
  1. Insert Student Records 
  2. Call Procedure
*/

DELIMITER //
    create procedure calcFine(roll int, sname varchar(15))
      begin 
	 #Declare variable for storing days
	 declare days integer;
	 
	 #Exception Handling
	 declare continue handler for not found
         begin 
	      select 'NOT FOUND';
         end;	

	 # Select difference betwen two dates
	 select DATEDIFF(curdate(), dIssue) into days from Borrower where roll_no = roll AND sname=name;
	 
	 #condition 1
	 if( days>15 && days<30 )
	  then 
       	     insert into Fine values(roll, curdate(), (days*5));
	 end if; 

	 #condition2 	 
	 if( days>30 )
          then   
             insert into Fine values(roll, curdate(), (days*50));
         end if;

	#kahihi zaal tri book return karnarach
        update Borrower set status='return' where roll_no = roll;
      end;	
//

DELIMITER ;
