	create database casestudy2

	use casestudy2

	create table Locations(location_ID int Primary key,City Varchar(30))

	Insert into Locations values(122,'New York'), (123,'Dallas'), (124,'Chicago'),(167, 'Boston')

	select * from Locations

	CREATE TABLE Department (
    Department_Id INT PRIMARY KEY,
    Names VARCHAR(30),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Locations (Location_ID)
); 

insert into Department values(10,'Accounting',122),( 20,'Sales',124),(30,'Research',123),(40,'Operations',167)

select * from Department


create table job(Job_ID int Primary key, Designation varchar(30) not null)

insert into job values(667,'Clerk'),(668,'Staff'),(669, 'Analyst'),(670,'Sales Person'),(671,'Manager'),(672,'President')

select * from job

create table Employee(Employee_ID int,
Last_Name varchar(50) not null,
First_Name varchar(50) null,
Middle_Name varchar(50) not null,
Job_Id int,
foreign key(job_id) references job(Job_Id),
Hire_Date date not null,
Salary Decimal(10,2),
Comm Decimal(10,2),
Department_Id int,
Foreign key(Department_id) references Department(Department_id))

INSERT INTO Employee
VALUES
(7369, 'Smith', 'John', 'Q', 667, '17-Dec-84', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '20-Feb-85', 1600, 300, 30),
(755,  'Doyle', 'Jean', 'K', 671, '04-Apr-85', 285, NULL, 30),
(756,  'Dennis', 'Lynn', 'S', 671, '15-May-85', 2750, NULL, 30),
(757,  'Baker', 'Leslie', 'D', 671, '10-Jun-85', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '22-Feb-85', 1250, 50, 30);


--------Simple Queries:

------1. List all the employee details. 

select * from Employee

------2. List all the department details. 

select * from department

-----3. List all job details. 

select * from job

--------4. List all the locations. 

select * from Locations

------5. List out the First Name, Last Name, Salary, Commission for all Employees. 

select first_name,Last_name,salary,comm from Employee

--6List out the Employee ID, Last Name, Department ID for all employees with alias

select Employee_Id as 'ID of the Employee',Last_name as 'Name of the
Employee',Department_Id as 'Dep_id' from Employee

----7List out the annual salary of the employees with their names only

select First_name,Last_name,Salary *12 from Employee


------where clause


------1. List the details about "Smith".

select * from Employee where Last_Name = 'smith'

----2.List out the employees who are working in department 20

select * from Employee where Department_Id = '20'

--------3.List out the employees who are earning salary between 2000 and 3000.

select * from Employee where Salary between 2000 and 3000

----4.List out the employees who are working in department 10 or 20

select * from Employee where Department_Id = 10 or department_id = 20
					----or
select * from Employee where Department_Id in(10,20)

 ------5.Find out the employees who are not working in department 10 or 30

 Select * from Employee where Department_Id != 10 or Department_Id !=30
					------or
select * from Employee where Department_Id not in(10,30)

------6.List out the employees whose name starts with 'L'.

select * from Employee where first_name like 'L%'

------7.List out the employees whose name starts with 'L' and ends with 'E'

select * from Employee where first_name like 'L%E'

------8.List out the employees whose name length is 4 and start with 'J'.

select * from Employee where  first_name like 'J%' and len(first_name) = 4 

------9.List out the employees who are working in department 30 and draw the salaries more than 2500.

select * from Employee where Department_Id = 30 and Salary > 2500

------10.List out the employees who are not receiving commission.

select * from Employee where Comm is null



------ORDER BY Clause:

--------1.List out the Employee ID and Last Name in ascending order based on the Employee ID.

select Employee_ID,Last_name from Employee order by Employee_ID asc

------2. List out the Employee ID and Name in descending order based on salary.

select employee_Id,First_name,salary from Employee order by Salary desc

----3List out the employee details according to their Last Name in ascending-order

select * from Employee order by Last_Name asc

----4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

select * from Employee order by Last_Name asc,Department_id desc



--------GROUP BY and HAVING Clause:

------1. List out the department wise maximum salary, minimum salary and average salary of the employees.

