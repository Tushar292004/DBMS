create table CUSTOMER2 (ID int, NAME varchar(20), AGE int, ADDRESS varchar(20), SALARY decimal(18,2));
INSERT INTO CUSTOMER2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES (7, 'praveen', 23, 'sist', 20500.00 );
INSERT INTO CUSTOMER2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES (9, 'raju', 25, 'tcs', 8500.00 );
INSERT INTO CUSTOMER2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES (15, 'ragu', 35, 'sist', 9500.00 );
select * from CUSTOMER2;

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON CUSTOMER2
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
   sal_diff number;
BEGIN
   sal_diff := :NEW.salary - :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary);
   dbms_output.put_line('New salary: ' || :NEW.salary);
   dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/

UPDATE customer2  
SET salary = salary + 500  
WHERE id = 7