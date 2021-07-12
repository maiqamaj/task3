-- query 1 
-- " return all job title that minimum salary is more that 5000 "
select job_title,min_salary from dbo.jobs where min_salary>5000;

-- query 2 
-- " return total salary for IT employess "
select departments.department_name,sum(salary) as "Total Salary for IT "from departments inner join employees on department_name='IT' group by department_name;

-- query 3 
-- report explin the total salary for each department in country 
select c.country_name,sum(e.salary) as "Total Salary"
from  locations l 
inner join departments d on d.location_id=l.location_id
inner join employees e on d.department_id=e.department_id
inner join countries c on c.country_id=l.country_id
group by c.country_name;


------------------------------------- 7 business query ----------------------------------------------------
-- query 1
-- return name and phone of each employee in United States of America
select c.country_name,e.first_name,e.last_name,e.phone_number
from  locations l 
inner join departments d on d.location_id=l.location_id
inner join employees e on d.department_id=e.department_id
inner join countries c on c.country_name='United States of America';

-- qyery 2 
-- return all information for each emmployee that hire year is 1994
select * from employees where year(hire_date)='1994';

-- query 3
-- retrun first name and last name and email and phone for each employee in job Programmer
select e.first_name,e.last_name,e.email,e.phone_number from jobs j 
inner join employees e on e.job_id=j.job_id 
where j.job_title='Programmer'

-- query 4 
-- return all information dependents for employee 'Steven King'
select d.first_name,d.last_name,d.relationship from employees e 
inner join dependents d on d.employee_id=e.employee_id 
where e.first_name='Steven' and e.last_name='King'


-- query 5 
-- return names of employee there manager is 'Dan Raphaely'
select e1.first_name,e1.last_name from employees e 
inner join employees e1 on e1.manager_id=e.employee_id 
where e.first_name='Den' and  e.last_name='Raphaely'


--query 6
-- return number of employee for each country
select c.country_name,count(e.employee_id) as "Number of Employee"
from  locations l 
inner join departments d on d.location_id=l.location_id
inner join employees e on d.department_id=e.department_id
inner join countries c on c.country_id=l.country_id
group by c.country_name;


--query 7
-- return number of employee and total salary  for each job 
select j.job_title,count(e.job_id) as "Number of Employee",sum(e.salary) as "Total of Salary" from jobs j 
inner join employees e on e.job_id=j.job_id 
group by j.job_title




