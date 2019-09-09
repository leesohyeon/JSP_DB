drop table member;
create table member(
id varchar(20) not null primary key,
passwd varchar(20) not null,
name varchar(20) not null,
reg_date datetime not null
);

select * from member;

show tables;