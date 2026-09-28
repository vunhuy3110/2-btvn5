create database qly_nhan_vien;
use qly_nhan_vien;

create table employees (
    emp_id int primary key,
    full_name varchar(100) not null,
    department varchar(100) not null,
    salary decimal(15,2) not null
);

insert into employees
(emp_id, full_name, department, salary)
values
(1, 'Nguyen Van A', 'IT', 15000000),
(2, 'Tran Thi B', 'IT', 13000000),
(3, 'Hoang Van C', 'HR', 10000000),
(4, 'Nguyen Van D', 'Sales', 9000000),
(5, 'Pham Van E', 'MH', 14000000),
(6, 'Ho Thi F', 'Accounting', 15000000);

-- mỗi phòng ban có bao nhiêu nhân viên
select department, count(*) as total_employees
from employees
group by department;

-- lương trung bình của từng phòng ban
select department, avg(salary) as average_salary
from employees
group by department;

-- phòng ban có trên 3 nhân viên
select department, count(*) as total_employees
from employees
group by department
having count(*) > 3;

-- phòng ban có lương trung bình > 12.000.000
SELECT department, AVG(salary) AS average_salary
from employees
group by department
having avg(salary) > 12000000;