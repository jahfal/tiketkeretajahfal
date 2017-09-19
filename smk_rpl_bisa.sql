-- Adminer 4.3.1 PostgreSQL dump

\connect "smk_rpl_bisa";

CREATE SEQUENCE customer_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."customer" (
    "customer_id" bigint DEFAULT nextval('customer_customer_id_seq') NOT NULL,
    "customer_name" character varying(50) NOT NULL,
    "identity_number" character varying(20) NOT NULL,
    "customer_address" character varying(50) NOT NULL,
    "customer_email" character varying(20) NOT NULL,
    "customer_phone_number" character varying(13) NOT NULL,
    CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id")
) WITH (oids = false);


CREATE SEQUENCE user_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE SEQUENCE user_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."user" (
    "user_id" bigint DEFAULT nextval('user_user_id_seq') NOT NULL,
    "password" character varying(12) NOT NULL,
    "customer_id" bigint DEFAULT nextval('user_customer_id_seq') NOT NULL,
    CONSTRAINT "customer" FOREIGN KEY (customer_id) REFERENCES customer(customer_id) NOT DEFERRABLE
) WITH (oids = false);


CREATE SEQUENCE city_city_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."city" (
    "city_id" bigint DEFAULT nextval('city_city_id_seq') NOT NULL,
    "city_name" character varying(20) NOT NULL,
    "id_valid" character varying(10),
    CONSTRAINT "city_pkey" PRIMARY KEY ("city_id")
) WITH (oids = false);


CREATE SEQUENCE tiket_master_schedule_detail_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE SEQUENCE tiket_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tiket" (
    "master_schedule_detail_id" bigint DEFAULT nextval('tiket_master_schedule_detail_id_seq') NOT NULL,
    "customer_id" bigint DEFAULT nextval('tiket_customer_id_seq') NOT NULL,
    CONSTRAINT "tiket_pkey" PRIMARY KEY ("master_schedule_detail_id")
) WITH (oids = false);


CREATE SEQUENCE master_schedule_detail_master_schedule_detail_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."master_schedule_detail" (
    "master_schedule_detail_id" bigint DEFAULT nextval('master_schedule_detail_master_schedule_detail_id_seq') NOT NULL,
    "eta" time without time zone NOT NULL,
    "etd" time without time zone NOT NULL,
    "schedule_id" bigint NOT NULL,
    "rails_id" bigint NOT NULL,
    CONSTRAINT "master_schedule_detail_pkey" PRIMARY KEY ("master_schedule_detail_id"),
    CONSTRAINT "master_schedule_detail_id" FOREIGN KEY (master_schedule_detail_id) REFERENCES tiket(master_schedule_detail_id) NOT DEFERRABLE
) WITH (oids = false);


CREATE SEQUENCE route_route_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."route" (
    "route_id" bigint DEFAULT nextval('route_route_id_seq') NOT NULL,
    "route_name" character varying(50) NOT NULL,
    "is_valid" character varying(50) NOT NULL,
    CONSTRAINT "route_pkey" PRIMARY KEY ("route_id")
) WITH (oids = false);


CREATE SEQUENCE master_schedule_schedule_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."master_schedule" (
    "schedule_id" bigint DEFAULT nextval('master_schedule_schedule_id_seq') NOT NULL,
    "route_id" bigint NOT NULL,
    "city_id" bigint NOT NULL,
    CONSTRAINT "master_schedule_pkey" PRIMARY KEY ("schedule_id")
) WITH (oids = false);


CREATE TABLE "public"."rails" (
    "rails_id" bigint NOT NULL,
    "rails_name" character varying(50) NOT NULL,
    "capacity" integer NOT NULL,
    CONSTRAINT "rails_pkey" PRIMARY KEY ("rails_id")
) WITH (oids = false);


-- 2017-09-19 10:41:50.079477+07
