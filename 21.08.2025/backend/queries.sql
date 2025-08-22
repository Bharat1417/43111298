use sathyabama;
select * from cse;
UPDATE cse
SET cgpa = 7.20
WHERE roll_no = '43110635';
DELETE FROM cse
WHERE roll_no = '43110632';
ALTER TABLE cse
ADD year_of_study INT;
desc cse;