select * from Employee

select 
Department_Id,
max(salary) as MaxSalary,
Min(salary) as MinSalary,
AVG(salary) as AvgSalary
from Employee
group by Department_Id


----2.List out the job wise maximum salary, minimum salary and average salary of the employees.

select 
job_id as Job,
Max(salary) as MaxSalary,
Min(salary) as MinSalary,
Avg(salary) as AvgSalary
from Employee
group by Job_Id

----3.List out the number of employees who joined each month in ascending order.

select 
hire_date,
month(hire_date) as month_name,
COUNT(*) as total_Employees
from Employee
group by Hire_Date
order by month_name asc

------4.List out the number of employees for each month and year in ascending order based on the year and month.

select
Hire_Date,
MONTH(hire_date) as join_month,
Year(hire_date) as join_year,
count(*) as total_employees
from Employee
group by Hire_Date
order by join_year asc,join_month asc

------5.List out the Department ID having at least four employees.

select
Department_Id
from Employee
group by Department_Id
having COUNT(*) >= 4

------6.How many employees joined in February month.

select 
Hire_Date,
MONTH(hire_date) as months,
count(*) as no_of
from Employee
group by Hire_Date
having month(Hire_Date) = 2 

select count(*) from employee where 
month(hire_date) = 2 

------7.How many employees joined in May or June month.

select 
Hire_Date,
MONTH(hire_date) as months,
count(*) as no_of
from Employee
group by Hire_Date
having month(Hire_Date) = 2 or MONTH(hire_date) = 5


select count(*) from Employee where month(hire_date) in (5,6)

------8. How many employees joined in 1985? 

select count(*) as number_of_emp from Employee where YEAR(hire_date) = 1985

------9.How many employees joined each month in 1985?

select
first_name,hire_date,
MONTH(hire_date) as month_Joined,
Year(hire_date) as Year_Joined
from Employee
group by first_name,hire_date
having YEAR(hire_date) = 1985

--------10. How many employees were joined in April 1985? 

select
Hire_Date,
month(hire_date) as MonthJoined,
year(hire_date) as YearJoined,
count(*) as no_of_emp_joined
from Employee
group by Hire_Date
having MONTH(hire_date) = 4 and YEAR(hire_date) = 1985

------11.Which is the Department ID having greater than or equal to 3 employees joining in April 1985?


select 
Department_Id,
count(*) no_of_emp
from Employee
where MONTH(hire_date) = 4
and year(hire_date) = 1985
group by Department_Id
having count(*) > = 3


------Joins: 

------1. List out employees with their department names. 

select * from Employee

Select * from Department

select * from Employee as e inner join Department as d on
e.Department_Id = d.Department_Id

select e.First_name,e.Department_Id,d.names from Employee as e inner join Department as d
on e.Department_Id = d.Department_Id

------2.Display employees with their designations.

select * from job

select * from Employee

select e.first_name,e.Job_Id,e.department_Id,j.Designation from Employee as e
inner join job as j on e.Job_Id = j.Job_ID


----3. Display the employees with their department names and city. 
select * from Employee

Select * from Department

select * from Locations

select e.First_Name,d.names,l.city from Employee as e inner join Department as d on e.Department_Id = d.Department_Id
inner join locations as l on d.location_ID = l.location_ID

 ------4.How many employees are working in different departments? Display with department names. 

 select * from Employee

 select * from Department

