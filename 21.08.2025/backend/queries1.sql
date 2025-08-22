show databases;
use sathyabama;
CREATE TABLE cse (
    roll_no VARCHAR(20),
    name VARCHAR(100),
    cgpa DECIMAL(3,2)
);
INSERT INTO cse (roll_no, name, cgpa) VALUES
('43111298', 'Bharat P', 8.75),
('43110632', 'Nijanthan', 9.9),
('43110635', 'Pankaj', 6.0);
select * from cse;
alter table cse  add age int(3);
desc cse;
update cse set age=19 where roll_no=43110636;
select * from cse;
delete from cse where name="Pankaj";
INSERT INTO cse (roll_no, name, cgpa) VALUES ('43110636', 'Pan', 6.0);
update cse set name="Arun" where roll_no=43110636;
alter table cse drop column year_of_study;
select count(*) from cse ;
select cgpa from cse order by cgpa desc;