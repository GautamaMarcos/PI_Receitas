CREATE TABLE IF NOT EXISTS "django_migrations" ("id" SERIAL PRIMARY KEY, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" TIMESTAMP NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2024-11-04 23:30:14.429012');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2024-11-04 23:30:14.472183');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2024-11-04 23:30:14.500038');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2024-11-04 23:30:14.529808');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2024-11-04 23:30:14.556559');
INSERT INTO django_migrations VALUES(6,'aplicativo_receitas','0001_initial','2024-11-04 23:30:14.596296');
INSERT INTO django_migrations VALUES(7,'contenttypes','0002_remove_content_type_name','2024-11-04 23:30:14.637323');
INSERT INTO django_migrations VALUES(8,'auth','0002_alter_permission_name_max_length','2024-11-04 23:30:14.666781');
INSERT INTO django_migrations VALUES(9,'auth','0003_alter_user_email_max_length','2024-11-04 23:30:14.701847');
INSERT INTO django_migrations VALUES(10,'auth','0004_alter_user_username_opts','2024-11-04 23:30:14.716193');
INSERT INTO django_migrations VALUES(11,'auth','0005_alter_user_last_login_null','2024-11-04 23:30:14.754319');
INSERT INTO django_migrations VALUES(12,'auth','0006_require_contenttypes_0002','2024-11-04 23:30:14.762687');
INSERT INTO django_migrations VALUES(13,'auth','0007_alter_validators_add_error_messages','2024-11-04 23:30:14.779962');
INSERT INTO django_migrations VALUES(14,'auth','0008_alter_user_username_max_length','2024-11-04 23:30:14.812970');
INSERT INTO django_migrations VALUES(15,'auth','0009_alter_user_last_name_max_length','2024-11-04 23:30:14.846903');
INSERT INTO django_migrations VALUES(16,'auth','0010_alter_group_name_max_length','2024-11-04 23:30:14.863190');
INSERT INTO django_migrations VALUES(17,'auth','0011_update_proxy_permissions','2024-11-04 23:30:14.899089');
INSERT INTO django_migrations VALUES(18,'auth','0012_alter_user_first_name_max_length','2024-11-04 23:30:14.922586');
INSERT INTO django_migrations VALUES(19,'sessions','0001_initial','2024-11-04 23:30:14.960834');
INSERT INTO django_migrations VALUES(20,'aplicativo_receitas','0002_avaliacao_data_criacao_receita_data_criacao','2024-11-07 00:13:17.232514');
INSERT INTO django_migrations VALUES(21,'aplicativo_receitas','0002_rename_categoria_receita_categoria_id_and_more','2024-11-08 05:03:10.624647');
INSERT INTO django_migrations VALUES(22,'aplicativo_receitas','0003_alter_categoria_nome','2024-11-15 00:21:52.079646');
INSERT INTO django_migrations VALUES(23,'aplicativo_receitas','0004_alter_avaliacao_unique_together_and_more','2024-11-16 03:44:43.976216');
INSERT INTO django_migrations VALUES(24,'aplicativo_receitas','0005_receita_imagem_url','2024-11-25 11:59:46.860785');
INSERT INTO django_migrations VALUES(26,'aplicativo_receitas','0006_receita_dificuldade_receita_porcoes_and_more','2024-11-28 16:02:23.453526');
INSERT INTO django_migrations VALUES(27,'aplicativo_receitas','0007_remove_receita_dificuldade_remove_receita_porcoes_and_more','2024-11-28 16:02:23.522633');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" SERIAL PRIMARY KEY, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" SERIAL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" SERIAL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" SERIAL PRIMARY KEY, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" TIMESTAMP NOT NULL);
INSERT INTO django_admin_log VALUES(1,'32ab575f-9db9-4d26-96e7-841eca7deb38','FIL├ë MIGNON SU├ìNO COM CHAMPINGNONS AO CREME DE MOSTARDA',1,'[{"added": {}}]',7,2,'2024-11-07 11:41:12.944452');
INSERT INTO django_admin_log VALUES(2,'c6bf642c-af34-4de3-9e78-7b8dd4fb2a63','SUFL├è DE CHOCOLATE COM CALDA QUENTE',1,'[{"added": {}}]',7,2,'2024-11-07 11:46:00.443603');
INSERT INTO django_admin_log VALUES(3,'1','gautama avaliou FIL├ë MIGNON SU├ìNO COM CHAMPINGNONS AO CREME DE MOSTARDA com nota 5',1,'[{"added": {}}]',8,2,'2024-11-07 14:25:46.528636');
INSERT INTO django_admin_log VALUES(4,'c6bf642c-af34-4de3-9e78-7b8dd4fb2a63','SUFL├è DE CHOCOLATE COM CALDA QUENTE',2,'[{"changed": {"fields": ["Categoria"]}}]',7,2,'2024-11-07 14:35:02.048030');
INSERT INTO django_admin_log VALUES(5,'c6bf642c-af34-4de3-9e78-7b8dd4fb2a63','SUFL├è DE CHOCOLATE COM CALDA QUENTE',2,'[{"changed": {"fields": ["Categoria"]}}]',7,2,'2024-11-07 14:36:01.009349');
INSERT INTO django_admin_log VALUES(6,'32ab575f-9db9-4d26-96e7-841eca7deb38','FIL├ë MIGNON SU├ìNO COM CHAMPINGNONS AO CREME DE MOSTARDA',2,'[{"changed": {"fields": ["Categoria"]}}]',7,2,'2024-11-07 16:41:43.991862');
INSERT INTO django_admin_log VALUES(7,'32ab575f-9db9-4d26-96e7-841eca7deb38','FIL├ë MIGNON SU├ìNO COM CHAMPINGNONS AO CREME DE MOSTARDA',2,'[{"changed": {"fields": ["Categoria"]}}]',7,2,'2024-11-07 17:04:11.808849');
INSERT INTO django_admin_log VALUES(8,'c6bf642c-af34-4de3-9e78-7b8dd4fb2a63','SUFL├è DE CHOCOLATE COM CALDA QUENTE',2,'[]',7,2,'2024-11-07 22:39:43.693887');
INSERT INTO django_admin_log VALUES(9,'1','Categoria Padr├úo > Carnes',1,'[{"added": {}}]',10,2,'2024-11-08 12:04:23.833497');
INSERT INTO django_admin_log VALUES(10,'0','Prato Principal',2,'[{"changed": {"fields": ["Nome"]}}]',9,2,'2024-11-08 12:05:15.492391');
INSERT INTO django_admin_log VALUES(11,'1','Prato Principal > Carnes',2,'[]',10,2,'2024-11-08 12:05:45.307180');
INSERT INTO django_admin_log VALUES(12,'9c53e8f3-ec29-4f2a-be70-16561d3ec330','Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda',1,'[{"added": {}}]',7,2,'2024-11-08 12:06:00.060631');
INSERT INTO django_admin_log VALUES(13,'1','Prato Principal > Carnes',2,'[]',10,2,'2024-11-08 12:07:17.871087');
INSERT INTO django_admin_log VALUES(14,'9c53e8f3-ec29-4f2a-be70-16561d3ec330','Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda',2,'[]',7,2,'2024-11-08 12:07:30.707937');
INSERT INTO django_admin_log VALUES(15,'1','Sobremesa',1,'[{"added": {}}]',9,2,'2024-11-08 12:10:35.421742');
INSERT INTO django_admin_log VALUES(16,'2','Sobremesa > Bolos',1,'[{"added": {}}]',10,2,'2024-11-08 12:11:05.406522');
INSERT INTO django_admin_log VALUES(17,'5aef7332-d162-463e-b97d-d63c937218f0','Bolo de Chocolate Del├¡cia',1,'[{"added": {}}]',7,2,'2024-11-08 12:11:19.363072');
INSERT INTO django_admin_log VALUES(18,'4','Acompanhamentos > Salgados',2,'[{"changed": {"fields": ["Nome"]}}]',10,2,'2024-11-10 20:02:55.457715');
INSERT INTO django_admin_log VALUES(19,'7cd7a27a-4e1c-40f2-96d9-3ad06af422aa','Batatas Fritas',2,'[{"changed": {"fields": ["Ingredientes", "Modo de preparo"]}}]',7,2,'2024-11-10 20:03:13.073073');
INSERT INTO django_admin_log VALUES(20,'7cd7a27a-4e1c-40f2-96d9-3ad06af422aa','Batatas Fritas',3,'',7,2,'2024-11-10 23:49:18.150573');
INSERT INTO django_admin_log VALUES(21,'2d0b2489-036e-47df-853c-ecadd3fe8baa','batatas fritas',3,'',7,2,'2024-11-11 01:13:02.216723');
INSERT INTO django_admin_log VALUES(22,'621c7ffb-50ff-4a2b-bde2-0dc94cbdd201','Batatas Fritas',2,'[{"changed": {"fields": ["Ingredientes", "Modo de preparo", "Avaliacao"]}}]',7,2,'2024-11-11 03:41:03.700525');
INSERT INTO django_admin_log VALUES(23,'621c7ffb-50ff-4a2b-bde2-0dc94cbdd201','Batatas Fritas',2,'[]',7,2,'2024-11-11 11:42:39.203374');
INSERT INTO django_admin_log VALUES(24,'1','gautama avaliou Batatas Fritas com nota 4',1,'[{"added": {}}]',8,2,'2024-11-11 12:53:48.821079');
INSERT INTO django_admin_log VALUES(25,'4','Acompanhamentos > Salgados',3,'',10,2,'2024-11-13 16:13:37.432472');
INSERT INTO django_admin_log VALUES(26,'5','Prato Principal',1,'[{"added": {}}]',9,2,'2024-11-13 23:02:35.307404');
INSERT INTO django_admin_log VALUES(27,'6','Sobremesa > Doces',1,'[{"added": {}}]',10,2,'2024-11-13 23:03:28.244962');
INSERT INTO django_admin_log VALUES(28,'0','Prato Principal',3,'',9,2,'2024-11-13 23:21:14.761553');
INSERT INTO django_admin_log VALUES(29,'6','Prato Principal',1,'[{"added": {}}]',9,2,'2024-11-13 23:21:32.178384');
INSERT INTO django_admin_log VALUES(30,'7','Prato Principal',1,'[{"added": {}}]',9,2,'2024-11-13 23:38:16.131350');
INSERT INTO django_admin_log VALUES(31,'7','Prato Principal',3,'',9,2,'2024-11-13 23:52:47.692611');
INSERT INTO django_admin_log VALUES(32,'6','Prato Principal',3,'',9,2,'2024-11-13 23:52:53.900277');
INSERT INTO django_admin_log VALUES(33,'8','sobremesa',1,'[{"added": {}}]',9,2,'2024-11-13 23:53:38.686457');
INSERT INTO django_admin_log VALUES(34,'8','sobremesa',3,'',9,2,'2024-11-13 23:57:54.637682');
INSERT INTO django_admin_log VALUES(35,'9','sobremesa',1,'[{"added": {}}]',9,2,'2024-11-13 23:58:09.573573');
INSERT INTO django_admin_log VALUES(36,'9','sobremesa',3,'',9,2,'2024-11-14 00:04:06.861455');
INSERT INTO django_admin_log VALUES(37,'10','sobremesa',1,'[{"added": {}}]',9,2,'2024-11-14 00:04:22.695624');
INSERT INTO django_admin_log VALUES(38,'11','sobremesa',1,'[{"added": {}}]',9,2,'2024-11-14 00:11:13.323320');
INSERT INTO django_admin_log VALUES(39,'12','sobremesa',1,'[{"added": {}}]',9,2,'2024-11-14 00:15:22.049559');
INSERT INTO django_admin_log VALUES(40,'10','sobremesa',3,'',9,2,'2024-11-14 00:15:53.163105');
INSERT INTO django_admin_log VALUES(41,'12','sobremesa',3,'',9,2,'2024-11-14 00:15:56.667394');
INSERT INTO django_admin_log VALUES(42,'1','Sobremesa',3,'',9,2,'2024-11-14 00:16:02.243631');
INSERT INTO django_admin_log VALUES(43,'13','segundo prato',1,'[{"added": {}}]',9,2,'2024-11-14 12:06:13.595739');
INSERT INTO django_admin_log VALUES(44,'13','segundo prato',2,'[{"changed": {"fields": ["Nome"]}}]',9,2,'2024-11-14 12:06:55.580081');
INSERT INTO django_admin_log VALUES(45,'11','sobremesa',3,'',9,2,'2024-11-14 12:29:58.098365');
INSERT INTO django_admin_log VALUES(46,'14','Sobremesa',1,'[{"added": {}}]',9,2,'2024-11-14 12:30:11.708206');
INSERT INTO django_admin_log VALUES(47,'13','segundo prato',3,'',9,2,'2024-11-14 12:30:32.890890');
INSERT INTO django_admin_log VALUES(48,'7','Sobremesa > doces',1,'[{"added": {}}]',10,2,'2024-11-14 12:31:21.299778');
INSERT INTO django_admin_log VALUES(49,'8','Sobremesa > doces',1,'[{"added": {}}]',10,2,'2024-11-14 12:31:55.148503');
INSERT INTO django_admin_log VALUES(50,'9','Sobremesa > Doces',1,'[{"added": {}}]',10,2,'2024-11-14 13:12:51.740925');
INSERT INTO django_admin_log VALUES(51,'10','Sobremesa > Doces',1,'[{"added": {}}]',10,2,'2024-11-14 13:14:19.939632');
INSERT INTO django_admin_log VALUES(52,'11','doces (Sobremesa)',1,'[{"added": {}}]',10,2,'2024-11-14 13:40:21.398205');
INSERT INTO django_admin_log VALUES(53,'11','doces (Sobremesa)',3,'',10,2,'2024-11-14 13:40:55.468453');
INSERT INTO django_admin_log VALUES(54,'8','doces (Sobremesa)',3,'',10,2,'2024-11-14 13:41:05.638004');
INSERT INTO django_admin_log VALUES(55,'9','Doces (Sobremesa)',3,'',10,2,'2024-11-14 13:41:12.381495');
INSERT INTO django_admin_log VALUES(56,'7','doces (Sobremesa)',3,'',10,2,'2024-11-14 13:41:20.368817');
INSERT INTO django_admin_log VALUES(57,'12','doces (Sobremesa)',1,'[{"added": {}}]',10,2,'2024-11-14 13:41:35.901044');
INSERT INTO django_admin_log VALUES(58,'12','doces (Sobremesa)',3,'',10,2,'2024-11-14 13:41:49.547873');
INSERT INTO django_admin_log VALUES(59,'13','doces (Sobremesa)',1,'[{"added": {}}]',10,2,'2024-11-14 14:13:14.800616');
INSERT INTO django_admin_log VALUES(60,'15','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 14:16:36.418318');
INSERT INTO django_admin_log VALUES(61,'15','prato principal',3,'',9,2,'2024-11-14 14:29:36.386338');
INSERT INTO django_admin_log VALUES(62,'16','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 14:29:48.836369');
INSERT INTO django_admin_log VALUES(63,'16','prato principal',3,'',9,2,'2024-11-14 15:53:46.726388');
INSERT INTO django_admin_log VALUES(64,'17','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 15:54:08.874478');
INSERT INTO django_admin_log VALUES(65,'17','prato principal',3,'',9,2,'2024-11-14 16:26:36.437949');
INSERT INTO django_admin_log VALUES(66,'3','Crespinhos de Batata (Aperitivos e Antepastos)',3,'',10,2,'2024-11-14 16:28:04.112723');
INSERT INTO django_admin_log VALUES(67,'13','doces (Sobremesa)',3,'',10,2,'2024-11-14 16:28:16.339725');
INSERT INTO django_admin_log VALUES(68,'18','lanches',1,'[{"added": {}}]',9,2,'2024-11-14 16:29:02.731339');
INSERT INTO django_admin_log VALUES(69,'14','salgados (lanches)',1,'[{"added": {}}]',10,2,'2024-11-14 16:30:40.644965');
INSERT INTO django_admin_log VALUES(70,'14','salgados (lanches)',3,'',10,2,'2024-11-14 16:31:02.428736');
INSERT INTO django_admin_log VALUES(71,'15','lanches (Sobremesa)',1,'[{"added": {}}]',10,2,'2024-11-14 16:32:05.246962');
INSERT INTO django_admin_log VALUES(72,'15','lanches (Sobremesa)',3,'',10,2,'2024-11-14 16:32:50.874519');
INSERT INTO django_admin_log VALUES(73,'16','doces (Prato Principal)',1,'[{"added": {}}]',10,2,'2024-11-14 16:33:13.358817');
INSERT INTO django_admin_log VALUES(74,'16','Prato Principal > doces',3,'',10,2,'2024-11-14 16:36:33.587406');
INSERT INTO django_admin_log VALUES(75,'19','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 16:57:19.815774');
INSERT INTO django_admin_log VALUES(76,'20','prato pricipal',1,'[{"added": {}}]',9,2,'2024-11-14 16:57:54.496710');
INSERT INTO django_admin_log VALUES(77,'19','prato principal',3,'',9,2,'2024-11-14 17:14:47.908679');
INSERT INTO django_admin_log VALUES(78,'20','prato pricipal',3,'',9,2,'2024-11-14 17:15:05.190737');
INSERT INTO django_admin_log VALUES(79,'21','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 17:15:29.752258');
INSERT INTO django_admin_log VALUES(80,'22','PRATO PRINCIPAL',1,'[{"added": {}}]',9,2,'2024-11-14 17:15:46.487525');
INSERT INTO django_admin_log VALUES(81,'21','prato principal',3,'',9,2,'2024-11-14 18:45:47.871118');
INSERT INTO django_admin_log VALUES(82,'22','PRATO PRINCIPAL',3,'',9,2,'2024-11-14 18:46:00.666516');
INSERT INTO django_admin_log VALUES(83,'18','lanches',3,'',9,2,'2024-11-14 18:46:09.618695');
INSERT INTO django_admin_log VALUES(84,'23','prato principal',1,'[{"added": {}}]',9,2,'2024-11-14 18:46:37.141755');
INSERT INTO django_admin_log VALUES(85,'23','prato principal',3,'',9,2,'2024-11-14 19:07:53.794675');
INSERT INTO django_admin_log VALUES(86,'24','PRATO PRINCIPAL',1,'[{"added": {}}]',9,2,'2024-11-14 19:08:06.409210');
INSERT INTO django_admin_log VALUES(87,'5','Prato Principal',3,'',9,2,'2024-11-14 19:08:23.828694');
INSERT INTO django_admin_log VALUES(88,'25','SOBREMESA',1,'[{"added": {}}]',9,2,'2024-11-14 19:09:29.998383');
INSERT INTO django_admin_log VALUES(89,'14','Sobremesa',3,'',9,2,'2024-11-14 19:09:40.817676');
INSERT INTO django_admin_log VALUES(90,'26','LANCHES',1,'[{"added": {}}]',9,2,'2024-11-14 19:09:53.270050');
INSERT INTO django_admin_log VALUES(91,'4','Lanches',3,'',9,2,'2024-11-14 19:10:09.494781');
INSERT INTO django_admin_log VALUES(92,'27','ACOMPANHAMENTOS',1,'[{"added": {}}]',9,2,'2024-11-14 19:10:28.925346');
INSERT INTO django_admin_log VALUES(93,'3','Acompanhamentos',3,'',9,2,'2024-11-14 19:10:38.431372');
INSERT INTO django_admin_log VALUES(94,'28','APERITIVOS E ANTEPASTOS',1,'[{"added": {}}]',9,2,'2024-11-14 19:14:12.855329');
INSERT INTO django_admin_log VALUES(95,'2','Aperitivos e Antepastos',3,'',9,2,'2024-11-14 19:15:16.427682');
INSERT INTO django_admin_log VALUES(96,'29','LANCHES',1,'[{"added": {}}]',9,2,'2024-11-14 19:25:07.355323');
INSERT INTO django_admin_log VALUES(97,'17','salgados (LANCHES)',1,'[{"added": {}}]',10,2,'2024-11-14 19:28:03.658717');
INSERT INTO django_admin_log VALUES(98,'18','SALGADOS (LANCHES)',1,'[{"added": {}}]',10,2,'2024-11-14 19:28:49.205663');
INSERT INTO django_admin_log VALUES(99,'29','LANCHES',3,'',9,2,'2024-11-14 20:05:40.922764');
INSERT INTO django_admin_log VALUES(100,'30','PRATO PRINCIPAL',1,'[{"added": {}}]',9,2,'2024-11-14 20:08:00.200038');
INSERT INTO django_admin_log VALUES(101,'30','PRATO PRINCIPAL',3,'',9,2,'2024-11-14 20:08:41.971873');
INSERT INTO django_admin_log VALUES(102,'17','salgados (LANCHES)',3,'',10,2,'2024-11-14 20:09:03.321720');
INSERT INTO django_admin_log VALUES(103,'19','SALGADOS (LANCHES)',1,'[{"added": {}}]',10,2,'2024-11-14 20:09:24.459888');
INSERT INTO django_admin_log VALUES(104,'20','SALGADOS (LANCHES)',1,'[{"added": {}}]',10,2,'2024-11-14 20:09:39.958736');
INSERT INTO django_admin_log VALUES(105,'20','SALGADOS (LANCHES)',3,'',10,2,'2024-11-14 20:09:51.407952');
INSERT INTO django_admin_log VALUES(106,'19','SALGADOS (LANCHES)',3,'',10,2,'2024-11-14 20:09:58.324114');
INSERT INTO django_admin_log VALUES(107,'26','LANCHES',3,'',9,2,'2024-11-14 20:39:38.575103');
INSERT INTO django_admin_log VALUES(108,'31','SOBREMESA',1,'[{"added": {}}]',9,2,'2024-11-14 20:40:34.172353');
INSERT INTO django_admin_log VALUES(109,'31','SOBREMESA',3,'',9,2,'2024-11-14 21:01:24.650621');
INSERT INTO django_admin_log VALUES(110,'32','ACOMPANHAMENTO',1,'[{"added": {}}]',9,2,'2024-11-14 21:01:39.618058');
INSERT INTO django_admin_log VALUES(111,'32','ACOMPANHAMENTO',3,'',9,2,'2024-11-14 21:02:05.590553');
INSERT INTO django_admin_log VALUES(112,'33','ACOMPANHAMENTO',1,'[{"added": {}}]',9,2,'2024-11-14 21:02:21.192795');
INSERT INTO django_admin_log VALUES(113,'27','ACOMPANHAMENTOS',3,'',9,2,'2024-11-14 21:02:33.636160');
INSERT INTO django_admin_log VALUES(114,'34','SOBREMESA',1,'[{"added": {}}]',9,2,'2024-11-14 21:02:47.137485');
INSERT INTO django_admin_log VALUES(115,'25','SOBREMESA',3,'',9,2,'2024-11-14 21:42:45.935164');
INSERT INTO django_admin_log VALUES(116,'35','SOBREMESA',1,'[{"added": {}}]',9,2,'2024-11-14 21:42:54.971222');
INSERT INTO django_admin_log VALUES(117,'35','SOBREMESA',3,'',9,2,'2024-11-14 21:46:33.482822');
INSERT INTO django_admin_log VALUES(118,'36','SOBREMESA',1,'[{"added": {}}]',9,2,'2024-11-14 21:46:43.763825');
INSERT INTO django_admin_log VALUES(119,'21','DOCES',1,'[{"added": {}}]',10,2,'2024-11-15 00:53:05.709791');
INSERT INTO django_admin_log VALUES(120,'19','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',1,'[{"added": {}}]',8,2,'2024-11-16 01:09:08.029293');
INSERT INTO django_admin_log VALUES(121,'20','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 4',1,'[{"added": {}}]',8,2,'2024-11-16 01:11:33.793859');
INSERT INTO django_admin_log VALUES(122,'20','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 4',3,'',8,2,'2024-11-16 01:20:26.936971');
INSERT INTO django_admin_log VALUES(123,'19','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',3,'',8,2,'2024-11-16 01:20:31.174784');
INSERT INTO django_admin_log VALUES(124,'18','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',2,'[]',8,2,'2024-11-16 01:21:28.075967');
INSERT INTO django_admin_log VALUES(125,'21','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 4',1,'[{"added": {}}]',8,2,'2024-11-16 01:21:54.898390');
INSERT INTO django_admin_log VALUES(126,'21','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 4',3,'',8,2,'2024-11-16 01:30:10.258379');
INSERT INTO django_admin_log VALUES(127,'22','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',1,'[{"added": {}}]',8,2,'2024-11-16 01:30:38.451774');
INSERT INTO django_admin_log VALUES(128,'18','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',3,'',8,2,'2024-11-16 01:30:49.910123');
INSERT INTO django_admin_log VALUES(129,'22','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',3,'',8,2,'2024-11-16 02:18:52.422925');
INSERT INTO django_admin_log VALUES(130,'25','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',1,'[{"added": {}}]',8,2,'2024-11-16 02:19:09.181893');
INSERT INTO django_admin_log VALUES(131,'24','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',2,'[]',8,2,'2024-11-16 02:19:37.733314');
INSERT INTO django_admin_log VALUES(132,'24','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',3,'',8,2,'2024-11-16 02:20:26.984345');
INSERT INTO django_admin_log VALUES(133,'25','gautama avaliou Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda com nota 5',3,'',8,2,'2024-11-16 02:20:34.732706');
INSERT INTO django_admin_log VALUES(134,'ae147a20-586b-4492-824a-acfe51cd162e','Bolo Gelado de Coco',2,'[{"changed": {"fields": ["Descricao", "Ingredientes", "Modo de preparo", "Avaliacao"]}}]',7,2,'2024-11-16 02:21:10.743122');
INSERT INTO django_admin_log VALUES(135,'36','PRATO PRICIPAL',1,'[{"added": {}}]',9,2,'2024-11-16 03:21:15.027510');
INSERT INTO django_admin_log VALUES(136,'36','PRATO PRICIPAL',3,'',9,2,'2024-11-16 03:22:06.538400');
INSERT INTO django_admin_log VALUES(137,'25','DOCES',1,'[{"added": {}}]',10,2,'2024-11-16 03:23:03.484303');
INSERT INTO django_admin_log VALUES(138,'25','DOCES',3,'',10,2,'2024-11-16 03:25:28.901004');
INSERT INTO django_admin_log VALUES(139,'2f1d552c-1e7f-45a6-a70c-b5d500fee6ba','Fil├® com Crosta de Castanhas',2,'[{"changed": {"fields": ["Descricao", "Ingredientes", "Modo de preparo", "Avaliacao"]}}]',7,2,'2024-11-16 12:50:32.038395');
INSERT INTO django_admin_log VALUES(140,'33','gautama avaliou Fil├® com Crosta de Castanhas com nota 5',1,'[{"added": {}}]',8,2,'2024-11-16 12:51:48.632559');
INSERT INTO django_admin_log VALUES(141,'34','gautama avaliou Canap├®s de Pasta de Gengibre, Kani e Manga com nota 5',3,'',8,2,'2024-11-16 13:04:37.949079');
INSERT INTO django_admin_log VALUES(142,'35','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 13:18:36.769314');
INSERT INTO django_admin_log VALUES(143,'36','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 13:19:31.089006');
INSERT INTO django_admin_log VALUES(144,'37','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 13:20:34.866667');
INSERT INTO django_admin_log VALUES(145,'38','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 13:22:01.188460');
INSERT INTO django_admin_log VALUES(146,'39','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 13:51:21.536120');
INSERT INTO django_admin_log VALUES(147,'40','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 14:55:34.584092');
INSERT INTO django_admin_log VALUES(148,'41','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 15:08:52.440442');
INSERT INTO django_admin_log VALUES(149,'42','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 15:10:13.962349');
INSERT INTO django_admin_log VALUES(150,'43','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 15:11:26.240734');
INSERT INTO django_admin_log VALUES(151,'45','gautama avaliou Bolinho de Batata, Lingui├ºa e Repolho com nota 5',1,'[{"added": {}}]',8,2,'2024-11-16 15:14:59.622686');
INSERT INTO django_admin_log VALUES(152,'44','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-16 15:45:57.026522');
INSERT INTO django_admin_log VALUES(153,'46','gautama avaliou Bolo Gelado de Coco com nota 5',3,'',8,2,'2024-11-17 17:37:31.369275');
INSERT INTO django_admin_log VALUES(154,'133197c9-d989-4cd3-9a3a-28288fe40ceb','Bombolini de doce de leite',3,'',7,2,'2024-11-25 13:03:36.740711');
INSERT INTO django_admin_log VALUES(155,'ea792eba-8140-4b09-84f4-9f586610cd15','Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda',3,'',7,2,'2024-11-25 13:06:45.418948');
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" SERIAL PRIMARY KEY, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'aplicativo_receitas','receita');
INSERT INTO django_content_type VALUES(8,'aplicativo_receitas','avaliacao');
INSERT INTO django_content_type VALUES(9,'aplicativo_receitas','categoria');
INSERT INTO django_content_type VALUES(10,'aplicativo_receitas','subcategoria');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" SERIAL PRIMARY KEY, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_receita','Can add receita');
INSERT INTO auth_permission VALUES(26,7,'change_receita','Can change receita');
INSERT INTO auth_permission VALUES(27,7,'delete_receita','Can delete receita');
INSERT INTO auth_permission VALUES(28,7,'view_receita','Can view receita');
INSERT INTO auth_permission VALUES(29,8,'add_avaliacao','Can add avaliacao');
INSERT INTO auth_permission VALUES(30,8,'change_avaliacao','Can change avaliacao');
INSERT INTO auth_permission VALUES(31,8,'delete_avaliacao','Can delete avaliacao');
INSERT INTO auth_permission VALUES(32,8,'view_avaliacao','Can view avaliacao');
INSERT INTO auth_permission VALUES(33,9,'add_categoria','Can add categoria');
INSERT INTO auth_permission VALUES(34,9,'change_categoria','Can change categoria');
INSERT INTO auth_permission VALUES(35,9,'delete_categoria','Can delete categoria');
INSERT INTO auth_permission VALUES(36,9,'view_categoria','Can view categoria');
INSERT INTO auth_permission VALUES(37,10,'add_subcategoria','Can add subcategoria');
INSERT INTO auth_permission VALUES(38,10,'change_subcategoria','Can change subcategoria');
INSERT INTO auth_permission VALUES(39,10,'delete_subcategoria','Can delete subcategoria');
INSERT INTO auth_permission VALUES(40,10,'view_subcategoria','Can view subcategoria');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" SERIAL PRIMARY KEY, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" SERIAL PRIMARY KEY, "password" varchar(128) NOT NULL, "last_login" TIMESTAMP NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" TIMESTAMP NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(2,'pbkdf2_sha256$870000$7VfJDfFJpZ5IAWWcYAYVcM$qG6vIg5lIRAED5W6MNKIkGDut7DMbTBJX75VQ0RQyDk=','2024-11-21 20:56:43.883859',1,'gautama','','mgautama70@gmail.com',1,1,'2024-11-05 13:03:49.800093','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" TIMESTAMP NOT NULL);
INSERT INTO django_session VALUES('0uw8uk5kur0gmmgmljhdhxzyu7fvxkv0','.eJxVjMEOwiAQRP-FsyHQDZT16N1vIAssUjWQlPbU-O-2SQ96nHlvZhOe1qX4tfPspySuYhCX3y5QfHE9QHpSfTQZW13mKchDkSft8t4Sv2-n-3dQqJd9rZSNWVFMo9ZKExjCPQJyRg0qjiZghmSzM2gdGochaAicBmOJM2jx-QLdsDfT:1t8OTA:Q26Ur9MoP97wjpTCHqz5kzkFpQLRoFbk6M5jcWq6wTo','2024-11-19 18:40:00.779233');
INSERT INTO django_session VALUES('9fx3inozeywyddyohxw9wb4c782y2mcn','.eJxVjMEOwiAQRP-FsyHQDZT16N1vIAssUjWQlPbU-O-2SQ96nHlvZhOe1qX4tfPspySuYhCX3y5QfHE9QHpSfTQZW13mKchDkSft8t4Sv2-n-3dQqJd9rZSNWVFMo9ZKExjCPQJyRg0qjiZghmSzM2gdGochaAicBmOJM2jx-QLdsDfT:1t96Td:6ilUH_3mL8PvwxOrH4KubcEUVJ-yTBILppq1igaCJFw','2024-11-21 17:39:25.712175');
INSERT INTO django_session VALUES('3terd8a639bu60s12hur7gf94kh7zpnr','.eJxVjMEOwiAQRP-FsyHQDZT16N1vIAssUjWQlPbU-O-2SQ96nHlvZhOe1qX4tfPspySuYhCX3y5QfHE9QHpSfTQZW13mKchDkSft8t4Sv2-n-3dQqJd9rZSNWVFMo9ZKExjCPQJyRg0qjiZghmSzM2gdGochaAicBmOJM2jx-QLdsDfT:1tEEEF:PVqGfwnl7voIg8fE2T9tOdd7XJPQKGwbXnOvw5Dy1aE','2024-12-05 20:56:43.899487');
CREATE TABLE aplicativo_receitas_subcategoria (

    id SERIAL PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    categoria_id INTEGER,

    FOREIGN KEY (categoria_id) REFERENCES aplicativo_receitas_categoria(id)

);
INSERT INTO aplicativo_receitas_subcategoria VALUES(21,'DOCES',34);
INSERT INTO aplicativo_receitas_subcategoria VALUES(22,'DOCES',35);
INSERT INTO aplicativo_receitas_subcategoria VALUES(23,'CARNES',24);
INSERT INTO aplicativo_receitas_subcategoria VALUES(24,'SALGADOS',28);
INSERT INTO aplicativo_receitas_subcategoria VALUES(26,'SALGADOS',35);
CREATE TABLE old_aplicativo_receitas_receita (

    uuid CHAR(36) PRIMARY KEY,

    titulo VARCHAR(255),

    descricao TEXT,

    ingredientes TEXT,

    modo_de_preparo TEXT,

    avaliacao INTEGER,

    data_criacao DATETIME,

    autor_id INTEGER,

    categoria_id_id BIGINT,

    subcategoria_id_id BIGINT

    -- outros campos conforme necess├írio

);
CREATE TABLE aplicativo_receitas_avaliacao (

    id SERIAL PRIMARY KEY,

    receita_id UUID NOT NULL,

    usuario_id INTEGER NOT NULL,

    nota INTEGER NOT NULL,

    comentario TEXT NOT NULL,

    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (receita_id) REFERENCES aplicativo_receitas_receita(uuid),

    FOREIGN KEY (usuario_id) REFERENCES auth_user(id)

);
INSERT INTO aplicativo_receitas_avaliacao VALUES(49,'c273dce36828403faf5f6a71824515c4',2,5,'Excelente','2024-12-02 22:33:08.521579');
CREATE TABLE IF NOT EXISTS "aplicativo_receitas_categoria" ("id" SERIAL PRIMARY KEY, "nome" varchar(100) NOT NULL UNIQUE);
INSERT INTO aplicativo_receitas_categoria VALUES(24,'PRATO PRINCIPAL');
INSERT INTO aplicativo_receitas_categoria VALUES(28,'APERITIVOS E ANTEPASTOS');
INSERT INTO aplicativo_receitas_categoria VALUES(33,'ACOMPANHAMENTO');
INSERT INTO aplicativo_receitas_categoria VALUES(34,'SOBREMESA');
INSERT INTO aplicativo_receitas_categoria VALUES(35,'BOLOS');
CREATE TABLE IF NOT EXISTS "aplicativo_receitas_receita" ("uuid" char(32) NOT NULL PRIMARY KEY, "titulo" varchar(255) NOT NULL, "descricao" text NOT NULL, "ingredientes" text NOT NULL, "modo_de_preparo" text NOT NULL, "avaliacao" integer NOT NULL, "data_criacao" datetime NOT NULL, "autor_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "categoria_id_id" bigint NOT NULL REFERENCES "aplicativo_receitas_categoria" ("id") DEFERRABLE INITIALLY DEFERRED, "subcategoria_id_id" bigint NULL REFERENCES "aplicativo_receitas_subcategoria" ("id") DEFERRABLE INITIALLY DEFERRED, "imagem_url" varchar(200) NULL);
INSERT INTO aplicativo_receitas_receita VALUES('dd81d5f874bf4d0b93c848bd1f21286d','Bolo de Chocolate com Coco e Morangos',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 14 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('MASSA\nDel├¡cia Supreme Sabor Manteiga 500 g\nA├º├║car 160 g\nOvos 2 un\nFarinha de trigo 240 g\nAmido de milho 36 g\nFermento qu├¡mico em p├│ 10 g\nLeite 125 ml\n\nCREME DE COCO\nAmido de milho 36 g\nLeite 125 ml\nLeite condensado 395 g\nLeite de coco 190 ml\nCoco seco ralado 40 g\n\nMOUSSE DE CHOCOLATE\nA├º├║car 20 g\nOvos, separados em gemas e claras 2 un\n\nCOBERTURA\nChocolate ao leite ou meio amargo 200 g\nChocolate picado 100 g\n\nMONTAGEM\nMorangos 1 caixa','\n',char(10)),replace('MASSA\n1. Na batedeira, leve 1/2 x├¡cara de margarina delicia_supreme_sabor_manteiga, o a├º├║car e as gemas para bater at├® obten├º├úo de um creme claro.\n2. Misture os ingredientes secos e, sempre batendo, adicione, alternadamente, a mistura de farinhas e o leite at├® obten├º├úo de um creme homog├¬neo.\n3. Retire da batedeira, misture as claras em neve e, em forma sem furo no meio, aro 22 cm, untada e polvilhada, leve a massa para assar, em forno preaquecido, ├á temperatura de 180┬║C, por aproximadamente 35 minutos. Retire do forno e deixe esfriar.\n\nCREME DE COCO\n4. Dissolva o amido no leite.\n5. Em uma panela, leve o leite, 3 colheres (sopa) de Margarina delicia_supreme_sabor_manteiga e os demais ingredientes para cozinhar, mexendo sempre, em fogo m├®dio, at├® come├ºar a aparecer o fundo da panela.\n6. Retire do fogo e deixe esfriar, mexendo de vez em quando.\n\nMOUSSE DE CHOCOLATE\n7. Na batedeira leve a gema, o a├º├║car e 3/4 de x├¡cara de margarina delicia_supreme_sabor_manteiga para bater.\n8. Adicione o chocolate derretido, misture bem e, ├á m├úo, as claras batidas em neve e a metade dos morangos (picados).\n9. Leve ao refrigerador ou freezer at├® firmar bem.\n\nCOBERTURA\n10. Misture 1/3 de x├¡cara de margarina Del├¡cia Supreme e o chocolate, derretidos, at├® obten├º├úo de uma mistura homog├¬nea.\n\nMONTAGEM\n11. Sobre o bolo, coloque o manjar de coco e leve para gelar bem.\n12. Adicione a mousse gelada por cima e leve para gelar por mais 30 minutos.\n13. Decore com os morangos frescos restantes e sirva com a cobertura de chocolate.','\n',char(10)),0,'2024-11-29 16:12:49.228558',2,35,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/1939/media1061bolo-chocolate-coco-morangos-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('a038155299e647038ec739cd115fcfd8','Bolo de Chocolate Del├¡cia',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 55 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 11 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('MASSA\n\nMargarina Del├¡cia 125 g\n\nA├º├║car 200 g\n\nOvos 3 un\n\nFarinha de Trigo Primor 175 g\n\nChocolate em P├│ 33% 85 g\n\nFermento qu├¡mico em p├│ 10 g\n\nLeite integral 100 ml\n\nCOBERTURA\n\nA├º├║car 200 g\n\nChocolate em P├│ 100 g\n\nMargarina Del├¡cia 12 g\n\nLeite 90 ml','\n',char(10)),replace('MASSA\n\n1. Ligue o forno na temperatura m├®dia (180┬░C).\n\n2. Bata a margarina com o a├º├║car at├® formar um creme fofo e cremoso.\n\n3. Junte os ovos, um a um, e bata por mais 5 minutos, em velocidade alta.\n\n4. Reduza a velocidade da batedeira para o m├¡nimo, e adicione os ingredientes secos, peneirados, sobre esse creme, alternando com o leite.\n\n5. Unte com margarina e farinha uma forma redonda (25 cm de di├ómetro), de fundo e laterais remov├¡veis, e nela despeje a massa.\n\n6. Regule a grade do forno para a posi├º├úo central e coloque o bolo para assar. Mantenha o forno a 180 graus at├® que o bolo tenha crescido bem (15 a 20 minutos).\n\n7. Em seguida reduza a temperatura para 150 graus, para que ele asse de modo mais uniforme, por mais 10 ou 15 minutos.\n\nDICA: Voc├¬ saber├í o ponto certo de retirar do forno quando sentir um aroma gostoso de chocolate no ar. Nessa hora, fa├ºa o teste do palito: colocando-o no centro da massa, ele deve sair limpo. Desenforme ainda morno e deixe esfriar.\n\nCOBERTURA\n\n8. Misture todos os ingredientes e aque├ºa levemente, em fogo baixo, at├® obter uma calda lisa.\n\n9. Despeje sobre o bolo ainda morno, espere secar e sirva.','\n',char(10)),0,'2024-11-29 18:05:27.836298',2,35,21,'https://www.delicia.com.br/wp-content/uploads/fly-images/1940/media1170bolo-deli-cia-scaled-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('7afbcf7184fa4012b362f74ca358920b','Bolo de Churros',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: M├®dio</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 16 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Nova Del├¡cia 72 g\nClaras 3 un.\nFarinha de trigo 330 g\nA├º├║car 320 g\nCanela em p├│ 30 g\nFermento em p├│ 10 g\nGemas 3 un.\nLeite 200 ml\nEss├¬ncia de baunilha 5 ml\nLeite condensado cozido em ponto de corte 790 g\nA├º├║car de confeiteiro e canela para polvilhar','\n',char(10)),replace('1. Na batedeira, bata as claras em neve. Retire e reserve.\n2. Na batedeira, em velocidade baixa, misture a farinha com o a├º├║car, a canela, o fermento, e a nova_delicia.\n3. Junte as gemas misturadas com o leite e a baunilha, bata at├® obter um creme homog├¬neo.\n4. Por ├║ltimo, e sem bater, acrescente as claras.\n5. Distribua a massa em 2 f├┤rmas redondas de 20cm, untadas com nova_delicia e polvilhadas com farinha de trigo.\n6. Asse no forno preaquecido por cerca de 40 minutos ou at├® dourar levemente.\n7. Desenforme morno e reserve at├® esfriar. Se necess├írio, corte o topo para nivelar. Corte os bolos ao meio.\n8. Em um prato, coloque um disco de massa e cubra com parte do doce de leite.\n9. Sobreponha a segunda massa, cubra com mais doce de leite, terceira massa, doce de leite e finalize com o ├║ltimo disco de massa.\n10. Leve a geladeira por cerca de 30 minutos para firmar.\n11. Espalhe uma fina camada do doce de leite na lateral e topo do bolo, alisando com uma esp├ítula.\n12. Polvilhe com o a├º├║car confeiteiro misturado com a canela e decore a gosto\n\nDICA\nPara o doce de leite em ponto de corte, cozinhe o leite condensado na panela de press├úo por 45 minutos, contados a partir da fervura.','\n',char(10)),0,'2024-11-29 18:15:16.027092',2,35,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/1941/media1062bolo-de-churros-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('c273dce36828403faf5f6a71824515c4','Fil├® Su├¡no ao Molho de Maracuj├í, Laranja e Mel',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 120 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: M├®dio</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 6 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('BATATA DOCE\nBatatas doces, m├®dias 450 g\n\nFIL├ë SUI NO\nDel├¡cia Cremosa 60 g\nFil├® mignon de porco, limpo e aparado 1,4 kg\nSal e pimenta-do-reino quanto baste\nSuco de laranja 360 ml\nVinho branco seco (20 ml\nMel 20 g\n\nMOLHO\nMaracuj├í azedo grande 50 g\nMel 40 g\nRasa de maizena 7 g','\n',char(10)),replace('BATATA DOCE\n1. Descasque e corte a batata doce em peda├ºos grandes.\n2. Em uma panela com ├ígua fervente e sal, leve a batatas para cozinhar, em fogo m├®dio, at├® que estejam levemente macias e cozidas.\n3. Escorra a ├ígua, deixe secar bem e, pr├│ximo ├á hora de servir, leve para saltear, em frigideira funda e larga, revestida com teflon e Margarina Del├¡cia Cremosa at├® que dourem. Adicione sal e reserve quente.\n\nFIL├ë SU├ìNO\n1. Tempere a pe├ºa de fil├® su├¡no com sal e pimenta do reino.\n2. Aque├ºa bem uma frigideira grande e larga, revestida com teflon, coloque a Margarina Del├¡cia Cremosa e deixe derreter.\n3. Quando estiver bem quente, coloque o fil├® e doure-o de todos os lados.\n4. Depois de bem dourado, retire da panela, coloque-o em uma assadeira pequena, regue com a mistura de vinho branco e suco de laranja, tampe com papel alum├¡nio e leve para assar, em forno preaquecido, ├á temperatura de 170┬░C por 40 minutos.\n5. Retire o papel alum├¡nio, e asse, regando de vez em quando, por mais 20 minutos.\n6. Retire do forno, passe 1 colher (sopa) de mel pela superf├¡cie da carne e deixe dourar por mais 10 minutos. Retire do forno, coloque o fie sobre uma travessa, coloque a assadeira sobre a chama do fog├úo, adicione 1 x├¡cara (ch├í) de ├ígua e deixe ferver por 5 minutos, raspando o fundo continuamente.\n7. Retire do fogo, passe o molho por uma peneira e coloque em uma panela pequena.\n\nMOLHO\n1. Adicione ao molho do fundo da assadeira, a polpa de maracuj├í, o mel (restante), a maisena, misture bem e leve para cozinhar, em fogo m├®dio, mexendo sempre, por mais 3 minutos ou at├® formar um molho homog├¬neo.\n2. Sirva em seguida sobre o lombo fatiado, acompanhado pelas batatas doces salteadas e do repolho roxo refogado.','\n',char(10)),0,'2024-11-29 18:21:04.808895',2,24,23,'https://www.delicia.com.br/wp-content/uploads/fly-images/1982/media1106file-suino-ao-molho-de-maracuja-laranja-e-mel-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('87262c984f33433eaf025b6c363955bc','Fil├® Mignon Su├¡no com Champignons ao Creme de Mostarda',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 70 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 4 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme 48 g\nFil├® mignon su├¡no 750 g\nDentes de alho picados 2 un\nVinagre de vinho 30 ml\nSal, cheiro verde picado e pimenta-do-reino quanto baste\nChampignons portobello fresco 150 g\nCebola picada 20 g\nMolho de mostarda amarela 30 ml','\n',char(10)),replace('1. Limpe a carne, seque e tempere com os ingredientes indicados.\n2. Deixe marinar por pelo menos 30 minutos.\n3. Em uma panela com ├ígua fervente e sal leve os champignons para ferver por 4 minutos.\n4. Retire, escorra a ├ígua e reserve.\n5. Em uma frigideira coloque a Margarina Del├¡cia Supreme, junte a cebola e deixe dourar. Acrescente os champignons, refogue em fogo m├®dio por 2 minutos.\n6. Apague o fogo, acrescente o molho de mostarda, misture e reserve quente.\n7. Em uma frigideira ou chapa bem quente, acrescente um pouco de Margarina Del├¡cia Supreme, um fio de azeite e leve a carne para fritar primeiro de um lado e depois de outro at├® que esteja dourada por fora, mas semi-cozida por dentro.\n8. Retire corte na transversal em fatias m├®dias e leve-as de volta ├á frigideira ou chapa para acabar o cozimento.\n9. Retire e sirva acompanhado pelos champignons refogados.','\n',char(10)),0,'2024-11-29 18:24:39.556248',2,24,23,'https://www.delicia.com.br/wp-content/uploads/fly-images/1981/media1105file-mignon-suino-champignons-creme-mostarda-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('1e420fd1e0a846809d2aec5bcfde21c0','Fil├® com Crosta de Castanhas',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 90 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: M├®dio</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 8 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('FIL├ë\nDel├¡cia Supreme 120 g\nFil├® mignon limpo e aparado 1 un\nSal e pimenta-do-reino quanto baste\nMolho shoyu 15 ml\nDentes de alho cortados ao meio 3 un\nCebola cortada em quatro 1 un\nAlecrim fresco 1 un\nLouro 2 Folha(s)\n\nCROSTA\nMix de castanhas-do-par├í e do caju, picadas 140 g\nFarinha de rosca 10 g\nQueijo parmes├úo ralado 18 g\nTempero de mix de ervas desidratadas 8 g\n\nPUR├è DE MANDIOQUINHA\nMandioquinha ou batata baroa 1 kg\n├ügua 250 ml\nLeite 250 ml\nCaldo de galinha 1 Sach├¬(s)\nParmes├úo ralado 20 g','\n',char(10)),replace('FIL├ë\n1. Tempere o fil├® mignon com sal, pimenta-do-reino e shoyu.\n2. Em uma panela ou frigideira larga e funda, leve metade da Margarina Delicia Supreme para derreter.\n3. Adicione os dentes de alho, a cebola e as ervas.\n4. Coloque o fil├® mignon e leve para fritar, cuidando para que fique dourado por igual. Descarte os temperos e reserve a carne e o caldo.\n\nCROSTA\n5. Em uma vasilha, coloque todos os ingredientes.\n6. Misture-os bem at├® obten├º├úo de uma farofa ├║mida.\n7. Cubra toda a superf├¡cie do fil├® com a crosta, amoldando e apertando-a bem.\n8. Coloque o fil├® sobre uma assadeira, com a parte da farofa para cima, despeje o caldo reservado na assadeira e leve-o para assar, em forno preaquecido, ├á temperatura de 180┬░C, por 30 minutos.\n9. Aumente a temperatura para 230┬░C e deixe a crosta gratinar, por aproximadamente 15 minutos ou at├® que doure.\n\nPUR├è DE MANDIOQUINHA\n10. Lave e descasque as mandioquinhas.\n11. Em uma panela, coloque-as para cozinhar com a ├ígua, o leite e o caldo de galinha, em fogo m├®dio, por aproximadamente 15 minutos ou at├® que estejam bem macias (se necess├írio adicione mais ├ígua para o cozimento).\n12. Com a ajuda de um amassador de batatas ou um batedor manual de ovos, misture bem at├® obten├º├úo de um pur├¬ cremoso.\n13. Adicione a Margarina Delicia Supreme, o queijo parmes├úo ralado, a pimenta-branca a gosto, corrija o sal (se necess├írio), misture vigorosamente, desligue o fogo e reserve.','\n',char(10)),0,'2024-11-29 18:27:04.678599',2,24,23,'https://www.delicia.com.br/wp-content/uploads/fly-images/1979/media1104file-crosta-castanhas-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('b3c923911c244f8fb48f25278be8cc51','Crespinhos de Batata',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 45 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 5 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme 24 g\nBatatas grandes sem casca 2 un\nFarinha de trigo 240 g\nOvos 2 un\nsal e pimenta quanto baste\nOvo (para empanar) 1 un\n├ügua (para empanar) 30 ml\nParmes├úo ralado m├®dio (para empanar) 50 g\n├ôleo de milho (para fritar) quanto baste','\n',char(10)),replace('1. Em uma panela contendo ├ígua fervente e sal leve as batatas para cozinhar at├® que estejam bem cozidas.\n2. Retire, escorra e amasse at├® obter consist├¬ncia de pur├¬.\n3. Em uma panela, leve a Margarina Del├¡cia Supreme para derreter.\n4. Junte a farinha de trigo e misture at├® que tenha sido absorvida pela margarina. Sempre misturando, adicione a batata e os ovos.\n5. Tempere com sal, pimenta do reino e cozinhe at├® que o fundo da panela comece a aparecer.\n6. Retire do fogo, deixe amornar e com pequenas por├º├Áes de massa fa├ºa bolinhas.\n7. Passe-as na mistura de ovo e ├ígua, depois no parmes├úo ralado e leve para fritar rapidamente em ├│leo quente.\n8. Retire da panela, coloque em papel a toalha e sirva como aperitivo ou acompanhamento.','\n',char(10)),0,'2024-11-29 18:29:07.544886',2,28,24,'https://www.delicia.com.br/wp-content/uploads/fly-images/1961/media1087crespinhos-batata-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('924aed70a3c14278b9d9d7657cf91120','Canap├®s de Pasta de Gengibre, Kani e Manga',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 30 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme 30 g\nGengibre em conserva 5 g\nCreme de leite 30 ml\nSal quanto baste\nKani kama 8 un\nMaga tommy, sem caro├ºo 1 un\nFolhas de dill para acabamento quanto baste\nTorradas como base para os canap├®s quanto baste','\n',char(10)),replace('1. Em uma t├íbua, pique o gengibre bem mi├║do e reserve.\n2. Em uma vasilha coloque a Margarina Del├¡cia Supreme, o gengibre picado e o creme de leite.\n3. Tempere com o sal e misture bem at├® que todos os ingredientes estejam agregados.\n4. Corte a manga e o kani em l├óminas bem finas e estreitas.\n5. Com o auxilio de uma faca espalhe uma por├º├úo de pasta de gengibre sobre uma torrada.\n6. Por cima coloque l├óminas de manga e kani fazendo curvas para formar desenhos. Decore com folhas de dill.','\n',char(10)),0,'2024-11-29 18:31:14.906790',2,28,24,'https://www.delicia.com.br/wp-content/uploads/fly-images/1954/media1077canapes-gengibre-kani-manga-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('b88dfdb7e4f54cc38ef2e8439303373c','Canap├®s de Manjeric├úo com Ma├º├ú',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 25 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 40 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme Light 100 g\nRicota 200 g\nFolhas manjeric├úo 25 g\nNozes descascadas 20 g\nDente de alho 1 un\nParmes├úo ralado 30 g\nSuco de lim├úo 30 ml\nSal quanto baste\nP├úo de forma integral 10 Fatia(s)\nMa├º├ú verde com casca 250 g\nSuco de lim├úo 30 ml','\n',char(10)),replace('1. Junte todos os ingredientes da pasta e bata em um processador at├® obter uma pasta homog├¬nea e com pedacinhos pequenos de manjeric├úo. Se necess├írio, ajuste o sal.\n2. Prepare os canap├®s: corte os p├úes na diagonal, fazendo 4 tri├óngulos com cada um.\n3. Espalhe a pasta sobre eles e asse em forno pr├®-aquecido (180┬║ C) por 5 minutos, sem deixar a pasta derreter por completo.\n4. Enquanto isso, coloque o suco de lim├úo em uma vasilha com ┬¢ litro de ├ígua.\n5. Corte a ma├º├ú em quatro, retire as sementes, pique em cubinhos muito pequenos e deixe-os na ├ígua com lim├úo.\n6. Assim que o p├úo estiver pronto retire-o do forno, e cubra com os cubinhos de ma├ºa. Sirva em seguida.','\n',char(10)),0,'2024-11-29 18:33:38.200151',2,28,24,'https://www.delicia.com.br/wp-content/uploads/fly-images/1953/media1076canapes-de-manjericao-com-maca-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('c45c51bc7ee74b9680f47667335ac536','Bolinho de Costela',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 20 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Massa\n\n500 g de costela desfiada\n1 x├¡cara (ch├í) de pur├¬ de mandioca\n1 cebola bem picada em cubos\n1 colher (sopa) de alho picado\n3 colheres (sopa) de salsinha picada\n2 colheres (sopa) de Margarina Del├¡cia Supreme Sabor Manteiga\nSal a gosto\nPara empanar\n\n1 x├¡cara (ch├í) de farinha de trigo\n1 x├¡cara de (ch├í) de farinha de rosca\n4 ovos','\n',char(10)),'Cozinhe a costela na panela de press├úo por 1 hora e, depois de morna, desfie e reserve. Em uma panela, refogue a cebola e o alho na margarina delicia_supreme_sabor_manteiga at├® murchar. Coloque a costela desfiada e acrescente a salsinha e sal a gosto. Deixe amornar. Para o pur├¬ de mandioca ficar mais cremoso e saboroso, acrescente uma colher de sopa de margarina delicia_supreme_sabor_manteiga. Misture o refogado no pur├¬ at├® ficar bem homog├¬neo. D├¬ o formato de croquete e empane na farinha de trigo, ovo e depois na farinha de rosca. Frite e sirva.',0,'2024-11-29 18:35:19.000701',2,28,24,'https://www.delicia.com.br/wp-content/uploads/fly-images/1929/media1228istock-897521536-scaled-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('1e01f6522bc44b86a63b867581034edf','Bolinho de Batata, Lingui├ºa e Repolho',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 20 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Massa\n500 g de costela desfiada\n1 x├¡cara (ch├í) de pur├¬ de mandioca\n1 cebola bem picada em cubos\n1 colher (sopa) de alho picado\n3 colheres (sopa) de salsinha picada\n2 colheres (sopa) de Margarina Del├¡cia Supreme Sabor Manteiga\nSal a gosto\nPara empanar\n1 x├¡cara (ch├í) de farinha de trigo\n1 x├¡cara de (ch├í) de farinha de rosca\n4 ovos','\n',char(10)),'Cozinhe a costela na panela de press├úo por 1 hora e, depois de morna, desfie e reserve. Em uma panela, refogue a cebola e o alho na margarina delicia_supreme_sabor_manteiga at├® murchar. Coloque a costela desfiada e acrescente a salsinha e sal a gosto. Deixe amornar. Para o pur├¬ de mandioca ficar mais cremoso e saboroso, acrescente uma colher de sopa de margarina delicia_supreme_sabor_manteiga. Misture o refogado no pur├¬ at├® ficar bem homog├¬neo. D├¬ o formato de croquete e empane na farinha de trigo, ovo e depois na farinha de rosca. Frite e sirva.',0,'2024-11-29 18:37:56.510906',2,28,24,'https://www.delicia.com.br/wp-content/uploads/fly-images/1928/media1050bolinho-de-batata-linguica-e-repolho-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('442b9dfd23ee4ffe828598351e99be62','Sufl├¬ de chocolate com calda quente',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 40 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 4 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('200g de chocolate meio amargo picado\n1Ôüä4 de xi╠ücara (cha╠ü) de cafe╠ü coado\n3 colheres (sopa) de margarina Deli╠ücia\n1Ôüä4 de xi╠ücara (cha╠ü) de ac╠ºu╠ücar\n3 gemas\n1 colher (sopa) de farinha de trigo\n5 claras\n\nCALDA QUENTE\n1Ôüä2 xi╠ücara (cha╠ü) de chocolate em po╠ü\n1/3 de xi╠ücara (cha╠ü) de ac╠ºu╠ücar\n1 colher (sopa) de margarina Deli╠ücia\n1/3 de xi╠ücara (cha╠ü) de leite','\n',char(10)),replace('SUFLE╠é\nNo microondas ou em banho-maria, derreta o chocolate misturado com o cafe╠ü.\nRetire do micro-ondas e adicione: a margarina Del├¡cia, o ac╠ºu╠ücar, as gemas e a farinha de trigo. Misture ate╠ü formar uma massa lisa.\nBata as claras em neve e incorpore a╠Ç massa delicadamente.\nDistribua a massa em 6 ramequins untados com margarina Deli╠ücia.\nColoque os ramequins em uma assadeira com a╠ügua fervente ate╠ü a metade da altura dos ramequins e leve ao forno preaquecido a 200 graus por aproximadamente 20 minutos ou ate╠ü ficar assado.\n\nCALDA\nEm uma panela coloque: o chocolate em po╠ü, o ac╠ºu╠ücar, a margarina Deli╠ücia e o leite.\nLeve ao fogo alto e mexa bem com um fue╠é ate╠ü ferver.\nDepois que ferver, mexa por mais 3 minutos ou ate╠ü a calda engrossar.\nDesligue o fogo e sirva quente com os sufle╠és','\n',char(10)),0,'2024-11-29 18:40:31.381001',2,34,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/2405/20210706_sufle_de_chocolate_com_calda_de_chocolate_master-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('5e86973688764b0db8482f1c95310488','Brownie de chocolate',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 40 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: M├®dio</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 12 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('150g de margarina Deli╠ücia\n200g de chocolate meio amargo picado (para derreter) 1 e 1Ôüä2 xi╠ücara (cha╠ü) de ac╠ºu╠ücar\n3 ovos\n3Ôüä4 de xi╠ücara (cha╠ü) de farinha de trigo\n200g de chocolate meio amargo picado','\n',char(10)),replace('1-No micro-ondas derreta o chocolate junto com a margarina Deli╠ücia e misture bem e reserve\n2-Em uma tigela com um batedor de arame, bata bem os ovos com o ac╠ºu╠ücar. Adicione delicadamente o chocolate derretido com a margarina Deli╠ücia.\n3-Adicione aos poucos a farinha.\n4-Misture delicadamente o chocolate picado.\n5-Coloque em uma assadeira de 20cmX30cm, untada com margarina Deli╠ücia e forrada com papel manteiga.\n6-Asse no forno pre╠ü aquecido a 180 graus por aproximadamente 30 minutos ou ate╠ü que a superfi╠ücie fique craquelada.\n7-Espere esfriar, desenforme e corte em quadradinhos.','\n',char(10)),0,'2024-11-29 18:43:06.336898',2,34,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/2270/20210614_brownie_de_chocolate_master-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('f3aa083aa2764ef4a22d90add8be4369','Trufas de Chocolate com Damasco',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 60 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 32 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme 30 g\nDamascos secos e macios 200 g\nConhaque ou licor de damascos 20 ml\n├ügua 120 ml\nChocolate meio amargo, picado 250 g\nCreme de leite 100 g\nChocolate ao leite ou meio amargo, derretido 400 g','\n',char(10)),replace('1. Reserve 1 x├¡cara (ch├í) de damascos.\n2. Pique a quantidade restante em cubinhos com 3 mm e leve-os a um vasilhame contendo o conhaque ou licor.\n3. Coloque o chocolate em uma vasilha e leve para derreter em banho-maria ou em micro-ondas por 1 ┬¢ minuto, parando o aquecimento e misturando o chocolate a cada 30 segundos.\n4. Misture bem, retire do micro-ondas e reserve.\n5. Pique o damasco reservado e leve para cozinhar na ├ígua indicada, em fogo baixo, at├® que a ├ígua seque.\n6. Retire do fogo, amasse-os com um garfo at├® ponto de pur├¬ e retorne ao fogo.\n7. Adicione o creme de leite at├® levantar fervura.\n8. Desligue o fogo, acrescente o chocolate picado, misture bem, adicione a margarina Del├¡cia Supreme e os damascos picados e escorridos.\n9. Misture bem, tampe com filme pl├ístico e leve ├á geladeira at├® endurecer.\n10. Retire da geladeira, fa├ºa um rolinho, corte com a faca em peda├ºos com 3 cm de comprimento e cubra com o chocolate derretido.\n11. Deixe secar e polvilhe com cacau em p├│','\n',char(10)),0,'2024-11-29 18:45:03.350305',2,34,21,'https://www.delicia.com.br/wp-content/uploads/fly-images/2043/media1164trufas-de-chocolate-com-damasco-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('ebeabec346a7403fa8c8801d1e2222e3','Bolo Gelado de Coco',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 81 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 16 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('MASSA\nDel├¡cia Supreme Light 265 g\nCoco seco ralado 50 g\nFermento qu├¡mico 20 g\nA├º├║car 270 g\nOvos 4 un\nLeite 120 ml\nCoco seco ralado 200 g\nFarinha de trigo 300 g\n\nCOBERTURA\nLeite condensado 395 g\nLeite de coco light 200 ml','\n',char(10)),replace('MASSA\n1. Misture a farinha de trigo, o coco ralado e o fermento. Reserve.\n2. Em batedeira leve a margarina Del├¡cia Supreme Light e o a├º├║car para bater.\n3. Sempre batendo, acrescente os ovos aos poucos e depois, junte alternadamente, o leite e a mistura dos ingredientes secos.\n4. Em tabuleiro retangular, untado com Del├¡cia Cremosa e polvilhado com farinha de trigo, despeje a massa e leve para assar em forno previamente aquecido, ├á temperatura de 180┬║C, por 30 a 40 minutos.\n5. Retire do forno, deixe esfriar e corte quadrados.\n\nCOBERTURA\n6. Em uma vasilha misture o leite condensado e o leite de coco.\n7. Coloque os peda├ºos de bolo nesta calda, vire o bolo de 2 a 3 vezes, escorra o excesso de l├¡quido e passe todos os lados no coco.\n8. Repita o procedimento at├® que todos os peda├ºos tenham sido banhados.\n9. Coloque em um prato e deixe secar por algumas horas.','\n',char(10)),0,'2024-11-29 18:50:24.859882',2,35,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/1945/media1067bologeladodelicia-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('de39e88222fd41b4aaac15dd76fff683','Bolo Formigueiro',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 50 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 1 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('Del├¡cia Supreme 100 g\nA├º├║car 160 g\nOvos 4 un\nFarinha de trigo 165 g\nAmido de milho 50 g\nLeite 200 ml\nFermento em p├│ 10 g\nChocolate granulado 75 g\nA├º├║car de confeiteiro quanto baste','\n',char(10)),replace('1. Na batedeira bata a Del├¡cia Supreme com o a├º├║car at├® ficar um creme bem leve. Sempre batendo, junte os ovos.\n2. Acrescente a farinha e o amido intercalando com o leite.\n3. Por ├║ltimo junte o fermento e o granulado.\n4. Unte uma f├┤rma redonda com cone central (24B x 20F x 8A) e coloque a massa.\n5. Asse no forno preaquecido em 180┬║C por cerca de 35 minutos ou at├® que ao espetar um palito ele saia seco. Desenforme morno e polvilhe com o a├º├║car de confeiteiro.','\n',char(10)),0,'2024-11-29 18:53:47.201670',2,35,21,'https://www.delicia.com.br/wp-content/uploads/fly-images/1944/media1066bolo-formigueiro-1366x500.jpg');
INSERT INTO aplicativo_receitas_receita VALUES('5cca75694d73454f86a46fadc8da8005','Bolo Especial de Laranja',replace('<div>\n        <p><i class="fas fa-clock"></i> Tempo de Preparo: 45 minutos</p>\n        <p><i class="fas fa-flag"></i> Dificuldade: F├ícil</p>\n        <p><i class="fas fa-utensils"></i> Por├º├Áes: 14 por├º├Áes</p>\n        <p></p>\n      </div>','\n',char(10)),replace('MASSA\nNova Del├¡cia 100 g\nOvos 6 un\nA├º├║car 240 g\nLeite 250 ml\nFarinha de trigo 240 g\nRaspas de laranja 4 g\nFermento em p├│ 15 g\nFarinha de trigo para polvilhar\n\nRECHEIO\nA├º├║car 80 g\nAmido de milho 45 g\nSuco de laranja 250 ml\nNova Del├¡cia sem sal 36 g\nCream cheese 100 g\nRaspas de laranja 2 g\n\nCOBERTURA\nLaranja cristalizada 90 g\nA├º├║car 160 g\nSuco de laranja 85 ml\n\nDECORA├ç├âO\nChantilly batido 60 g\nGomos frescos de laranja','\n',char(10)),replace('MASSA\n1. Em uma batedeira, em velocidade alta, leve os ovos, o a├º├║car e a margarina nova_delicia para bater, at├® obter uma mistura leve e clara.\n2. Diminua a velocidade e alternando, acrescente o leite e a farinha de trigo.\n3. Ao final, adicione as raspa e por ├║ltimo o fermento.\n4. Em uma forma com 19 cm de di├ómetro, untada com nova_delicia e polvilhada com farinha de trigo, despeje a massa e leve para assar em forno preaquecido, a 180┬║C, por 30 minutos. Retire do forno, deixe amornar e desenforme.\n\nRECHEIO\n5. Em uma panela, leve o a├º├║car, o amido de milho dissolvido no suco de laranja e a margarina nova_delicia para cozinhar, em fogo m├®dio, mexendo sempre, at├® que ferva e engrosse.\n6. Retire do fogo, deixe esfriar bem, acrescente o cream cheese, as raspas, misture bem e reserve.\n\nCOBERTURA\n7. Em uma panela, leve o a├º├║car e o suco para ferver at├® que reduza bem. Deixe esfriar.\n\nMONTAGEM\n8. Corte o bolo ao meio no sentido horizontal, espalhe o recheio, coloque por cima a laranja cristalizada e a outra parte do bolo.\n9. Leve para gelar por uma hora.\n\nDECORA├ç├âO\n10. Cubra todo o bolo com o chantilly, alisando-o com uma esp├ítula. Derrame a geleia e decore com uma laranja fresca.','\n',char(10)),0,'2024-11-29 18:56:40.134220',2,35,22,'https://www.delicia.com.br/wp-content/uploads/fly-images/1943/media1064bolo-especial-laranja-1366x500.jpg');
INSERT INTO sqlite_sequence VALUES('django_migrations',27);
INSERT INTO sqlite_sequence VALUES('django_admin_log',155);
INSERT INTO sqlite_sequence VALUES('django_content_type',10);
INSERT INTO sqlite_sequence VALUES('auth_permission',40);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',2);
INSERT INTO sqlite_sequence VALUES('aplicativo_receitas_subcategoria',26);
INSERT INTO sqlite_sequence VALUES('aplicativo_receitas_avaliacao',49);
INSERT INTO sqlite_sequence VALUES('aplicativo_receitas_categoria',36);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE UNIQUE INDEX "aplicativo_receitas_avaliacao_receita_id_usuario_id_e27b56e3_uniq" ON "aplicativo_receitas_avaliacao" ("receita_id", "usuario_id");
CREATE UNIQUE INDEX "aplicativo_receitas_subcategoria_nome_categoria_id_da524cbb_uniq" ON "aplicativo_receitas_subcategoria" ("nome", "categoria_id");
CREATE INDEX "aplicativo_receitas_receita_autor_id_624f91a5" ON "aplicativo_receitas_receita" ("autor_id");
CREATE INDEX "aplicativo_receitas_receita_categoria_id_id_a98d14da" ON "aplicativo_receitas_receita" ("categoria_id_id");
CREATE INDEX "aplicativo_receitas_receita_subcategoria_id_id_f25e35ca" ON "aplicativo_receitas_receita" ("subcategoria_id_id");

