create database score_st;
use score_st;

create table students(
student_id varchar(10) primary key,
full_name varchar(100) not null,
birth_year int not null,
gender varchar(10) not null,
score decimal (4,2) not null
);

insert into students
(student_id, full_name, birth_year, gender, score)
values
('SV001', 'Nguyen Van A', 2000, 'Nam', 8.5),
('SV002', 'Vo Thi B', 2001, 'Nu', 7),
('SV003', 'Trinh Van C', 2002, 'Nam', 9.25),
('SV004', 'Pham Thi D', 2000, 'Nu', 6.75),
('SV005', 'Than Van E', 2001, 'Nam', 8.5);

-- mã sinh viên + họ tên viết hoa
select student_id,
    upper(full_name) as full_name
from students;

-- họ tên + tuổi
select full_name,
    year(curdate()) - birth_year as age
from students;

-- điểm trung bình làm tròn 1 chữ số
select student_id,full_name,
    round(score, 1) as score
from students;


-- tổng số SV + điểm cao nhất + điểm thấp nhất
select
    count(*) as total_students,	
    max(score) as highest_score,
    min(score) as lowest_score
from students;