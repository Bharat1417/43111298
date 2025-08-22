use sathyabama;
CREATE TABLE practice2 (
    name VARCHAR(100),
    age INT,
    occupation VARCHAR(100),
    state VARCHAR(100)
);
INSERT INTO practice2 (name, age, occupation, state)
VALUES
('Arun', 28, 'Software Engineer', 'Tamil Nadu'),
('Sharma', 34, 'Doctor', 'Maharashtra'),
('Rahul', 22, 'Student', 'bihar'),
('Kumar', 29, 'Teacher', 'Telangana'),
('Vikram', 41, 'Businessman', 'Rajasthan');
select * from practice2;
alter table practice2 add country varchar(10) default "India";
select * from practice2;
select name, occupation from practice2 where age<=30;
update practice2 set age=age+1;
select * from practice2;
alter table practice2 rename column country to Nationality;
START TRANSACTION;
UPDATE practice2 
SET occupation = 'Senior Software Engineer' 
WHERE name = 'Arun';
select * from practice2;
SAVEPOINT sp1;
UPDATE practice2 
SET occupation = 'Surgeon' 
WHERE name = 'Sharma';
select * from practice2;
ROLLBACK TO sp1;
select * from practice2;
COMMIT;
SELECT * FROM practice2;
