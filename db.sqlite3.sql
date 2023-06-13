BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "tickets_ticket" (
	"id"	integer NOT NULL,
	"ticket_number"	varchar(50) NOT NULL,
	"creation_date"	date NOT NULL,
	"description"	text NOT NULL,
	"resolution_end_date"	date NOT NULL,
	"assigned_employee_id"	bigint,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("assigned_employee_id") REFERENCES "tickets_employee"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "tickets_employee" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"start_time"	time NOT NULL,
	"end_time"	time NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tickets_dutyroster" (
	"id"	integer NOT NULL,
	"date"	date NOT NULL,
	"employee_id"	bigint NOT NULL,
	"is_available"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("employee_id") REFERENCES "tickets_employee"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2023-06-12 10:47:33.954387');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2023-06-12 10:47:34.130442');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2023-06-12 10:47:34.301722');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2023-06-12 10:47:34.448185');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-06-12 10:47:34.496137');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2023-06-12 10:47:34.554920');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2023-06-12 10:47:34.608827');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2023-06-12 10:47:34.656339');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2023-06-12 10:47:34.696958');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2023-06-12 10:47:34.746162');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2023-06-12 10:47:34.782040');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-06-12 10:47:34.823437');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2023-06-12 10:47:34.877828');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-06-12 10:47:34.962625');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2023-06-12 10:47:35.022552');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2023-06-12 10:47:35.070808');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-06-12 10:47:35.140489');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2023-06-12 10:47:35.232729');
