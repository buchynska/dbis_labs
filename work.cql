insert into "STUDENT" (studybook,group,info,curator) values ('113001', 'KM63', {"name": 'Kate', "surname": 'Buchynska' }, 'Ladogubets');
insert into "STUDENT" (studybook,group,info,curator) values ('113002', 'KM61', {"name": 'Nadia', "surname": 'Antoschuk' }, 'Malchikov');
insert into "STUDENT" (studybook,group,info,curator) values ('113003', 'KM63', {"name": 'Mike', "surname": 'Taison' }, 'Ladogubets');
select * from "STUDENT" ; 

insert into "POST"(post_id,type,body,discipline_id, studybook, teacher_name) values (1, 'complain','very boring','1', '113001', 'Ladogubets');
insert into "POST"(post_id,type,body,discipline_id, studybook, teacher_name) values (2, 'advance','i want more practice lessons','2','113002', 'Liscin');
insert into "POST"(post_id,type,body,discipline_id,studybook, teacher_name) values (3, 'complain','very boring','1', '113002', 'Liscin');
select * from "POST" ;

insert into "DISCIPLINE" (disc_id, disc_name, topics, count_of_complaints) values (001, 'LA', ['Intro', 'topic1'], 1);
insert into "DISCIPLINE" (disc_id, disc_name, topics, count_of_complaints) values (002, 'Matan', ['Integrals', 'Other stuff'], 0);
insert into "DISCIPLINE" (disc_id, disc_name, topics, count_of_complaints) values (003, 'AI', ['AI is cool', 'topic1'], 2);
select * from "DISCIPLINE";


UPDATE "STUDENT" SET info = {"name": 'Kate', "surname": 'Vando' } WHERE studybook = '113001' and group='KM63' ;
select * from "STUDENT"

UPDATE "STUDENT" SET curator='another' WHERE group='KM63';
select * from "STUDENT";

update "DISCIPLINE" set topics =['Integrals', 'Other stuff', 'Integral-2'] where disc_id = 002;
select * from "DISCIPLINE";


insert into "TEACHER" (teacher_name, disciplines) values ('Malchikov' , {'1 семестр 2019':{'LA', 'Matan'}});
insert into "TEACHER" (teacher_name, disciplines) values ('Ladogubets' , {'1 семестр 2019':{'LA', 'AI'}, '2 семестр 2019':{'LA', 'Matan'}} );
insert into "TEACHER" (teacher_name, disciplines) values ('Liskin' , {'1 семестр 2019':{'LA'}});
select * from "TEACHER";


delete from "TEACHER" WHERE teacher_name='Malchikov';
delete from "TEACHER" WHERE teacher_name='Ladogubets';
delete from "TEACHER" WHERE teacher_name='Liskin';

delete from "DISCIPLINE" WHERE disc_id=001;
delete from "DISCIPLINE" WHERE disc_id=003;
delete from "DISCIPLINE" WHERE disc_id=002;

delete from "STUDENT" WHERE studybook='113001';
delete from "STUDENT" WHERE studybook='113002';
delete from "STUDENT" WHERE studybook='113003';

delete from "POST" WHERE post_id=1;
delete from "POST" WHERE post_id=2;
delete from "POST" WHERE post_id=3;



CREATE TABLE keyspace_my."DISCIPLINE_POST" (
	disc_id int,
	post_id int,
	name text,
	topics SET<text>,
        count_of_complaints int;
	PRIMARY KEY (disc_id, post_id)
);

CREATE TABLE keyspace_my."TEACHER_POST" (
	teacher_name text,
	disciplines MAP<text, FROZEN<SET<text>>>,
	post_id int,
	PRIMARY KEY (teacher_name, post_id)
);


CREATE TABLE keyspace_my."STUDENT_POST" (
	studybook text,
	group text,
	info frozen<info>,
	post_id int,
	PRIMARY KEY (post_id, studybook)
);


SELECT studybook, info from "STUDENT_POST" where post_id=1;
SELECT name, topics from "DISCIPLINE_POST" where post_id=1;
SELECT teacher_name, disciplines from "TEACHER_POST" where post_id=2;
SELECT count_of_complaints from "DISCIPLINE_POST" where post_id=3;
