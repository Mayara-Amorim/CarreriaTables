-- drop table T_CSU_USER;

-- drop table T_CSU_ACHIEVEMENT;

-- drop table T_CSU_USER_ACHIEVEMENT;

-- drop table T_CSU_CONTENT;

-- drop table T_CSU_JOB_CONTENT;

-- drop table T_CSU_INTEREST;





create table T_CSU_USER(
id number (6),
nm_name varchar2 (30),
nm_last_name varchar2 (30),
email varchar2 (30)
password varchar2 (30),
dt_register date
);

create table T_CSU_ACHIEVEMENT(
id number (6),
nm_title varchar2(30)
);

create table T_CSU_JOB(
id number (6),
nm_name varchar2 (30),
nr_yearly_market_demand number (12),
nr_average_wage number (12),
nr_satisfaction_score number (12)
);

create table T_CSU_USER_ACHIEVEMENT(
id number (6),
cd_user number (6),
cd_achievement number (6)
);

create table T_CSU_JOB_CONTENT(
id number (6),
cd_content number(6),
);

create table T_CSU_CONTENT(
id number (6),
nm_title varchar2 (30),
uri_thumb varchar2 (100),
uri_content varchar2 (100)
);

create table T_CSU_INTEREST(
id number (6),
cd_user number(6),
cd_content number(6),
date_interest date,
isLiked number(1)
);


alter table T_CSU_USER add constraint user_id_pk 
primary key (id);

alter table T_CSU_ACHIEVEMENT add constraint achievement_id_pk 
primary key (id);

alter table T_CSU_JOB add constraint job_id_pk 
primary key (id);

alter table T_CSU_USER_ACHIEVEMENT add constraint user_achievemen_id_pk 
primary key (id);

alter table T_CSU_JOB_CONTENT add constraint job_content_id_pk 
primary key (id);

alter table T_CSU_INTEREST add constraint interest_id_pk 
primary key (id);

alter table T_CSU_CONTENT add constrait content_id_pk
primary key (id);


-- criando as FKs

alter table T_CSU_USER_ACHIEVEMENT create add constraint user_achievement_id
foreign key (cd_user) references T_CSU_USER (id);

alter table T_CSU_USER_ACHIEVEMENT create add constraint achiev_achievement_id
foreign key (cd_achievement) references T_CSU_ACHIEVEMENT (id);


alter table T_CSU_JOB_CONTENT create add constraint job_content_id
foreign key (cd_job) references T_CSU_JOB (id);

alter table T_CSU_JOB_CONTENT create add constraint cont_content_id
foreign key (cd_job) references T_CSU_CONTENT (id);


alter table T_CSU_INTEREST create add constraint user_interest_id
foreign key (cd_user) references T_CSU_USER(id);

alter table T_CSU_INTEREST create add constraint content_interest_id
foreign key (cd_content) references T_CSU_CONTENT(id);

-- CRIACAO DE SEQUENCE AUTOMATICA POR TRIGGERS

-- drop sequence SQ_CSU_USER;
	create sequence SQ_CSU_USER;

create or replace trigger tg_user_sq
before insert on T_CSU_USER
for each row
declare
	v_id_user T_CSU_USER.ID%TYPE;

begin
	select T_CSU_USER.nextval into v_id_user from dual;
	:new.id :=v_id_user;

end;


-- drop sequence SQ_CSU_ACHIEVEMENT;
	create sequence SQ_CSU_ACHIEVEMENT;

create or replace trigger tg_achievement_sq
before insert on T_CSU_ACHIEVEMENT
for each row
declare
	v_id_achievement T_CSU_ACHIEVEMENT.ID%TYPE;

begin
	select T_CSU_ACHIEVEMENT.nextval into v_id_achievement from dual;
	:new.id :=v_id_achievement;

end;


-- drop sequence SQ_CSU_JOB;
	create sequence SQ_CSU_JOB;

create or replace trigger tg_job_sq
before insert on T_CSU_JOB
for each row
declare
	v_id_job T_CSU_JOB.ID%TYPE;

begin
	select T_CSU_JOB.nextval into v_id_job from dual;
	:new.id :=v_id_job;
end;


-- drop sequence SQ_CSU_USER_ACHIEVEMENT;
	create sequence SQ_CSU_USER_ACHIEVEMENT;

create or replace trigger tg_user_achievement_sq
before insert on T_CSU_USER_ACHIEVEMENT
for each row
declare
	v_id_user_achievement T_CSU_USER_ACHIEVEMENT.ID%TYPE;

begin
	select T_CSU_USER_ACHIEVEMENT.nextval into v_id_user_achievement from dual;
	:new.id :=v_id_user_achievement;
end;


-- drop sequence SQ_CSU_CONTENT;
	create sequence SQ_CSU_CONTENT;

create or replace trigger tg_content_sq
before insert on T_CSU_CONTENT
for each row
declare
	v_id_content T_CSU_CONTENT.ID%TYPE;

begin
	select T_CSU_CONTENT.nextval into v_id_content from dual;
	:new.id :=v_id_content;
end;


-- drop sequence SQ_CSU_JOB_CONTENT;
	create sequence SQ_CSU_JOB_CONTENT;

create or replace trigger tg_job_content_sq
before insert on T_CSU_JOB_CONTENT
for each row
declare
	v_id_job_content T_CSU_JOB_CONTENT.ID%TYPE;

begin
	select T_CSU_JOB_CONTENT.nextval into v_id_job_content from dual;
	:new.id :=v_id_job_content;
end;


-- drop sequence SQ_T_CSU_INTEREST;
	create sequence SQ_T_CSU_INTEREST;

create or replace trigger tg_interest_sq
before insert on T_CSU_INTEREST
for each row
declare
	v_id_interest T_CSU_INTEREST.ID%TYPE;

begin
	select T_CSU_INTEREST.nextval into v_id_interest from dual;
	:new.id :=v_id_interest;
end;








