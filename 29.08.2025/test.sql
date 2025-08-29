create database test;
use test;
CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select * from worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
select * from bonus;

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from title;
 
#INTERMEDIATE QNS
#11. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

#12. . Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) as no_of_emp_in_admin 
from worker 
where department = 'admin';


#13. Write an SQL query to fetch the no. of workers for each department in the descending order.
select count(*) as no_of_emp, department 
from worker 
group by department 
order by no_of_emp desc;

#14. Write an SQL query to print details of the Workers who are also Managers. (High Level)
select worker.* 
from worker 
join title  on worker.worker_id = title.worker_ref_id 
where title.worker_title = 'Manager';

#15. Write an SQL query to show only odd rows from a table.
select * from worker
where(worker_id%2 !=0);

#16. Write an SQL query to show the top 4 records of a table.
select * from worker 
limit 4;

#17. Write an SQL query to fetch the list of employees with the same salary. (High Level)
select salary, group_concat(first_name, ' ', last_name) as employees
from worker 
group by salary 
having count(*) > 1;

#18. Write an SQL query to show the second highest salary from a table.
select distinct salary 
from worker 
order by salary desc 
limit 1 offset 1;

#19. Write an SQL query to show one row twice in results from a worker table.
select * from worker where worker_id = 1
union all
select * from worker where worker_id = 1;

#20. Write an SQL query to fetch the first 50% records from a table. (without using limit and offset)
select * from worker 
where worker_id <= (select count(*)/2 from worker);

#21. Write an SQL query to fetch the departments that have less than five people in it.
select department, count(*) as no_of_emp from worker 
group by department 
having count(*) < 5;

#22. Write an SQL query to show all departments along with the number of people in there.
select department, count(*) as no_of_emp 
from worker 
group by department;

#23. Write an SQL query to show the last record from a table.
select * from worker 
order by worker_id desc 
limit 1;

#24. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, last_name from worker 
where salary = (select max(salary) from worker);
 
#25. Write an SQL query to print the name of employees having the highest salary in each department.
select max(salary), first_name from worker group by department, first_name;