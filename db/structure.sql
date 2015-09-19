--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: age_division; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE age_division AS ENUM (
    'adult',
    'young_adult',
    'youth',
    'cub',
    'senior',
    'silver_senior',
    'master_senior'
);


--
-- Name: uom; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE uom AS ENUM (
    'yd',
    'm',
    'ft'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: round_ends; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE round_ends (
    id integer NOT NULL,
    round_id integer,
    distance integer,
    uom uom DEFAULT 'yd'::uom,
    max_shots_count smallint,
    shots character varying[] DEFAULT '{}'::character varying[],
    score integer,
    mulligan boolean DEFAULT false,
    x_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: round_ends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE round_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE round_ends_id_seq OWNED BY round_ends.id;


--
-- Name: rounds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rounds (
    id integer NOT NULL,
    user_id integer,
    name character varying,
    category character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying,
    age_division age_division DEFAULT 'adult'::age_division
);


--
-- Name: rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rounds_id_seq OWNED BY rounds.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    last_name character varying,
    first_name character varying,
    email character varying,
    password_digest bytea,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_ends ALTER COLUMN id SET DEFAULT nextval('round_ends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rounds ALTER COLUMN id SET DEFAULT nextval('rounds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: round_ends_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY round_ends
    ADD CONSTRAINT round_ends_pkey PRIMARY KEY (id);


--
-- Name: rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rounds
    ADD CONSTRAINT rounds_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_round_ends_on_round_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_round_ends_on_round_id ON round_ends USING btree (round_id);


--
-- Name: index_rounds_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rounds_on_user_id ON rounds USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150208203729');

INSERT INTO schema_migrations (version) VALUES ('20150217001319');

INSERT INTO schema_migrations (version) VALUES ('20150217002352');

INSERT INTO schema_migrations (version) VALUES ('20150306052348');

INSERT INTO schema_migrations (version) VALUES ('20150812035028');

INSERT INTO schema_migrations (version) VALUES ('20150812154733');