INSERT INTO "django_migrations" VALUES (20,'tickets','0001_initial','2023-06-12 10:53:14.882199');
INSERT INTO "django_migrations" VALUES (21,'tickets','0002_employee_ticket_assigned_employee','2023-06-12 10:58:05.217240');
INSERT INTO "django_migrations" VALUES (22,'tickets','0003_dutyroster','2023-06-12 11:12:42.898957');
INSERT INTO "django_migrations" VALUES (23,'tickets','0004_remove_dutyroster_is_leave_dutyroster_is_available_and_more','2023-06-13 06:59:35.445005');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'tickets','ticket');
INSERT INTO "django_content_type" VALUES (8,'tickets','employee');
INSERT INTO "django_content_type" VALUES (9,'tickets','dutyroster');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_ticket','Can add ticket');
INSERT INTO "auth_permission" VALUES (26,7,'change_ticket','Can change ticket');
INSERT INTO "auth_permission" VALUES (27,7,'delete_ticket','Can delete ticket');
INSERT INTO "auth_permission" VALUES (28,7,'view_ticket','Can view ticket');
INSERT INTO "auth_permission" VALUES (29,8,'add_employee','Can add employee');
INSERT INTO "auth_permission" VALUES (30,8,'change_employee','Can change employee');
INSERT INTO "auth_permission" VALUES (31,8,'delete_employee','Can delete employee');
INSERT INTO "auth_permission" VALUES (32,8,'view_employee','Can view employee');
INSERT INTO "auth_permission" VALUES (33,9,'add_dutyroster','Can add duty roster');
INSERT INTO "auth_permission" VALUES (34,9,'change_dutyroster','Can change duty roster');
INSERT INTO "auth_permission" VALUES (35,9,'delete_dutyroster','Can delete duty roster');
INSERT INTO "auth_permission" VALUES (36,9,'view_dutyroster','Can view duty roster');
INSERT INTO "tickets_ticket" VALUES (9,'T001','2023-06-13','Example ticket','2023-06-15',1);
INSERT INTO "tickets_ticket" VALUES (10,'T002','2023-06-13','Example ticket','2023-06-15',2);
INSERT INTO "tickets_ticket" VALUES (11,'T003','2023-06-13','Example ticket','2023-06-15',3);
INSERT INTO "tickets_ticket" VALUES (12,'T004','2023-06-13','Example ticket','2023-06-15',4);
INSERT INTO "tickets_ticket" VALUES (13,'T005','2023-06-13','Example ticket','2023-06-15',1);
INSERT INTO "tickets_ticket" VALUES (14,'T006','2023-06-13','Example ticket','2023-06-15',2);
INSERT INTO "tickets_ticket" VALUES (15,'T007','2023-06-13','Example ticket','2023-06-15',3);
INSERT INTO "tickets_ticket" VALUES (16,'T008','2023-06-13','Example ticket','2023-06-16',4);
INSERT INTO "tickets_ticket" VALUES (17,'T009','2023-06-13','Example ticket','2023-06-16',1);
INSERT INTO "tickets_ticket" VALUES (18,'T0010','2023-06-12','Example ticket','2023-06-16',2);
INSERT INTO "tickets_ticket" VALUES (21,'T0014','2023-06-13','Example ticket','2023-06-20',3);
INSERT INTO "tickets_employee" VALUES (1,'John Doe','09:00:00','17:00:00');
INSERT INTO "tickets_employee" VALUES (2,'Shimna','09:00:00','17:00:00');
INSERT INTO "tickets_employee" VALUES (3,'Ashish','09:00:00','17:00:00');
INSERT INTO "tickets_employee" VALUES (4,'Farooq','12:00:00','08:00:00');
INSERT INTO "tickets_employee" VALUES (5,'Santhosh','18:00:00','02:00:00');
INSERT INTO "tickets_employee" VALUES (6,'Robert','12:00:00','12:00:00');
INSERT INTO "tickets_employee" VALUES (7,'James','18:00:00','02:00:00');
INSERT INTO "tickets_dutyroster" VALUES (1,'2023-06-13',1,1);
INSERT INTO "tickets_dutyroster" VALUES (2,'2023-06-13',2,1);
INSERT INTO "tickets_dutyroster" VALUES (3,'2023-06-13',3,1);
INSERT INTO "tickets_dutyroster" VALUES (4,'2023-06-13',4,1);
INSERT INTO "tickets_dutyroster" VALUES (5,'2023-06-13',5,1);
INSERT INTO "tickets_dutyroster" VALUES (6,'2023-06-13',6,1);
INSERT INTO "tickets_dutyroster" VALUES (7,'2023-06-13',7,1);
INSERT INTO "tickets_dutyroster" VALUES (8,'2023-06-14',1,0);
INSERT INTO "tickets_dutyroster" VALUES (9,'2023-06-14',2,1);
INSERT INTO "tickets_dutyroster" VALUES (10,'2023-06-14',3,1);
INSERT INTO "tickets_dutyroster" VALUES (11,'2023-06-14',4,1);
INSERT INTO "tickets_dutyroster" VALUES (12,'2023-06-15',2,1);
INSERT INTO "tickets_dutyroster" VALUES (13,'2023-06-14',5,0);
INSERT INTO "tickets_dutyroster" VALUES (14,'2023-06-14',6,1);
INSERT INTO "tickets_dutyroster" VALUES (15,'2023-06-14',7,1);
INSERT INTO "tickets_dutyroster" VALUES (16,'2023-06-15',1,1);
INSERT INTO "tickets_dutyroster" VALUES (17,'2023-06-15',3,1);
INSERT INTO "tickets_dutyroster" VALUES (18,'2023-06-15',4,0);
INSERT INTO "tickets_dutyroster" VALUES (19,'2023-06-15',5,1);
INSERT INTO "tickets_dutyroster" VALUES (20,'2023-06-15',6,1);
INSERT INTO "tickets_dutyroster" VALUES (21,'2023-06-15',7,1);
INSERT INTO "tickets_dutyroster" VALUES (22,'2023-06-16',1,1);
INSERT INTO "tickets_dutyroster" VALUES (23,'2023-06-16',2,1);
INSERT INTO "tickets_dutyroster" VALUES (24,'2023-06-16',3,1);
INSERT INTO "tickets_dutyroster" VALUES (25,'2023-06-16',4,1);
INSERT INTO "tickets_dutyroster" VALUES (26,'2023-06-16',5,1);
INSERT INTO "tickets_dutyroster" VALUES (27,'2023-06-16',6,1);
INSERT INTO "tickets_dutyroster" VALUES (28,'2023-06-16',7,0);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "tickets_ticket_assigned_employee_id_f4780cfe" ON "tickets_ticket" (
	"assigned_employee_id"
);
CREATE INDEX IF NOT EXISTS "tickets_dutyroster_employee_id_a1c47484" ON "tickets_dutyroster" (
	"employee_id"
);
COMMIT;
