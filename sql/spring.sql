--==============================================
-- 관리자계정
--==============================================
--spring계정 생성
alter session set "_oracle_script" = true;

create user spring
identified by spring
default tablespace users;

alter user spring quota unlimited on users;

grant connect, resource to spring;

--============================================
-- spring계정
--============================================
create table dev (
    no number,
    name varchar2(50) not null,
    career number not null,
    email varchar2(256) not null,
    gender char(1),
    lang varchar2(500) not null,
    constraint pk_dev_no primary key(no),
    constraint ck_dev_gender check(gender in ('M', 'F'))
);

create sequence seq_dev_no;






