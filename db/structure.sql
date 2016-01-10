CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "city" varchar, "category_id" integer, "addressable_id" integer, "addressable_type" varchar);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "category_id" integer);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "like_count" integer DEFAULT 0, "dislike_count" integer DEFAULT 0, "emotion_count" integer DEFAULT 0);
CREATE TABLE "emotions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "emotionable_id" integer, "emotionable_type" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "emotion" varchar);
CREATE TABLE "memberships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "role_id" integer, "org_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "orgs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "replies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "comment_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "like_count" integer DEFAULT 0, "dislike_count" integer DEFAULT 0, "emotion_count" integer DEFAULT 0);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "warehouses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
CREATE INDEX "index_addresses_on_addressable_type_and_addressable_id" ON "addresses" ("addressable_type", "addressable_id");
CREATE INDEX "index_addresses_on_category_id" ON "addresses" ("category_id");
CREATE INDEX "index_categories_on_category_id" ON "categories" ("category_id");
CREATE INDEX "index_emotions_on_emotionable_type_and_emotionable_id" ON "emotions" ("emotionable_type", "emotionable_id");
CREATE INDEX "index_memberships_on_org_id" ON "memberships" ("org_id");
CREATE INDEX "index_memberships_on_role_id" ON "memberships" ("role_id");
CREATE INDEX "index_memberships_on_user_id" ON "memberships" ("user_id");
CREATE INDEX "index_replies_on_comment_id" ON "replies" ("comment_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "my_index" ON "memberships" ("org_id", "role_id", "user_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20151229194342');

INSERT INTO schema_migrations (version) VALUES ('20151229194430');

INSERT INTO schema_migrations (version) VALUES ('20151229194529');

INSERT INTO schema_migrations (version) VALUES ('20151229231626');

INSERT INTO schema_migrations (version) VALUES ('20151229231856');

INSERT INTO schema_migrations (version) VALUES ('20151229231939');

INSERT INTO schema_migrations (version) VALUES ('20151229232750');

INSERT INTO schema_migrations (version) VALUES ('20151229232919');

INSERT INTO schema_migrations (version) VALUES ('20151230124519');

INSERT INTO schema_migrations (version) VALUES ('20151230125015');

INSERT INTO schema_migrations (version) VALUES ('20151230125116');

INSERT INTO schema_migrations (version) VALUES ('20151230194344');

INSERT INTO schema_migrations (version) VALUES ('20151230194956');

INSERT INTO schema_migrations (version) VALUES ('20151230195113');

INSERT INTO schema_migrations (version) VALUES ('20151230195541');

INSERT INTO schema_migrations (version) VALUES ('20151230225049');

INSERT INTO schema_migrations (version) VALUES ('20151231115452');

