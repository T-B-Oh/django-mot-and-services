--
-- PostgreSQL database dump
--

\restrict 1gwbtzaTm7kUWXTzqbSjsZMnKDdHxLM1nO0e1G95eAIO51yk9H4rUN6yTgg7BCS

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: useruser
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO useruser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO useruser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO useruser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO useruser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO useruser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO useruser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO useruser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: bookings_bookingdetail; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.bookings_bookingdetail (
    id integer NOT NULL,
    booking_id character varying(5) NOT NULL,
    booking_date date NOT NULL,
    booking_time character varying(5) NOT NULL,
    booking_status character varying(10) NOT NULL,
    owner_id integer NOT NULL,
    package_id_id integer NOT NULL,
    vehicle_id_id integer
);


ALTER TABLE public.bookings_bookingdetail OWNER TO useruser;

--
-- Name: bookings_bookingdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.bookings_bookingdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_bookingdetail_id_seq OWNER TO useruser;

--
-- Name: bookings_bookingdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.bookings_bookingdetail_id_seq OWNED BY public.bookings_bookingdetail.id;


--
-- Name: bookings_package; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.bookings_package (
    id integer NOT NULL,
    package_type character varying(10) NOT NULL,
    package_name character varying(70) NOT NULL,
    price character varying(200) NOT NULL,
    description character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.bookings_package OWNER TO useruser;

--
-- Name: bookings_package_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.bookings_package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_package_id_seq OWNER TO useruser;

--
-- Name: bookings_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.bookings_package_id_seq OWNED BY public.bookings_package.id;


--
-- Name: bookings_uservehicle; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.bookings_uservehicle (
    id integer NOT NULL,
    user_id integer NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.bookings_uservehicle OWNER TO useruser;

--
-- Name: bookings_uservehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.bookings_uservehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_uservehicle_id_seq OWNER TO useruser;

--
-- Name: bookings_uservehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.bookings_uservehicle_id_seq OWNED BY public.bookings_uservehicle.id;


--
-- Name: bookings_vehicle; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.bookings_vehicle (
    id integer NOT NULL,
    make character varying(70) NOT NULL,
    model character varying(200) NOT NULL,
    reg character varying(200),
    year integer NOT NULL
);


ALTER TABLE public.bookings_vehicle OWNER TO useruser;

--
-- Name: bookings_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.bookings_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_vehicle_id_seq OWNER TO useruser;

--
-- Name: bookings_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.bookings_vehicle_id_seq OWNED BY public.bookings_vehicle.id;


--
-- Name: bookings_vehicledatabase; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.bookings_vehicledatabase (
    id integer NOT NULL,
    reg character varying(200),
    make character varying(70) NOT NULL,
    model character varying(200) NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.bookings_vehicledatabase OWNER TO useruser;

--
-- Name: bookings_vehicledatabase_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.bookings_vehicledatabase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_vehicledatabase_id_seq OWNER TO useruser;

--
-- Name: bookings_vehicledatabase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.bookings_vehicledatabase_id_seq OWNED BY public.bookings_vehicledatabase.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO useruser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO useruser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO useruser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO useruser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO useruser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO useruser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO useruser;

--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.users_profile (
    id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    contact character varying(100),
    address character varying(500) NOT NULL,
    city character varying(100) NOT NULL,
    postcode character varying(10) NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO useruser;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.users_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_profile_id_seq OWNER TO useruser;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.users_profile_id_seq OWNED BY public.users_profile.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(100),
    email character varying(254) NOT NULL
);


ALTER TABLE public.users_user OWNER TO useruser;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO useruser;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_groups_id_seq OWNER TO useruser;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO useruser;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: useruser
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO useruser;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: useruser
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNER TO useruser;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useruser
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bookings_bookingdetail id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail ALTER COLUMN id SET DEFAULT nextval('public.bookings_bookingdetail_id_seq'::regclass);


--
-- Name: bookings_package id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_package ALTER COLUMN id SET DEFAULT nextval('public.bookings_package_id_seq'::regclass);


--
-- Name: bookings_uservehicle id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_uservehicle ALTER COLUMN id SET DEFAULT nextval('public.bookings_uservehicle_id_seq'::regclass);


--
-- Name: bookings_vehicle id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_vehicle ALTER COLUMN id SET DEFAULT nextval('public.bookings_vehicle_id_seq'::regclass);


--
-- Name: bookings_vehicledatabase id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_vehicledatabase ALTER COLUMN id SET DEFAULT nextval('public.bookings_vehicledatabase_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_profile id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN id SET DEFAULT nextval('public.users_profile_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add profile	7	add_profile
26	Can change profile	7	change_profile
27	Can delete profile	7	delete_profile
28	Can view profile	7	view_profile
29	Can add booking detail	8	add_bookingdetail
30	Can change booking detail	8	change_bookingdetail
31	Can delete booking detail	8	delete_bookingdetail
32	Can view booking detail	8	view_bookingdetail
33	Can add package	9	add_package
34	Can change package	9	change_package
35	Can delete package	9	delete_package
36	Can view package	9	view_package
37	Can add user vehicle	10	add_uservehicle
38	Can change user vehicle	10	change_uservehicle
39	Can delete user vehicle	10	delete_uservehicle
40	Can view user vehicle	10	view_uservehicle
41	Can add vehicle	11	add_vehicle
42	Can change vehicle	11	change_vehicle
43	Can delete vehicle	11	delete_vehicle
44	Can view vehicle	11	view_vehicle
45	Can add vehicle database	12	add_vehicledatabase
46	Can change vehicle database	12	change_vehicledatabase
47	Can delete vehicle database	12	delete_vehicledatabase
48	Can view vehicle database	12	view_vehicledatabase
\.


--
-- Data for Name: bookings_bookingdetail; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.bookings_bookingdetail (id, booking_id, booking_date, booking_time, booking_status, owner_id, package_id_id, vehicle_id_id) FROM stdin;
\.


--
-- Data for Name: bookings_package; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.bookings_package (id, package_type, package_name, price, description, slug) FROM stdin;
1	MOT	MOT	45	MOT Only	mot
2	Servicing	Basic Service	120	Basic Checks	basicservice
3	Servicing	Interim Service	150	Interim Service	interimservice
4	Servicing	Full Service	200	Full Servicing	fullservice
5	Offers	Interim Service + MOT	170	interim service + MOT	motandservice1
6	Offers	Full Service + MOT	220	Full Servicing + MOT	motandservice2
\.


--
-- Data for Name: bookings_uservehicle; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.bookings_uservehicle (id, user_id, vehicle_id) FROM stdin;
\.


--
-- Data for Name: bookings_vehicle; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.bookings_vehicle (id, make, model, reg, year) FROM stdin;
\.


--
-- Data for Name: bookings_vehicledatabase; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.bookings_vehicledatabase (id, reg, make, model, year) FROM stdin;
1	HH24BBB	BMW	X1	2024
2	SS16DDD	Toyota	Auris	2016
3	GG18NNN	Ford	Kuga	2018
4	KK25TST	Mercedes	GLA	2025
5	TE10STT	KIA	Rio	2010
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-08-29 19:06:21.483046+01	1	MOT	1	[{"added": {}}]	9	1
2	2025-08-29 19:06:48.062373+01	2	Basic Service	1	[{"added": {}}]	9	1
3	2025-08-29 19:07:11.823187+01	3	Interim Service	1	[{"added": {}}]	9	1
4	2025-08-29 19:07:26.709752+01	4	Full Service	1	[{"added": {}}]	9	1
5	2025-08-29 19:07:54.712297+01	5	Interim Service + MOT	1	[{"added": {}}]	9	1
6	2025-08-29 19:08:17.949461+01	6	Full Service + MOT	1	[{"added": {}}]	9	1
7	2025-08-29 19:09:21.037042+01	1	1	1	[{"added": {}}]	12	1
8	2025-08-29 19:09:54.282117+01	2	2	1	[{"added": {}}]	12	1
9	2025-08-29 19:10:40.333886+01	3	3	1	[{"added": {}}]	12	1
10	2025-08-29 19:11:10.884815+01	4	4	1	[{"added": {}}]	12	1
11	2025-08-29 19:11:53.948034+01	5	5	1	[{"added": {}}]	12	1
12	2025-08-29 21:28:55.257365+01	3	3	1	[{"added": {}}]	6	1
13	2025-08-29 21:29:06.036847+01	3	3	2	[{"changed": {"fields": ["Username"]}}]	6	1
14	2025-08-29 21:31:45.989373+01	1	1	2	[{"changed": {"fields": ["Email"]}}]	6	1
15	2025-08-29 21:31:57.541292+01	2	2	2	[{"changed": {"fields": ["Email"]}}]	6	1
16	2025-09-01 21:31:32.261501+01	8	2 - 2025-09-02 12:00	3		8	1
17	2025-09-01 21:31:32.264+01	7	2 - 2025-09-02 11:00	3		8	1
18	2025-09-01 21:31:32.264501+01	6	2 - 2025-09-02 10:00	3		8	1
19	2025-09-01 21:31:32.265+01	5	2 - 2025-09-02 09:00	3		8	1
20	2025-09-01 21:31:32.265501+01	4	2 - 2025-08-31 10:00	3		8	1
21	2025-09-01 21:31:32.266001+01	3	2 - 2025-08-30 10:00	3		8	1
22	2025-09-01 21:31:32.266001+01	2	2 - 2025-08-31 11:00	3		8	1
23	2025-09-01 21:31:32.266502+01	1	2 - 2025-08-30 09:00	3		8	1
24	2025-09-01 21:31:44.792874+01	7	TE10STT	3		11	1
25	2025-09-01 21:31:44.794373+01	6	SS16DDD	3		11	1
26	2025-09-01 21:31:44.794874+01	5	HH24BBB	3		11	1
27	2025-09-01 21:31:44.795374+01	4	TE10STT	3		11	1
28	2025-09-01 21:31:44.795374+01	3	GG18NNN	3		11	1
29	2025-09-01 21:31:44.795874+01	2	SS16DDD	3		11	1
30	2025-09-01 21:31:44.796374+01	1	HH24BBB	3		11	1
31	2025-09-01 21:32:01.038341+01	4	4	3		6	1
32	2025-09-01 21:32:01.039341+01	2	2	3		6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	users	profile
8	bookings	bookingdetail
9	bookings	package
10	bookings	uservehicle
11	bookings	vehicle
12	bookings	vehicledatabase
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-08-29 19:04:45.3956+01
2	contenttypes	0002_remove_content_type_name	2025-08-29 19:04:45.400599+01
3	auth	0001_initial	2025-08-29 19:04:45.410099+01
4	auth	0002_alter_permission_name_max_length	2025-08-29 19:04:45.4226+01
5	auth	0003_alter_user_email_max_length	2025-08-29 19:04:45.424599+01
6	auth	0004_alter_user_username_opts	2025-08-29 19:04:45.426599+01
7	auth	0005_alter_user_last_login_null	2025-08-29 19:04:45.428599+01
8	auth	0006_require_contenttypes_0002	2025-08-29 19:04:45.4296+01
9	auth	0007_alter_validators_add_error_messages	2025-08-29 19:04:45.431599+01
10	auth	0008_alter_user_username_max_length	2025-08-29 19:04:45.434101+01
11	auth	0009_alter_user_last_name_max_length	2025-08-29 19:04:45.436104+01
12	auth	0010_alter_group_name_max_length	2025-08-29 19:04:45.439108+01
13	auth	0011_update_proxy_permissions	2025-08-29 19:04:45.441107+01
14	auth	0012_alter_user_first_name_max_length	2025-08-29 19:04:45.443608+01
15	users	0001_initial	2025-08-29 19:04:45.45667+01
16	admin	0001_initial	2025-08-29 19:04:45.474113+01
17	admin	0002_logentry_remove_auto_add	2025-08-29 19:04:45.480614+01
18	admin	0003_logentry_add_action_flag_choices	2025-08-29 19:04:45.483902+01
19	bookings	0001_initial	2025-08-29 19:04:45.494902+01
20	bookings	0002_auto_20250829_1904	2025-08-29 19:04:45.518902+01
21	sessions	0001_initial	2025-08-29 19:04:45.524902+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mu9x7gqaxkneuw3s6gudbmc1ukg7d0hl	.eJxVjE0OwiAYBe_C2pACBcSl-56h-f6QqqFJaVfGu2uTLnT7Zua91AjbWsatyTJOrC7KqNPvhkAPqTvgO9TbrGmu6zKh3hV90KaHmeV5Pdy_gwKtfGuglG2yHgxkJ4k4iEMMQuy8gI8hgetjyEyYO6Fzx9g7Agt9IhN9p94fGl45Gw:1us4Iv:CqLIkfKmFb7dNkYaVlND_7AY4Z176bejvEobb_hk_oo	2025-09-12 19:58:29.692493+01
w3n2e3ty7wxk78uwi8h4pmv5zxw6xv32	.eJxVjE0OwiAYBe_C2pACBcSl-56h-f6QqqFJaVfGu2uTLnT7Zua91AjbWsatyTJOrC7KqNPvhkAPqTvgO9TbrGmu6zKh3hV90KaHmeV5Pdy_gwKtfGuglG2yHgxkJ4k4iEMMQuy8gI8hgetjyEyYO6Fzx9g7Agt9IhN9p94fGl45Gw:1us6Y4:q8KYdLrbg3GQG_MOUGpK27nODOCS09Ri9Z7CXU6OShw	2025-09-12 22:22:16.639112+01
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.users_profile (id, first_name, last_name, contact, address, city, postcode, date, user_id) FROM stdin;
3	\N	\N	\N				2025-08-29 21:28:55.249858+01	3
1	\N	\N	\N				2025-08-29 19:05:10.955732+01	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.users_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email) FROM stdin;
3	pbkdf2_sha256$216000$tfI9P6AA986n$9CmPHiHjDaFhRJMD9gni/nvTjxnFz8v+b1S1EZySOgA=	2025-09-01 13:39:36.427517+01	f			t	t	2025-08-29 21:23:17+01	staff	staff@example.com
1	pbkdf2_sha256$216000$UDbY8bfwjc0J$+SHjYpKAtY/PmcF5gdCy0jI9jDtJQBPnZDElPoYetEI=	2025-09-01 21:31:09.560644+01	t			t	t	2025-08-29 19:05:10+01	admin	admin@example.com
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: useruser
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: bookings_bookingdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.bookings_bookingdetail_id_seq', 8, true);


--
-- Name: bookings_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.bookings_package_id_seq', 6, true);


--
-- Name: bookings_uservehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.bookings_uservehicle_id_seq', 7, true);


--
-- Name: bookings_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.bookings_vehicle_id_seq', 7, true);


--
-- Name: bookings_vehicledatabase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.bookings_vehicledatabase_id_seq', 5, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 32, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 4, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useruser
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: bookings_bookingdetail bookings_bookingdetail_booking_id_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail
    ADD CONSTRAINT bookings_bookingdetail_booking_id_key UNIQUE (booking_id);


--
-- Name: bookings_bookingdetail bookings_bookingdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail
    ADD CONSTRAINT bookings_bookingdetail_pkey PRIMARY KEY (id);


--
-- Name: bookings_package bookings_package_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_package
    ADD CONSTRAINT bookings_package_pkey PRIMARY KEY (id);


--
-- Name: bookings_package bookings_package_slug_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_package
    ADD CONSTRAINT bookings_package_slug_key UNIQUE (slug);


--
-- Name: bookings_uservehicle bookings_uservehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_uservehicle
    ADD CONSTRAINT bookings_uservehicle_pkey PRIMARY KEY (id);


--
-- Name: bookings_vehicle bookings_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_vehicle
    ADD CONSTRAINT bookings_vehicle_pkey PRIMARY KEY (id);


--
-- Name: bookings_vehicledatabase bookings_vehicledatabase_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_vehicledatabase
    ADD CONSTRAINT bookings_vehicledatabase_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: bookings_bookingdetail_booking_id_12740561_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_bookingdetail_booking_id_12740561_like ON public.bookings_bookingdetail USING btree (booking_id varchar_pattern_ops);


--
-- Name: bookings_bookingdetail_owner_id_f01720da; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_bookingdetail_owner_id_f01720da ON public.bookings_bookingdetail USING btree (owner_id);


--
-- Name: bookings_bookingdetail_package_id_id_869605d5; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_bookingdetail_package_id_id_869605d5 ON public.bookings_bookingdetail USING btree (package_id_id);


--
-- Name: bookings_bookingdetail_vehicle_id_id_1b9a6efd; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_bookingdetail_vehicle_id_id_1b9a6efd ON public.bookings_bookingdetail USING btree (vehicle_id_id);


--
-- Name: bookings_package_slug_3107c2a3_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_package_slug_3107c2a3_like ON public.bookings_package USING btree (slug varchar_pattern_ops);


--
-- Name: bookings_uservehicle_user_id_f5087fff; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_uservehicle_user_id_f5087fff ON public.bookings_uservehicle USING btree (user_id);


--
-- Name: bookings_uservehicle_vehicle_id_c1b00dba; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX bookings_uservehicle_vehicle_id_c1b00dba ON public.bookings_uservehicle USING btree (vehicle_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: useruser
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_bookingdetail bookings_bookingdeta_package_id_id_869605d5_fk_bookings_; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail
    ADD CONSTRAINT bookings_bookingdeta_package_id_id_869605d5_fk_bookings_ FOREIGN KEY (package_id_id) REFERENCES public.bookings_package(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_bookingdetail bookings_bookingdeta_vehicle_id_id_1b9a6efd_fk_bookings_; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail
    ADD CONSTRAINT bookings_bookingdeta_vehicle_id_id_1b9a6efd_fk_bookings_ FOREIGN KEY (vehicle_id_id) REFERENCES public.bookings_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_bookingdetail bookings_bookingdetail_owner_id_f01720da_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_bookingdetail
    ADD CONSTRAINT bookings_bookingdetail_owner_id_f01720da_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_uservehicle bookings_uservehicle_user_id_f5087fff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_uservehicle
    ADD CONSTRAINT bookings_uservehicle_user_id_f5087fff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_uservehicle bookings_uservehicle_vehicle_id_c1b00dba_fk_bookings_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.bookings_uservehicle
    ADD CONSTRAINT bookings_uservehicle_vehicle_id_c1b00dba_fk_bookings_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.bookings_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict 1gwbtzaTm7kUWXTzqbSjsZMnKDdHxLM1nO0e1G95eAIO51yk9H4rUN6yTgg7BCS

