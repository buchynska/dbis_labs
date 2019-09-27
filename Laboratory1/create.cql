CREATE KEYSPACE keyspace_my
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 1
};


CREATE TABLE keyspace_my."STUDENT" (
	studybook text,
	group text,
	info frozen<info>,
	curator text STATIC,
	PRIMARY KEY (group, studybook)
);





CREATE TABLE keyspace_my."POST" (
	post_id int,
	type text,
	discipline_id text,
	body text,
        discipline_id text,
        teacher_name text,
	PRIMARY KEY (discipline_id, post_id)
);




CREATE TABLE keyspace_my."DISCIPLINE" (
	disc_id int,
	disc_name text,
	topics LIST<text>,
	count_of_complaints int,
	PRIMARY KEY (disc_id)
);


CREATE TABLE keyspace_my."TEACHER" (
	teacher_name text,
	disciplines MAP<text, FROZEN<SET<text>>>,
	PRIMARY KEY (teacher_name)
);
 