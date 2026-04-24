create database hackathon;
use hackathon;

create table Department (
	dept_id varchar(5) primary key,
    dept_name varchar(100) not null unique,
    location varchar(100) not null,
    manager_name varchar(50) not null
);

create table Employee (
	emp_id varchar(5) primary key,
    emp_name varchar(50) not null,
    dob date not null,
    email varchar(100) not null unique,
    phone varchar(15) not null unique,
    dept_id varchar(5) not null,
    foreign key(dept_id) references Department(dept_id)
);

create table Project (
	project_id varchar(5) primary key not null,
    project_name varchar (20) not null unique,
    start_date date not null,
    end_date date not null,
    budget decimal(10, 2) not null
);

create table Assignment (
	assignment_id int primary key auto_increment,
    emp_id varchar(5) not null,
    project_id varchar(5) not null,
    roles varchar(20) not null,
    hours_worked int not null,
	foreign key(emp_id) references Employee(emp_id),
	foreign key(project_id) references Project(project_id)
);

insert into Department (dept_id, dept_name, location, manager_name)
values ('D01', 'IT', 'Floor 5', 'Nguyen Van An'),
('D02', 'HR', 'Floor 2', 'Tran Thi Binh'),
('D03', 'Sales', 'Floor 1', 'Le Van Cuong'),
('D04', 'Marketing', 'Floor 3', 'Pham Thi Duong'),
('D05', 'Finance', 'Floor 4', 'Hoang Van Tu');

insert into Employee (emp_id, emp_name, dob, email, phone, dept_id)
values ('E001', 'Nguyen Van Tuan', '1990-01-01', 'tuan@gmail.com', '0901234567', 'D01'),
('E002', 'Tran Thi Lan', '1995-05-05', 'lan@gmail.com', '0902345678', 'D02'),
('E003', 'Le Minh Khoi', '1992-10-10', 'khoi@gmail.com', '0903456789', 'D03'),
('E004', 'Pham Hoang Nam', '1998-12-12', 'nam@gmail.com', '0904567890', 'D04'),
('E005', 'Vu Minh Ha', '1996-07-07', 'ha@gmail.com', '0905678901', 'D05');

insert into Project (project_id, project_name, start_date, end_date, budget)
values ('P001', 'Website Redesign', '2025-01-01', '2025-06-01', '50000.00'),
('P002', 'Mobile App Dev', '2025-02-01', '2025-08-01', '80000.00'),
('P003', 'HR System', '2025-03-01', '2025-09-01', '30000.00'),
('P004', 'Marketing Campaign', '2025-04-01', '2025-05-01', '10000.00'),
('P005', 'AI Research', '2025-05-01', '2025-12-31', '100000.00');

insert into Assignment (assignment_id, emp_id, project_id, roles,  hours_worked)
values (1, 'E001', 'P001', 'Developer', 150),
(2, 'E002', 'P001', 'Tester', 100),
(3, 'E003', 'P002', 'Tech Lead', 200),
(4, 'E004', 'P005', 'Data Scientist', 180),
(5, 'E005', 'P004', 'Content Creator', 50);

update Department
set location = 'Floor 10'
where dept_id = 'D01';

update Project
set budget = budget * 1.1,
    end_date = date_add(end_date, interval 1 month)
where project_id = 'P005';

delete from Assignment
where hours_worked = 0 or roles = 'Intern';

select emp_id, emp_name, email
from Employee
where dept_id = 'D01';

select project_name, start_date, budget
from Project
where project_name like '%System%';

select project_id, project_name, budget
from Project
order by budget desc;

select *
from Employee
order by dob asc
limit 3;

select project_id, project_name
from Project
limit 3 offset 1;

select a.assignment_id, e.emp_name, p.project_name, a.roles
from Assignment a
join Employee e on a.emp_id = e.emp_id
join Project p on a.project_id = p.project_id
where a.hours_worked > 100; 

select d.dept_id, d.dept_name, e.emp_name
from Department d
left join Employee e on d.dept_id = e.dept_id;

select p.project_name, SUM(a.hours_worked) as Total_Hours
from Project p
join Assignment a on p.project_id = a.project_id
group by p.project_name;















