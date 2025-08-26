use sathyabama;

CREATE TABLE Workers (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Workers
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
select * from workers;

#=
select * from workers where department = 'hr';
select * from workers where first_name = 'vipul';
select first_name, last_name, salary from workers where salary = 500000;


#<=
select first_name, last_name, salary from workers where salary <= 80000;
select worker_id,first_name, salary from workers where salary <= 90000;
select first_name, joining_date from workers where joining_date <= '2014-04-11';
select worker_id, first_name, last_name from workers where worker_id <= 6;
#>=
select first_name, joining_date from workers where joining_date >= '2014-06-11';
select first_name, joining_date from workers where joining_date >= '2014-04-11';
select worker_id, first_name, last_name from workers where worker_id >= 6;
select worker_id,first_name, salary from workers where salary >= 90000;

#!=
select first_name, last_name, department from workers where department != 'hr';
select first_name, salary from workers where salary != 500000;
select first_name, last_name from workers where first_name != 'amitabh';



#and
select first_name, last_name, salary, department from workers where department = 'admin' and salary > 100000;
select first_name, last_name, salary, department from workers where department = 'hr' and salary < 800000;
select first_name, joining_date, department from workers where joining_date = '2014-02-20' and department = 'hr';
select first_name, last_name, salary, department from workers where salary >= 200000 and department != 'admin';


#or
select first_name, last_name, salary, department from workers where department = 'hr' or salary < 80000;
select first_name, last_name from workers where first_name = 'vivek' or last_name = 'singh';
select first_name, last_name, salary, department from workers where salary > 300000 or department = 'account';
select first_name, joining_date, salary from workers where joining_date = '2014-06-11' or salary = 100000;



#not
select first_name, last_name, department from workers where not department = 'hr';
select first_name, salary from workers where not salary > 100000;
select first_name, joining_date from workers where not joining_date = '2014-02-20';
select first_name, last_name from workers where not first_name = 'vivek';

#monthly salary
Select First_name, salary/12 as monthly_salary from worker;
Select first_name, salary*0.1 + salary as incremented_salary from worker;


select * from workers where first_name like '_____';

#1. employees in admin department with salary greater than 80000 and joined before 2014-06-11
select first_name, last_name, salary, department, joining_date
from workers
where department = 'admin' 
  and salary > 80000 
  and joining_date < '2014-06-11';

#2. employees whose salary is between 75000 and 200000, not in hr, and joined after 2014-01-20
select worker_id, first_name, last_name, salary, department, joining_date
from workers
where salary between 75000 and 200000
  and department != 'hr'
  and joining_date > '2014-01-20';


#3. employees whose salary is equal to the maximum salary in admin department
select first_name, last_name, salary, department
from workers
where department = 'admin'
  and salary = (
      select max(salary)
      from workers
      where department = 'admin'
  );

#4. employees whose salary is greater than average salary of hr department
select first_name, last_name, salary
from workers
where salary > (
      select avg(salary)
      from workers
      where department = 'hr'
);




#6. get department-wise average salary, only for departments where average is above 150000
select department, avg(salary) as avg_salary
from workers
group by department
having avg(salary) > 150000;


#in operator
select first_name, last_name, department from workers
where department in ('hr', 'admin');

select worker_id, first_name, last_name from workers
where worker_id in (1, 3, 5, 7);

#employees whose department is in the list of departments having avg salary > 150000
select first_name, last_name, salary, department from workers
where department in (
    select department
    from workers
    group by department
    having avg(salary) > 150000
);

#not in
select first_name, last_name, department from workers
where department not in ('hr', 'admin');

select worker_id, first_name, last_name from workers
where worker_id not in (2, 4, 6, 8);


#employees whose department is not in the list of departments having avg salary > 150000
select first_name, last_name, salary, department from workers
where department not in (
    select department
    from workers
    group by department
    having avg(salary) > 150000
);

#between
select first_name, last_name, salary from workers
where salary between 80000 and 200000;

select first_name, joining_date from workers
where joining_date between '2014-02-20' and '2014-06-11';

#employees whose worker_id is between 3 and 6 and department is admin
select worker_id, first_name, last_name, department from workers
where worker_id between 3 and 6
  and department = 'admin';

# Find workers not in HR or Admin with salary between 70000 and 300000.
select first_name, last_name, salary, department from workers
where department not in ('hr', 'admin') and salary between 70000 and 300000;

#2. Find workers with first name starting with 'V' and salary greater than or equal to 200000.
select first_name, last_name, salary, department from workers
where first_name like 'v%'
  and salary >= 200000;
  
 #3. Find workers not in Admin with salary < 100000.
 select first_name, last_name, salary, department from workers
 where department not in ('admin') and salary < 100000;
 
 
 # aggregate 
 #count
select count(*) as total_workers from workers;

#sum
select sum(salary) as total_salary from workers;

#Find total salary per department:
select department, sum(salary) as total_salary from workers
group by department;

#highest salary
select department, sum(salary) as total_salary from workers
group by department
order by total_salary desc;


#avg
select avg(salary) as average_salary from workers;

# find average salary per department
select department, avg(salary) as avg_salary from workers
group by department;

#min
select min(salary) as lowest_salary from workers;
select department,min(salary) as lowest_salary from workers where department='hr';

#max
select max(salary) as highest_salary from workers;


#1. Find the average salary in the Admin department.
select department, avg(salary) from workers where department='admin';

#2. Total salary for HR and Admin departments combined.
select sum(salary) from workers where department in ('hr','admin');



 #4. Count employees whose first name starts with 'V'.
 select count(first_name) from workers where first_name like 'v%';

#5. Total salary of employees with salary between 50000 and 200000.
select sum(salary) from worker where salary between 50000 and 200000;

#union
select first_name from worker 
union 
select last_name from worker;


select first_name from worker 
union 
select salary from worker;

#union all
select department from worker
union all
select salary from worker;

#case
select first_name, last_name, salary,
case 
    when salary >= 200000 then 'rich'
    when salary between 100000 and 199999 then 'middle'
    else 'poor'
end as salary_category
from workers;

select first_name, last_name, department,
case department
    when 'hr' then 'human resources'
    when 'it' then 'information technology'
    when 'admin' then 'administration'
    else 'others'
end as department_full
from workers;












