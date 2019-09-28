from cassandra.cluster import Cluster
cluster = Cluster()
session = cluster.connect()
session.execute("SELECT studybook, info from "STUDENT_POST" where post_id=1;")
session.execute("SELECT name, topics from "DISCIPLINE_POST" where post_id=1;")
session.execute("SELECT teacher_name, disciplines from "TEACHER_POST" where post_id=2;")
session.execute("SELECT count_of_complaints from "DISCIPLINE_POST" where post_id=3;")

