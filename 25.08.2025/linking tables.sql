create database clglink;
use clglink;
create table college (
    cid int primary key,
    cname varchar(100) not null,
    affiliation varchar(100)
);
create table department (
    did int primary key,
    dname varchar(100) not null,
    cid int,
    foreign key (cid) references college(cid)
    on update cascade
	on delete cascade
);
create table student (
    sid int primary key,
    sname varchar(100) not null,
    rollno varchar(20) unique,
    did int,
    foreign key (did) references department(did)
    on update cascade
	on delete cascade
);
insert into college (cid,cname, affiliation) values
(101,'abc engineering college', 'anna university'),
(102,'xyz institute of technology', 'nijan'),
(103,'bbss college of science', 'sathyabama university');

insert into department (did,dname, cid) values
(110,'computer science', 101),
(120,'electronics', 102),
(130,'mechanical', 103);

insert into student (sid,sname, rollno, did) values
(001,'bharat', '43111298', 110),
(002,'nijanthan', '43111032', 120),
(003,'pankaj', '43111001', 130);