----step2
 select Department_Id,
 count(*) as no_of_emp
 from Employee
 group by Department_Id

 ---step3
 select d.names,
 count(*) as no_of_emp
 from Employee as e 
 inner join 
 Department as d 
 on e.Department_Id = d.Department_Id
 group by d.names

 --------5.How many employees are working in the sales department?
 
 select * from Employee

 select * from Department

 ------step2

 select d.Names,
 COUNT(*) as no_emp
 from Employee as e inner join Department as d 
 on e.Department_Id = d.Department_Id
 group by d.Names
 having d.Names = 'sales' 

 ------6.Which is the department having greater than or equal to 3 employees and display the department names in ascending order.

 select * from Employee

 select * from Department

 select d.Names,
 count(*) as no_of_emp
 from Employee as e inner join Department as d
 on e.Department_Id = d.Department_Id
 group by d.Names
 having count(*)>=3
 order by d.Names asc;

 ------7. How many employees are working in 'Dallas'? 

 select * from Employee
 select * from Department
 select * from Locations

 select * from Employee as e inner join Department as d 
 on e.Department_Id = d.Department_Id
 inner join Locations as l on d.Location_ID = l.location_ID
 where l.City = 'Dallas'

 select l.city, 
 count(*) as how_many_emp
 from Employee as e inner join Department as d 
 on e.Department_Id = d.Department_Id
 inner join Locations as l on d.Location_ID = l.location_ID
 group by l.city
 having l.City = 'dallas'

 --------8.Display all employees in sales or operation departments. 

 select * from Employee as e inner join Department as d on e.Department_Id = d.Department_Id
 where d.Names = 'sales' or d.Names = 'operations'


 ------Conditional Statements

 ----1. Display the employee details with salary grades. Use conditional statement to create a grade column. 

 select *,
 CASE
 when salary >= 2000 then 'High'
 when salary >= 1000 then 'Medium'
 else 'Low'
 end as Grades
 from Employee

  ------2.List out the number of employees grade wise. Use conditional statement to create a grade column.

select salary,
case
when salary >= 2000 then 'High'
when salary >= 1000 then 'Medium'
else 'low'
end as grades,
count(*) no_of_emp
from Employee
group by
case
when salary >= 2000 then 'High'
when salary >= 1000 then 'Medium'
else 'low'
end

select grade,count(*) as no_of_emp
from
(select salary,
case
when salary >= 2000 then 'High'
when salary >= 1000 then 'Medium'
else 'low'
end as grade
from employee) as t 
group by grade


------3.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

select First_name,Department_Id, salary,
case 
when salary >= 2000 then 'High'
when salary >= 1000 then 'Medium'
else 'low'
end
from Employee
where Salary between 2000 and 5000


------Subquery

--------1.Display the employees list who got the maximum salary. 

Select * from Employee where Salary >= (select AVG(salary) from Employee)

------2. Display the employees who are working in the sales department.

select * from Employee as e inner join Department as d
on e.Department_Id = d.Department_Id where d.Names = 'sales'

select * from Employee
where Department_Id = (select Department_Id from Department where Names ='sales');

----------3.Display the employees who are working as 'Clerk'

select * from Employee where Job_Id = (select Job_Id from job where Designation = 'Clerk')

--------4. Display the list of employees who are living in 'Boston'.

select * from Employee where Department_Id
=(select Department_Id from Department where Location_ID =(select Location_ID from Locations where City = 'Boston') )

------5. Find out the number of employees working in the sales department.

select COUNT(*) as no_of_emp  from Employee where Department_Id =(select Department_Id from Department where Names = 'sales')

----------6. Update the salaries of employees who are working as clerks on the basis of 10%.

update Employee
set Salary = Salary * 1.10 where Job_Id = (select Job_Id from job where Designation = 'clerk')

--------7. Display the second highest salary drawing employee details.

select * from Employee

select * from Employee where Salary = (select max(salary) from Employee where Salary < ( select max(salary) from Employee)) 

select salary, rank() over(order by salary desc) as ranks from Employee

with nthrank
as
(select salary , rank() over(order by salary desc) as ranks from Employee)
select * from nthrank where ranks = 2

with nthrank
as
(select salary , ROW_NUMBER() over (order by salary desc) as rnumm from Employee)
select * from nthrank where rnumm = 2

------8. List out the employees who earn more than every employee in department 30.

select * from Employee where Salary > 
all(select max(Salary) from Employee where Department_Id = 30)

------9. Find out which department has no employees. 

select * from Department
select * from Employee

select * from Department
where Department_Id not in(select Department_Id from Employee)



--------10. Find out the employees who earn greater than the average salary for their department.

select Salary
from Employee 
group by Salary
having Salary > (select AVG(salary) from Employee)

SELECT *
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE Department_Id = e.Department_Id
);

