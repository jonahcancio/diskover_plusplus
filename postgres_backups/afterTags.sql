--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrator (
    firstname character varying(30) NOT NULL,
    lastname character varying(20) NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(200) NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    name character varying(50) NOT NULL,
    image character varying(260),
    url character varying(50),
    marker character varying(260),
    "routeMarker" character varying(260),
    "routeColor" character varying(7),
    id integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    location character varying(100) NOT NULL,
    img_url character varying(260) NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: inside; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inside (
    room character varying(100) NOT NULL,
    building character varying(100) NOT NULL
);


ALTER TABLE public.inside OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    name character varying(100) NOT NULL,
    description text,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    url character varying(100),
    id integer NOT NULL,
    category_id integer,
    more_info text
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_copy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_copy (
    name character varying(100),
    category character varying(50),
    description text,
    more_info text,
    lat double precision,
    lng double precision,
    url character varying(100),
    id integer
);


ALTER TABLE public.location_copy OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: login_tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_tracker (
    id integer NOT NULL,
    username character varying(15) NOT NULL,
    ip_addr character varying(30) NOT NULL,
    "consecutiveFails" integer NOT NULL,
    "lastAttemptTime" timestamp without time zone NOT NULL
);


ALTER TABLE public.login_tracker OWNER TO postgres;

--
-- Name: login_tracker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_tracker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_tracker_id_seq OWNER TO postgres;

--
-- Name: login_tracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_tracker_id_seq OWNED BY public.login_tracker.id;


--
-- Name: subarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subarea (
    sub_id integer NOT NULL,
    building_id integer
);


ALTER TABLE public.subarea OWNER TO postgres;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tag_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag_location (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.tag_location OWNER TO postgres;

--
-- Name: tag_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_location_id_seq OWNER TO postgres;

--
-- Name: tag_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_location_id_seq OWNED BY public.tag_location.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: login_tracker id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_tracker ALTER COLUMN id SET DEFAULT nextval('public.login_tracker_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tag_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_location ALTER COLUMN id SET DEFAULT nextval('public.tag_location_id_seq'::regclass);


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator (firstname, lastname, username, password, status) FROM stdin;
CS 191	Team D4C	d4cteam	pbkdf2:sha256:50000$aZ31bAr1$9f9d482d4e9e609544211b0083eadb874237032531a4290f2243044025a1e752	t
CS 192	Team Deep	teamdeep	pbkdf2:sha256:50000$1v4UzpcA$41428f984e723724c4d8c39c3395548363f271555d49a7637829f66cb7a911f1	f
In	Active	inactive	pbkdf2:sha256:50000$ZQrOCNt4$b4043c3e50b0c03f63ec799ca5c417fcfe9c6002111458235e294ac3f7076973	f
Guest	Account	guest76	pbkdf2:sha256:50000$NDTm9GDH$1305efa45c40d1f42b793aecfb4b73cfdaca506b767da7229d8383f4bc1406d2	f
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add administrator	1	add_administrator
2	Can change administrator	1	change_administrator
3	Can delete administrator	1	delete_administrator
4	Can view administrator	1	view_administrator
5	Can add category	2	add_category
6	Can change category	2	change_category
7	Can delete category	2	delete_category
8	Can view category	2	view_category
9	Can add image	3	add_image
10	Can change image	3	change_image
11	Can delete image	3	delete_image
12	Can view image	3	view_image
13	Can add inside	4	add_inside
14	Can change inside	4	change_inside
15	Can delete inside	4	delete_inside
16	Can view inside	4	view_inside
17	Can add location	5	add_location
18	Can change location	5	change_location
19	Can delete location	5	delete_location
20	Can view location	5	view_location
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add permission	7	add_permission
26	Can change permission	7	change_permission
27	Can delete permission	7	delete_permission
28	Can view permission	7	view_permission
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
45	Can add administrator	12	add_administrator
46	Can change administrator	12	change_administrator
47	Can delete administrator	12	delete_administrator
48	Can view administrator	12	view_administrator
49	Can add category	13	add_category
50	Can change category	13	change_category
51	Can delete category	13	delete_category
52	Can view category	13	view_category
53	Can add image	14	add_image
54	Can change image	14	change_image
55	Can delete image	14	delete_image
56	Can view image	14	view_image
57	Can add inside	15	add_inside
58	Can change inside	15	change_inside
59	Can delete inside	15	delete_inside
60	Can view inside	15	view_inside
61	Can add location	16	add_location
62	Can change location	16	change_location
63	Can delete location	16	delete_location
64	Can view location	16	view_location
65	Can add subarea	17	add_subarea
66	Can change subarea	17	change_subarea
67	Can delete subarea	17	delete_subarea
68	Can view subarea	17	view_subarea
69	Can add tag	18	add_tag
70	Can change tag	18	change_tag
71	Can delete tag	18	delete_tag
72	Can view tag	18	view_tag
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$lYrwrKZutCcq$r1mjm4HP8+3OVNa3MqWZtX+nQUSeDTO3NgUnmMoOzow=	2019-02-28 11:01:15.996513+08	t	cs192-diskover			diskoverupd2018@gmail.com	t	t	2019-02-28 09:53:37.704892+08
2	pbkdf2_sha256$120000$XG6DpBale1GI$dsEx9xOk1pMUtIBC4GGdJiubLe/xRAu90cnGbRuLJ0c=	2019-04-02 21:20:53.328977+08	t	d4cteam			diskoverplusplus@gmail.com	t	t	2019-03-22 10:23:37.992844+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (name, image, url, marker, "routeMarker", "routeColor", id) FROM stdin;
Rooms	room.jpg	rooms	schoolIcon.png	schoolRouteIcon.png	#1E90FF	2
Parking Areas	parking.jpg	parking-lots	parkingIcon.png	parkingRouteIcon.png	#800080	4
Comfort Rooms	toilet.jpg	comfort-rooms	toiletIcon.png	toiletIcon.png	#FF7F50	5
Jeepney Stops	jeepstop.jpg	jeepney-stops	jeepstopIcon.png	jeepstopRouteIcon.png	#B22222	6
Entrances/Exits	\N	\N	\N	\N	\N	7
Landmarks	\N	\N	\N	\N	\N	8
Food Services	food.jpg	food-service	foodIcon.png	foodRouteIcon.png	#B22222	3
Buildings	college.jpg	college-buildings	schoolIcon.png	schoolRouteIcon.png	#1E90FF	1
Offices/Facilities	\N	\N	\N	\N	\N	9
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-03-31 15:08:44.021704+08	9	Category object (9)	1	[{"added": {}}]	13	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	DiskoverApp	administrator
2	DiskoverApp	category
3	DiskoverApp	image
4	DiskoverApp	inside
5	DiskoverApp	location
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
12	api	administrator
13	api	category
14	api	image
15	api	inside
16	api	location
17	api	subarea
18	api	tag
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	DiskoverApp	0001_initial	2019-02-06 18:43:47.390291+08
2	DiskoverApp	0002_auto_20190128_0859	2019-02-06 18:43:47.496271+08
3	DiskoverApp	0003_auto_20190128_0905	2019-02-06 18:43:47.502256+08
4	contenttypes	0001_initial	2019-02-06 18:43:47.762508+08
5	auth	0001_initial	2019-02-06 18:43:48.966594+08
6	admin	0001_initial	2019-02-06 18:43:49.228629+08
7	admin	0002_logentry_remove_auto_add	2019-02-06 18:43:49.238067+08
8	admin	0003_logentry_add_action_flag_choices	2019-02-06 18:43:49.250035+08
9	contenttypes	0002_remove_content_type_name	2019-02-06 18:43:49.296917+08
10	auth	0002_alter_permission_name_max_length	2019-02-06 18:43:49.306917+08
11	auth	0003_alter_user_email_max_length	2019-02-06 18:43:49.315868+08
12	auth	0004_alter_user_username_opts	2019-02-06 18:43:49.325868+08
13	auth	0005_alter_user_last_login_null	2019-02-06 18:43:49.336834+08
14	auth	0006_require_contenttypes_0002	2019-02-06 18:43:49.339809+08
15	auth	0007_alter_validators_add_error_messages	2019-02-06 18:43:49.358752+08
16	auth	0008_alter_user_username_max_length	2019-02-06 18:43:49.434678+08
17	auth	0009_alter_user_last_name_max_length	2019-02-06 18:43:49.447719+08
18	sessions	0001_initial	2019-02-06 18:43:49.71036+08
19	api	0001_initial	2019-03-22 10:28:41.126211+08
20	api	0002_category	2019-03-31 14:49:02.281856+08
21	api	0003_subarea	2019-04-01 15:18:29.593732+08
22	api	0004_inside_clear	2019-04-01 22:20:45.4597+08
23	api	0005_remove-admin	2019-04-06 14:15:52.61032+08
24	api	0006_tags	2019-04-06 14:41:14.468331+08
25	api	0007_cascade	2019-04-06 23:04:33.655396+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (location, img_url) FROM stdin;
AH 202-204	ah-202-204.jpg
AH 206-208	ah-206-208.jpg
AH Annex 222	ah-annex-222.jpg
ASCAL Food Kiosks	ascal-food-kiosks.jpg
Arkivickie	arkivickie.jpg
CAL 201	cal-201.JPG
CAL 209	cal-209.JPG
CAL 210	cal-210.JPG
CAL 301	cal-301.JPG
CAL 309	cal-309.JPG
CAL 310	cal-310.JPG
CAL 401	cal-401.JPG
CAL 408	cal-408.JPG
CAL 409	cal-409.JPG
CAL Parking Lot 1	cal-parking-lot.jpg
CFA Comfort Rooms	cfa-toilet.JPG
CFA Parking Lot	cfa-parking-lot.JPG
CHE Gusali 2 Comfort Rooms	che-gusali-2-toilet.jpg
CHE Room D	che-room-d.JPG
CHE Room E	che-room-e.JPG
College of Arts and Letters (CAL)	college-of-arts-and-letters.jpg
College of Home Economics Gusali 2 (CHE)	college-of-home-economics-gusali-2.jpg
E. de Los Santos Street	edsa-st.jpg
Encarnacion Hall Comfort Rooms	encarnacion-toilet.jpg
Engineering Theater	engineering-theater.jpg
FA B1 & B2	fa-b1-&-b2.JPG
FA B4 & B5	fa-b4-&-b5.JPG
FA B6	fa-b6.JPG
FA RGEP 1	fa-rgep-1.JPG
FA RGEP 2	fa-rgep-2.JPG
FA T2	fa-t2.JPG
FA T3	fa-t3.JPG
Glorias Cafe	glorias-cafe.jpg
Gusali 2 Parking Lot	gusali-2-parking-lot.jpg
IC 305-306	ic-305-306.jpg
IC 307-308	ic-307-308.jpg
IC 309-310	ic-309-310.jpg
IC 311-312	ic-311-312.jpg
IC 313-314	ic-313-314.jpg
IC 315-316	ic-315-316.jpg
IC 330-331	ic-330-331.jpg
IC CHEMREZ	ic-chemrez.jpg
IC Chevron	ic-chevron.jpg
Institute of Mathematics Annex (MBAn)	institute-of-mathematics-annex.jpg
Institute of Mathematics Parking Lot 1	math_parking_1.JPG
Institute of Mathematics Parking Lot 1	math-building-parking-lot-1.jpg
Institute of Mathematics Parking Lot 2	math_parking_2.JPG
LAW 110 (Ambion Room)	law-110-ambion-room.JPG
LAW 200	law-200.JPG
LAW 221	law-221.JPG
LAW 307	law-307.JPG
LAW 311	law-311.JPG
Law Complex Parking Lot	law-complex-parking-lot.JPG
MB 301	mb-301.jpg
MB 302	mb-302.jpg
MB 303	mb-303.jpg
MB 304	mb-304.jpg
MB 305	mb-305.jpg
MB 306	mb-306.jpg
MB 307	mb-307.jpg
MB 308	mb-308.jpg
MB 321	mb-321.jpg
MB 322	mb-322.jpg
MB 323	mb-323.jpg
MB 328	mb-328.jpg
MB 329	mb-329.jpg
MB Comfort Rooms	mb-toilet.jpg
MBAn 305	mban-305.jpg
MBAn 306	mban-306.jpg
MBAn 313	mban-313.jpg
MBAn 314	mban-314.jpg
MBAn 401	mban-401.jpg
MBAn 402	mban-402.jpg
MBAn 403	mban-403.jpg
MBAn AVR 1	mban-avr-1.jpg
MBAn AVR 2	mban-avr-2.jpg
MBAn Comfort Rooms	mban-toilet.jpg
MH 301-303	mh301_303.jpg
MH 314-316	mh314_316.jpg
MH 318-320	mh318_320.jpg
MH 416-418	mh416_418.jpg
MH 422-424	mh422_424.jpg
MH 501	mh501.jpg
Melchor Hall Comfort Rooms (Left Wing)	melchor-hall-left-toilet.jpg
Melchor Hall Comfort Rooms (Right Wing)	melchor-hall-right-toilet.jpg
NCPAG 301-302	ncpag-301-302.JPG
NCPAG 305	ncpag-305.JPG
NCPAG 306	ncpag-306.JPG
NCPAG 307A	ncpag-307a.JPG
NCPAG 308	ncpag-308.JPG
NCPAG 309	ncpag-309.JPG
NCPAG AVR	ncpag-avr.JPG
NCPAG Cafe	ncpag-cafe.JPG
NCPAG Parking Lot	ncpag-parking-lot.JPG
NIGS 125	nigs-125.jpg
NIGS 127	nigs-127.jpg
NIGS 128	nigs-128.jpg
NIGS 211	nigs-211.jpg
NIGS 215	nigs-215.jpg
NIGS Canteen	nigs-canteen.jpg
NIGS Comfort Rooms	nigs-toilet.jpg
NIGS Parking Lot	nigs-parking-lot.jpg
NIP Comfort Rooms	nip-toilet.jpg
NIP F201	nip-f201.jpg
NIP F202	nip-f202.jpg
NIP F203	nip-f203.jpg
NIP F204	nip-f204.jpg
NIP F205	nip-f205.jpg
NIP F206	nip-f206.jpg
NIP F207	nip-f207.jpg
NIP F208	nip-f208.jpg
NIP F209	nip-f209.jpg
NIP F210	nip-f210.jpg
NIP Lecture Pavilion 101	nip-lecture-pavilion-101.jpg
NIP Lecture Pavilion 102	nip-lecture-pavilion-102.jpg
NIP Lecture Pavilion 103	nip-lecture-pavilion-103.jpg
NIP Lecture Pavilion 104	nip-lecture-pavilion-104.jpg
National Institute of Geological Sciences	national-institute-of-geological-sciences.jpg
PAV1 1114	pav1-1114.jpg
PAV1 1115	pav1-1115.jpg
PAV1 1206	pav1-1206.jpg
College of Architecture Building 2 (Juguilon Hall) (JH)	college-of-architecture-building-2.jpg
College of Architecture Building 1 (Archi Lab) (CA)	college-of-architecture-building-1.jpg
Melchor Hall Parking Lot 1 (Engineering)	melchor-hall-parking-lot-1.jpg
Abelardo Hall (ABH) (College of Music)	abelardo-hall.jpg
PAV1 1210	pav1-1210.jpg
PAV1 1213	pav1-1213.jpg
PAV1 1214	pav1-1214.jpg
PAV1 1222	pav1-1222.jpg
PAV1 1228	pav1-1228.jpg
PAV1 1230	pav1-1230.jpg
PAV1 1232	pav1-1232.jpg
PH 108-110	ph-108-110.jpg
PH 116-118	ph-116-118.jpg
PH 120-122	ph-120-122.jpg
PH 207ABC	ph-207abc.JPG
PH 213-215	ph-213-215.jpg
PH 216-218	ph-216-218.jpg
PH 308-310	ph-308-310.jpg
PH 312-314	ph-312-314.jpg
PH 324-326	ph-324-326.jpg
PH Parking Lot 1	ph-parking-lot-1.jpg
PH Parking Lot 2	ph-parking-lot-2.jpg
Palma Hall Toilets (Females)	palma-hall-female-toilet.jpg
Palma Hall Toilets (Males)	palma-hall-male-toilet.jpg
SE 103	se-103.JPG
SE 105	se-105.JPG
SE 111	se-111.JPG
SE 114	se-114.JPG
SE 121	se-121.JPG
SE Auditorium	se-auditorium.JPG
SOLAIR 10	solair-10.JPG
SOLAIR 201	solair-201.JPG
SOLAIR 203	solair-203.JPG
SOLAIR Auditorium	solair-auditorium.JPG
SOLAIR Comfort Rooms	solair-toilet.jpg.JPG
SOLAIR Parking Lot	solair-parking-lot.JPG
SS 301	ss-301.jpg
SS 302	ss-302.jpg
SS 303	ss-303.jpg
SS 304	ss-304.jpg
SS 305	ss-305.jpg
SS 306	ss-306.jpg
SS 307	ss-307.jpg
School of Labor & Industrial Relations (SOLAIR)	school-of-labor-and-industrial-relations.JPG
School of Statistics Parking Lot	stat-parking-lot.jpg
School of Statistics Parking Lot	statistics_parking_1.JPG
School of Statistics Parking Lot	statistics_parking_2.JPG
UP School of Economics (SE)	up-school-of-economics.jpg
UP Stat Comfort Rooms	stat-toilet.jpg
Abelardo Hall Comfort Rooms	abelardo-toilet.jpg
Abelardo Hall Parking Lot	abelardo-hall-parking-lot
MH 305-307	mh-305-307.jpg
MH 306-308	mh-306-308.jpg
MH 309-311	mh-309-311.jpg
MH 313-315	mh-313-315.jpg
Malcolm Hall Theater	malcolm-hall-theater.jpg
National College of Public Administration & Governance (NCPAG)	national-college-of-public-administration-and-governance.jpg
National Institute of Physics (NIP)	national-institute-of-physics.jpg
Palma Hall (PH)	palma-hall.jpg
Penthouse Lecture Hall	penthouse-lecture-hall.jpg
Procter & Gamble AVR	pandg2.jpg
Procter & Gamble AVR	pandg.jpg
School of Economics Parking Lot	econ-parking-lot.jpg
Parking Area across Center for Women's Studies	across_gender_studies_parking.JPG
Law Complex Parking Lot 2	across_law_parking.JPG
Bahay ng Alumni Parking Lots	alumni_bahay_parking_1.JPG
Bahay ng Alumni Parking Lots	alumni_bahay_parking_2.JPG
Shopping Center Parking Lots	behind_shopping_parking_1.JPG
Shopping Center Parking Lots	behind_shopping_parking_2.JPG
School of Economics Street Parking	beside_econ_parking.JPG
College of Arts and Letters Parking Lot 2	cal_parking.JPG
CSWCD Parking Lot	cswcd_parking.JPG
UP AECH Parking Lot	dcs_parking.JPG
UP Film Institute Parking Lot	film_center_parking_1.JPG
UP Film Institute Parking Lot	film_center_parking_2.JPG
College of Home Economics Gusali 2 Parking Lot	gusali2_parking.JPG
Institute of Electrical and Electronics Engineering Parking Lot 1	ieee_parking.JPG
Institute of Biology Parking Lot	institute_of_biology_parking.JPG
Marine Science Institute Parking Lot	marine_parking.JPG
NIMBB Parking Strip	nimbb_parking.JPG
NIMBB Parking Lot	nimbb_rear_parking_1.JPG
NIMBB Parking Lot	nimbb_rear_parking_2.JPG
NISMED Parking Lot	nismed_parking.JPG
National Institute of Physics Parking Strip	physics_chem_parking.JPG
Quirino Avenue	quirino_ave_parking.JPG
Regidor Street	regidor_st_parking.JPG
University Theater Parking Lot	univ_theater_parking.JPG
Area 2 Jeepney Stop	Area 2.jpg
Arki Jeepney Stop	Arki.jpg
Biology Jeepney Stop	Bio.jpg
Centennial Residence Hall Jeepney Stop	Centennial.jpg
Dagohoy Jeepney Stop	Dagohoy.jpg
EEE Jeepney Stop	EEE.jpg
MBB Jeepney Stop	MBB.jpg
NIP Jeepney Stop	NIP.jpg
Romulo Hall Jeepney Stop	Romulo Hall.jpg
CAL Jeepney Stop	ASCAL.jpg
CS Library Jeepney Stop	CS Lib.jpg
Kalayaan Jeepney Stop	Kalay.jpg
Malcolm Hall Jeepney Stop	Law2.jpg
Molave Residence Hall Jeepney Stop	Molave.jpg
NIGS Jeepney Stop	NIGS.jpg
NSRI Jeepney Stop	NSRI.jpg
OUR Jeepney Stop	OUR.jpg
SOLAIR 11	solair-11.JPG
Malcolm Hall (LAW) (College of Law)	malcolm-hall.jpg
Melchor Hall (MH) (College of Engineering)	melchor-hall.jpg
School of Statistics (SS) (STAT)	school-of-statistics.JPG
Abelardo Hall Annex (College of Music Annex)	abelardo-hall-annex.jpg
Plaridel Hall Parking Lot	plaridel_parking.JPG
JH 101	room-101.jpg
JH 102	room-102.jpg
JH 103	room-103.jpg
JH 104	room-104.jpg
JH 105	room-105.jpg
JH 106	room-106.jpg
College of Science Library Parking Lot	cslib_parking.JPG
Swimming Pool Jeepney Stop	Swimming pool.jpg
University Avenue Jeepney Stop 1	Univ Ave 1.jpg
University Avenue Jeepney Stop 2	Univ Ave 2.jpg
Area 2	area_2_1.jpg
Area 2	area_2_2.jpg
Area 2	area_2_3.jpg
CASAA Food Court	casaa.jpg
Kuya Ramon's Food Hub	ieee_food_1.jpg
Kuya Ramon's Food Hub	ieee_food_2.jpg
Mang Larry's Isawan	mang_larrys.jpg
Vinzons Hall Food Kiosks	vinzons_food_1.jpg
Vinzons Hall Food Kiosks	vinzons_food_2.jpg
Institute of Electrical and Electronics Engineering Parking Lot 2	ieee_parking_right.JPG
CAL Parking Lot 2	cal_parking_2.JPG
Institute of Mathematics Cafeteria	inst_of_math_cafeteria.JPG
Institute of Mathematics Food Kiosk	inst_of_math_food_kiosk.JPG
Sari-sari Stores across Bulwagang Rizal	kiosks_across_cal.JPG
NISMED Cafeteria	nismed_cafeteria.JPG
Regidor St. Food Kiosk	regidor_st_food_kiosk.JPG
Vinzons Hall Parking Lots	vinzons_hall_parking_1.JPG
Vinzons Hall Parking Lots	vinzons_hall_parking_2.JPG
Vinzons Hall University Food Service	vinzons_univ_food_service.JPG
Bocobo Hall Jeepney Stop	Law.jpg
Bulwagang Rizal Jeepney Stop	bulwagang_rizal_stop.JPG
Church of the Risen Lord Jeepney Stop	CRL.jpg
Lagmay Hall Jeepney Stop	lagmay_stop.JPG
Melchor Hall Jeepney Stop	melchor_stop.JPG
Quezon Hall Jeepney Stop	quezon_hall_stop.JPG
School of Economics Jeepney Stop	econ_stop.JPG
Shopping Center Jeepney Stop	Shopping Center.jpg
SURP Jeepney Stop	SURP.jpg
University Theater Jeepney Stop	univ_theater_stop.JPG
UPFI Jeepney Stop	UPFI.jpg
Vanguard Jeepney Stop	Vanguard.jpg
Vinzons Hall Jeepney Stops	vinzons_stop_1.JPG
Vinzons Hall Jeepney Stops	vinzons_stop_2.JPG
Vinzons Hall Jeepney Stops	vinzons_stop_3.JPG
SS Lecture Hall 1	SS_Lec_Hall_1.JPG
SS Lecture Hall 2	SS_Lec_Hall_2.JPG
SOLAIR 203	SOLAIR_203.JPG
School of Labor & Industrial Relations (SOLAIR)	SOLAIR_Entrance.JPG
AH 226	ah-226.jpg
CMC - B Viewing Room	CMC_BViewingRoom.JPG
PH Multimedia Room (PH 400)	PH_400.jpg
CMC - Auditorium	CMC_Auditorium1.JPG
CMC - PhilStar Room	CMC_PhilStarRoom.JPG
Plaridel Hall (College of Mass Communication - CMC)	CMC_ParkingLot1.JPG
SOLAIR 12	SOLAIR_12.JPG
Institute of Mathematics Main Building (MB)	institute-of-mathematics-main-building.jpg
CAL 211	CAL_211.jpg
CAL 212	CAL_212.jpg
CAL 213	CAL_213.jpg
CAL 501	CAL_501.jpg
CAL 502	CAL_502.jpg
CAL 503	CAL_503.jpg
CAL 510	CAL_510.jpg
CAL 512	CAL_512.jpg
Bocobo Hall (Law Center) (BOC)	bocobo-hall.JPG
Institute of Chemistry Teaching Building (IC)	institute-of-chemistry-teaching-building.jpg
College of Fine Arts (CFA)	CFA_Entrance.jpg
Malcolm Hall Comfort Rooms	MalcolmHall_3rdFloor_CRMale.JPG
Malcolm Hall Comfort Rooms	MalcolmHall_1stFloor_CRFemale.JPG
Malcolm Hall Comfort Rooms	MalcolmHall_1stFloor_CRMale.JPG
Malcolm Hall Comfort Rooms	MalcolmHall_2ndFloor_CRFemale.JPG
Malcolm Hall Comfort Rooms	MalcolmHall_2ndFloor_CRMale.JPG
Malcolm Hall Comfort Rooms	MalcolmHall_3rdFloor_CRFemale.JPG
NCPAG Comfort Rooms	NCPAG_3rdFloor_CRMale.JPG
NCPAG Comfort Rooms	NCPAG_1stFloor_CRFemale.JPG
NCPAG Comfort Rooms	NCPAG_1stFloor_CRMale.JPG
NCPAG Comfort Rooms	NCPAG_2ndFloor_CRFemale.JPG
NCPAG Comfort Rooms	NCPAG_2ndFloor_CRMale.JPG
NCPAG Comfort Rooms	NCPAG_3rdFloor_CRFemale.JPG
Plaridel Hall (CMC) Comfort Rooms	CMC_CRAuditorium.JPG
Plaridel Hall (CMC) Comfort Rooms	CMC_Lobby_CRFemale.JPG
Plaridel Hall (CMC) Comfort Rooms	CMC_Lobby_CRMale.JPG
UP Integrated School – 7-12 Building (UPIS)	upis-a.png
UP Integrated School – 7-12 Building (UPIS)	upis-road.png
UPIS 110	upis-110-a.png
UPIS 111	upis-111.png
UPIS 111	upis-111-padded.png
UPIS 110	upis-110-a.jpg
UPIS 110	upis-110-b.jpg
UPIS 111	upis-111.jpg
Institute of Civil Engineering Cafeteria	inst_of_civil_engg_cafeteria.JPG
Law Center Comfort Rooms	law-1-cr.jpg
Law Center Comfort Rooms	law-2-cr.jpg
Law Center Comfort Rooms	law-3-cr.jpg
UPIS 1st Floor Comfort Rooms	upis-1-cr-d.jpg
UPIS 1st Floor Comfort Rooms	upis-1-cr-f.jpg
UPIS 1st Floor Comfort Rooms	upis-1-cr-m.jpg
UPIS 2nd Floor Comfort Rooms	upis-2-cr-f.jpg
UPIS 2nd Floor Comfort Rooms	upis-2-cr-m-a.jpg
UPIS 2nd Floor Comfort Rooms	upis-2-cr-m-b.jpg
UPIS 3rd Floor Comfort Rooms	upis-3-cr-f.jpg
UPIS 3rd Floor Comfort Rooms	upis-3-cr-m.jpg
UPIS 113	upis-113.jpg
UPIS 120	upis-120-a.jpg
UPIS 120	upis-120-b.jpg
UPIS 121	upis-121.jpg
UPIS 122	upis-122.jpg
UPIS 123	upis-123.jpg
UPIS 124	upis-124-a.jpg
UPIS 124	upis-124-b.jpg
UPIS 125	upis-125-a.jpg
UPIS 125	upis-125-b.jpg
UPIS 126	upis-126-a.jpg
UPIS 126	upis-126-b.jpg
UPIS 127	upis-127-a.jpg
UPIS 127	upis-127-b.jpg
UPIS 128	upis-128-a.jpg
UPIS 128	upis-128-b.jpg
UPIS 129	upis-129.jpg
UPIS 130	upis-130.jpg
UPIS 131	upis-131.jpg
UPIS 132	upis-132.jpg
UPIS 133	upis-133.jpg
UPIS 134	upis-134-a.jpg
UPIS 134	upis-134-b.jpg
UPIS 135	upis-135-a.jpg
UPIS 135	upis-135-b.jpg
UPIS 136	upis-136.jpg
UPIS 137	upis-137.jpg
UP Alumni Center (Fonacier Hall)	FonacierHall.JPG
UP Center for Ethnomusicology	EthnoMusicology.JPG
Department of Military Science and Tactics Complex (DMST)	DMST.jpg
Balay Atleta	BalayAtleta.jpg
College of Music - Dance Studio	DanceStudio.jpg
Yakal Residence Hall	Yakal_Residence_Hall.jpg
Office of the University Registrar	office-univ-registrar.jpg
Diliman Interactive Learning Center (DILC)	DILC2.jpg
Diliman Interactive Learning Center (DILC)	DILC.jpg
Acacia Residence Halls	Acacia.jpg
College of Arts and Letters Faculty Center	CAL_FacultyCenter.jpg
Ipil Residence Hall	Ipil_Back.jpg
Ipil Residence Hall	Ipil_Residence_Hall.jpg
Diliman Learning Resource Center (DLRC)	dlrc_3.jpg
Office of Student Housing	OSH.jpg
Espiritu Hall (College of Law Library)	Espiritu_Hall.jpg
Sanggumay Residence Hall	Sanggumay.jpg
Kalayaan Residence Halls	Kalayaan.jpg
Molave Residence Halls	DSC_00411.JPG
National Institute for Science and Mathematics Education Development (NISMED)	nismed-a.jpg
National Institute for Science and Mathematics Education Development (NISMED)	nismed-b.jpg
UP National Center for Transportation Studies (UP NCTS)	NCTS.jpg
Juinio Hall (National Engineering Center)	JunioHall.jpg
Vidal A. Tan Hall	vidal-a-tan-hall.jpg
PAUW Child Study Center	pauw-child-study-center.jpg
Institute of Civil Engineering (ICE)	institute-of-civil-engineering-a.jpg
Institute of Civil Engineering (ICE)	institute-of-civil-engineering-b.jpg
Executive House	executive-house-a.jpg
Executive House	executive-house-b.jpg
GT Toyota Asian Center	GT_Toyota1.jpg
GT Toyota Asian Center Auditorium	GT_Toyota.jpg
College of Engineering Admin Office	Melchor_Admin.jpg
College of Engineering Library I	Melchor_Library.jpg
Electrical and Electronics Engineering Institute (EEEI)	electrical-and-electronics-engineering-institute-a.jpg
Electrical and Electronics Engineering Institute (EEEI)	electrical-and-electronics-engineering-institute-b.jpg
Department of Mining, Metallurgical & Materials Engineering (DMMME)	dept-mmm-engineering-a.jpg
UP Health Service	HealthService.jpg
Diliman Legal Office (DLO)	dlo.jpg
PAGASA Observatory	pagasa-observatory-a.jpg
UP Marine Science Institute (MSI)	msi-a.jpg
National Institute of Geological Sciences (NIGS)	national-institute-of-geological-sciences-a.jpg
Virata Hall (ISSI - Institute for Small Scale Industries)	Virata.jpg
Virata Hall (ISSI - Institute for Small Scale Industries)	Virata1.jpg
National Institute of Molecular Biology and Biotechnology (NIMBB)	ni-molecular-biology-biotechnology-a.jpg
College of Science Library (CS Library)	college-of-science-library-b.jpg
College of Science Administration	college-of-science-administration-a.jpg
College of Science Administration	college-of-science-administration-b.jpg
Computational Science Research Center (CSRC)	computational-science-research-center-a.jpg
Andres Bonifacio Centennial Carilion Tower and Plaza	BellTower.jpg
National Science Complex Amphitheater	nsc-amphitheater-a.jpg
National Science Complex Amphitheater	nsc-amphitheater-b.jpg
Institute of Environmental Science and Meteorology (IESM)	institute-of-environmental-science-and-meteorology-a.jpg
Philippine Genome Center	philippine-genome-center-b.jpg
Villamor Hall (University Theater)	UP_MainTheater.jpg
Washington Sycip Garden of Native Trees 	UP_SYCP_Trees.jpg
Benton Hall	benton.jpg
CA Comfort Room	archi_cr.jpg
Bulwagan ng Dangal	bulwagan_dangal.jpg
CAL Comfort Rooms 	cal_cr_1.jpg
CAL Parking Lot 1	archi_parking_5.jpg
Coral Building (Office of the Campus Architect) (OCA)	oca_1.jpg
Coral Building (Office of the Campus Architect) (OCA)	oca_2.jpg
Center for International Studies	benton_cis.jpg
Diliman Learning Resource Center (DLRC)	dlrc_1.jpg
Jorge B. Vargas Museum and Filipiniana Research Center	vargas_museum_1.jpg
Jorge B. Vargas Museum and Filipiniana Research Center	vargas_museum_2.jpg
Kamia Residence Hall	kamia_dorm_1.jpg
Kamia Residence Hall	kamia_dorm_2.jpg
Sampaguita Residence Hall	sampaguita_dorm_1.jpg
Sampaguita Residence Hall	sampaguita_dorm_2.jpg
Albert Hall (Archaeological Studies Program) (ASP)	albert_hall.jpg
Benitez Hall (College of Education)	benitez_1.jpg
Benitez Hall (College of Education)	benitez_2.jpg
UP Integrated School — K-2 Building (UPIS)	upis_k2.jpg
Accounting Budget and Cash Office Building	CashOffice.jpg
Romulo Hall (Institute for Islamic Studies)	Romulo_Hall.jpg
Palma Hall Parking Lot	palma_parking.jpg
UP Biology - EDC BINHI (Threatened Species Arboretum)	bio_narnia_1.jpg
UP Biology - EDC BINHI (Threatened Species Arboretum)	bio_narnia_2.jpg
UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)	engg-library-2-a.jpg
Institute of Biology (IB) Comfort Rooms	bio_cr.jpg
School of Economics (SE) Library 	econ_lib_1.jpg
Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)	CSWCD.jpg
Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)	CSWCD2.jpg
UPFI Film Center	UP_Film_Center.jpg
Church of the Risen Lord	Church_of_the_Risen_Lord.jpg
Parish of The Holy Sacrifice	Parish_of_Holy_Sacrifice.jpg
Parish of The Holy Sacrifice	Parish_of_Holy_Sacrifice2.jpg
Parish of The Holy Sacrifice	Parish_of_Holy_Sacrifice3.jpg
German Yia Hall (IE and ME Building)	German_Yia_Hall.jpg
German Yia Hall (IE and ME Building)	German_Yia_Hall2.jpg
Alonso Hall (College of Home Economics) (CHE)	alonso_hall.jpg
Alonso Hall (College of Home Economics) (CHE)	alonso_inner.jpg
UP School of Economics - Philippine Center for Economic Development (PCED)	Philippine_Center_for_Economic_Development.jpg
School of Economics (SE) Library 	econ_lib_2.jpg
Diosdado P Macapagal Hall	econ_diosdado.jpg
Benitez Hall Comfort Rooms	benitez_cr_1.jpg
Benitez Hall Comfort Rooms	benitez_cr_2.jpg
School of Economics (SE) Comfort Rooms	econ_cr.jpg
Benitez 105	benitez_105.jpg
Benitez 108	benitez_108.jpg
Benitez 109	benitez_109.jpg
Benitez 110	benitez_110.jpg
Benitez 200	benitez_200.jpg
Benitez 201	benitez_201.jpg
Benitez 203	benitez_203.jpg
Benitez 205	benitez_205_1.jpg
Benitez 205	benitez_205_2.jpg
Benitez 206	benitez_206.jpg
Benitez 212	benitez_212.jpg
Benitez 304	benitez_304.jpg
Benitez 312	benitez_312.jpg
Benitez Hall Education Library	benitez_lib.jpg
Child Development Center (CDC)	che_daycare.jpg
UP School of Urban and Regional Planning (SURP)	SURPBldg.jpg
College of Home Economics (CHE) Comfort Rooms	che_cr_2.jpg
College of Home Economics (CHE) Comfort Rooms	che_cr_3.jpg
College of Home Economics (CHE) Library	che_lib_1.jpg
College of Home Economics (CHE) Library	che_lib_2.jpg
EEEI VLC	eee_vlc.jpg
EEEI LC1	eee_lc1.jpg
EEEI LC2	eee_lc2.jpg
UP Meralco Innovation Hall	eee_meralco.jpg
Virata School of Business Comfort Rooms	virata_cr_1.jpg
Virata School of Business Comfort Rooms	virata_cr_2.jpg
CASAA Food Court	casaa_interior.jpg
CASAA Food Court	casaa_zoo_2.jpg
NIMBB Cafeteria	mbb_cafe.jpg
NIMBB Library	mbb_lib.jpg
NIMBB Comfort Rooms	mbb_cr_1.jpg
NIMBB Comfort Rooms	mbb_cr_2.jpg
Math Building Comfort Rooms	math_cr_1.jpg
Math Building Comfort Rooms	math_cr_2.jpg
DZUP Tower	DZUPTower.jpg
Epsilon Chi Center	EpsilonChiCenter.jpg
Ang Bahay ng Alumni	Bahay_Alumni.jpg
Ang Bahay ng Alumni Parking Area	Bahay_Alumni_Parking.jpg
Aldaba Hall	Aldaba.jpg
Kamagong Residence Hall	Kamagong.jpg
Post Office (PHLPOST)	PostOffice.jpg
Sentro ng Wikang Filipino	SentroNgWikangFilipino.jpg
Temporary Shopping Center	NewShopping.jpg
Temporary Shopping Center	NewShopping2.jpg
Temporary Shopping Center	NewShopping3.jpg
Office of the Vice Chancellor for Academic Affairs	OVCAA.jpg
Office of International Linkages in Diliman (OIL)	OfficeOfInternationalLinkagesInDiliman.jpg
General Education Center (GEC)	GeneralEducationCenter.jpg
National Service Training Program (NSTP)	NationalServiceTrainingProgram.jpg
Office of Field Activities (OFA)	OfficeOfFieldActivities.jpg
University Food Service	FoodService.jpg
Office of the Chief Security Officer	OfficeChiefSecurityOfficer.jpg
University Computer Center (UCC)	UP_ComputerCenter.jpg
Utilities Management Team (UMT)	UtilitiesManagementTeam.jpg
Magdangal	DSC_0065.jpg
Balay Kalinaw (Ikeda Hall)	bahay_kalinaw.jpg
Commission on Human Rights (CHR) Office 	chr_sign.jpg
University Gymnasium (Ylanan Hall) (College of Human Kinetics) (CHK)	chk_1.jpg
University Gymnasium (Ylanan Hall) (College of Human Kinetics) (CHK)	chk_2.JPG
Gym Annex Basketball Court	gym_back.jpg
NIGS Library	nigs_lib.jpg
University Hotel	university_hotel.jpg
CSWCD Parking Area	CSWCDParking.jpg
AECH Accenture Hall	aech-accenture.jpg
IB Auditorium	ib-auditorium.jpg
Institute of Biology (IB)	institute-of-biology.jpg
Institute of Biology (IB)	institute-of-biology-a.jpg
UP Biology - EDC Binhi Threatened Species Arboretum	up-biology-arboretum.jpg
IB Library	ib-library.jpg
IB Cafeteria	ib-cafeteria.jpg
DMMME Comfort Rooms	dmmme-cr.jpg
ICE Comfort Rooms	icivilengg-cr.jpg
UP Veterinary Teaching Hospital	up-vet-hospital.jpg
IC Cafeteria	ichem-cafeteria.jpg
Institute of Chemistry Research Building (ICR)	institute-of-chemistry-research.jpg
IC Parking Strip	ic-parking.jpg
PAGASA Observatory	pagasa-observatory-b.jpg
Vinzons Hall Comfort Rooms	vinzons-cr.jpg
Virata School of Business Parking Lot	virata-sb-parking.jpg
Sunken Garden	sunken-garden-a.jpg
Juinio Hall (National Engineering Center)	juinio-hall-b.jpg
Department of Computer Science Comfort Rooms	dcs_cr.jpg
Main Library Parking Lots	main-library-parking-a.jpg
UP Main Library - Social Sciences and Philosophy Library	uml-ssp-library.jpg
UP Main Library - Filipiniana Books Section	uml-filipiniana-section.jpg
Lagmay Hall Comfort Rooms	lagmay-cr.jpg
Benton Hall	benton-b.jpg
Lagmay Hall Library (Mandala Room)	lagmay-library.jpg
Office of the University Registrar Parking Lot	our-parking-a.jpg
Office of the University Registrar Parking Lot	our-parking-b.jpg
College of Mass Communication - Media Center and DZUP Studio	MediaCenter.jpg
CSWCD Comfort Room	cswcd_cr.jpg
Virata School of Business (VSB)	virata_facade.jpg
UP Integrated School — 3-10 Building (UPIS)	upis-3-10-a.jpg
VSB 104 Cesar E.A. Virata Lecture Room	virata_lec.jpg
Alonso Hall (College of Home Economics) (CHE)	che_facade_1.jpg
IB Museum Public Exhibit Area	ib-museum.jpg
College of Law - Law Forum	LawForum.jpg
Centennial Residence Hall Parking Lot	centennial-rh-parking-a.jpg
Asian Institute of Tourism	asian-institute-of-tourism-a.jpg
DMMME Parking Lot	dmmme-parking.jpg
IChE Parking	iche-parking.jpg
IChE Comfort Rooms	iche-cr.jpg
Institute of Chemical Engineering (IChE)	institute-of-chemical-engineering-c.jpg
Institute of Chemical Engineering (IChE)	institute-of-chemical-engineering-b.jpg
Environmental and Energy Engineering Program Building	environmental-energy-engineering-a.jpg
Three Women Sewing the First Filipino Flag	public-art-three-women-a.jpg
Untitled by Abdulmari Imao	public-art-untitled-a-imao-a.jpg
CAL Library	cal-library.jpg
Rajah Sulayman	public-art-rajah-sulayman.jpg
Landbank	landbank-a.jpg
Catholic Parish Office	parish-office-a.jpg
Kalinga Day Care Center	kalinga-day-care-b.jpg
Area 1	area-1-b.jpg
Balay Kalinaw (Ikeda Hall)	balay-kalinaw-b.jpg
Philippine Association of University Women (PAUW) Annex	pauw-annex.jpg
Ilang-ilang Residence Hall	ilang-ilang-residence-hall-a.jpg
GT Toyota Asian Center - Cafe Via Mare	gt-cafe-via-mare.jpg
Rizal Statue	public-art-rizal-statue.jpg
Spirit of Business	public-art-spirit-of-business.jpg
University Seal	public-art-university-seal.jpg
AECH Comfort Rooms	engg-library-2-cr.jpg
Cry of Balintawak by Ramon Martinez	public-art-balintawak.jpg
Sundial	public-art-sundial.jpg
Office of Extension Coordination	oec.jpg
Philippine Institute of Volcanology and Seismology	phivolcs.jpg
Oblation by Guillermo Tolentino	oblation.jpg
ICE 311	ice_311.jpg
ICE 312	ice_312.jpg
ICE 313	ice_313.jpg
ICE 314	ice_314.jpg
ICE 315	ice_315.jpg
ICE 316	ice_316.jpg
ICE 317	ice_317.jpg
ICE 318	ice_318.jpg
ICE 319	ice_319_1.jpg
ICE 319	ice_319_2.jpg
ICE 408-B	ice_408b.jpg
University Ampitheater	ampitheatre_1.jpg
ICE 410	ice_410.jpg
ICE 411	ice_411.jpg
ICE 412	ice_412a.jpg
ICE 409	ice_409a.jpg
ICE David Y Tan Lecture Room	ice_lec_tan.jpg
JH 107	archi_107.jpg
DMMME 103	dmmme_103.jpg
DMMME 105	dmmme_105.jpg
DMMME 108	dmmme_108.jpg
DMMME 109	dmmme_109.jpg
DMMME 203	dmmme_203.jpg
DMMME ANSyD	dmmme_ansyd_1.jpg
DMMME ANSyD	dmmme_ansyd_2.jpg
DMMME Mechanical Testing Section	dmmme_mts.jpg
DMMME Rubber Processing Laboratory	dmmme_rpl.jpg
DMMME Disini Lecture Room	dmmme_lec_dis.jpg
DMMME Dr. Perfecto Guerrero Lecture Room	dmmme_lec_gue.jpg
DMMME Roman B. Ramos Lecture Room	dmmme_lec_ram.jpg
DMMME Ernesto A. Villaluna, Sr. Lecture Room	dmmme_lec_vill.jpg
Department of Mining, Metallurgical & Materials Engineering (DMMME)	dmmme_corridor.jpg
Human Resources Development Office 	hrdo.jpg
Law Center 1st Floor Lobby	bocobo_lobby1st.jpg
Law Center 3rd Floor Lobby	bocobo_lobby3rd.jpg
MB 105	math_105.jpg
MB 106	math_106.jpg
MB 107	math_107.jpg
MB 108	math_108.jpg
MB 115	math_115.jpg
MB 116	math_116.jpg
MB 117	math_117.jpg
MB 120	math_120.jpg
MB 121	math_121.jpg
MB 313	math_313.jpg
MB 314	math_314.jpg
MB 319	math_319.jpg
MB 320	math_320.jpg
Natural Sciences Research Institute (NSRI) (Miranda Hall)	miranda_1.jpg
Natural Sciences Research Institute (NSRI) (Miranda Hall)	miranda_2.jpg
Office of the Chancellor (OC)	chancellor.jpg
Office of the Vice Chancellor for Administration (OVCA)	ovca_1.jpg
Office of the Vice Chancellor for Administration (OVCA)	ovca_2.jpg
Office of the Vice Chancellor for Student Affairs (OVCSA)	ovcsa.jpg
Quezon Hall	quezon_sign.jpg
SE 123	econ_123_1.jpg
SE 123	econ_123_2.jpg
SE 125	econ_125.jpg
SE 127	econ_127_1.jpg
Supply and Property Managment Office (SPMO)	spmo_1.jpg
Supply and Property Managment Office (SPMO)	spmo_2.jpg
University Ampitheater	ampitheatre_2.jpg
University Ampitheater	ampitheatre_3.jpg
UP Diliman Gender Office (UPDGO)	gender_office_1.jpg
UP Diliman Gender Office (UPDGO)	gender_office_2.jpg
UP Diliman Police (UPDP)	updp.jpg
UP DOST Core Group	dost_core.jpg
UP Lagoon Beta Epsilon Theatrum	beta_theatrum.jpg
UP Lagoon Beta Epsilon Theatrum	lagoon_1.jpg
UP Lagoon Beta Epsilon Theatrum	lagoon_2.jpg
UP Main Library (Gonzales Hall)	gonzales.jpg
Viladolid Hall	viladolid_hall_1.jpg
Viladolid Hall	viladolid_hall_2.jpg
EEE 123	eee_123.jpg
EEE 124	eee_124.jpg
EEE 125	eee_125.jpg
EEE 126	eee_126.jpg
EEE 129	eee_129.jpg
EEE 127	eee_127.jpg
EEE 201	eee_201.jpg
Lagmay Hall (LH) (Palma Hall Annex)	lagmay_entrance_3.jpg
Concordia Albarracin Residence Hall	concordia-albarracin-rh.jpg
Centennial Residence Hall	centennial-rh-a.jpg
Centennial Residence Hall	centennial-rh-b.jpg
EEE 202	eee_202.jpg
EEE 203	eee_203.jpg
EEE 204	eee_204.jpg
EEE 205	eee_205.jpg
EEE 206	eee_206.jpg
EEE 207	eee_207.jpg
EEE 208	eee_208.jpg
EEE 209	eee_209.jpg
EEE 210	eee_210.jpg
EEE 220	eee_220.jpg
EEE 225	eee_225.jpg
EEE 227	eee_227.jpg
EEE 228	eee_228.jpg
EEE 229	eee_229.jpg
EEE 301	eee_301.jpg
EEE 302	eee_302.jpg
EEE 303	eee_303.jpg
EEE 305	eee_305.jpg
EEE 304	eee_304.jpg
EEE 307	eee_307.jpg
EEE 308	eee_308.jpg
EEE 309	eee_309.jpg
EEE 310	eee_310.jpg
EEE 320	eee_320.jpg
EEE 321	eee_321.jpg
EEE 322	eee_322.jpg
EEE 323	eee_323.jpg
EEE 324	eee_324.jpg
EEE 325	eee_325.jpg
EEE 326	eee_326.jpg
EEE 327	eee_327.jpg
EEE 329	eee_329.jpg
EEE 401	eee_401.jpg
EEE 402	eee_402.jpg
EEE 403	eee_403.jpg
EEE 404	eee_404.jpg
EEE 405	eee_405.jpg
EEE 406	eee_406.jpg
EEE 407	eee_407.jpg
EEE 408	eee_408.jpg
EEE 409	eee_409.jpg
EEE 410	eee_410.jpg
EEE 412	eee_412.jpg
EEE 420	eee_420.jpg
EEE 421	eee_421.jpg
EEE 422	eee_422.jpg
EEE 423	eee_423.jpg
EEE 424	eee_424.jpg
EEE 425	eee_425.jpg
EEE 426	eee_426.jpg
EEE 427	eee_427.jpg
EEE 428	eee_428.jpg
EEE 429	eee_429.jpg
NIMBB 100	nimbb_100.jpg
NIMBB 101	nimbb_101.jpg
NIMBB 105	nimbb_105.jpg
NIMBB 107	nimbb_107.jpg
NIMBB 110	nimbb_110.jpg
NIMBB 112	nimbb_112.jpg
NIMBB 200	nimbb_200.jpg
NIMBB 202	nimbb_202.jpg
NIMBB 203	nimbb_203.jpg
NIMBB 205	nimbb_205.jpg
NIMBB 206	nimbb_206.jpg
NIMBB 214	nimbb_214.jpg
NIMBB 215	nimbb_215.jpg
NIMBB Bioinformatics	nimbb_bioinformatics.jpg
NIMBB DNA Sequencing	nimbb_dna_sequencing.jpg
CMC Library	cmc_lib.jpg
CMC Department of Communication Research	cmc_research.jpg
CMC 205	cmc_205.jpg
CMC 207	cmc_207.jpg
CMC 209	cmc_209.jpg
CMC Department of Broadcasting	cmc_broadkast.jpg
Lagmay Hall (LH) (Palma Hall Annex)	lagmay_entrance_2.jpg
LH 201	lagmay_201.jpg
LH 203	lagmay_203.jpg
LH 204	lagmay_204.jpg
LH 205	lagmay_205.jpg
LH 207	cswcd_207.jpg
LH 209	lagmay_209.jpg
LH 213	lagmay_213.jpg
LH 215	lagmay_215.jpg
LH 301	lagmay_301.jpg
LH 302	lagmay_302.jpg
LH 303	lagmay_303.jpg
LH 304	lagmay_304.jpg
LH 305	cswcd_305.jpg
LH 307	lagmay_307.jpg
LH 309	lagmay_309.jpg
LH 313-315	lagmay_313.jpg
LH 313-315	lagmay_315.jpg
Bahay ng Alumni Comfort Rooms	BahayAlumni_MaleCR.jpg
Bahay ng Alumni Comfort Rooms	BahayAlumni_FemaleCR.jpg
Department of Computer Science Teaching Lab 1 (TL1)	DCS_TL1.jpg
Department of Computer Science Classroom 3 (CLR 3)	DCS_Classroom3.jpg
Department of Computer Science Classroom 2 (CLR 2)	DCS_Classroom2.jpg
Department of Computer Science Engineering and Research for Technology Development (ERDT)	DCS_ERDT.jpg
UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)	engg-library-2-b.jpg
Art Circle Cafe	ArtCircleCafe.jpg
Chocolate Kiss Cafe	ChocolateKissCafe.jpg
Chocolate Kiss Cafe	ChocolateKissCafe2.jpg
College of Mass Communication - Media Center and DZUP Studio	MediaCenter2.jpg
Centennial Residence Hall - University Food Service	Centennial_UFS.jpg
YZA Printing Shop	YZA.jpg
Food Nook	FoodNook.jpg
B.E. Scientific Glass Instruments	B.E_Scientific_Glassware.jpg
Acacia Residence Halls Commercial Area	Acacia_Stores2.jpg
Acacia Residence Halls Commercial Area	Acacia_Stores.jpg
Quicklean	Quicklean.jpg
Khaleb	Khaleb.jpg
Unlad Convenience Store	Unlad.jpg
UP Click	UPClick.jpg
Acacia Wellness	AcaciaWellness.jpg
Upbeat	Upbeat.jpg
Orange Segment	OrangeSegment.jpg
CSWCD 101	cswcd_101.jpg
CSWCD 105	cswcd_105.jpg
CSWCD 102	cswcd_102.jpg
CSWCD 106	cswcd_106.jpg
CSWCD 201	cswcd_201.jpg
CSWCD 202	cswcd_202.jpg
CSWCD 203	cswcd_203.jpg
CSWCD 204	cswcd_204.jpg
CSWCD 205	cswcd_205.jpg
CSWCD 206	cswcd_206.jpg
CSWCD 208	cswcd_208.jpg
CSWCD 207	cswcd_207_1.jpg
CSWCD 301	cswcd_301.jpg
CSWCD 302	cswcd_302.jpg
CSWCD 303	cswcd_303.jpg
CSWCD 304	cswcd_304.jpg
CSWCD 306	cswcd_306_1.jpg
CSWCD 307	cswcd_307.jpg
CSWCD 308	cswcd_308.jpg
CSWCD Library	cswcd_lib_2.jpg
Law Office	CentennialNotary.jpg
Law Office	CentennialNotary2.jpg
UP Film Institute (UPFI)	up-film-institute.jpg
UPFI 104	upfi-104.jpg
UPFI 105	upfi-105.jpg
UPFI 107	upfi-107.jpg
UPFI 202	upfi-202.jpg
UPFI AVR 1	upfi-avr-1.jpg
UPFI AVR 2	upfi-avr-2.jpg
AECH Serials Section	aech-serials-a.jpg
AECH 213	aech-213-classroom-1.jpg
AECH 210 - Teaching Lab 3	aech-210-tl-3.jpg
AECH 212	aech-212-classroom-4.jpg
AECH 214 - Teaching Lab 2	aech-214-tl-2.jpg
AECH 215 - Seminar Room	aech-215-seminar-room.jpg
DMMME Adaptive Metallurgy Laboratory	dmmme-lab-am-a.jpg
DMMME Adaptive Metallurgy Laboratory	dmmme-lab-am-b.jpg
DMMME 205-206	dmmme-205-206.jpg
DMMME Composites Laboratory	dmmme-lab-comp.jpg
DMMME 214	dmmme-214.jpg
DMMME 216	dmmme-216.jpg
DMMME 217	dmmme-217.jpg
DMMME Administrative Office	dmmme-admin.jpg
DMMME 301-302	dmmme-301-302.jpg
DMMME 303-304	dmmme-303-304.jpg
DMMME Comfort Rooms	dmmme-cr-a.jpg
IChE A101	iche-a101.jpg
IChE A102	iche-a102.jpg
IChE A104	iche-a104.jpg
IChE A103	iche-a103.jpg
IChE A202 - Administration Office	iche-a202.jpg
IChE A301 - Computer Laboratory I	iche-a301.jpg
IChE A401	iche-a401.jpg
IChE A402	iche-a402.jpg
IChE A403	iche-a403.jpg
IChE A404	iche-a404.jpg
IChE A302 - Computer Laboratory II	iche-a302.jpg
IChE B101 Process Systems Engineering Laboratory	iche-b101.jpg
IChE B102 Analytical Laboratory	iche-b102.jpg
IChE B103-B104 Polymers Laboratory	iche-b103-104.jpg
IChE B105-B106 Catalysts Laboratory	iche-b105-106.jpg
IChE B201-B202 Separations Engineering Laboratory	iche-b201-202.jpg
IChE B203 Analytical Laboratory	iche-b203.jpg
IChE B204-B205 Fuels, Energy, and Thermal Systems Laboratory	iche-b204-205.jpg
IChE B206 Green Materials Laboratory	iche-b206.jpg
IChE B301-B302 Chemical Engineering Commons	iche-b301-302.jpg
Espiritu Hall (College of Law Library)	espiritu-hall-library-b.jpg
Palma Hall Pavilion I (PAV1)	ph-pav-1-a.jpg
College of Home Economics (CHE) Museum	che-museum-a.jpg
ICE 401	ice-401.jpg
ICE 402	ice-402.jpg
ICE 403	ice-403.jpg
ICE 404	ice-404.jpg
ICE 405	ice-405.jpg
ICE 301	ice-301.jpg
ICE 302	ice-302.jpg
ICE 303	ice-303.jpg
ICE 304	ice-304.jpg
ICE 305	ice-305.jpg
ICE 306A	ice-306a.jpg
ICE 306B	ice-306b.jpg
ICE 307	ice-307.jpg
ICE 308	ice-308.jpg
ICE 309	ice-309.jpg
ICE 310	ice-310.jpg
ICE 201	ice-201.jpg
ICE 202	ice-202.jpg
ICE 203	ice-203.jpg
ICE 204	ice-204.jpg
ICE 205 - Faculty Room	ice-205.jpg
ICE 103	ice-103.jpg
ICE 104	ice-104.jpg
ICE 101	ice-101.jpg
ICE 102	ice-102.jpg
ICE 105	ice-105.jpg
ICE 106	ice-106.jpg
ICE 108	ice-108.jpg
ICE 107	ice-107.jpg
College of Architecture Library	arki-library.jpg
UP School of Urban and Regional Planning (SURP)	surp-construction-a.jpg
Center for Women's and Gender Studies	center-for-womens-and-gender-studies.jpg
CMC M 107	cmc-m107.jpg
CMC 107	cmc-annex-107.jpg
CMC A-202	cmc-annex-a202.jpg
Parish of The Holy Sacrifice - Gomburza Hall	parish-oths-sign.jpg
Parish of The Holy Sacrifice - Gomburza Hall	parish-oths-gomburza-hall.jpg
Parish of The Holy Sacrifice - Delaney Hall	parish-oths-delaney-hall.jpg
Old UP Swimming Pool Lot	old-swimming-pool.jpg
F. Agoncillo-Parish of The Holy Sacrifice Area	f-agoncillo-poths-parking.jpg
Balay Kalinaw Parking Lot	balay-kalinaw-parking-a.jpg
Virata School of Business Library	vsb-library.jpg
VSB 201	vsb-201.jpg
VSB 203	vsb-203.jpg
VSB 205	vsb-205.jpg
VSB 207	vsb-207.jpg
VSB 209	vsb-209.jpg
VSB 211	vsb-211.jpg
VSB 213	vsb-213.jpg
VSB 215	vsb-215.jpg
VSB 202	vsb-202.jpg
VSB 204	vsb-204.jpg
VSB 206	vsb-206.jpg
VSB 208	vsb-208.jpg
VSB 210	vsb-210.jpg
VSB 212	vsb-212.jpg
VSB 214	vsb-214.jpg
VSB 106	vsb-106.jpg
VSB 108	vsb-108.jpg
VSB 110	vsb-110.jpg
VSB 118	vsb-118.jpg
IESM 101	iesm-101.jpg
IESM 102	iesm-102.jpg
IESM 103	iesm-103.jpg
IESM 104	iesm-104.jpg
IESM Administration Office	iesm-admin.jpg
IESM Auditorium	iesm-auditorium.jpg
IESM 202	iesm-202.jpg
College of Science Library Parking Lot	cslib-parking-a.jpg
MSI 201	msi-201.jpg
MSI 202	msi-202.jpg
MSI 203	msi-203.jpg
MSI 204	msi-204.jpg
MSI 205	msi-205.jpg
MSI 206	msi-206.jpg
MSI 207	msi-207.jpg
MSI 208	msi-208.jpg
MSI 209	msi-209.jpg
MSI 210	msi-210.jpg
MSI 211	msi-211.jpg
MSI 219 - Library	msi-219-library.jpg
UP Marine Science Institute Comfort Rooms	msi-cr-a.jpg
Archaeological Studies Program Solheim Library	asp-library.jpg
ASP 103 - Administration	asp-103-admin.jpg
ASP 109	asp-109.jpg
ASP 113	asp-113.jpg
ASP 115	asp-115.jpg
ASP 117	asp-117.jpg
Centennial Residence Hall - UP Stop	cente-up-stop.jpg
Centennial Residence Hall - The Food Nook	cente-the-food-nook.jpg
Centennial Residence Hall - FLUIDSURF	cente-fluidsurf.jpg
Centennial Residence Hall - ACT RC	cente-act-rc.jpg
Centennial Residence Hall - B E Scientific Glass	cente-be-scientific-glass.jpg
Centennial Residence Hall - ST-ART 101	cente-st-art-101.jpg
Centennial Residence Hall - YZA Printing	cente-yza.jpg
CHE 101A	che-101a.jpg
CHE 102	che-102.jpg
CHE 103	che-103.jpg
CHE 104	che-104.jpg
CHE 106	che-106.jpg
College of Home Economics (CHE) Library	che-library-b.jpg
CHE 202 Computer Room	che-202.jpg
CHE 203-B	che-203b.jpg
CHE 203-A	che-203a.jpg
CHE 204	che-204.jpg
NIGS Seminar Room	nigs-seminar-room-b.jpg
NIGS 302	nigs-302.jpg
NIGS 301	nigs-301.jpg
NIGS 230	nigs-230.jpg
NIGS 217	nigs-217.jpg
NIGS 214 Geophysics Laboratory	nigs-214.jpg
NIGS 213 Structural Geology Laboratory	nigs-213.jpg
NIGS 212 Geomorphology Laboratory	nigs-212.jpg
NIGS 121 Computer Room	nigs-121.jpg
NIGS 111 Mineralogy Room	nigs-111.jpg
NIGS Museum	nigs-museum.jpg
National Institute of Geological Sciences (NIGS)	nigs-inner-a.jpg
IB 306	ib-306.jpg
IB 307	ib-307.jpg
IB 308	ib-308.jpg
IB 309	ib-309.jpg
IB 318	ib-318.jpg
IB 319	ib-319.jpg
IB 321	ib-321.jpg
IB 330	ib-330.jpg
IB 345	ib-345.jpg
IB 260	ib-260.jpg
IB 2605	ib-250.jpg
IB 234 Supply and Property Office	ib-234-supply.jpg
IB 117	ib-117.jpg
IB 118	ib-118.jpg
IB 119	ib-119.jpg
IB 167 Fish Biology Lab	ib-167.jpg
IB 168	ib-168.jpg
DMST - Vanguard Comfort Rooms	vanguard-cr.jpg
DMST - Vanguard Rooftop	vanguard-roof.jpg
DMST - Vanguard 201	vanguard-201.jpg
DMST - Vanguard 202	vanguard-202.jpg
DMST - Vanguard 203	vanguard-203.jpg
DMST - Vanguard 204	vanguard-204.jpg
\.


--
-- Data for Name: inside; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inside (room, building) FROM stdin;
CAL 201	College of Arts and Letters (CAL)
CAL 209	College of Arts and Letters (CAL)
CAL 210	College of Arts and Letters (CAL)
CAL 301	College of Arts and Letters (CAL)
CAL 309	College of Arts and Letters (CAL)
CAL 310	College of Arts and Letters (CAL)
CAL 401	College of Arts and Letters (CAL)
CAL 408	College of Arts and Letters (CAL)
CAL 409	College of Arts and Letters (CAL)
CHE Room ABC	College of Home Economics Gusali 2 (CHE)
CHE Room D	College of Home Economics Gusali 2 (CHE)
CHE Room E	College of Home Economics Gusali 2 
SE 105	UP School of Economics (SE)
SE 111	UP School of Economics (SE)
SE 114	UP School of Economics (SE)
SE 121	UP School of Economics (SE)
SE 123	UP School of Economics (SE)
SE Auditorium	UP School of Economics (SE)
SE 103	UP School of Economics (SE)
SE 125	UP School of Economics (SE)
SE 127	UP School of Economics (SE)
MBAn 306	Institute of Mathematics Annex (MBAn)
MBAn 313	Institute of Mathematics Annex (MBAn)
MBAn 401	Institute of Mathematics Annex (MBAn)
MBAn 402	Institute of Mathematics Annex (MBAn)
MBAn 403	Institute of Mathematics Annex (MBAn)
MBAn AVR 2	Institute of Mathematics Annex (MBAn)
MBAn AVR 1	Institute of Mathematics Annex (MBAn)
MBAn 305	Institute of Mathematics Annex (MBAn)
MBAn 314	Institute of Mathematics Annex (MBAn)
NCPAG 301-302	National College of Public Administration & Governance (NCPAG)
NCPAG 305	National College of Public Administration & Governance (NCPAG)
NCPAG 306	National College of Public Administration & Governance (NCPAG)
NCPAG 307A	National College of Public Administration & Governance (NCPAG)
NCPAG 308	National College of Public Administration & Governance (NCPAG)
NCPAG 309	National College of Public Administration & Governance (NCPAG)
NCPAG AVR	National College of Public Administration & Governance (NCPAG)
NIGS 125	National Institute of Geological Sciences (NIGS)
Penthouse Lecture Hall	Bocobo Hall (Law Center) (BOC)
MB 301	Institute of Mathematics Main Building (MB)
JH 101	College of Architecture Building 2 (Juguilon Hall) (JH)
JH 102	College of Architecture Building 2 (Juguilon Hall) (JH)
LAW 200	Malcolm Hall (LAW) (College of Law)
LAW 203	Malcolm Hall (LAW) (College of Law)
JH 103	College of Architecture Building 2 (Juguilon Hall) (JH)
JH 104	College of Architecture Building 2 (Juguilon Hall) (JH)
JH 105	College of Architecture Building 2 (Juguilon Hall) (JH)
JH 106	College of Architecture Building 2 (Juguilon Hall) (JH)
MH 301-303	Melchor Hall (MH) (College of Engineering)
MH 305-307	Melchor Hall (MH) (College of Engineering)
MH 306-308	Melchor Hall (MH) (College of Engineering)
MH 309-311	Melchor Hall (MH) (College of Engineering)
MH 313-315	Melchor Hall (MH) (College of Engineering)
MH 314-316	Melchor Hall (MH) (College of Engineering)
MH 318-320	Melchor Hall (MH) (College of Engineering)
MH 416-418	Melchor Hall (MH) (College of Engineering)
FA Auditorium	College of Fine Arts (CFA)
FA RGEP 1	College of Fine Arts (CFA)
FA RGEP 2	College of Fine Arts (CFA)
FA T2	College of Fine Arts (CFA)
FA T3	College of Fine Arts (CFA)
FA B6	College of Fine Arts (CFA)
FA B1 & B2	College of Fine Arts (CFA)
FA B4 & B5	College of Fine Arts (CFA)
MH 422-424	Melchor Hall (MH) (College of Engineering)
IC 305-306	Institute of Chemistry Teaching Building (IC)
IC 307-308	Institute of Chemistry Teaching Building (IC)
IC 309-310	Institute of Chemistry Teaching Building (IC)
IC 311-312	Institute of Chemistry Teaching Building (IC)
IC 313-314	Institute of Chemistry Teaching Building (IC)
IC 315-316	Institute of Chemistry Teaching Building (IC)
IC 330-331	Institute of Chemistry Teaching Building (IC)
IC CHEMREZ	Institute of Chemistry Teaching Building (IC)
IC Chevron	Institute of Chemistry Teaching Building (IC)
Procter & Gamble AVR	Melchor Hall (MH) (College of Engineering)
AH 206-208	Abelardo Hall (ABH) (College of Music)
AH 226	Abelardo Hall (ABH) (College of Music)
SS 307	School of Statistics (SS) (STAT)
SS Lecture Hall 1	School of Statistics (SS) (STAT)
SS Lecture Hall 2	School of Statistics (SS) (STAT)
MB 319	Institute of Mathematics Main Building (MB)
MB 320	Institute of Mathematics Main Building (MB)
AH Annex 222	Abelardo Hall Annex (College of Music Annex)
AH Annex 232	Abelardo Hall Annex (College of Music Annex)
LAW 204	Malcolm Hall (LAW) (College of Law)
LAW 208	Malcolm Hall (LAW) (College of Law)
LAW 303	Malcolm Hall (LAW) (College of Law)
LAW 304	Malcolm Hall (LAW) (College of Law)
NIGS 127	National Institute of Geological Sciences (NIGS)
NIGS 128	National Institute of Geological Sciences (NIGS)
NIGS 211	National Institute of Geological Sciences (NIGS)
NIGS 215	National Institute of Geological Sciences (NIGS)
NIGS Seminar Room	National Institute of Geological Sciences (NIGS)
NIGS 301	National Institute of Geological Sciences (NIGS)
PH 207ABC	Palma Hall (PH)
PH 108-110	Palma Hall (PH)
PH 116-118	Palma Hall (PH)
PH 120-122	Palma Hall (PH)
PH 213-215	Palma Hall (PH)
PH 216-218	Palma Hall (PH)
PH 308-310	Palma Hall (PH)
PH 312-314	Palma Hall (PH)
PH 324-326	Palma Hall (PH)
PH Multimedia Room	Palma Hall (PH)
PAV1 1114	Palma Hall Pavilion I (PAV1)
PAV1 1115	Palma Hall Pavilion I (PAV1)
PAV1 1119	Palma Hall Pavilion I (PAV1)
PAV1 1206	Palma Hall Pavilion I (PAV1)
PAV1 1210	Palma Hall Pavilion I (PAV1)
PAV1 1213	Palma Hall Pavilion I (PAV1)
PAV1 1214	Palma Hall Pavilion I (PAV1)
PAV1 1222	Palma Hall Pavilion I (PAV1)
PAV1 1228	Palma Hall Pavilion I (PAV1)
PAV1 1230	Palma Hall Pavilion I (PAV1)
PAV1 1232	Palma Hall Pavilion I (PAV1)
NIP F209	National Institute of Physics (NIP)
NIP F210	National Institute of Physics (NIP)
NIP Lecture Pavilion 101	National Institute of Physics (NIP)
NIP Lecture Pavilion 102	National Institute of Physics (NIP)
NIP Lecture Pavilion 103	National Institute of Physics (NIP)
NIP Lecture Pavilion 104	National Institute of Physics (NIP)
NIP F208	National Institute of Physics (NIP)
NIP F204	National Institute of Physics (NIP)
NIP F205	National Institute of Physics (NIP)
NIP F206	National Institute of Physics (NIP)
NIP F207	National Institute of Physics (NIP)
NIP F201	National Institute of Physics (NIP)
NIP F202	National Institute of Physics (NIP)
NIP F203	National Institute of Physics (NIP)
SOLAIR Auditorium	School of Labor & Industrial Relations (SOLAIR)
SOLAIR 201	School of Labor & Industrial Relations (SOLAIR)
SOLAIR 203	School of Labor & Industrial Relations (SOLAIR)
SOLAIR 10	School of Labor & Industrial Relations (SOLAIR)
PH Multimedia Room (PH 400)	Palma Hall (PH)
MB 116	Institute of Mathematics Main Building (MB)
SOLAIR 12	School of Labor & Industrial Relations (SOLAIR)
SOLAIR 11	School of Labor & Industrial Relations (SOLAIR)
MB 302	Institute of Mathematics Main Building (MB)
MB 303	Institute of Mathematics Main Building (MB)
MB 304	Institute of Mathematics Main Building (MB)
MB 305	Institute of Mathematics Main Building (MB)
MB 306	Institute of Mathematics Main Building (MB)
MB 307	Institute of Mathematics Main Building (MB)
MB 308	Institute of Mathematics Main Building (MB)
MB 321	Institute of Mathematics Main Building (MB)
MB 322	Institute of Mathematics Main Building (MB)
MB 323	Institute of Mathematics Main Building (MB)
MB 329	Institute of Mathematics Main Building (MB)
MB 328	Institute of Mathematics Main Building (MB)
CAL 211	College of Arts and Letters (CAL)
CAL 212	College of Arts and Letters (CAL)
CAL 213	College of Arts and Letters (CAL)
CAL 501	College of Arts and Letters (CAL)
CMC - B Viewing Room	Plaridel Hall (College of Mass Communication - CMC)
CAL 502	College of Arts and Letters (CAL)
CAL 503	College of Arts and Letters (CAL)
CAL 510	College of Arts and Letters (CAL)
CAL 512	College of Arts and Letters (CAL)
MB 105	Institute of Mathematics Main Building (MB)
MB 107	Institute of Mathematics Main Building (MB)
1F Lobby	Bocobo Hall (Law Center) (BOC)
Law Center 3rd Floor Lobby	Bocobo Hall (Law Center) (BOC)
Law Center 1st Floor Lobby	Bocobo Hall (Law Center) (BOC)
MB 108	Institute of Mathematics Main Building (MB)
MB 106	Institute of Mathematics Main Building (MB)
MB 115	Institute of Mathematics Main Building (MB)
MB 117	Institute of Mathematics Main Building (MB)
AH 202-204	Abelardo Hall (ABH) (College of Music)
MB 120	Institute of Mathematics Main Building (MB)
MB 121	Institute of Mathematics Main Building (MB)
MB 313	Institute of Mathematics Main Building (MB)
MB 314	Institute of Mathematics Main Building (MB)
SS 301	School of Statistics (SS) (STAT)
SS 302	School of Statistics (SS) (STAT)
SS 303	School of Statistics (SS) (STAT)
SS 304	School of Statistics (SS) (STAT)
SS 305	School of Statistics (SS) (STAT)
SS 306	School of Statistics (SS) (STAT)
LAW Soliven Room	Malcolm Hall (LAW) (College of Law)
LAW Sarmiento Room	Malcolm Hall (LAW) (College of Law)
LAW 221	Malcolm Hall (LAW) (College of Law)
Malcolm Hall Theater	Malcolm Hall (LAW) (College of Law)
CMC - Auditorium	Plaridel Hall (College of Mass Communication - CMC)
CMC - PhilStar Room	Plaridel Hall (College of Mass Communication - CMC)
Engineering Theater	Melchor Hall (MH) (College of Engineering)
MH 501	Melchor Hall (MH) (College of Engineering)
EEEI LC2	Electrical and Electronics Engineering Institute (EEEI)
UP Meralco Innovation Hall	Electrical and Electronics Engineering Institute (EEEI)
LAW 307	Malcolm Hall (LAW) (College of Law)
LAW 308	Malcolm Hall (LAW) (College of Law)
LAW 311	Malcolm Hall (LAW) (College of Law)
LAW 312	Malcolm Hall (LAW) (College of Law)
LAW 322	Malcolm Hall (LAW) (College of Law)
LAW 110 (Ambion Room)	Malcolm Hall (LAW) (College of Law)
UPIS 110	UP Integrated School – 7-12 Building (UPIS)
UPIS 111	UP Integrated School – 7-12 Building (UPIS)
Law Center Comfort Rooms	Bocobo Hall (Law Center) (BOC)
UPIS 1st Floor Comfort Rooms	UP Integrated School – 7-12 Building (UPIS)
UPIS 2nd Floor Comfort Rooms	UP Integrated School – 7-12 Building (UPIS)
UPIS 3rd Floor Comfort Rooms	UP Integrated School – 7-12 Building (UPIS)
UPIS 113	UP Integrated School – 7-12 Building (UPIS)
UPIS 120	UP Integrated School – 7-12 Building (UPIS)
UPIS 121	UP Integrated School – 7-12 Building (UPIS)
UPIS 122	UP Integrated School – 7-12 Building (UPIS)
UPIS 123	UP Integrated School – 7-12 Building (UPIS)
UPIS 124	UP Integrated School – 7-12 Building (UPIS)
UPIS 125	UP Integrated School – 7-12 Building (UPIS)
UPIS 126	UP Integrated School – 7-12 Building (UPIS)
UPIS 127	UP Integrated School – 7-12 Building (UPIS)
UPIS 128	UP Integrated School – 7-12 Building (UPIS)
UPIS 129	UP Integrated School – 7-12 Building (UPIS)
UPIS 130	UP Integrated School – 7-12 Building (UPIS)
UPIS 131	UP Integrated School – 7-12 Building (UPIS)
UPIS 132	UP Integrated School – 7-12 Building (UPIS)
UPIS 133	UP Integrated School – 7-12 Building (UPIS)
UPIS 134	UP Integrated School – 7-12 Building (UPIS)
UPIS 135	UP Integrated School – 7-12 Building (UPIS)
UPIS 136	UP Integrated School – 7-12 Building (UPIS)
UPIS 137	UP Integrated School – 7-12 Building (UPIS)
Diliman Legal Office (DLO)	Quezon Hall
Human Resources Development Office 	Quezon Hall
Office of the Chancellor (OC)	Quezon Hall
Office of the Vice Chancellor for Administration (OVCA)	Quezon Hall
Office of the Vice Chancellor for Student Affairs (OVCSA)	Quezon Hall
UP Diliman Gender Office (UPDGO)	Benton Hall
Office of Anti-Sexual Harassment (OASH)	Benton Hall
Center for International Studies	Benton Hall
Diliman Learning Resource Center (DLRC)	Kamia Residence Hall
UP DOST Core Group	Kamia Residence Hall
Office of Student Housing	Acacia Residence Halls
GT Toyota Asian Center Auditorium	GT Toyota Asian Center
College of Engineering Admin Office	Melchor Hall (MH) (College of Engineering)
College of Engineering Library I	Melchor Hall (MH) (College of Engineering)
UP Center for Ethnomusicology	Abelardo Hall (ABH) (College of Music)
School of Economics (SE) Library 	UP School of Economics (SE)
Diosdado P Macapagal Hall	UP School of Economics (SE)
Benitez 105	Benitez Hall (College of Education)
Benitez 108	Benitez Hall (College of Education)
Benitez 109	Benitez Hall (College of Education)
Benitez 110	Benitez Hall (College of Education)
Benitez 200	Benitez Hall (College of Education)
Benitez 201	Benitez Hall (College of Education)
Benitez 203	Benitez Hall (College of Education)
Benitez 205	Benitez Hall (College of Education)
Benitez 206	Benitez Hall (College of Education)
Benitez 212	Benitez Hall (College of Education)
Benitez 304	Benitez Hall (College of Education)
Benitez 312	Benitez Hall (College of Education)
Benitez Hall Education Library	Benitez Hall (College of Education)
EEEI VLC	Electrical and Electronics Engineering Institute (EEEI)
EEEI LC1	Electrical and Electronics Engineering Institute (EEEI)
Office of the Chief Security Officer	School of Labor & Industrial Relations (SOLAIR)
Office of the Vice Chancellor for Academic Affairs	Diliman Interactive Learning Center (DILC)
Office of International Linkages in Diliman (OIL)	Diliman Interactive Learning Center (DILC)
General Education Center (GEC)	Diliman Interactive Learning Center (DILC)
National Service Training Program (NSTP)	Diliman Interactive Learning Center (DILC)
Office of Field Activities (OFA)	Diliman Interactive Learning Center (DILC)
Utilities Management Team (UMT)	University Computer Center (UCC)
NIGS Library	National Institute of Geological Sciences (NIGS)
IB Auditorium	Institute of Biology (IB)
IB Library	Institute of Biology (IB)
UP Main Library - Social Sciences and Philosophy Library	UP Main Library (Gonzales Hall)
UP Main Library - Filipiniana Books Section	UP Main Library (Gonzales Hall)
CAL Library	College of Arts and Letters (CAL)
Office of Extension Coordination	Philippine Institute of Volcanology and Seismology
ICE 311	Institute of Civil Engineering (ICE)
ICE 312	Institute of Civil Engineering (ICE)
ICE 313	Institute of Civil Engineering (ICE)
ICE 314	Institute of Civil Engineering (ICE)
Catholic Parish Office	Parish of The Holy Sacrifice
Sentro ng Wikang Filipino	UP School of Urban and Regional Planning (SURP)
VSB 104 Cesar E.A. Virata Lecture Room	Virata School of Business (VSB)
IB Museum Public Exhibit Area	Institute of Biology (IB)
ICE 315	Institute of Civil Engineering (ICE)
ICE 316	Institute of Civil Engineering (ICE)
ICE 317	Institute of Civil Engineering (ICE)
ICE 318	Institute of Civil Engineering (ICE)
ICE 319	Institute of Civil Engineering (ICE)
ICE 408-B	Institute of Civil Engineering (ICE)
ICE 410	Institute of Civil Engineering (ICE)
ICE 411	Institute of Civil Engineering (ICE)
ICE 412	Institute of Civil Engineering (ICE)
ICE 409	Institute of Civil Engineering (ICE)
ICE David Y Tan Lecture Room	Institute of Civil Engineering (ICE)
JH 107	College of Architecture Building 2 (Juguilon Hall) (JH)
DMMME 103	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 105	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 108	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 109	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 203	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME ANSyD	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Mechanical Testing Section	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Rubber Processing Laboratory	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Disini Lecture Room	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Dr. Perfecto Guerrero Lecture Room	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Roman B. Ramos Lecture Room	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Ernesto A. Villaluna, Sr. Lecture Room	Department of Mining, Metallurgical & Materials Engineering (DMMME)
EEE 123	Electrical and Electronics Engineering Institute (EEEI)
EEE 124	Electrical and Electronics Engineering Institute (EEEI)
EEE 125	Electrical and Electronics Engineering Institute (EEEI)
EEE 126	Electrical and Electronics Engineering Institute (EEEI)
EEE 129	Electrical and Electronics Engineering Institute (EEEI)
EEE 127	Electrical and Electronics Engineering Institute (EEEI)
EEE 201	Electrical and Electronics Engineering Institute (EEEI)
EEE 202	Electrical and Electronics Engineering Institute (EEEI)
EEE 203	Electrical and Electronics Engineering Institute (EEEI)
EEE 204	Electrical and Electronics Engineering Institute (EEEI)
EEE 205	Electrical and Electronics Engineering Institute (EEEI)
EEE 206	Electrical and Electronics Engineering Institute (EEEI)
EEE 207	Electrical and Electronics Engineering Institute (EEEI)
EEE 208	Electrical and Electronics Engineering Institute (EEEI)
EEE 209	Electrical and Electronics Engineering Institute (EEEI)
EEE 210	Electrical and Electronics Engineering Institute (EEEI)
EEE 220	Electrical and Electronics Engineering Institute (EEEI)
EEE 225	Electrical and Electronics Engineering Institute (EEEI)
EEE 227	Electrical and Electronics Engineering Institute (EEEI)
EEE 228	Electrical and Electronics Engineering Institute (EEEI)
EEE 229	Electrical and Electronics Engineering Institute (EEEI)
EEE 301	Electrical and Electronics Engineering Institute (EEEI)
EEE 302	Electrical and Electronics Engineering Institute (EEEI)
EEE 303	Electrical and Electronics Engineering Institute (EEEI)
EEE 305	Electrical and Electronics Engineering Institute (EEEI)
EEE 304	Electrical and Electronics Engineering Institute (EEEI)
EEE 307	Electrical and Electronics Engineering Institute (EEEI)
EEE 308	Electrical and Electronics Engineering Institute (EEEI)
EEE 309	Electrical and Electronics Engineering Institute (EEEI)
EEE 310	Electrical and Electronics Engineering Institute (EEEI)
EEE 320	Electrical and Electronics Engineering Institute (EEEI)
EEE 321	Electrical and Electronics Engineering Institute (EEEI)
EEE 322	Electrical and Electronics Engineering Institute (EEEI)
EEE 323	Electrical and Electronics Engineering Institute (EEEI)
EEE 324	Electrical and Electronics Engineering Institute (EEEI)
EEE 325	Electrical and Electronics Engineering Institute (EEEI)
EEE 326	Electrical and Electronics Engineering Institute (EEEI)
EEE 327	Electrical and Electronics Engineering Institute (EEEI)
EEE 329	Electrical and Electronics Engineering Institute (EEEI)
EEE 401	Electrical and Electronics Engineering Institute (EEEI)
EEE 402	Electrical and Electronics Engineering Institute (EEEI)
EEE 403	Electrical and Electronics Engineering Institute (EEEI)
EEE 404	Electrical and Electronics Engineering Institute (EEEI)
EEE 405	Electrical and Electronics Engineering Institute (EEEI)
EEE 406	Electrical and Electronics Engineering Institute (EEEI)
EEE 407	Electrical and Electronics Engineering Institute (EEEI)
EEE 408	Electrical and Electronics Engineering Institute (EEEI)
EEE 409	Electrical and Electronics Engineering Institute (EEEI)
EEE 410	Electrical and Electronics Engineering Institute (EEEI)
EEE 412	Electrical and Electronics Engineering Institute (EEEI)
EEE 420	Electrical and Electronics Engineering Institute (EEEI)
EEE 421	Electrical and Electronics Engineering Institute (EEEI)
EEE 422	Electrical and Electronics Engineering Institute (EEEI)
EEE 423	Electrical and Electronics Engineering Institute (EEEI)
EEE 424	Electrical and Electronics Engineering Institute (EEEI)
EEE 425	Electrical and Electronics Engineering Institute (EEEI)
EEE 426	Electrical and Electronics Engineering Institute (EEEI)
EEE 427	Electrical and Electronics Engineering Institute (EEEI)
EEE 428	Electrical and Electronics Engineering Institute (EEEI)
EEE 429	Electrical and Electronics Engineering Institute (EEEI)
NIMBB 100	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 101	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 105	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 107	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 110	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 112	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 200	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 202	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 203	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 205	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 206	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 214	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB 215	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB Bioinformatics	National Institute of Molecular Biology and Biotechnology (NIMBB)
NIMBB DNA Sequencing	National Institute of Molecular Biology and Biotechnology (NIMBB)
Lagmay Hall Library (Mandala Room)	Lagmay Hall (LH) (Palma Hall Annex)
LH 201	Lagmay Hall (LH) (Palma Hall Annex)
LH 203	Lagmay Hall (LH) (Palma Hall Annex)
LH 204	Lagmay Hall (LH) (Palma Hall Annex)
LH 205	Lagmay Hall (LH) (Palma Hall Annex)
LH 207	Lagmay Hall (LH) (Palma Hall Annex)
LH 209	Lagmay Hall (LH) (Palma Hall Annex)
LH 213	Lagmay Hall (LH) (Palma Hall Annex)
LH 215	Lagmay Hall (LH) (Palma Hall Annex)
LH 301	Lagmay Hall (LH) (Palma Hall Annex)
LH 302	Lagmay Hall (LH) (Palma Hall Annex)
LH 303	Lagmay Hall (LH) (Palma Hall Annex)
LH 304	Lagmay Hall (LH) (Palma Hall Annex)
LH 305	Lagmay Hall (LH) (Palma Hall Annex)
LH 307	Lagmay Hall (LH) (Palma Hall Annex)
LH 309	Lagmay Hall (LH) (Palma Hall Annex)
LH 313-315	Lagmay Hall (LH) (Palma Hall Annex)
Bahay ng Alumni Comfort Rooms	Ang Bahay ng Alumni
AECH Accenture Hall	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
Department of Computer Science Teaching Lab 1 (TL1)	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
Department of Computer Science Classroom 3 (CLR 3)	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
Department of Computer Science Classroom 2 (CLR 2)	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
Department of Computer Science Engineering and Research for Technology Development (ERDT)	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
Art Circle Cafe	Ang Bahay ng Alumni
Chocolate Kiss Cafe	Ang Bahay ng Alumni
Quicklean	Acacia Residence Halls Commercial Area
Khaleb	Acacia Residence Halls Commercial Area
Unlad Convenience Store	Acacia Residence Halls Commercial Area
UP Click	Acacia Residence Halls Commercial Area
Acacia Wellness	Acacia Residence Halls Commercial Area
Upbeat	Acacia Residence Halls Commercial Area
Orange Segment	Acacia Residence Halls Commercial Area
CSWCD 101	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 105	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 102	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 106	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 201	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 202	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 203	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 204	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CMC Library	Plaridel Hall (College of Mass Communication - CMC)
CMC Department of Communication Research	Plaridel Hall (College of Mass Communication - CMC)
CMC 205	Plaridel Hall (College of Mass Communication - CMC)
CMC 207	Plaridel Hall (College of Mass Communication - CMC)
CMC 209	Plaridel Hall (College of Mass Communication - CMC)
CMC Department of Broadcasting	Plaridel Hall (College of Mass Communication - CMC)
Centennial Residence Hall - University Food Service	Centennial Residence Hall
YZA Printing Shop	Centennial Residence Hall
Food Nook	Centennial Residence Hall
B.E. Scientific Glass Instruments	Centennial Residence Hall
CSWCD 205	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 206	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 208	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 207	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 301	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 302	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 303	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 304	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 306	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 307	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD 308	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
CSWCD Library	Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)
UPFI 104	UP Film Institute (UPFI)
UPFI 105	UP Film Institute (UPFI)
UPFI 107	UP Film Institute (UPFI)
UPFI 202	UP Film Institute (UPFI)
UPFI AVR 1	UP Film Institute (UPFI)
UPFI AVR 2	UP Film Institute (UPFI)
AECH Serials Section	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
AECH 213	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
AECH 210 - Teaching Lab 3	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
AECH 212	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
AECH 214 - Teaching Lab 2	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
AECH 215 - Seminar Room	UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)
DMMME Adaptive Metallurgy Laboratory	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 205-206	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Composites Laboratory	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 214	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 216	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 217	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME Administrative Office	Abelardo Hall (ABH) (College of Music)
DMMME 301-302	Department of Mining, Metallurgical & Materials Engineering (DMMME)
DMMME 303-304	Department of Mining, Metallurgical & Materials Engineering (DMMME)
IChE A101	Institute of Chemical Engineering (IChE)
IChE A102	Institute of Chemical Engineering (IChE)
IChE A104	Institute of Chemical Engineering (IChE)
IChE A103	Institute of Chemical Engineering (IChE)
IChE A202 - Administration Office	Institute of Chemical Engineering (IChE)
IChE A301 - Computer Laboratory I	Institute of Chemical Engineering (IChE)
IChE A401	Institute of Chemical Engineering (IChE)
IChE A402	Institute of Chemical Engineering (IChE)
IChE A403	Institute of Chemical Engineering (IChE)
IChE A404	Institute of Chemical Engineering (IChE)
IChE A302 - Computer Laboratory II	Institute of Chemical Engineering (IChE)
IChE B101 Process Systems Engineering Laboratory	Institute of Chemical Engineering (IChE)
IChE B102 Analytical Laboratory	Institute of Chemical Engineering (IChE)
IChE B103-B104 Polymers Laboratory	Institute of Chemical Engineering (IChE)
IChE B105-B106 Catalysts Laboratory	Institute of Chemical Engineering (IChE)
IChE B201-B202 Separations Engineering Laboratory	Institute of Chemical Engineering (IChE)
IChE B203 Analytical Laboratory	Institute of Chemical Engineering (IChE)
IChE B204-B205 Fuels, Energy, and Thermal Systems Laboratory	Institute of Chemical Engineering (IChE)
IChE B206 Green Materials Laboratory	Institute of Chemical Engineering (IChE)
IChE B301-B302 Chemical Engineering Commons	Institute of Chemical Engineering (IChE)
ICE 401	Institute of Civil Engineering (ICE)
ICE 402	Institute of Civil Engineering (ICE)
ICE 403	Institute of Civil Engineering (ICE)
ICE 404	Institute of Civil Engineering (ICE)
ICE 405	Institute of Civil Engineering (ICE)
ICE 301	Institute of Civil Engineering (ICE)
ICE 302	Institute of Civil Engineering (ICE)
ICE 303	Institute of Civil Engineering (ICE)
ICE 304	Institute of Civil Engineering (ICE)
ICE 305	Institute of Civil Engineering (ICE)
ICE 306A	Institute of Civil Engineering (ICE)
ICE 306B	Institute of Civil Engineering (ICE)
ICE 307	Institute of Civil Engineering (ICE)
ICE 308	Institute of Civil Engineering (ICE)
ICE 309	Institute of Civil Engineering (ICE)
ICE 310	Institute of Civil Engineering (ICE)
ICE 201	Institute of Civil Engineering (ICE)
ICE 202	Institute of Civil Engineering (ICE)
ICE 203	Institute of Civil Engineering (ICE)
ICE 204	Institute of Civil Engineering (ICE)
ICE 205 - Faculty Room	Institute of Civil Engineering (ICE)
ICE 103	Institute of Civil Engineering (ICE)
ICE 104	Institute of Civil Engineering (ICE)
ICE 101	Institute of Civil Engineering (ICE)
ICE 102	Institute of Civil Engineering (ICE)
ICE 105	Institute of Civil Engineering (ICE)
ICE 106	Institute of Civil Engineering (ICE)
ICE 108	Institute of Civil Engineering (ICE)
ICE 107	Institute of Civil Engineering (ICE)
Law Office	Centennial Residence Hall
College of Architecture Library	College of Architecture Building 2 (Juguilon Hall) (JH)
CMC M 107	Plaridel Hall (College of Mass Communication - CMC)
CMC 107	Plaridel Hall (College of Mass Communication - CMC)
CMC A-202	Plaridel Hall (College of Mass Communication - CMC)
Parish of The Holy Sacrifice - Gomburza Hall	Parish of The Holy Sacrifice
Parish of The Holy Sacrifice - Delaney Hall	Parish of The Holy Sacrifice
Virata School of Business Library	Virata School of Business (VSB)
VSB 201	Virata School of Business (VSB)
VSB 203	Virata School of Business (VSB)
VSB 205	Virata School of Business (VSB)
VSB 207	Virata School of Business (VSB)
VSB 209	Virata School of Business (VSB)
VSB 211	Virata School of Business (VSB)
VSB 213	Virata School of Business (VSB)
VSB 215	Virata School of Business (VSB)
VSB 202	Virata School of Business (VSB)
VSB 204	Virata School of Business (VSB)
VSB 206	Virata School of Business (VSB)
VSB 208	Virata School of Business (VSB)
VSB 210	Virata School of Business (VSB)
VSB 212	Virata School of Business (VSB)
VSB 214	Virata School of Business (VSB)
VSB 106	Virata School of Business (VSB)
VSB 108	Virata School of Business (VSB)
VSB 110	Virata School of Business (VSB)
VSB 118	Virata School of Business (VSB)
IESM 101	Institute of Environmental Science and Meteorology (IESM)
IESM 102	Institute of Environmental Science and Meteorology (IESM)
IESM 103	Institute of Environmental Science and Meteorology (IESM)
IESM 104	Institute of Environmental Science and Meteorology (IESM)
IESM Administration Office	Institute of Environmental Science and Meteorology (IESM)
IESM Auditorium	Institute of Environmental Science and Meteorology (IESM)
IESM 202	Institute of Environmental Science and Meteorology (IESM)
MSI 201	UP Marine Science Institute (MSI)
MSI 202	UP Marine Science Institute (MSI)
MSI 203	UP Marine Science Institute (MSI)
MSI 204	UP Marine Science Institute (MSI)
MSI 205	UP Marine Science Institute (MSI)
MSI 206	UP Marine Science Institute (MSI)
MSI 207	UP Marine Science Institute (MSI)
MSI 208	UP Marine Science Institute (MSI)
MSI 209	UP Marine Science Institute (MSI)
MSI 210	UP Marine Science Institute (MSI)
MSI 211	UP Marine Science Institute (MSI)
MSI 219 - Library	UP Marine Science Institute (MSI)
Archaeological Studies Program Solheim Library	Albert Hall (Archaeological Studies Program) (ASP)
ASP 103 - Administration	Albert Hall (Archaeological Studies Program) (ASP)
ASP 109	Albert Hall (Archaeological Studies Program) (ASP)
ASP 113	Albert Hall (Archaeological Studies Program) (ASP)
ASP 115	Albert Hall (Archaeological Studies Program) (ASP)
ASP 117	Albert Hall (Archaeological Studies Program) (ASP)
NIGS 302	National Institute of Geological Sciences (NIGS)
NIGS 230	National Institute of Geological Sciences (NIGS)
NIGS 217	National Institute of Geological Sciences (NIGS)
NIGS 214 Geophysics Laboratory	National Institute of Geological Sciences (NIGS)
NIGS 213 Structural Geology Laboratory	National Institute of Geological Sciences (NIGS)
NIGS 212 Geomorphology Laboratory	National Institute of Geological Sciences (NIGS)
NIGS 121 Computer Room	National Institute of Geological Sciences (NIGS)
NIGS 111 Mineralogy Room	National Institute of Geological Sciences (NIGS)
NIGS Museum	National Institute of Geological Sciences (NIGS)
CHE 101A	Alonso Hall (College of Home Economics) (CHE)
CHE 102	Alonso Hall (College of Home Economics) (CHE)
CHE 103	Alonso Hall (College of Home Economics) (CHE)
CHE 104	Alonso Hall (College of Home Economics) (CHE)
CHE 106	Alonso Hall (College of Home Economics) (CHE)
CHE 202 Computer Room	Alonso Hall (College of Home Economics) (CHE)
CHE 203-B	Alonso Hall (College of Home Economics) (CHE)
CHE 203-A	Alonso Hall (College of Home Economics) (CHE)
CHE 204	Alonso Hall (College of Home Economics) (CHE)
IB 306	Institute of Biology (IB)
IB 307	Institute of Biology (IB)
IB 308	Institute of Biology (IB)
IB 309	Institute of Biology (IB)
IB 318	Institute of Biology (IB)
IB 319	Institute of Biology (IB)
IB 321	Institute of Biology (IB)
IB 330	Institute of Biology (IB)
IB 345	Institute of Biology (IB)
IB 260	Institute of Biology (IB)
IB 2605	Institute of Biology (IB)
IB 234 Supply and Property Office	Institute of Biology (IB)
IB 117	Institute of Biology (IB)
IB 118	Institute of Biology (IB)
IB 119	Institute of Biology (IB)
IB 167 Fish Biology Lab	Institute of Biology (IB)
IB 168	Institute of Biology (IB)
DMST - Vanguard Rooftop	Department of Military Science and Tactics Complex (DMST)
DMST - Vanguard 201	Department of Military Science and Tactics Complex (DMST)
DMST - Vanguard 202	Department of Military Science and Tactics Complex (DMST)
DMST - Vanguard 203	Department of Military Science and Tactics Complex (DMST)
DMST - Vanguard 204	Department of Military Science and Tactics Complex (DMST)
Church of the Risen Lord - Function Hall	Church of the Risen Lord
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (name, description, lat, lng, url, id, category_id, more_info) FROM stdin;
UP School of Economics (SE)	The University of the Philippines School of Economics (UPSE) provides instruction leading to undergraduate and graduate degrees in economics. It is housed by Encarnacion Hall, named after Jose Encarnacion Jr. the National Scientist who developed the economics profession in the Philippines and served as the college's dean for 20 years (1974-1994).	14.6558694999999997	121.073639	up-school-of-economics	3	1	UPSE is located at the far end of the Academic Oval (side closer to Katipunan Ave.) near F. Ma. Guerrero St.. Any jeepney ride can take you here, however,  more often than not, the UP Campus - Katipunan route does not pass by this building.
Institute of Mathematics Annex (MBAn)	Formerly known as the Department of Mathematics, the Institute is the largest institute in the University of the Philippines System. It nurtures about 300 undergraduate and 200 graduate students, and handles all the mathematics courses of some 5000 undergraduate students in UP Diliman.	14.6485672000000005	121.071938000000003	institute-of-mathematics-annex	4	1	The Institute of Mathematics' annex building can is located within the National Science Complex, just beside the institute's main building, along C.P. Garcia Ave. Toki jeepneys have a stop at a waiting shed just outside the building's parking lot.
CAL 309	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-309	5	2	Located on the 3rd floor of the College of Arts and Letters building.
Bocobo Hall (Law Center) (BOC)	Bocobo Hall houses the University of the Philippines Law Center and stands adjacent to Malcolm Hall. The Law Center was established in 1964 as an agency attached to the College of Law for the purpose of continuing legal education programs, as well as legal and research publications.	14.6569996000000007	121.071999000000005	bocobo-hall-(law-center)-(boc)	6	1	Bocobo Hall is situated behind Malcolm Hall, bounded by F. Ma. Guerrero St. and Magsaysay Ave.. All jeeps can stop across the building.
College of Architecture Building 2 (Juguilon Hall) (JH)	Some classrooms and administrative offices of the UP College of Architecture are housed by this Building 2.	14.6513995999999995	121.065002000000007	college-of-architecture-building-2-(juguilon-hall)-(jh)	7	1	UP Arki is built along E. De los Santos St. Any jeepney can stop near this building, notably at a waiting shed within the Academic Oval.
College of Architecture Building 1 (Archi Lab) (CA)	The UP College of Architecture is housed by this building. After being sponsored many years past by Melchor Hall (College of Engineering) and Gonzales Hall (now Main Library), the Architecture programs of the university finally found its home in 2005 in this building.	14.6509999999999998	121.065002000000007	college-of-architecture-building-1-(archi-lab)-(ca)	8	1	UP Arki is built along E. De los Santos St. Any jeepney can stop near this building, notably at a waiting shed within the Academic Oval.
Institute of Chemistry Teaching Building (IC)	The Institute of Chemistry (IChem) is one of the degree-granting units of the College of Science at the University of the Philippines in Diliman and was designated by the Commission on Higher Education (CHED) as a Center of Excellence in Chemistry and Chemical Education encompassing teaching, research and extension services. It is the training ground for the country's top chemists, consistently besting other universities in the annual Chemistry license examinations.	14.6501999000000005	121.072997999999998	institute-of-chemistry-teaching-building-(ic)	9	1	This building can be found within the National Science Complex of the university across the National Institute of Physics. A Toki jeepney ride can drop you off at a waiting shed by this building.
Melchor Hall (MH) (College of Engineering)	Melchor Hall houses the College of Engineering which is the largest degree-granting unit in the UP Diliman Campus in terms of student population. It is named after Alejandro Melchor, a renowned Filipino civil engineer and mathematician.	14.6565999999999992	121.069999999999993	melchor-hall-(mh)-(college-of-engineering)	10	1	One can find Melchor Hall between Osmena Avenue (main entrance) and Magsaysay Avenue (rear entrance), and bounded by A. Roces St. on its right side. All jeepney routes except Ikot stop across Melchor Hall.
Malcolm Hall (LAW) (College of Law)	The main offices and classrooms of the College of Law are located inside Malcolm Hall within the U.P. Diliman Campus. The UP College of Law was among the first seven Colleges established after the foundation of the University of the Philippines on June 18, 1908 through Act No. 1870 of the Philippine Assembly.	14.6566200000000002	121.072104999999993	malcolm-hall-(law)-(college-of-law)	11	1	Malcolm Hall is situated on the block bounded by Osmena Avenue (along the Academic Oval) and F. Ma. Guerrero Street. All jeepneys within the campus stop at a waiting shed nearby, however, the UP Campus - Katipunan route may sometimes not pass by this building at all.
National College of Public Administration & Governance (NCPAG)	The U.P. National College of Public Administration and Governance (NCPAG) is a degree-granting unit at the University of the Philippines Diliman. Founded as the Institute of Public Administration (IPA), it has produced government officials, bureaucrats, civil society leaders and academic among others. It also houses the Eastern Regional Organization on Public Administration (EROPA) secretariat and the Association of Schools of Public Administration in the Philippines (ASPAP) headquarters. 	14.6564837000000008	121.060432000000006	national-college-of-public-administration-&-governance	12	1	NCPAG stands at the end of R.P. De Guzman St. which is accessible from E. Jacinto St. Only Ikot and Toki jeepneys can get you near this building.
CAL 409	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-409	13	2	Located on the 4th floor of the College of Arts and Letters building.
National Institute of Geological Sciences (NIGS)	The National Institute of Geological Sciences (NIGS) is a multidisciplinary forum for the study of processes that shape the Earth.  It is the national center of excellence for the advancement, dissemination and application of geology in the Philippines.	14.6479701999999996	121.069450000000003	national-institute-of-geological-sciences	14	1	To the back of the institute is C.P. Garcia Avenue, and to its left side is Velasquez St. An Ikot or Toki ride can get you to NIGS.
IB 234 Supply and Property Office	Supply and Property Office in Institute of Biology	14.6504002	121.070999	ib-234-supply-and-property-office	877	2	Located on the second floor, on the left side of the center area.
IB 117	Lecture Room in Institute of Biology	14.6504002	121.070999	ib-117	878	2	Located on the first floor, in the wing facing towards the CS Amphitheater.
Palma Hall (PH)	Palma Hall houses the College of Social Science and Philosophy. Palma Hall, popularly known as AS (Arts and Sciences), is where most General Education subjects are taught so almost all students in UP get to have a class or two in this building. It is named after Rafael Palma, former president of UP and a journalist who supported liberalism and academic freedom	14.6534767000000006	121.069892999999993	palma-hall	15	1	Palma Hall is located along the Roxas Ave. segment of the Academic Oval. All jeepneys within the campus can stop by Palma Hall.
Palma Hall Pavilion I (PAV1)	Palma Hall Pavilion 1 (PAV 1) currently houses offices of some of the faculty of the College of Arts and Letters and its classrooms are where the latter college's classes take place as well. Some assets of the college were transferred here as a result of the CAL Faculty Center (Bulwagang Rizal) burning down back in 2015.	14.6528796999999997	121.068825000000004	palma-hall-pavilion-i	16	1	PAV1 is located on the left wing of Palma Hall, and is the building immediately beside the segment of A. Roces St. popularly known as "ASCAL." All jeepney routes have a stop just across this building.
National Institute of Physics (NIP)	The Institute was established in 1983 by Presidential Executive Order transforming the then Department of Physics of the College of Arts and Sciences. Its vision is to be the leading center of physics education and research in the Philippines which, through the generation of new knowledge in pure and applied physics, would exert scientific influence in the Asia-Pacific region. 	14.6490211000000006	121.073120000000003	national-institute-of-physics	17	1	The institute is located at the farthest southeast side of the campus, near Katipunan Ave. and C.P Garcia Ave.. It is accessible from the outside through Katipunan Ave. jeepneys, and within the campus through Toki jeeps.
School of Labor & Industrial Relations (SOLAIR)	The U.P. School of Labor and Industrial Relations (SOLAIR) traces its roots to the Labor Education Center (LEC). Founded in 1954, the Center was established to assist the fledgling labor movement at that time by providing training on the various aspects of trade union organizing and administration. The Center boasted of a highly capable training and professional staff of labor lawyers and trainers most of whom were recruited from the ranks of the trade union movement. 	14.6571874999999991	121.061699000000004	school-of-labor-&-industrial-relations	18	1	UP SOLAIR can be located along E. Jacinto St. and the dead end of Magsaysay Ave.. The building is included in the routes of Toki and Ikot jeeps.
CAL 201	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-201	19	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 209	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-209	20	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 210	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-210	21	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 301	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-301	22	2	Located on the 3rd floor of the College of Arts and Letters building.
School of Statistics (SS) (STAT)	The University of the Philippines School of Statistics (Stat) is the only Center of Excellence for Statistics in the country. Its BS Statistics program is accredited by the ASEAN University Quality Assurance [Network] (AUN-QA). It aims to advance the development and maintenance of a high level of efficiency in statistical activities in the country and in the Asia-Pacific region through its academic programs as well as research and extension services.	14.6512002999999993	121.067001000000005	school-of-statistics-(ss)-(stat)	23	1	UP Stat can be located at the intersection of Pardo de Tavera St. and T. Kalaw St., in front of the Office of the University Registrar (OUR). A Toki jeepney can drop you off by this building. 
JH 101	This room has a seating capacity of 35 people. An air-conditioning system and whiteboard can be found inside.	14.6509999999999998	121.065002000000007	jh-101	24	2	Located on the 1st floor of College of Architecture Building 2.
JH 102	This room has a seating capacity of 35 people. An air-conditioning system can be found inside.	14.6509999999999998	121.065002000000007	jh-102	25	2	Located on the 1st floor of College of Architecture Building 2.
JH 103	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	14.6509999999999998	121.065002000000007	jh-103	26	2	Located on the 1st floor of College of Architecture Building 2.
JH 104	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	14.6509999999999998	121.065002000000007	jh-104	27	2	Located on the 1st floor of College of Architecture Building 2.
JH 105	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	14.6509999999999998	121.065002000000007	jh-105	28	2	Located on the 1st floor of College of Architecture Building 2.
JH 106	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	14.6509999999999998	121.065002000000007	jh-106	29	2	Located on the 1st floor of College of Architecture Building 2.
NIMBB 105	NIMBB 105 is Lecture Hall - A	14.6506004000000001	121.071999000000005	nimbb-105	30	2	Located on the 1st Floor of NIMBB
NIMBB 107	NIMBB 107 is Lecture Hall - B	14.6506004000000001	121.071999000000005	nimbb-107	31	2	Located on the 1st Floor of NIMBB
NIMBB 200	NIMBB 200 is Molecular Biology Laboratory - A	14.6506004000000001	121.071999000000005	nimbb-200	34	2	Located on the 2nd Floor of NIMBB
CAL 310	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-310	35	2	Located on the 3rd floor of the College of Arts and Letters building.
CAL 401	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-401	36	2	Located on the 4th floor of the College of Arts and Letters building.
CAL 408	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6526832999999996	121.067383000000007	cal-408	37	2	Located on the 4th floor of the College of Arts and Letters building.
FA Auditorium	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6522778999999996	121.061501000000007	fa-auditorium	38	2	Located on the 1st floor of the College of Fine Arts building.
FA RGEP 1	This room has a seating capacity of 50 people. An air-conditioning system and a whiteboard can be found inside.	14.6522778999999996	121.061501000000007	fa-rgep-1	39	2	Located on the 1st floor of the College of Fine Arts building.
FA RGEP 2	This room has a seating capacity of 50 people. An air-conditioning system and a whiteboard can be found inside.	14.6522778999999996	121.061501000000007	fa-rgep-2	40	2	Located on the 1st floor of the College of Fine Arts building.
FA T2	This room has a seating capacity of 40 people. An air-conditioning system and a whiteboard can be found inside.	14.6522778999999996	121.061501000000007	fa-t2	41	2	Located on the 1st floor of the College of Fine Arts building.
FA T3	This room has a seating capacity of 40 people. An air-conditioning system and a whiteboard can be found inside.	14.6522778999999996	121.061501000000007	fa-t3	42	2	Located on the 1st floor of the College of Fine Arts building.
FA B6	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6522778999999996	121.061501000000007	fa-b6	43	2	Located on the 1st floor of the College of Fine Arts building.
FA B1 & B2	This room has a seating capacity of 60 people. A chalkboard and electric fans can be found inside.	14.6522778999999996	121.061501000000007	fa-b1-&-b2	44	2	Located on the 1st floor of the College of Fine Arts building.
FA B4 & B5	This room has a seating capacity of 60 people. A chalkboard and electric fans can be found inside.	14.6522778999999996	121.061501000000007	fa-b4-&-b5	45	2	Located on the 1st floor of the College of Fine Arts building.
CHE Room ABC	This room has a seating capacity of 200 people. A whiteboard, projector, and air-conditioning systems can be found inside.	14.6518698000000001	121.072151000000005	che-room-abc	46	2	Hard to miss once you're in CHE Gusali 2.
CHE Room D	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	14.6518698000000001	121.072151000000005	che-room-d	47	2	Located once down the stairs outside CHE Gusali 2.
CHE Room E	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	14.6518698000000001	121.072151000000005	che-room-e	48	2	Located once down the stairs outside CHE Gusali 2.
IC 305-306	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-305-306	49	2	Located on the 3rd floor of the IC Teaching Building.
IC 307-308	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-307-308	50	2	Located on the 3rd floor of the IC Teaching Building.
IC 309-310	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-309-310	51	2	Located on the 3rd floor of the IC Teaching Building.
IC 311-312	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-311-312	52	2	Located on the 3rd floor of the IC Teaching Building.
IC 313-314	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-313-314	53	2	Located on the 3rd floor of the IC Teaching Building.
IC 315-316	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-315-316	54	2	Located on the 3rd floor of the IC Teaching Building.
IC 330-331	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	14.6502017999999996	121.073120000000003	ic-330-331	55	2	Located on the 3rd floor of the IC Teaching Building.
IC CHEMREZ	This room has a seating capacity of 65 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6502017999999996	121.073120000000003	ic-chemrez	56	2	Located on the 1st floor of the IC Teaching Building.
IC Chevron	This room has a seating capacity of 50 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6502017999999996	121.073120000000003	ic-chevron	57	2	Located on the 1st floor of the IC Teaching Building.
SE 105	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-105	58	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE 111	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-111	59	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE 114	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-114	60	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE 121	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-121	61	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE 123	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-123	62	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE Auditorium	This room has a seating capacity of 150 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-auditorium	63	2	Located on the nth floor of the UPSE building (Encarnacion Hall).
SE 103	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-103	64	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
SE 125	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-125	65	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
CAL Library	Library of College of Arts and Letters	14.6527004000000005	121.067001000000005	cal-library	66	2	On the first floor of CAL, before the main entrance.
SE 127	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6558694999999997	121.073639	se-127	67	2	Located on the 1st floor of the UPSE building (Encarnacion Hall).
MH 301-303	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-301-303	68	2	Located on the 3rd floor, right wing of Melchor Hall.
JH 107	Room 107 of JH	14.6513995999999995	121.065002000000007	jh-107	69	2	located on the 1st floor of College of Architecture Building 2
IB 118	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-118	879	2	Located on the first floor, in the wing facing towards the CS Amphitheater.
MH 305-307	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-305-307	70	2	Located on the 3rd floor, right wing of Melchor Hall.
MH 306-308	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-306-308	71	2	Located on the 3rd floor, left wing of Melchor Hall.
MH 309-311	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-309-311	72	2	Located on the 3rd floor, right wing of Melchor Hall.
MH 313-315	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-313-315	73	2	Located on the 3rd floor, right wing of Melchor Hall.
MH 314-316	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-314-316	74	2	Located on the 3rd floor, left wing of Melchor Hall.
MH 318-320	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-318-320	75	2	Located on the 3rd floor, left wing of Melchor Hall.
MH 416-418	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-416-418	76	2	Located on the 4th floor, left wing of Melchor Hall.
MH 422-424	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	14.6565961999999992	121.069641000000004	mh-422-424	77	2	Located on the 4th floor, left wing of Melchor Hall.
Procter & Gamble AVR	This room has a seating capacity of 100 people. A whiteboard, projector, and air-conditioning systems can be found inside.	14.6565961999999992	121.069641000000004	procter-&-gamble-avr	78	2	Located on the 5th floor, left wing of Melchor Hall.
Engineering Theater	This room has a seating capacity of 150 people. A whiteboard, projector, air-conditioning systems, and electric fans can be found inside. This is a soundproofed room	14.6565961999999992	121.069641000000004	engineering-theater	79	2	Located on the 2nd floor, center of Melchor Hall.
MH 501	This room has a seating capacity of 75 people. A whiteboard, projector, and air-conditioning systems can be found inside.	14.6565961999999992	121.069641000000004	mh-501	80	2	Located on the 5th floor, right wing of Melchor Hall.
Penthouse Lecture Hall	This room has a seating capacity of 240 people. An air-conditioning system and projector can be found inside.	14.6570319999999992	121.072113000000002	penthouse-lecture-hall	81	2	Located on the 4th floor of Bocobo Hall.
LAW 200	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-200	82	2	Located on the 2nd floor of Malcolm Hall.
LAW 203	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-203	83	2	Located on the 2nd floor of Malcolm Hall.
LAW 204	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-204	84	2	Located on the 2nd floor of Malcolm Hall.
LAW 208	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-208	85	2	Located on the 2nd floor of Malcolm Hall.
LAW 303	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-303	86	2	Located on the 3rd floor of Malcolm Hall.
LAW 304	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-304	87	2	Located on the 3rd floor of Malcolm Hall.
LAW 307	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-307	88	2	Located on the 3rd floor of Malcolm Hall.
LAW 308	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-308	89	2	Located on the 3rd floor of Malcolm Hall.
LAW 311	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-311	90	2	Located on the 3rd floor of Malcolm Hall.
LAW 312	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-312	91	2	Located on the 3rd floor of Malcolm Hall.
LAW 322	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-322	92	2	Located on the 3rd floor of Malcolm Hall.
LAW 110 (Ambion Room)	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-110-(ambion-room)	93	2	Located on the 1st floor of Malcolm Hall.
LAW Soliven Room	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-soliven-room	94	2	Located on the 1st floor of Malcolm Hall.
LAW Sarmiento Room	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-sarmiento-room	95	2	Located on the 1st floor of Malcolm Hall.
LAW 221	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	14.6566238000000002	121.072090000000003	law-221	96	2	Located on the 2nd floor of Malcolm Hall.
MBAn 306	This room has a seating capacity of 60 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-306	97	2	Located on the 3rd floor of the Institute of Math Annex Building.
MBAn 313	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-313	98	2	Located on the 3rd floor of the Institute of Math Annex Building.
MBAn 401	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-401	99	2	Located on the 4th floor of the Institute of Math Annex Building.
MBAn 402	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-402	100	2	Located on the 4th floor of the Institute of Math Annex Building.
IB 119	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-119	880	2	Located on the first floor, on the left side of the center area.
MBAn 403	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-403	101	2	Located on the 4th floor of the Institute of Math Annex Building.
Rajah Sulayman	by Anastacio Caedo.	14.6535367999999995	121.066733999999997	rajah-sulayman	102	6	In front of Vargas Museum.
MB 301	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-301	103	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 302	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-302	104	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 303	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-303	105	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 304	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-304	106	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 305	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-305	107	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 306	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-306	108	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 307	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-307	109	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 308	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-308	110	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 321	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-321	111	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 322	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-322	112	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 323	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-323	113	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 329	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-329	114	2	Located on the 3rd floor of the Institute of Math Main Building.
MBAn AVR 2	This room has a seating capacity of 100 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-avr-2	115	2	Located on the 4th floor of the Institute of Math Annex Building.
MBAn AVR 1	This room has a seating capacity of 100 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-avr-1	116	2	Located on the 4th floor of the Institute of Math Annex Building.
MB 328	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485882000000007	121.071387999999999	mb-328	117	2	Located on the 3rd floor of the Institute of Math Main Building.
MBAn 305	This room has a seating capacity of 60 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-305	118	2	Located on the 3rd floor of the Institute of Math Annex Building.
MBAn 314	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	14.6485672000000005	121.071938000000003	mban-314	119	2	Located on the 3rd floor of the Institute of Math Annex Building.
AH 202-204	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	14.6566896	121.065421999999998	ah-202-204	120	2	Located on the 2nd floor, left wing of Abelardo Hall.
AH 206-208	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	14.6566896	121.065421999999998	ah-206-208	121	2	Located on the 2nd floor, left wing of Abelardo Hall.
AH Annex 222	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	14.6571484000000005	121.065406999999993	ah-annex-222	122	2	Located on the 2nd floor, left wing of Abelardo Hall Annex.
AH Annex 232	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	14.6571484000000005	121.065406999999993	ah-annex-232	123	2	Located on the 2nd floor, left wing of Abelardo Hall Annex.
NCPAG 301-302	This room has a seating capacity of 90 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-301-302	124	2	Located on the 3rd floor of the NCPAG building.
NCPAG 305	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-305	125	2	Located on the 3rd floor of the NCPAG building.
NCPAG 306	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-306	126	2	Located on the 3rd floor of the NCPAG building.
NCPAG 307A	This room has a seating capacity of 70 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-307a	127	2	Located on the 3rd floor of the NCPAG building.
NCPAG 308	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-308	128	2	Located on the 3rd floor of the NCPAG building.
NCPAG 309	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-309	129	2	Located on the 3rd floor of the NCPAG building.
NCPAG AVR	This room has a seating capacity of 90 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6564837000000008	121.060432000000006	ncpag-avr	130	2	Located on the 3rd floor of the NCPAG building.
NIGS 125	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-125	131	2	Located on the 1st floor, right wing of the NIGS building.
NIGS 127	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-127	132	2	Located on the 1st floor, right wing of the NIGS building.
NIGS 128	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-128	133	2	Located on the 1st floor, right wing of the NIGS building.
NIGS 211	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-211	134	2	Located on the 2nd floor, right wing of the NIGS building.
NIGS 215	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-215	135	2	Located on the 2nd floor, right wing of the NIGS building.
NIGS Seminar Room	This room has a seating capacity of 60 people. A whiteboard, a projector and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-seminar-room	136	2	Located on the 1st floor of the NIGS building.
DMMME 103	Room 103 of DMMME	14.6478996000000006	121.068000999999995	dmmme-103	137	2	Located on the 1st floor of DMMME Building
NIGS 301	This room has a seating capacity of 100 people. A whiteboard, a projector and air-conditioning systems can be found inside.	14.6479701999999996	121.069450000000003	nigs-301	138	2	Located on the 3rd floor of the NIGS building.
PH 207ABC	This room has a seating capacity of 80 people. A whiteboard, a television and sound system, and air-conditioning systems can be found inside.	14.6534767000000006	121.069892999999993	ph-207abc	139	2	Located on the 2nd floor, right wing of Palma Hall.
PH 108-110	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-108-110	140	2	Located on the 1st floor, left wing of Palma Hall.
PH 116-118	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-116-118	141	2	Located on the 1st floor, left wing of Palma Hall.
PH 120-122	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-120-122	142	2	Located on the 1st floor, left wing of Palma Hall.
PH 213-215	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-213-215	143	2	Located on the 2nd floor, right wing of Palma Hall.
PH 216-218	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-216-218	144	2	Located on the 2nd floor, left wing of Palma Hall.
PH 308-310	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-308-310	145	2	Located on the 3rd floor, left wing of Palma Hall.
PH 312-314	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-312-314	146	2	Located on the 3rd floor, left wing of Palma Hall.
PH 324-326	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	14.6534767000000006	121.069892999999993	ph-324-326	147	2	Located on the 3rd floor, left wing of Palma Hall.
PH Multimedia Room	null	14.6534767000000006	121.069892999999993	ph-multimedia-room	148	2	null
PAV1 1114	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1114	149	2	Located along Palma Hall Pavilion 1.
PAV1 1115	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1115	150	2	Located along Palma Hall Pavilion 1.
PAV1 1119	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1119	151	2	Located along Palma Hall Pavilion 1.
PAV1 1206	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1206	152	2	Located along Palma Hall Pavilion 1.
PAV1 1210	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1210	153	2	Located along Palma Hall Pavilion 1.
PAV1 1213	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1213	154	2	Located along Palma Hall Pavilion 1.
PAV1 1214	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1214	155	2	Located along Palma Hall Pavilion 1.
PAV1 1222	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1222	156	2	Located along Palma Hall Pavilion 1.
PAV1 1228	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1228	157	2	Located along Palma Hall Pavilion 1.
PAV1 1230	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1230	158	2	Located along Palma Hall Pavilion 1.
PAV1 1232	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6528796999999997	121.068825000000004	pav1-1232	159	2	Located along Palma Hall Pavilion 1.
NIP F209	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f209	160	2	Located on the 2nd floor, right wing of the NIP building.
NIP F210	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f210	161	2	Located on the 2nd floor, right wing of the NIP building.
NIP Lecture Pavilion 101	This room has a seating capacity of 120 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-101	162	2	Located on the 1st floor, left wing of the NIP building.
NIP Lecture Pavilion 102	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-102	163	2	Located on the 1st floor, left wing of the NIP building.
NIP Lecture Pavilion 103	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-103	164	2	Located on the 1st floor, left wing of the NIP building.
NIP Lecture Pavilion 104	This room has a seating capacity of 120 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-104	165	2	Located on the 1st floor, left wing of the NIP building.
NIP F208	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f208	166	2	Located on the 2nd floor, right wing of the NIP building.
NIP F204	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f204	167	2	Located on the 2nd floor, right wing of the NIP building.
NIP F205	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f205	168	2	Located on the 2nd floor, right wing of the NIP building.
NIP F206	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f206	169	2	Located on the 2nd floor, right wing of the NIP building.
DMMME 109	Room 109 of DMMME	14.6478996000000006	121.068000999999995	dmmme-109	170	2	Located on the 1st floor of DMMME Building
NIP F207	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f207	171	2	Located on the 2nd floor, right wing of the NIP building.
NIP F201	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f201	172	2	Located on the 2nd floor, right wing of the NIP building.
NIP F202	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f202	173	2	Located on the 2nd floor, right wing of the NIP building.
NIP F203	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	14.6490211000000006	121.073120000000003	nip-f203	174	2	Located on the 2nd floor, right wing of the NIP building.
SOLAIR Auditorium	This room has a seating capacity of 120 people. A whiteboard and a projector can be found inside.	14.6571874999999991	121.061699000000004	solair-auditorium	175	2	Located on the nth floor of the SOLAIR building.
SOLAIR 201	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	14.6571874999999991	121.061699000000004	solair-201	176	2	Located on the 2nd floor of the SOLAIR building.
SOLAIR 203	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	14.6571874999999991	121.061699000000004	solair-203	177	2	Located on the 2nd floor of the SOLAIR building.
SOLAIR 10	This room has a seating capacity of 100 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6571874999999991	121.061699000000004	solair-10	178	2	Located on the 1st floor of the SOLAIR building.
SS 301	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-301	179	2	Located on the 3rd floor of the UP School of Statistics building.
SS 302	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-302	180	2	Located on the 3rd floor of the UP School of Statistics building.
SS 303	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-303	181	2	Located on the 3rd floor of the UP School of Statistics building.
SS 304	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-304	182	2	Located on the 3rd floor of the UP School of Statistics building.
SS 305	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-305	183	2	Located on the 3rd floor of the UP School of Statistics building.
SS 306	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-306	184	2	Located on the 3rd floor of the UP School of Statistics building.
SS 307	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	14.6511574000000007	121.067276000000007	ss-307	185	2	Located on the 3rd floor of the UP School of Statistics building.
1F Lobby	This room has a seating capacity of 60 people.	14.6570319999999992	121.072113000000002	1f-lobby	186	2	Located on the 1st floor of Bocobo Hall.
Malcolm Hall Theater	This room has a seating capacity of 120 people. A whiteboard and air-conditioning systems can be found inside."	14.6566238000000002	121.072090000000003	malcolm-hall-theater	187	2	null
Arkivickie	Arckivikie is a food kiosk just by the College of Architecture. They serve quick snacks and meals.	14.6518678999999992	121.064612999999994	arkivickie	188	3	Located just across the College of Architecture complex. A Toki jeepney ride can take you near the place.
ASCAL Food Kiosks	These are small food kiosks built on the elevated land along ASCAL. They serve short-order snacks such as sandwiches, street food, and pancit canton.	14.6528253999999993	121.068588000000005	ascal-food-kiosks	189	3	Located along ASCAL (segment of A. Roces St. in between Palma Hall and Bulwagang Rizal).
Glorias Cafe	A cafeteria located in Melchor Hall. They serve anywhere from snacks to full meals.	14.6564999	121.068779000000006	glorias-cafe	190	3	Located on the ground floor in the rightmost side of Melchor Hall.
NCPAG Cafe	A cafeteria located in NCPAG. They serve anything from snacks to meals here.	14.6564511999999993	121.060019999999994	ncpag-cafe	191	3	Located in the NCPAG building.
NIGS Canteen	NIGS Canteen is a food service establishment located in the building's lower ground floor. They serve anything from snacks to full meals.	14.6477652000000003	121.069748000000004	nigs-canteen	192	3	Located on the lowest floor of NIGS on its right wing.
IB 167 Fish Biology Lab	Fish Biology Lab in Institute of Biology	14.6504002	121.070999	ib-167-fish-biology-lab	881	2	Located on the first floor, in the wing facing away from the CS Amphitheater.
IB 168	Genetics Wet Lab in Institute of Biology	14.6504002	121.070999	ib-168	882	2	Located on the first floor, in the wing facing away from the CS Amphitheater.
Area 2	Area 2 serves an assortment of various food that everyone would be sure to choose from no matter their taste. The area is a staple spot for many goers around the university. There are at least 15 different eateries translating to at least 15 different menus to choose from, with all of them set at reasonable, if not very affordable, prices.	14.6596478999999995	121.067763999999997	area-2-food	193	3	The food service establishments are located along Jose P. Laurel and neighbouring streets, by the intersection of A. Roces. St. and Laurel Ave.. All jeepney routes can stop by two sheds that are a minute's walk from the location.
CASAA Food Court	After burning down a few years back, CASAA has set up a temporary food court close to its original home. They serve many types of food here from different food stalls.	14.6527499999999993	121.071342000000001	casaa-temp-food	194	3	CASAA is located by Quirino Ave. across Sampaguita Residence Hall, in the block enclosed by the Fernandez and Africa Streets.
Institute of Biology Parking Lot	A parking lot that can accommodate no more than 30 sedan-sized vehicles.	14.6503735000000006	121.070808	bio-parking	224	4	Located in front of the Institute of Biology, within the National Science Complex.
CAL Jeepney Stop	Jeepney stop for all routes that go into UP Diliman.	14.6524333999999996	121.067963000000006	cal-jeepney-stop	257	6	It is located across Vidal A. Tan Hall.
Kuya Ramon's Food Hub	This small kiosk serves food from snacks such as street food and instant noodles to full meals such as chicken wings and rice, with deals that are sure to appeal to barkada. There are a good number of seats and tables around the stall.	14.6505078999999991	121.068245000000005	kuya-ramons-food-hub	195	3	Located along Velasquez St., to the right of the Institute of Electrical and Electronics Engineering (as viewed from the front). Ikot and Toki jeepneys stop at a waiting shed close to the location.
Mang Larry's Isawan	Mang Larry's Isawan is an iconic spot in UPD and its popularity can be attributed to its three decades of serving the UP Diliman community. Here, they offer anywhere from your favorite street food to rice meals.	14.6590824000000008	121.067329000000001	isawan-ni-mang-larry	196	3	Mang Larry's Isawan is situated by Balagtas St., just beside Area 2. Ikot jeepneys can be taken to reach a jeepney stop across Bahay ng Alumni (Magsaysay Ave.), and take a minute's walk to the famous Isawan.
Landbank	Bank near Cash Office	14.6599111999999998	121.070366000000007	landbank	197	1	At the side of the old Shopping Center, near Balay Atleta
Catholic Parish Office	Catholic Parish Office	14.6589003000000009	121.070999	catholic-parish-office	198	2	From the entrance in front of Acacia Residence Hall, turn right, then head up the stairs.
Vinzons Hall Food Kiosks	The Vinzons Hall Food Kiosks serve quick snacks such as instant noodles, sandwiches and street food. They also offer a variety of drinks.	14.6540060000000008	121.073051000000007	vinzons-food-kiosks	199	3	Located in spots in front of Vinzons Hall, across the Sunken Garden.
E. de Los Santos Street	E. de Los Santos Street is the street along which you can find the College of Architecture. It is not a busy street and can serve as a parking space for about 10 vehicles.	14.6513957999999995	121.065558999999993	e--de-los-santos-street	200	4	Located across the College of Architecture.
PH Parking Lot 1	A parking lot in front of Palma Hall. Has space for more or less 30 cars.	14.6539029999999997	121.069762999999995	ph-parking-lot-1	201	4	Located in front of Palma Hall.
PH Parking Lot 2	A parking lot in front of Palma Hall. Has space for about 30 cars.	14.6540432000000003	121.069702000000007	ph-parking-lot-2	202	4	Located just across Palma Hall.
CAL Parking Lot 1	A parking lot near the College of Arts and Letters.	14.6530255999999994	121.068023999999994	cal-parking-lot	203	4	Located behind (then-) Bulwagang Rizal, near the CAL building.
Gusali 2 Parking Lot	A parking lot in front of CHE Gusali 2. Has space for more or less 20 4-wheel vehicles.	14.6518736000000001	121.072472000000005	gusali-2-parking-lot	204	4	Located just in front of CHE Gusali 2.
Abelardo Hall Parking Lot	A parking lot in front of Abelardo Hall. Has a parking capacity of more or less 10 cars.	14.6563473000000002	121.065353000000002	abelardo-hall-parking-lot	205	4	Located just in front of the College of Music complex.
School of Economics Parking Lot	A parking lot beside UPSE. Has space for about 20 cars.	14.6556540000000002	121.073822000000007	school-of-economics-parking-lot	206	4	Located to the left of UPSE's Encarnacion Hall.
CFA Parking Lot	The parking lot within the College of Fine Arts complex. Can hold more or less 15 cars.	14.6522798999999999	121.061508000000003	cfa-parking-lot	207	4	Located within the CFA complex.
Law Complex Parking Lot	The parking lot behind Malcolm Hall and beside Bocobo Hall. Has space for about 15 cars.	14.6570034000000007	121.072495000000004	law-complex-parking-lot	208	4	Located in the University of the Philippines Law Complex.
Math Building Parking Lot 1	The parking lot behind the main math building. Can hold around 40 cars.	14.6488131999999993	121.071158999999994	math-building-parking-lot-1	209	4	Located behind the Institute of Math main building.
NCPAG Parking Lot	The parking lot by NCPAG. Can hold more or less 15 cars.	14.6564274000000001	121.060989000000006	ncpag-parking-lot	210	4	Located near NCPAG.
NIGS Parking Lot	The parking lot just in front of NIGS. The area can accommodate around 35 cars.	14.6486502000000005	121.069519	nigs-parking-lot	211	4	Located immediately in front of NIGS.
SOLAIR Parking Lot	The parking lot outside SOLAIR. Can hold about 15 cars.	14.6570596999999996	121.062195000000003	solair-parking-lot	212	4	Located just outside the School of Labor and Industrial Locations.
School of Statistics Parking Lot	The parking lot in front of the UP School of Statistics. Can hold about 20 cars.	14.6513442999999999	121.067252999999994	school-of-statistics-parking-lot	213	4	Located immediately in front of the UP School of Statistics.
Parking Area across Center for Women's Studies	A parking lot that can hold about 10 cars.	14.6577797000000007	121.064628999999996	womens-studies-lot	214	4	Located across the UP Center for Women's Studies, at the Magsaysay Ave. - Ylanan St. intersection
Law Complex Parking Lot 2	A parking lot that can accommodate about 50 four-wheeled vehicles.	14.6577997	121.072243	law-complex-lot-2	215	4	Located at the F. Ma. Guerrero St. - Magsaysay Ave. intersection, across the street from the Law Complex.
Bahay ng Alumni Parking Lots	The larger lot can hold 20 to 30 cars. The smaller one can hold about 15.	14.6579666	121.066215999999997	bahay-alumni-lots	216	4	These lots are located beside (larger lot) and behind (smaller lot) the Bahay ng Alumni in the block by the Balagtas St. - Magsaysay Ave. intersection.
Shopping Center Parking Lots	This space can hold about 40 four-wheeled vehicles.	14.6599530999999992	121.069739999999996	sc-parking-lots	217	4	Can be found behind the ruins of the UP Shopping Center, by P. Valenzuela St..
School of Economics Street Parking	This small street is reserved as a parking space, and can accommodate about 25 four-wheeled vehicles.	14.6564922000000006	121.073409999999996	econ-street-parking	218	4	Located beside the UP School of Economics and can be approached from F. Ma. Guerrero St..
College of Arts and Letters Parking Lot 2	This lot can hold more or less 60 cars.	14.6529427000000005	121.067993000000001	cal-parking-2	219	4	This area can only be approached from Velasquez St. or Quirino Ave..
UP AECH Parking Lot	This small parking lot can hold no more than 15 cars.	14.6489983000000006	121.068755999999993	dcs-parking	220	4	Located in front of the UP Alumni Engineers Centennial Hall, by Velasquez St..
UP Film Institute Parking Lot	This parking lot can accommodate more or less 50 four-wheeled vehicles. Keep in mind that the lot has little cover and is exposed to direct sunlight.	14.6571464999999996	121.067267999999999	cine-adarna-parking	221	4	Located beside the UP Film Institute (Cine Adarna) by Magsaysay Avenue.
College of Home Economics Gusali 2 Parking Lot	A small parking lot meant for goers to Gusali 2 or the College of Home Economics that can hold about 15 cars.	14.6519308000000006	121.072433000000004	che-g2-parking	222	4	Located along Regidor St. between Alonso Hall (Gusali 2) and Alonso Hall Annex.
Institute of Electrical and Electronics Engineering Parking Lot 1	This is a large parking lot with half reserved for students and guests. The latter section has space for about 15 four-wheeled vehicles.	14.6493453999999996	121.068695000000005	ieee-parking	223	4	Located within the area of the Institute of Electrical and Electronics Engineering by Velasquez St..
Marine Science Institute Parking Lot	This is a spacious parking lot with about 15 slots reserved for stuednts and guests.	14.6507310999999998	121.068747999999999	msi-parking	225	4	Located in front of the Marine Science Institute by Velasquez St..
Institute of Mathematics Parking Lot 2	This parking lot can hold more or less 40 vehicles.	14.6489171999999996	121.071167000000003	math-parking-2	226	4	Located beside the Institute of Mathematics Main Building, closer to the National Science Complex Ampitheatre.
Kalinga Day Care Center	Kalinga Day Care Center	14.6601686000000004	121.071967999999998	kalinga-day-care-center	227	1	On Aglipay St., behind Church of the Risen Lord
Area 1	Residential area in UP.	14.6614313000000003	121.070930000000004	area-1	228	1	Can be entered from Agoncillo St.
Philippine Association of University Women (PAUW) Annex	Philippine Association of University Women (PAUW) Annex	14.6599207000000007	121.073516999999995	philippine-association-of-university-women-(pauw)-annex	229	1	On Dagohoy St., past Balay Kalinaw.
DMMME 203	Room 203 of DMMME	14.6478996000000006	121.068000999999995	dmmme-203	230	2	Located on the 2nd floor of DMMME Building
NIMBB Parking Strip	This small strip has space for about 20 four-wheeled vehicles.	14.6504793000000006	121.071579	nimbb-parking-1	231	4	Located in front of the National Institute of Molecular Biology and Biotechnology within the National Science Complex.
NIMBB Parking Lot	This parking lot is able to hold 15 cars.	14.6509236999999999	121.071395999999993	nimbb-parking-2	232	4	Located behind the National Institute of Molecular Biology and Biotechnology beside Regidor St..
NISMED Parking Lot	A small parking lot that has 5 spaces reserved for guests.	14.6517800999999999	121.068213999999998	nismed-parking	233	4	This space can be approached from Velasquez St., and sits beside NISMED and the UP Information Technology Development Center. 
National Institute of Physics Parking Strip	This strip can accommodate about 40 cars. Note that the space hasn't much cover from sunlight.	14.6494827000000001	121.073836999999997	nip-parking	234	4	Located by the National Institute of Physics, on the side that faces Katipunan Avenue.
Quirino Avenue	This street can be used for parking, and can accommodate about 30 cars.	14.6525555000000001	121.073425	quirino-ave-parking	235	4	This avenue can be approached from Regidor St..
Regidor Street	This street can be used for parking and can accommodate more or less 15 vehicles (on one side so as not to debilitate traffic).	14.6531420000000008	121.072806999999997	regidor-st-parking	236	4	Located between Benitez Hall and the UP Integrated School high school building.
University Theater Parking Lot	This parking lot can hold about 20 cars.	14.6573533999999999	121.066108999999997	univ-theater-parking0	237	4	Located behind the University Theater by Magsaysay Avenue.
Palma Hall Toilets (Males)	Comfort rooms for males in Palma Hall.	14.6534691000000006	121.069289999999995	palma-hall-toilets-(males)	238	5	At the left wing of every floor or Palma Hall (except for the 4th), a comfort room for males is available.
Palma Hall Toilets (Females)	Comfort rooms in Palma Hall for females.	14.6534996	121.070221000000004	palma-hall-toilets-(females)	239	5	At the right wing of every floor in Palma Hall, a comfort room for females can be found.
CHE Gusali 2 Comfort Rooms	Comfort rooms that can be found in Alonso Hall Annex (CHE Gusali 2).	14.6518525999999998	121.072288999999998	che-gusali-2-comfort-rooms	240	5	Down the stairs of the building, there are comfort rooms for males and females.
Abelardo Hall Comfort Rooms	Comfort rooms that can be found in Abelardo Hall.	14.6566658000000007	121.065376000000001	abelardo-hall-comfort-rooms	241	5	Inside Abelardo Hall, there are comfort rooms for both males and females.
Encarnacion Hall Comfort Rooms	Comfort rooms in UPSE (Encarnacion Hall).	14.6558752000000005	121.073768999999999	encarnacion-hall-comfort-rooms	242	5	Inside Encarnacion Hall. Comfort rooms are available for both sexes.
Melchor Hall Comfort Rooms (Right Wing)	At the right wing of Melchor Hall, in every floor, there are comfort rooms for both sexes.	14.6564893999999999	121.069000000000003	melchor-hall-comfort-rooms-(right-wing)	243	5	Right wing of all Melchor Hall levels.
Melchor Hall Comfort Rooms (Left Wing)	At the left wing of each Melchor Hall level, there are comfort rooms for both males and females.	14.6564607999999996	121.070014999999998	melchor-hall-comfort-rooms-(left-wing)	244	5	The left wing of every Melchor Hall floor except the lowest and 5th.
CFA Comfort Rooms	Comfort rooms in the College of Fine Arts. Watch out for large images of people (as signs) denoting male and female restrooms.	14.6522960999999992	121.061577	cfa-comfort-rooms	245	5	Located within the College of Fine Arts complex.
MBAn Comfort Rooms	Comfort rooms in the Institute of Mathematics Annex Building (MBAn).	14.6485567000000003	121.071929999999995	mban-comfort-rooms	246	5	On every floor of MBAn, there are comfort rooms available for males and females.
MB Comfort Rooms	Comfort rooms inside the Institute of Mathematics Main Building (MB).	14.6485748000000005	121.071395999999993	mb-comfort-rooms	247	5	Inside MB there are multiple comfort rooms that serve males and females.
NIGS Comfort Rooms	Comfort rooms inside the National Institute of Geological Sciences.	14.6479234999999992	121.069632999999996	nigs-comfort-rooms	248	5	Located inside NIGS. There are restrooms on every floor on the right wing except the lowest.
NIP Comfort Rooms	Comfort rooms inside the National Institute of Physics building.	14.6490755000000004	121.073302999999996	nip-comfort-rooms	249	5	On every floor on the building's right wing there are restrooms for both Gents and Ladies.
SOLAIR Comfort Rooms	Comfort rooms inside the School of Labor and Industrial Relations.	14.6571797999999998	121.061661000000001	solair-comfort-rooms	250	5	There are male and female comfort rooms on every floor of SOLAIR.
UP Stat Comfort Rooms	Comfort rooms inside the School of Statistics.	14.6511697999999999	121.067245	up-stat-comfort-rooms	251	5	On every floor of the building there are comfort rooms for both sexes along the hallways.
Area 2 Jeepney Stop	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6594342999999991	121.068764000000002	area-2-jeepney-stop	252	6	It is located outside All UP Worker's Union.
Romulo Hall Jeepney Stop	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6568097999999996	121.072829999999996	romulo-jeepney-stop	253	6	It is located outside of Romulo Hall.
University Avenue Jeepney Stop 1	Jeepney stop for PHILCOA, Pantranco and SM North EDSA routes.	14.6546716999999997	121.062140999999997	univ-ave-1-jeepney-stop	254	6	It is located on the University Avenue.
University Avenue Jeepney Stop 2	Jeepney stop for PHILCOA, Pantranco and SM North EDSA routes.	14.6550560000000001	121.062072999999998	univ-ave-2-jeepney-stop	255	6	It is located on the University Avenue.
Dagohoy Jeepney Stop	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6590203999999993	121.072829999999996	dagohoy-jeepney-stop	256	6	It is located near the Ilang-Ilang Residence Hall.
Church of the Risen Lord Jeepney Stop	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6594552999999994	121.071731999999997	church-of-the-risen-lord-jeepney-stop	258	6	It is located outside the Church of the Risen Lord.
CS Library Jeepney Stop	Jeepney stop for Ikot jeeps.	14.6488999999999994	121.069000000000003	cs-library-jeepney-stop	259	6	It is located outside the College of Science Library.
Malcolm Hall Jeepney Stop	Jeepney stop for Ikot, Pantranco, Philcoa, and SM North EDSA jeeps.	14.6567001000000001	121.072997999999998	malcolm-hall-jeepney-stop	260	6	It is located near Malcolm Hall.
Shopping Center Jeepney Stop	Jeepney stop for all jeeps that go within UP Diliman.	14.6593999999999998	121.069999999999993	shopping-center-jeepney-stop	261	6	It is located in front of the University Shopping Center.
Plaridel Hall Parking Lot	This parking lot can hold about 10 vehicles.	14.6563996999999997	121.064003	plaridel-hall-parking-lot	262	4	Located by Ylanan St., in front of Plaridel Hall across from the College of Music.
ICE David Y Tan Lecture Room	Lecture Room in ICE	14.6485996000000007	121.066001999999997	ice-david-y-tan-lecture-room	263	2	Located on the 4th floor of ICE
MBB Jeepney Stop	Jeepney stop for Toki.	14.6503639000000003	121.072090000000003	mbb-jeepney-stop	264	6	It is located near the National Institute of Molecular Biology and Biotechnology, and the Institute of Chemistry.
NIP Jeepney Stop	Jeepney stop for Toki.	14.6498031999999991	121.073691999999994	nip-jeepney-stop	265	6	It is located near the National Institute of Physics.
Swimming Pool Jeepney Stop	Jeepney stop for Toki.	14.6593704000000002	121.072472000000005	swimming-pool-jeepney-stop	266	6	It is located near the UP Swimming Pool.
EEE Jeepney Stop	Jeepney stop for Ikot and Toki.	14.6498728000000007	121.068641999999997	eee-jeepney-stop	267	6	It is located across the Electrical and Electronics Engineering Institute.
Centennial Residence Hall Jeepney Stop	Jeepney stop for Ikot.	14.6478280999999999	121.062293999999994	centennial-jeepney-stop	268	6	It is located outside the Centennial Residence Hall.
Biology Jeepney Stop	Jeepney stop for Toki.	14.6511755000000008	121.071442000000005	biology-jeepney-stop	269	6	It is located outside the Institute of Biology.
Arki Jeepney Stop	Jeepney stop for Toki.	14.6514044000000005	121.065680999999998	arki-jeepney-stop	270	6	It is located near the College of Architecture.
Institute of Electrical and Electronics Engineering Parking Lot 2	A parking lot that can hold about 20 cars.	14.6500435000000007	121.06823	ieee-parking-lot-2	271	4	Located by Velasquez St., beside the IEEE buildings, across the street from the jeepney stop.
CAL Parking Lot 2	A parking lot that can accommodate about 40 large vehicles.	14.6525859999999994	121.068175999999994	cal-parking-lot-2	272	4	Located near Palma Hall, behind the ASCAL Food Kiosks. The lot can be entered through Pardo de Tavera St..
Institute of Mathematics Cafeteria	This is a cafeteria that serves 'lutong-bahay' recipes, including rice topping food items.	14.6484527999999994	121.071074999999993	inst-of-math-cafeteria	273	3	Located on the first floor of the Institute of Mathematics Main Building, on the side entrance close to the Science Complex Park. Toki Jeepneys stop at a shed that is a short walk away from this cafeteria.
Institute of Mathematics Food Kiosk	A small kiosk that serves chips, pancit canton, sandwiches, street food, and a choice of drinks.	14.6483048999999994	121.070876999999996	inst-of-math-food-kiosk	274	3	Located beside the Institute of Mathematics Main Building, near its parking lots.
Sari-sari Stores across Bulwagang Rizal	Two small stores across ASCAL, by A. Roces St., that serves sandwiches, drinks, and chips.	14.6540450999999994	121.068466000000001	ascal-sari-sari-stores	275	3	Located at the Roxas Ave. - A. Roces St. intersection, across the street from the ASCAL Jeepney Stop.
NISMED Canteen	This canteen serves anywhere from lutong-bahay recipes, to snacks such as sandwiches, and a variety of chilled drinks. They are operated by the same group that runs the Math cafeteria.	14.6514339000000007	121.068031000000005	nismed-canteen	276	3	This canteen can be found near the NISMED Parking Lot behind the UP Information Technology Development Center.
Regidor St. Food Kiosk	A by-the-road food kiosk that serves pancit canton, sandwiches, and street food.	14.6523503999999996	121.072800000000001	regidor-st-food-kiosk	277	3	This kiosk is situated along A. Ma. Regidor St., near Alonso Hall and the UP Integrated School buildings.
Vinzons Hall Parking Lots	Vinzons Hall has two parking lots (one larger than the other). The larger lot has space for 20 cars, while the smaller can hold 5 cars.	14.6541204	121.073227000000003	vinzons-hall-parking=lots	278	4	The larger lot is located to the side of Vinzons Hall where the organization's tambayans can be located. The smaller lot is located right in front of the entrance to Vinzons Hall.
Bulwagang Rizal Jeepney Stop	This jeepney stop is not in use at the moment.	14.6538868000000004	121.067963000000006	bulwagang-rizal-jeepney-stop	279	6	Located along Roxas Avenue, by the A. Roces St. intersection.
Kalayaan Jeepney Stop	Jeepney stop for Toki, Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6586999999999996	121.068000999999995	kalayaan-jeepney-stop	280	6	It is located across the Kalayaan Residence Hall.
Lagmay Hall Jeepney Stop	This jeepney stop is not in use at the moment.	14.6538000000000004	121.070999	lagmay-hall-jeepney-stop	281	6	This shed can be found in front of Lagmay Hall (Palma Hall Annex Building) along the Roxas Avenue stretch of the Academic Oval.
Melchor Hall Jeepney Stop	This jeepney stop is currently not in use.	14.6562996000000005	121.068000999999995	melchor-hall-jeepney-stop	282	6	Located to the east of Melchor Hall (College of Engineering), along A. Roces St..
NIGS Jeepney Stop	Jeepney stop for Ikot jeeps.	14.6484889999999996	121.069038000000006	nigs-jeepney-stop	283	6	It is located outside the National Institute of Geological Sciences.
NSRI Jeepney Stop	Jeepney stop for all jeeps that go within UP Diliman.	14.6524286000000004	121.068871000000001	nsri-jeepney-stop	284	6	It is located outside the Natural Sciences Research Institute.
OUR Jeepney Stop	Jeepney stop for all jeeps that go within UP Diliman.	14.6515999000000008	121.067001000000005	our-jeepney-stop	285	6	It is located outside the Office of the University Registrar.
Quezon Hall Jeepney Stop	This jeepney stop is currently not in use.	14.6555003999999993	121.064003	quezon-hall-jeepney-stop	286	6	Located slightly in front of Quezon Hall, along Osmena Avenue on the end that leads to University Avenue.
School of Economics Jeepney Stop	Jeepneys of the Ikot, Pantranco, Philcoa, and SM North EDSA routes stop at this shed.	14.6561003000000003	121.072997999999998	school-of-economics-jeepney-stop	287	6	Located in front of the UP School of Economics by the concrete signage slab, across the Sunken Garden Grand Stand.
SURP Jeepney Stop	Jeepney stop for all jeeps that go within the campus.	14.6569996000000007	121.061995999999994	surp-jeepney-stop	288	6	It is located outside the UP School of Urban and Regional Planning.
University Theater Jeepney Stop	This jeepney stop is currently not in use.	14.6562003999999995	121.066001999999997	university-theater-jeepney-stop	289	6	Located along the Osmena Avenue stretch of the Academic Oval in front of the University Theater (Villamor Hall).
UPFI Jeepney Stop	Jeepney stop for Toki.	14.6574001000000003	121.066001999999997	upfi-jeepney-stop	290	6	It is located near Villamor Hall and the UP Film Institute.
Vanguard Jeepney Stop	Jeepney stop for all jeeps that go within UP Diliman.	14.6576003999999998	121.065002000000007	vanguard-jeepney-stop	291	6	It is located near the UP Center for Women Studies and the College of Music on Magsaysay Avenue.
Vinzons Hall Jeepney Stops	These are three sheds that serve as stops for all routes except Toki and Katipunan.	14.6541996000000001	121.072997999999998	vinzons-hall-jeepney-stops	292	6	Located in front of Vinzons Hall near the Sunken Garden Grand Stand.
MB 107	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	14.6485996000000007	121.070999	mb-107	293	2	Located on the 1st floor of the Institute of Math Main Building.
DMMME 105	Room 105 of DMMME	14.6478996000000006	121.068000999999995	dmmme-105	294	2	Located on the 1st floor of DMMME Building
DMMME 108	Room 108 of DMMME	14.6478996000000006	121.068000999999995	dmmme-108	295	2	Located on the 1st floor of DMMME Building
Vinzons Hall University Food Service	According to the site iskWiki, the University Food Service (UFS) "provides food that is acceptable, nutritious, safe, wholesome and reasonably priced to its University clientele of students, faculty and administrative personnel. It is managed by professional dietitians and nutritionists." They are a university organization that operates a canteen in Vinzons Hall, and also provides the food that UPD dormitories serve to its residents.	14.6541262000000003	121.073502000000005	vinzons-hall-univ-food-service	296	3	Located in the first floor of Vinzons Hall, to the immediate right of the entrance.
Bocobo Hall Jeepney Stop	Jeepney stop for Ikot, Toki, Katipunan, and Pantranco/PhilCoA/SM North jeeps.	14.6570844999999998	121.072982999999994	bocobo-hall-jeepney-stop	297	6	It is located near Bocobo Hall.
Molave Residence Hall Jeepney Stop	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	14.6577902000000009	121.068466000000001	molave-residence-hall-jeepney-stop	298	6	It is located outside the Molave Residence Hall.
SS Lecture Hall 1	A large hall, airconditioned.	14.6512002999999993	121.067001000000005	ss-lecture-hall-1	299	2	Located on the 1st floor of the School of Statistics. Go left from the entrance of SS, then take the last right. Lec Hall 1 is at the end of the hallway, on the right side.
SS Lecture Hall 2	A large hall, airconditioned.	14.6512002999999993	121.067001000000005	ss-lecture-hall-2	300	2	Located on the 2nd floor of the School of Statistics. Go up the first flight of stairs from the entrance, then turn right, and right again. Lec Hall 2 is at the end of the corridor, on the right side.
AH 226	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	14.6567001000000001	121.065002000000007	ah-226	301	2	Located on the 2nd floor, left wing of Abelardo Hall.
CMC - B Viewing Room	Medium capacity, airconditioned 	14.6564999	121.065002000000007	cmc---b-viewing-room	302	2	from the entrance, go left
PH Multimedia Room (PH 400)	A multimedia room with large seating capacity. Has air-conditioning.	14.6534996	121.069999999999993	ph-multimedia-room-(ph-400)	303	2	Located on the 4th floor of Palma Hall. From the lobby of Palma Hall, ascend to the 4th floor and turn right.
CMC - Auditorium	Large capacity	14.6564999	121.065002000000007	cmc---auditorium	304	2	The Auditorium is in a separate building from where the main entrance is. You should be able to see an exit at the back of the main building which goes straight to the building that houses the auditorium.
CMC - PhilStar Room	medium capacity	14.6564999	121.065002000000007	cmc---philstar-room	305	2	From the entrance, go to the second floor. There will be a short hallway to the left.
Law Center 3rd Floor Lobby	Airconditioned, office-like room with medium capacity	14.6569996000000007	121.071999000000005	law-center-3rd-floor-lobby	306	2	From the front entrance of Bocobo Hall, head inside all the way to back stairs. Go up until the 3rd floor and head through the glass doors in between the two bonsai plants.
SOLAIR 12	Small capacity	14.6571999000000002	121.061995999999994	solair-12	307	2	Go straight from the entrance. Room 12 should be beside the canteen area in the 1st floor.
SOLAIR 11	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	14.6571999000000002	121.061995999999994	solair-11	308	2	Located on the 1st floor of the SOLAIR building.
Law Center 1st Floor Lobby	Large capacity	14.6569996000000007	121.071999000000005	law-center-1st-floor-lobby	309	2	From the Bocobo hall front entrance, head inside and it will be the room to the right with the large painting in the middle
Institute of Mathematics Main Building (MB)	Formerly known as the Department of Mathematics, the Institute is the largest institute in the University of the Philippines System. It nurtures about 300 undergraduate and 200 graduate students, and handles all the mathematics courses of some 5000 undergraduate students in UP Diliman.	14.6485996000000007	121.070999	institute-of-mathematics-main-building-(mb)	310	1	The Institute of Mathematics' main building can be located within the National Science Complex, along C.P. Garcia Ave. Toki jeepneys have a stop at a waiting shed just outside the building's parking lot.\r\nThe building has two entrances, one at the side of the building next to the cafeteria, and a larger entrance at the side of the building facing C.P. Garcia.
CAL 211	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-211	311	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 212	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-212	312	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 213	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-213	313	2	Located on the 2nd floor of the College of Arts and Letters building.
CAL 501	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-501	314	2	Located on the 5th floor of the College of Arts and Letters building.
CAL 502	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-502	315	2	Located on the 5th floor of the College of Arts and Letters building.
CAL 503	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-503	316	2	Located on the 5th floor of the College of Arts and Letters building.
Plaridel Hall (College of Mass Communication - CMC)	Plaridel Hall has housed the College of Mass Communication since 1966.	14.6564999	121.065002000000007	plaridel-hall-(college-of-mass-communication---cmc)	317	1	Ylanan Road, University of the Philippines\r\nDiliman, Quezon City 1101; beside the College of Music
CAL 510	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-510	318	2	Located on the 5th floor of the College of Arts and Letters building.
CAL 512	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	14.6527004000000005	121.067001000000005	cal-512	319	2	Located on the 5th floor of the College of Arts and Letters building.
MB 105	This room has a seating capacity of 40 people. A chalkboard and airconditoner can be found inside.	14.6485996000000007	121.070999	mb-105	320	2	Located on the 1st floor of the Institute of Math Main Building.
MB 108	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	14.6485996000000007	121.070999	mb-108	321	2	Located on the 1st foor of the Institute of Math Main Building.
MB 106	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	14.6485996000000007	121.070999	mb-106	322	2	Located on the 1st foor of the Institute of Math Main Building.
MB 115	This room has a seating capacity of 40 people.	14.6485996000000007	121.070999	mb-115	324	2	Located on the 3rd floor of the Institute of Math Main Building.
College of Fine Arts (CFA)	The University of the Philippines College of Fine Arts (UPCFA) is the oldest arts and design educational institution in the country. For more than a century now, the UP College of Fine Arts remains steadfast in its vision to be the eminent learning institution for arts and design, imbued with a deep sense of humanity that inspires the Filipino to strive for excellence. The UPCFA commits itself to the task of nurturing career artists dedicated to the perfection of their craft and the enrichment of Philippine society. The main building of UPCFA is Bartlett Hall. 	14.6522998999999992	121.061995999999994	college-of-fine-arts-(cfa)	325	1	The college can be located along E. Jacinto St. An Ikot jeepney ride can drop you off immediately in front of the building.
MB 117	This room has a seating capacity of 40 people. 	14.6485996000000007	121.070999	mb-117	326	2	Located on the 1st floor of the Institute of Math Main Building.
MB 116	This room has a seating capacity of 40 people.	14.6485996000000007	121.070999	mb-116	327	2	Located on the 1st floor of the Institute of Math Main Building.
MB 120	This room has a seating capacity of 40 people.	14.6485996000000007	121.070999	mb-120	328	2	Located on the 1st floor of the Institute of Math Main Building.
MB 121	This room has a seating capacity of 40 people. 	14.6485996000000007	121.070999	mb-121	329	2	Located on the 1st floor of the Institute of Math Main Building.
MB 313	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485996000000007	121.070999	mb-313	330	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 314	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485996000000007	121.070999	mb-314	331	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 319	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485996000000007	121.070999	mb-319	332	2	Located on the 3rd floor of the Institute of Math Main Building.
MB 320	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	14.6485996000000007	121.070999	mb-320	333	2	Located on the 3rd floor of the Institute of Math Main Building.
Melchor Hall Parking Lot 1 (Engineering)	Melchor Hall's larger parking lot. Can hold more or less 30 vehicles.	14.6567001000000001	121.069999999999993	melchor-hall-parking-lot-1-(engineering)	334	4	Located behind Melchor Hall's left wing.
Abelardo Hall Annex (College of Music Annex)	Abelardo Hall Annex houses rooms of the College of Music aside from those in the main hall. The college serves as a catalyst in national development by providing quality and professional instruction in diverse areas of music specialization. Its college administration and faculty are committed to provide a meaningful and personally relevant learning experience of music, as well as to guide students towards academic excellence. 	14.6570996999999998	121.065002000000007	abelardo-hall-annex-(college-of-music-annex)	335	1	Abelardo Hall Annex is located behind the main Abelardo Hall building which is situated across Ylanan Street. You can ride any jeepney within the campues to get near this building.
CAL Comfort Rooms 	Comfort rooms of College Arts and Letters (CAL)	14.6526527000000009	121.067229999999995	cal-comfort-rooms-	336	5	After entering the building by going up the stairs, turn immediately right. There will be a comfort room for both genders at the same place on every floor.
CA Parking Lot 1	Parking Area of the College of Architecture (CA)	14.6517906	121.065430000000006	ca-parking-lot-1	337	4	Directly across the street from the College of Architecture
CA Comfort Room	Comfort room of the Architecture Lab (CA)	14.6514626000000003	121.064673999999997	ca-comfort-room	338	5	Enter the Archi Lab turn right, head to the corner, turn left, head to the corner. It's next to some stairs.
Malcolm Hall Comfort Rooms	Male and female comfort rooms are on opposite wings (male is on the left side facing into the building from the entrance, female is on the right side).	14.6566372000000005	121.071869000000007	malcolm-hall-comfort-rooms	339	5	There is a male comfort room on the left-side stairs (facing inside from the main entrance) and a female comfort room on the right-side stairs on every floor in the building.
NCPAG Comfort Rooms	There are comfort rooms on each floor of the building. The male comfort rooms are on the right side. The female comfort rooms are on the left side.	14.6564473999999993	121.060462999999999	ncpag-comfort-rooms	340	5	On every floor, the male comfort rooms are on the left side (facing into the building) and the female comfort rooms are on the right side.
Plaridel Hall (CMC) Comfort Rooms	Comfort rooms in Plaridel Hall	14.6569213999999999	121.064514000000003	plaridel-hall-(cmc)-comfort-rooms	341	5	There are comfort rooms in the lobby (located near the door leading outside, towards the auditorium) and comfort rooms near the auditorium itself. The male comfort room in the lobby is located on the left side while the female comfort room is located on the right side. The comfort rooms near the auditorium are in a hallway on the left, facing the auditorium.
Benton Hall	Benton Hall is located to the east of Palma Hall, also facing the Academic Oval. It houses the Center for International Studies (CIS), as well as offices like the Office of Anti-Sexual Harassment (OASH) and the UP Diliman Gender Office (UPDGO). - iskWiki!	14.6536387999999995	121.070892000000001	benton-hall	395	1	Directly to the left of Palma Hall when facing its entrance
UP Integrated School – 7-12 Building (UPIS)	The UP Integrated School (UPIS) is one of the country's pioneer integrated schools, a school of the UP College of Education. It has been offering an integrated curriculum since its inception in 1976, and now offers a curriculum from Kindergarten to Grade 12.	14.6527662000000003	121.073134999999994	up-integrated-school-–-7-12-building-(upis)	342	1	The UPIS Grade 7-12 building is located at the corner of Quirino Avenue and Regidor St.
UPIS 110	Room 110 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-110	343	2	Located on the first floor of the UPIS 7-12 building.
UPIS 111	Room 111 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-111	344	2	Located on the first floor of the UPIS 7-12 building.
DMMME ANSyD	Active Nanomaterials Synthesis and Devices Laboratory in DMMME	14.6478996000000006	121.068000999999995	dmmme-ansyd	345	2	Located on the 1st floor of DMMME Building
DMMME Mechanical Testing Section	Name is of location is self-explanatory	14.6478996000000006	121.068000999999995	dmmme-mechanical-testing-section	346	2	Located on the 1st floor of DMMME Building
DMMME Rubber Processing Laboratory	Name is of location is self-explanatory	14.6478996000000006	121.068000999999995	dmmme-rubber-processing-laboratory	347	2	Located on the 1st floor of DMMME Building
EEE 428	EEE 428 is the Electric Power Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-428	348	2	Located on the 4th floor of EEEi
EEE 429	EEE 429 is the Electricity Market Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-429	349	2	Located on the 4th floor of EEEi
NIMBB 100	NIMBB 100 is an Administration Office	14.6506004000000001	121.071999000000005	nimbb-100	350	2	Located on the 1st Floor of NIMBB
Law Center Comfort Rooms	Comfort rooms in Law Center, Bocobo Hall.	14.6569996000000007	121.071999000000005	law-center-comfort-rooms	351	5	There are male and female comfort rooms on the left and right sides on the first two floors. On the third floor turning right from the stairs, the comfort rooms are on the right side.
UPIS 1st Floor Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-1st-floor-comfort-rooms	352	5	On the first floor, there are female, male, and PWD restrooms.
UPIS 2nd Floor Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-2nd-floor-comfort-rooms	353	5	On the second floor, there are female and male restrooms.
UPIS 3rd Floor Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-3rd-floor-comfort-rooms	354	5	On the third floor, there are female and male restrooms.
UPIS 113	Room 113 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-113	355	2	Located on the first floor of the UPIS 7-12 building.
UPIS 120	Room 120 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-120	356	2	Located on the second floor of the UPIS 7-12 building.
UPIS 121	Room 121 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-121	357	2	Located on the second floor of the UPIS 7-12 building.
UPIS 122	Room 122 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-122	358	2	Located on the second floor of the UPIS 7-12 building.
UPIS 123	Room 123 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-123	359	2	Located on the second floor of the UPIS 7-12 building.
UPIS 124	Room 124 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-124	360	2	Located on the second floor of the UPIS 7-12 building.
UPIS 125	Room 125 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-125	361	2	Located on the second floor of the UPIS 7-12 building.
UPIS 126	Room 126 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-126	362	2	Located on the second floor of the UPIS 7-12 building.
UPIS 127	Room 127 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-127	363	2	Located on the second floor of the UPIS 7-12 building.
UPIS 128	Room 128 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-128	364	2	Located on the second floor of the UPIS 7-12 building.
UPIS 129	Room 129 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-129	365	2	Located on the second floor of the UPIS 7-12 building.
UPIS 130	Room 130 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-130	366	2	Located on the third floor of the UPIS 7-12 building.
UPIS 131	Room 131 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-131	367	2	Located on the third floor of the UPIS 7-12 building.
UPIS 132	Room 132 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-132	368	2	Located on the third floor of the UPIS 7-12 building.
UPIS 133	Room 133 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-133	369	2	Located on the third floor of the UPIS 7-12 building.
UPIS 134	Room 134 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-134	370	2	Located on the third floor of the UPIS 7-12 building.
UPIS 135	Room 135 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-135	371	2	Located on the third floor of the UPIS 7-12 building.
UPIS 136	Room 136 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-136	372	2	Located on the third floor of the UPIS 7-12 building.
UPIS 137	Room 137 of UPIS 7-12.	14.6527995999999998	121.072997999999998	upis-137	373	2	Located on the third floor of the UPIS 7-12 building.
UP Alumni Center (Fonacier Hall)	UP Alumni Center	14.6577386999999995	121.065894999999998	up-alumni-center-(fonacier-hall)	374	1	Fonacier Hall is located along Magsaysay Ave., beside the Bahay ng Alumni.
UP Center for Ethnomusicology	UP Center for Ethnomusicology	14.6567001000000001	121.065002000000007	up-center-for-ethnomusicology	375	2	It is located on the second floor (Rm 218-220) of the College of Music
DMST - Vanguard Comfort Rooms	Comfort Rooms in Vanguard Hall	14.6588162999999998	121.064239999999998	dmst---vanguard-comfort-rooms	883	5	Located on the second and third floors.
Department of Military Science and Tactics Complex (DMST)	The DMST Complex houses the Department of Military Science and Tactics and the UP ROTC	14.6588239999999992	121.064209000000005	department-of-military-science-and-tactics-complex-(dmst)	376	1	The DMST Complex is located on Ylanan st., near the College of Human Kinetics.
Balay Atleta	Balay Atleta is a dormitory for the athletes of UP Diliman	14.6603708000000008	121.070319999999995	balay-atleta	377	1	Balay Atleta is located along Apacible St., across the Cash Office
Viladolid Hall	Environmental Science Building	14.6527004000000005	121.064003	viladolid-hall	378	1	Along Lakandula street beside Albert Hall
UP Lagoon Beta Epsilon Theatrum	Aside from the forest glades that adorn the area, the UP Lagoon is now landscaped with decorative plants complete with benches, tables, wooden bridges, and paved pathways with street lamps. The presence of the Beta Theatrum (courtesy of the Beta Epsilon Fraternity) in the area makes it an ideal activity center for cultural endeavors such as concerts and variety shows throughout the year. - http://iskwiki.upd.edu.ph/index.php/UP_Lagoon_and_the_Academic_Oval#.W_FTHOgzZPY	14.6547269999999994	121.066612000000006	up-lagoon-beta-epsilon-theatrum	394	1	Behind University Amphitheatre. Walkways toward it can be found at its adjacent sides in Roxas Ave. and Osmena Ave.
College of Science Administration	CS Administration.	14.6497784000000006	121.070899999999995	college-of-science-administration	452	1	Located in National Science Complex.
Diliman Interactive Learning Center (DILC)	The Interactive Learning Center or ILC Diliman is under the Office of the Vice Chancellor for Academic Affairs (OVCAA) mandated to help in the development of faculty expertise in the use of technologies in teaching and learning.  It is located at Magsaysay Avenue corner Apacible Street.  ILC Diliman operates the on-line learning management system of the university, as well as promotes the production and use of interactive instructional materials.  ILC Diliman aims to facilitate and supplement teaching and learning through the use of education technologies.  It aspires for the mainstreaming of the development, application and promotion of interactive learning.  It strives to go beyond producing products and delivering services through the active and collaborative participation of the entire academic community.  ILC Diliman: promoting education technologies for Invaluable, Leading-edge, Collaborative and Dynamic teaching and learning!\r\n\r\n-from the ILC Diliman Website	14.6573876999999992	121.070426999999995	diliman-interactive-learning-center-(dilc)	379	1	The Diliman Interactive Learning Center is located across Ipil Residence Hall, beside the Computer Center.
College of Music - Dance Studio	The Dance Studio is where students from the College of Music practice dance performances.	14.6575003000000006	121.065002000000007	college-of-music---dance-studio	380	1	The Dance Studio is a small building located behind Plaridel Hall, directly beside the UP Center for Women Studies
Quezon Hall	Aside from being the home the Oblation, the Quezon Hall is the front-most building of the university from the University Avenue. It houses many of the administrative offices for the entire university. - iskWiki!	14.6548996000000002	121.065002000000007	quezon-hall	381	1	It's right behind the Oblation
Coral Building (Office of the Campus Architect) (OCA)	The Office of the Campus Architect is the infrastructure and physical planning delivery agency of the University of the Philippines Diliman. - www.oca.upd.edu.ph	14.6527004000000005	121.064003	coral-building-(office-of-the-campus-architect)-(oca)	382	1	Along Lakandula Street beside Villadolid Hall, to the corner of its intersection with Delos Reyes Street
Supply and Property Managment Office (SPMO)	As a service unit of the University, the Supply and Property Management Office (SPMO) is the overall in charge in the acquisition of new properties and equipment, its utilization and the disposition of unserviceable or no longer needed equipment of the University. - spmo.upd.edu.ph	14.6522998999999992	121.063004000000006	supply-and-property-managment-office-(spmo)	383	1	Behind Albert Hall
Diliman Legal Office (DLO)	Office of Atty. Maria Luz R. Raval, Chief Legal Officer	14.6548996000000002	121.065002000000007	diliman-legal-office-(dlo)	384	2	Enter Quezon Hall from the front Oblation entrance and navigate to the right-most room at its back
ICE 314	ICE Classroom 314	14.6485996000000007	121.066001999999997	ice-314	385	2	On the 3rd floor of ICE
ICE 315	ICE Classroom 315	14.6485996000000007	121.066001999999997	ice-315	386	2	On the 3rd floor of ICE
Human Resources Development Office 	Provides responsive and excellent service in the development and administration of effective human resource management through implementation of rules and policies on: recruitment, appointment and separation process, personnel benefits, training, skills and professional development, rationalized manpower and staffing pattern, monitoring of Administrative and REPS performance and management of personnel records and database system.\r\n- hrdo.upd.edu.ph \r\n	14.6548996000000002	121.065002000000007	human-resources-development-office-	387	2	Down the 1st floor corridor of the right wing of Quezon Hall
Office of the Chancellor (OC)	Office of the UP Diliman Chancellor	14.6548996000000002	121.065002000000007	office-of-the-chancellor-(oc)	388	2	1st room found at the 2nd floor of the south (right) wing of Quezon Hall
Office of the Vice Chancellor for Administration (OVCA)	The OVCA administers the university’s physical, financial and human resources. Under it are the Human Resources Development Office (HRDO), Accounting Office, Budget Office, Cash Office, Supply and Property Management Office, and the PABX and Utilities Monitoring Team - upd.edu.ph/about/administration/	14.6548996000000002	121.065002000000007	office-of-the-vice-chancellor-for-administration-(ovca)	389	2	At the end of the 1st floor of the south (right) wing of Quezon hall
Office of the Vice Chancellor for Student Affairs (OVCSA)	The OVCSA is tasked to attend to several non-academic needs of students such as counseling, discipline, scholarships, food service, housing, tutorials/learning centers, student/graduate assistantships, loans, organizations and visa requirements for international students - upd.edu.ph/about/administration/	14.6548996000000002	121.065002000000007	office-of-the-vice-chancellor-for-student-affairs-(ovcsa)	390	2	The first room through the 1st floor corridor of the south (right) wing of Quezon Hall
UP Diliman Police (UPDP)	The primary missions of the UPDP are to maintain peace and order, secure and protect lives and property, enforce basic laws, applicable Quezon City Ordinances, and University Rules and Regulations including policies and standards; and to perform such other functions relative to the general safety and security of students, employees, and residents in the U.P. Diliman Campus. - iskWiki!	14.6520243000000008	121.065453000000005	up-diliman-police-(updp)	391	1	Along Epifania Delos Santos Street, towards the opposite side of the College of Architecture Building
DMST - Vanguard Rooftop	Rooftop of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-rooftop	884	2	On the third floor of Vanguard building
DMST - Vanguard 201	Classroom in Vanguard Hall	14.6588001000000006	121.064003	dmst---vanguard-201	885	2	On the second floor of Vanguard building
Jorge B. Vargas Museum and Filipiniana Research Center	A center for Philippine art and culture, the Jorge B. Vargas Museum and Filipiniana Research Center’s main thrusts are research, exhibition and education. It enjoys the distinction of being one of the art repositories in the country embracing the entire range of Philippine artistic creativity from the 1880s to the 1960s. Through its collection of oil paintings, watercolors, pastels, drawings, and sculptures, Vargas Museum aims to contribute towards the appreciation of the country’s artistic heritage and to foster an awareness of the history of Philippine art. - vargasmuseum.wordpress.com/the-museum/	14.6533002999999997	121.067001000000005	jorge-b--vargas-museum-and-filipiniana-research-center	392	1	1st major building across Roxas Avenue of the University Oval, immediately after the 1st jeepney stop, just before the ruins of the previous Faculty Center (Bulwagang Center)
University Ampitheater	The University Amphitheater is a semi-circular open area located at the back of Quezon Hall.  While it is not a complete round or oval space, it has the main feature of an amphitheater—rising tiers—with flower boxes to demarcate the area.  The development of what was once a plain field into the Amphitheater commenced in the 1960s.  It is where the most awaited rite symbolizing the culmination of the students’ work in the University—the General Commencement Exercises—continues to be held with the Quezon Hall as the seemly stage.  The Lantern Parade also winds up at the Amphitheater where all participating groups converge and present their song, dance and other numbers. - https://upd.edu.ph/sites-of-interest/	14.6549206000000005	121.065680999999998	university-ampitheater	393	1	Behind Quezon Hall
Computational Science Research Center (CSRC)	Computational Science Research Center.	14.6498183999999991	121.071465000000003	computational-science-research-center-(csrc)	453	1	Located in National Science Complex.
UP Diliman Gender Office (UPDGO)	The UPDGO has been giving Gender Sensitivity Trainings to faculty and students from different colleges; organizing fora on gender topics and issues; advocating for the integration of gender in the curriculum; providing list of courses on women, gender and sexuality; providing counseling services regardless of gender or sexual orientation. It has also participated in researches on gender and sexuality. It is working in partnership with the College of Law Office of Legal Aid, UP Health Service, UP Police and the Office of Guidance and Counseling in its efforts to respond to gender-related crisis situations. - dgo.upd.edu.ph/about-us-en-us/	14.6535996999999991	121.070999	up-diliman-gender-office-(updgo)	396	2	Enter Benton Hall from the right entrance. Along the hallway, you should see a sign pointing to a passage leading to some stairs. UPDGO will be at the 2nd floor of those stairs.
Kamia Residence Hall	Kamia Residence Hall was established in 1961 as a dormitory for upperclassmen. It is beside another dormitory called the Sampaguita Residence Hall. The two dormitories are connected by a covered walk. The dormitory has a basement, first floor, and second floor. Every floor is equipped with a communal toilet and a utility room. There is also a piano, a television, an intercom system and a public telephone.	14.6520165999999996	121.070480000000003	kamia-residence-hall	397	1	Along Quirino Ave., just before the jeepney stop behind the CASAA Temporary Food Court
Office of Anti-Sexual Harassment (OASH)	The OASH is in charge of designing and implementing a continuing program of activities and initiatives for the prevention of sexual harassment; undertaking information and educational activities to ensure that the University policy, rules, regulations, and procedures on anti-sexual harassment are disseminated and become part of academic culture; and formulating procedures of such nature as to elicit trust and confidence on the part of interested parties in resolving problems arising from cases or incidents of sexual harassment, including counseling and grievance management - oash.upd.edu.ph/?page_id=396	14.6535996999999991	121.070999	office-of-anti-sexual-harassment-(oash)	398	2	Same place as the UP Diliman Gender Office. On the 2nd floor of the Benton Hall left wing
ICE 316	ICE Classroom 316	14.6485996000000007	121.066001999999997	ice-316	399	2	On the 3rd floor of ICE
Sampaguita Residence Hall	Sampaguita Residence Hall, situated along Quirino Avenue across the Zoology building and adjacent to the Kamia Residence Hall, was in June 1957 referred to as the UP Women's South Dorm II. Three years later, it was known as Halcon Hall, when acting UP President Virata designated it as such. It was only in 1962 that its present name was adopted. Mrs. Luz D. Padilla, the matron who had gone through the nine-year period during which the dorm's name was changed several times, handed over the administration of the dorm to Miss Carmelita Ynares, who opted for a two year term. Miss Erlinda N. Acosta took charge of Sampaguita Residence Hall in September 1967. Presently, Mrs. Teresita Ngayan manages the dormitory. -iskWiki!	14.6521082000000007	121.070983999999996	sampaguita-residence-hall	400	1	Along Quirino Ave., behind the Ikot jeepney stop, beside Kamia residence hall
UP Main Library (Gonzales Hall)	The Main Library, which is the seat of library administration, is situated at Gonzalez Hall in the middle of the academic oval. This was intended as to portray that it is the "heart" of all the colleges present around the academic oval. It is organized into three major divisions which covers the various functional sections: (a) Technical Services Division which formulates and adopts standard acquisition, cataloging and indexing policies and procedures, (b) Administrative Services which provides support to the functional sections/units of the Library, and (c) User Education and Services Division which lends books and provides reference, research, and bibliographic services; maintains and preserves books, documents, and archival materials; undertakes user education programs; and maintains computerized database applications. -iskWiki!	14.6550540999999992	121.071067999999997	up-main-library-(gonzales-hall)	401	1	Behind the Sunken Garden. Pathways connect it to Osmena Ave. and to Roxas Ave.
Center for International Studies	Directory: 9818500 local 2460 and 2462 - iskWiki!	14.6535996999999991	121.070999	center-for-international-studies	402	2	Inside Benton Hall left wing. The first doorway from the 1st floor entrance near Palma Hall.
Diliman Learning Resource Center (DLRC)	Learning Resource Centers (LRCs) were established by the UP Board of Regents on April 17, 1997 to supplement, complement and coordinate all learning assistance programs and instructional support services to students in each campus and to ensure that the goal of promoting academic excellence will be realized in a more caring and nurturing environment. The Diliman Learning Resource Center (DLRC), simultaneous with LRCs of other autonomous UP units, was institutionalized on April 28, 1997. It is supervised by the Office of the Vice Chancellor for Student Affairs and is headed by a Director.  - iskWiki!	14.6520004000000004	121.069999999999993	diliman-learning-resource-center-(dlrc)	403	2	From the Kamia Hall entrance, turn right, go up some stairs and enter the nearest door.
DMST - Vanguard 202	Classroom in Vanguard Hall	14.6588001000000006	121.064003	dmst---vanguard-202	886	2	On the second floor of Vanguard building
UP DOST Core Group	TheUP-DOST Core Group was established in 1997 through a Memorandum of Agreement between the Department of Science and Technology-Science EducationInstitute (DOST-SEI) and the UP Diliman. Itsmain function is to attend to the Republic Act 7687 scholars of UP Diliman. Monitoring of the students' academic performance, release of their stipends, andmanagement of the Science and Technology Learning Assistance Program has becomepart of the service that DOST offers the students. Located at the DLRC-2 office, Kamia Residence Hall, DOST also offers 10 computers with printers acquired in 1998 for the use of the scholars. - iskWiki!	14.6520004000000004	121.069999999999993	up-dost-core-group	404	2	Same room as the DLRC. The first door on top of some stairs to the right of Kamia Residence Hall entrance
Bulwagan ng Dangal	The Bulwagan ng Dangal is a University Heritage Museum.	14.6543454999999998	121.071037000000004	bulwagan-ng-dangal	405	1	Beside UP Main Library towards the Roxas Ave. side.
Natural Sciences Research Institute (NSRI) (Miranda Hall)	The NSRI, recognizing the importance of science and technology (S&T) in the advancement of our country has continued to support the research endeavors of the NSRI in-house researchers and faculty-scientists of the UP Diliman College of Science, in particular the Institute of Biology, Institute of Chemistry, Institute of Environmental Science and Meteorology and the Institute of Mathematics. Through the years, the NSRI has supported projects on diverse fields of basic and applied sciences like environmental and medical microbiology, aquaculture, genetics, drug discovery, forensic biology, biochemistry, materials science, mathematics, etc. Indeed, the NSRI sees that all inclusive growth of S&T will lead to a better future for Filipinos. Our scientists have time and again proved how research and innovation can address cross-cutting issues which affect people’s lives. They do not lose sight of continually improving their craft with the goal of delivering quality research that would benefit the country. - nsri.upd.edu.ph/	14.6521396999999993	121.068984999999998	natural-sciences-research-institute-(nsri)-(miranda-hall)	406	1	On the corner of the intersection between Quirino Ave. and Velasquez Ave.
Yakal Residence Hall	a co-ed dormitory in UP Diliman with 49 male rooms (4 males per room) and 92 female rooms (2 females per room)	14.6578817000000008	121.069168000000005	yakal-residence-hall	407	1	Yakal Residence Hall is located on Magsaysay Ave. between the Molave Residence Hall and Ipil Residence Hall.
Office of the University Registrar	The Office of the University Registrar is a vital arm of the University. It is the official recorder and keeper of records of the students.	14.6516141999999991	121.066513	office-of-the-university-registrar	408	1	The Office of the University Registrar is located at the corner of T.M. Kalaw and Quirino. The Ikot passes by it, as do the Philcoa/Pantranco/SM North jeeps, although only when coming from outside the campus. The Katipunan jeep passes by it after getting on on the northern side of UP, but not when getting on the jeep on the southern side of UP.
Acacia Residence Halls	A co-ed dormitory in UP Diliman	14.6589335999999992	121.070380999999998	acacia-residence-halls	409	1	Acacia is located along G. Apacible St., across the Parish of Holy Sacrifice.
College of Arts and Letters Faculty Center	This building houses is where the offices of CAL faculty members are located.	14.6584625000000006	121.070480000000003	college-of-arts-and-letters-faculty-center	410	1	The CAL Faculty Center is located on G. Apacible St., between Acacia Residence Halls and Ipil Residence Halls
Ipil Residence Hall	Ipil Dormitory is an all male dorm located in UP Diliman	14.6580706000000003	121.070212999999995	ipil-residence-hall	411	1	Ipil Dormitory is located on the corner of Magsaysay Ave. and G. Apacible St. The entrance that is currently being used is along G. Apacible St.
Office of Student Housing	The Office of Student Housing oversees all dormitories in UP Diliman	14.6589003000000009	121.069999999999993	office-of-student-housing	412	2	The Office of Student Housing is located on the second floor of the Acacia Residence Halls lobby. 
Espiritu Hall (College of Law Library)	Espirtu Hall is the library for the College of Law	14.6569442999999993	121.072327000000001	espiritu-hall-(college-of-law-library)	413	1	Espiritu Hall is located along Magsaysay Ave., beside Bocobo Hall.
Sanggumay Residence Hall	Sanggumay Residence Hall is an all female dormitory in UP Diliman	14.6585522000000008	121.068245000000005	sanggumay-residence-hall	414	1	Sanggumay Residence Hall is located along A. Roces St. across Kalayaan Residence Hall
Kalayaan Residence Halls	Kalayaan Residence Hall is the freshman dorm in UP Diliman	14.6588984	121.068862999999993	kalayaan-residence-halls	415	1	Kalayaan Residence Halls is located on A. Roces St., across Sanggumay Residence Halls.
Molave Residence Halls	Molave Residence Halls is an all male dormitory in UP Diliman	14.6578397999999996	121.067711000000003	molave-residence-halls	416	1	Molave is located on the corner of Magsaysay Ave. and A. Roces St.
Sunken Garden	The General Antonio Luna Parade Grounds aka Sunken Garden is a large grassy open space for recreation and events.	14.6549748999999991	121.072204999999997	sunken-garden	417	6	Located off the Academic Oval, behind the Main Library.
Lagmay Hall (LH) (Palma Hall Annex)	Lagmay Hall, previously named Palma Hall Annex, is home to the UP Department of Psychology. Lagmay was the Department’s longest-serving chair. - https://upd.edu.ph/~updinfo/may15/articles/PHAN_is_now_AV_Lagmay_Hall.html	14.6535996999999991	121.070999	lagmay-hall-(lh)-(palma-hall-annex)	418	1	Directly beside Palma Hall to the east.
UPFI Film Center	This is the Film Center of the UP Film Institute.	14.6562242999999999	121.063598999999996	upfi-film-center	419	1	The UP Film Institute Film Center is located along Osmeña Ave., beside the UP Carillion Tower.
Church of the Risen Lord	The Church of the Risen Lord is a church located in UP Diliman. There is a function hall on the second floor of the building to the right of the entrance.	14.6597004000000002	121.071999000000005	church-of-the-risen-lord	420	1	The Church of the Risen Lord is located along Laurel Ave., beside the UP Health Service.
Parish of The Holy Sacrifice	The Parish of The Holy Sacrifice is a church located in UP Diliman.	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice	421	1	The Parish of Holy Sacrifice is located on the corner of G. Apacible St. and Laurel Ave., across from the Acacia Residence Halls.
UP School of Economics - Philippine Center for Economic Development (PCED)	The Philippine Center for Economic Development (PCED) was created on 15 March 1974 by Presidential Decree (PD) No. 453 with the primary responsibility of  giving “…financial and moral support to the research, teaching, training, and other programs of the School of Economics, University of the Philippines.” Through the PCED, the UPSE undertakes its academic functions at a larger scale while still maintaining a high degree of independence, relying on faculty initiative as the prime means of developing competent training and research.\r\n\r\n-PCED Website	14.6559000000000008	121.073997000000006	up-school-of-economics---philippine-center-for-economic-development-(pced)	422	1	The PCED Building is located along Osmeña Ave., near the Sunken Garden and beside the Cesar E.A. Virata School of Business.
National Institute for Science and Mathematics Education Development (NISMED)	Established in 1964 as the Science Teaching Center, NISMED has many facilities to accommodate various science teaching activities, and is a venue for many seminars and talks.	14.6519002999999994	121.068000999999995	national-institute-for-science-and-mathematics-education-development-(nismed)	423	1	NISMED is on Quirino Avenue, across from the Office of the University Registrar. All jeepneys pass by it.
UP National Center for Transportation Studies (UP NCTS)	NCTS offers technical expertise on traffic engineering and transportation planning, and advocates environmentally sustainable transport (EST), including low carbon transport, road safety and people-friendly transport infrastructure.\r\n\r\n- UP Diliman Website	14.6569699999999994	121.069953999999996	up-national-center-for-transportation-studies-(up-ncts)	424	1	UP NCTS is located along G. Apacible St., behind the UP Computer Center.
Juinio Hall (National Engineering Center)	The NEC serves as the UP College of Engineering's research and extension arm.\r\n\r\n- UP NEC Website	14.6564379000000002	121.071090999999996	juinio-hall-(national-engineering-center)	425	1	Juinio Hall is located along Osmeña Ave., in between Melchor Hall and Malcolm Hall.
Vidal A. Tan Hall	Vidal A. Tan Hall is an office building of the University of the Philippines. It contains, among other things, the Information Technology Development Center (ITDC).	14.6522141000000001	121.068213999999998	vidal-a--tan-hall	426	1	Vidal A. Tan Hall is on Quirino Avenue, next to NISMED.
PAUW Child Study Center	The PAUW Child Study Center, also called the Child Care Center, is a preschool run by the Philippine Association of University Women.	14.6498031999999991	121.066283999999996	pauw-child-study-center	427	1	Located on Pardo de Tavera Street, a short distance from the Office of the University Registrar.
Benitez 200	Room 200 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-200	480	2	Located on the 2nd floor of Benitez Hall
Benitez 201	Room 201 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-201	481	2	Located on the 2nd floor of Benitez Hall
Institute of Civil Engineering Cafeteria	This spacious cafeteria can serve about 150 heads at any one time. There are three food stalls to choose from, with all items offered at most reasonable prices.	14.6487589000000007	121.065987000000007	institute-of-civil-engineering-cafeteria	428	3	Located in the UP Engineering Complex, near the Executive House, a short walk from the Pardo de Tavera and Maramag Streets' intersection.
Institute of Civil Engineering (ICE)	ICE is an institute under the College of Engineering. The complex is composed of the Office and Classroom Wing, Structural Engineering and Construction Engineering Management Laboratories, Water Resources Engineering and Geotechnical Engineering Laboraotries, Environment and Energy Engineering and a Fire Laboratory.	14.6486139000000009	121.065978999999999	institute-of-civil-engineering-(ice)	429	1	ICE is at the corner of Pardo de Tavera and C. P. Garcia.
Executive House	The Executive House is the residence of the UP President.	14.6492558000000006	121.067206999999996	executive-house	430	1	It is located on Maramag, off from Pardo de Tavera.
GT Toyota Asian Center	The University of the Philippines Asian Center (also referred to as UP Asian Center or UP AC) is a degree-granting unit of the University of the Philippines, and is the only unit of the university with a regional area of specialization. The Asian Center offers multidisciplinary graduate programs on Asian Studies and on Philippine Studies.\r\n\r\n-Wikipedia	14.6571236000000003	121.073936000000003	gt-toyota-asian-center	431	1	The GT Toyota Asian Center is located along Magsaysay Ave., beside Romulo Hall.
GT Toyota Asian Center Auditorium	Auditorium located at the GT Toyota Asian Center	14.6570996999999998	121.073997000000006	gt-toyota-asian-center-auditorium	432	2	The Auditorium is located inside the complex, right across from the gate.
College of Engineering Admin Office	The admin office for the College of Engineering	14.6565999999999992	121.069999999999993	college-of-engineering-admin-office	433	2	The admin office is located on the first floor, on the right side of the lobby.
College of Engineering Library I	The College of Engineering library located at Melchor Hall.	14.6565999999999992	121.069999999999993	college-of-engineering-library-i	434	2	The College of Engineering Library is located right across the main entrance of Melchor Hall.
UP Meralco Innovation Hall	A newly built lecture hall for the EEE	14.6495999999999995	121.069000000000003	up-meralco-innovation-hall	435	2	Instead of heading through the first floor entrance with the guard, go up the ramp instead. It will be the first door you see.
ICE 317	ICE Room 317	14.6485996000000007	121.066001999999997	ice-317	436	2	On the 3rd floor of ICE
ICE 318	ICE Room 318	14.6485996000000007	121.066001999999997	ice-318	437	2	On the 3rd floor of ICE
Electrical and Electronics Engineering Institute (EEEI)	The Electrical and Electronics Engineering Institute is part of the College of Engineering. EEEI is highly committed to produce a critical mass of highly-skilled electrical and electronics engineers who are equipped to solve today's technological problems and who would serve as forefronts of the country's push for technological competitiveness. The Institute is organized into 13 research laboratories, each with a specific line of research interest.	14.6496258000000008	121.068641999999997	electrical-and-electronics-engineering-institute-(eeei)	438	1	Located on Velasquez Street. An Ikot or a Toki jeep will pass this building.
Department of Mining, Metallurgical & Materials Engineering (DMMME)	DMMME is part of the College of Engineering, offering undergraduate, Master's, and PhD courses in the fields of Mining Metallurgical and Materials Engineering.	14.6479101000000007	121.068115000000006	department-of-mining,-metallurgical-&-materials-engineering-(dmmme)	439	1	Located off C. P. Garcia and near the Alumni Engineers' Centennial Hall.
UP Health Service	Infirmary located in UP Diliman	14.6596507999999996	121.071060000000003	up-health-service	440	1	The UP Health Service is located along Laurel Ave., beside the Church of the Risen Lord.
Abelardo Hall (ABH) (College of Music)	Abelardo Hall houses the College of Music. The college serves as a catalyst in national development by providing quality and professional instruction in diverse areas of music specialization. Its college administration and faculty are committed to provide a meaningful and personally relevant learning experience of music, as well as to guide students towards academic excellence. 	14.6567001000000001	121.065002000000007	abelardo-hall-(abh)-(college-of-music)	441	1	Abelardo Hall is located along Ylanan Street accros the College of Mass Communication. You can ride any jeepney except ones of the Ikot and Toki routes to get to this building.
PAGASA Observatory	PAGASA Observatory.	14.6516886	121.072379999999995	pagasa-observatory	442	1	Located off Ma. Regidor, it is near the CHE Annex and the Philippine Genome Center.
Epsilon Chi Center	Epsilon Chi Center has a basketball gym, 7-11, Rodic's Diner and SnackShack.	14.6581191999999998	121.067215000000004	epsilon-chi-center	443	1	The Epsilon Chi Center is located between Bahay ng Alumni and Molave Residence Hall.
EEE 425	EEE 425 is the Electricity Market Research Laboratory	14.6495999999999995	121.069000000000003	eee-425	444	2	Located on the 4th floor of EEEi
EEE 426	EEE 426 is the EPRL Faculty Room	14.6495999999999995	121.069000000000003	eee-426	445	2	Located on the 4th floor of EEEi
EEE 427	EEE 427 is the Electrical Power Research Laboratory (EPRL)	14.6495999999999995	121.069000000000003	eee-427	446	2	Located on the 4th floor of EEEi
German Yia Hall (IE and ME Building)	German Yia Hall houses facilities for Industrial Engineering and Mechanical Engineering. This building is currently under construction.	14.6572999999999993	121.070999	german-yia-hall-(ie-and-me-building)	447	1	The German Yia Hall is located along Magsaysay Ave., behind Juinio Hall.
UP Marine Science Institute (MSI)	The UP Marine Science Institute is one of seven academic institutes of the University of the Philippines’ College of Science. MSI was originally established as the Marine Sciences Center (MSC) on 28 March 1974. It is tasked to pursue research, teaching, and extension work in marine biology, marine chemistry, physical oceanography, marine geology, and related disciplines.	14.6505480000000006	121.068848000000003	up-marine-science-institute-(msi)	448	1	Located on Velasquez Street, it is a large building seen before reaching the road that leads into the National Science Complex.
Virata Hall (ISSI - Institute for Small Scale Industries)	UP ISSI conducted several consultancy training courses, seminars, technical studies in the field of medium and small-scale industries with emphasis on Philippine industries\r\n\r\n- UP ISSI Website	14.6564989000000008	121.061829000000003	virata-hall-(issi---institute-for-small-scale-industries)	449	1	Virata Hall is located on Emilio Jacinto Rd, beside the UP School of Labor and Industrial Relations
National Institute of Molecular Biology and Biotechnology (NIMBB)	National Institute of Molecular Biology and Biotechnology.	14.6505832999999992	121.071631999999994	national-institute-of-molecular-biology-and-biotechnology-(nimbb)	450	1	Located in National Science Complex.
College of Science Library (CS Library)	CS Library.	14.6492739000000007	121.069114999999996	college-of-science-library-(cs-library)	451	1	Located in National Science Complex.
Andres Bonifacio Centennial Carilion Tower and Plaza	The Carillon Tower and Plaza, the first in the country, is a 130-foot structure that originally housed 46 bronze bells cast by Van Bergen Bell, Chimes and Carillon Foundry of Holland.\r\n\r\n- UP Diliman Website	14.6565466000000004	121.066497999999996	andres-bonifacio-centennial-carilion-tower-and-plaza	454	1	The Carillion Tower and Plaza is located along Osmeña Ave., between Villamor Hall and the UP Film Institute.
National Science Complex Amphitheater	National Science Complex Amphitheater.	14.6496057999999998	121.071922000000001	national-science-complex-amphitheater	455	1	Located in National Science Complex.
Institute of Environmental Science and Meteorology (IESM)	Institute of Environmental Science and Meteorology.	14.6483450000000008	121.070098999999999	institute-of-environmental-science-and-meteorology-(iesm)	456	1	Located in National Science Complex.
Philippine Genome Center	Philippine Genome Center.	14.6514968999999997	121.071877000000001	philippine-genome-center	457	1	Located in National Science Complex, near PAGASA Observatory and Institute of Biology.
Villamor Hall (University Theater)	This is the venue for gala performances and concerts by local and international artists, as well as by UP’s own talents.\r\n\r\n- UP OICA Webiste	14.6567630999999992	121.066101000000003	villamor-hall-(university-theater)	458	1	Villamor Hall is located along Osmeña Ave., between the UP College of Music and the UP Film Institute.
Washington Sycip Garden of Native Trees 	Located between the University Theater and the UP Film Center and designed by the Office of the Campus Architect, the 4,700-square-meter area is dotted with over 100 different species of young native trees from all over the Philippines.\r\n-UP Diliman Website	14.6570253000000008	121.066649999999996	washington-sycip-garden-of-native-trees-	459	1	The Washington Sycip Garden of Native Trees is located along Magsaysay Ave., beside the UP Film Institute
Albert Hall (Archaeological Studies Program) (ASP)	The main building for the archaeological studies programs	14.6526002999999996	121.063004000000006	albert-hall-(archaeological-studies-program)-(asp)	460	1	Along Lakandula Street, near its intersection with Emilio Jacinto Street.
IChE Parking	Parking lot for faculty that holds up to 10 vehicles.	14.6478634000000003	121.0672	iche-parking	461	4	On the right side of the Institute of Chemical Engineering.
Benitez Hall (College of Education)	The University of the Philippines College of Education is a degree-granting unit within the University of the Philippines Diliman. One of the first academic units established in the University, the College offers baccalaureate, graduate and non-degree programs in the field of teacher education.\r\n\r\nThe College of Education is housed by the Benitez Hall along the Academic Oval of the Diliman campus.\r\n- http://iskwiki.upd.edu.ph/index.php/UP_College_of_Education#.XACYuGgzZPY	14.6536378999999997	121.072151000000005	benitez-hall-(college-of-education)	462	1	Along Roxas Ave. Just before the Katipunan Jeepney stop, overlooking the Sunken Garden
UP Integrated School — K-2 Building (UPIS)	The UP Integrated School (est. 1976) is the laboratory school of the UP College of Education. It offers an integrated curriculum from Kindergarten to Grade 12. It is one of the country's pioneer integrated schools and has been offering an integrated curriculum from Kindergarten to Grade 10 since its inception until the mandatory implementation of the Department of Education's K-12 program in 2012.\r\n\r\nThis building is houses the kindergarden section of UPIS	14.6524000000000001	121.072556000000006	up-integrated-school-—-k-2-building-(upis)	463	1	Along the road-blocked part of Quirino Ave.
Accounting Budget and Cash Office Building	The Cash Office is where most payments to the university are made.	14.6600999999999999	121.069999999999993	accounting-budget-and-cash-office-building	464	1	The Cash Office is located on Apacible St., across from Balay Atleta
Palma Hall Parking Lot	Parking lot for CSSP faculty and staff, but also open to the public	14.6540680000000005	121.069771000000003	palma-hall-parking-lot	465	4	in front of Palma Hall steps
Institute of Biology (IB)	Institute of Biology.	14.6504002	121.070999	institute-of-biology-(ib)	466	1	Located in National Science Complex.
Ang Bahay ng Alumni	Ang Bahay ng Alumni is one of the convention facilities in UP Diliman.	14.6578111999999994	121.066581999999997	ang-bahay-ng-alumni	467	1	It is located along Magsaysay Ave., between Fonacier Hall and Molave Residence Hall.
Ang Bahay ng Alumni Parking Area	Parking space for Bahay ng Alumni	14.6579484999999998	121.066306999999995	ang-bahay-ng-alumni-parking-area	468	4	This parking is located on the left side facing the building, behind Fonacier Hall.
Ilang-ilang Residence Hall	Ilang-ilang Residence Hall	14.6593169999999997	121.072959999999995	ilang-ilang-residence-hall	469	1	At the corner of F. Ma. Guerrero and Laurel Avenue.
DMST - Vanguard 203	Classroom in Vanguard Hall	14.6588001000000006	121.064003	dmst---vanguard-203	887	2	On the second floor of Vanguard building
UP Biology - EDC BINHI (Threatened Species Arboretum)	Geothermal leader Energy Development Corporation (EDC) has established an arboretum of threatened native species at the UP Institute of Biology (UPIB) in Diliman, Quezon City.  The arboretum is a component of EDC’s BINHI Tree for the Future project which aims to save and propagate high-value but fast-dwindling Philippine trees such as yakal, tindalo, kamagong, mangkono and ipil.\r\n-https://www.energy.com.ph/edc-establishes-threatened-species-arboretum-in-up/	14.6523438000000006	121.069725000000005	up-biology---edc-binhi-(threatened-species-arboretum)	470	1	There is one entrance along Quirino Ave., another along Velazquez Ave. and another inside the Institute of Biology. See red dotted trail on map.
Institute of Biology (IB) Comfort Rooms	Comfort rooms found in the Institute of Biology	14.6507997999999997	121.070999	institute-of-biology-(ib)-comfort-rooms	471	5	from the A. Ma. Regidor entrance, head left for male cr or right for female cr.
School of Economics (SE) Library 	The library for the UP School of Economics	14.6559000000000008	121.073997000000006	school-of-economics-(se)-library-	472	2	on the 2nd and 3rd floor of the Northern Building.
Diosdado P Macapagal Hall	Lecture Hall in the UP School of Economics	14.6559000000000008	121.073997000000006	diosdado-p-macapagal-hall	473	2	Turn left from the entrance of the Northern Building
Benitez Hall Comfort Rooms	Comfort rooms of the College of Education	14.653511	121.072449000000006	benitez-hall-comfort-rooms	474	5	From the main entrance turn left for males or right for females. CRs are by the stairs.
School of Economics (SE) Comfort Rooms	Comforts Rooms in the UP School of Economics	14.6560001	121.073997000000006	school-of-economics-(se)-comfort-rooms	475	5	Quick left from the entrance of the Eastern building
Benitez 105	Room 105 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-105	476	2	Located on the first floor of Benitez Hall
Benitez 108	Room 108 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-108	477	2	Located on the 1st floor of Benitez Hall
Benitez 109	Room 108 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-109	478	2	Located on the 1st floor of Benitez Hall
Benitez 110	Room 110 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-110	479	2	Located on the 1st floor of Benitez Hall
Benitez 203	Room 203 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-203	482	2	Located on the 2nd floor of Benitez Hall
Benitez 205	Room 205 of Benitez Hall. Split into two parts A and B	14.6535996999999991	121.071999000000005	benitez-205	483	2	Located on the 2nd floor of Benitez Hall
Benitez 206	Room 206 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-206	484	2	Located on the 2nd floor of Benitez Hall
Benitez 212	Room 212 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-212	485	2	Located on the 2nd floor of Benitez Hall
Benitez 304	Room 304 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-304	486	2	Located on the 3rd floor of Benitez Hall
Benitez 312	Room 312 of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-312	487	2	Located on the 3rd floor of Benitez Hall
Benitez Hall Education Library	Official Library of the College of Eduction	14.6535996999999991	121.071999000000005	benitez-hall-education-library	488	2	Located on the 3rd floor of Benitez Hall
Child Development Center (CDC)	Building behind Alonso Hall (CHE)	14.6521434999999993	121.073761000000005	child-development-center-(cdc)	489	1	It's behind Alonso Hall
College of Home Economics (CHE) Comfort Rooms	Comfort rooms for the CHE	14.6520100000000006	121.073425	college-of-home-economics-(che)-comfort-rooms	490	5	From the entrance, head left into the back most corner of the building 1st floor. Both male and female crs are there.
College of Home Economics (CHE) Library	Library for CHE	14.6517610999999999	121.072929000000002	college-of-home-economics-(che)-library	491	1	Beside Alonso Hall is a narrow walkway leading the the CHE Annex Library
EEEI VLC	very large classroom lecture hall for EEE	14.6495999999999995	121.069000000000003	eeei-vlc	492	2	From the 1st floor entrance with the guard, it will be the nearest door to the right.
EEEI LC1	Large Classroom 1 of EEE	14.6495999999999995	121.069000000000003	eeei-lc1	493	2	From the 1st floor entrance with the guard, immediately turn right and head down a narrow hallway
EEEI LC2	Large Classroom 2of EEE	14.6495999999999995	121.069000000000003	eeei-lc2	494	2	From the 1st floor entrance with the guard, head as far back as you can. Then, turn right and head down a narrow hallway.
Virata School of Business Comfort Rooms	Comfort Rooms for the Virata School of Business	14.6554718000000008	121.073752999999996	virata-school-of-business-comfort-rooms	495	5	From the entrance, head to the far back left corner for females or the far back right corner for males
NIMBB Cafeteria	Cafeteria for MBB	14.6506995999999994	121.070999	nimbb-cafeteria	496	3	From the entrance head down hallway at the left.
NIMBB Library	Library for MBB	14.6507997999999997	121.071999000000005	nimbb-library	497	1	From the entrance, take right turn and it will be the first door you'll see.
NIMBB Comfort Rooms	Library for MBB	14.6506995999999994	121.071845999999994	nimbb-comfort-rooms	498	5	From the entrance, take right turn and head down to the very end of the hallway. It will be to the right near a water fountain. Alternatively, there is another CR at the MBB cafeteria.
Math Building Comfort Rooms	Comfort Rooms scattered around the math building and annex.	14.6485661999999994	121.071753999999999	math-building-comfort-rooms	499	5	One can be found on every floor at the bridge that connects the main building with the annex. \r\nOne can be found on every floor near stairs beside the cafeteria entrance.\r\nOne can be found on the top floor of MBAN between the two lecture halls
DZUP Tower	broadcasting tower for the DZUP station	14.6509733000000004	121.064025999999998	dzup-tower	500	1	The DZUP Tower is located in the corner of Village B and Delos Reyes St.
CSWCD Parking Area	CSWCD Parking Area	14.6574764000000002	121.063559999999995	cswcd-parking-area	501	4	Parking area in front of the CSWCD Building
College of Home Economics (CHE) Museum	Museum behind Alonso Hall (CHE)	14.6524000000000001	121.073997000000006	college-of-home-economics-(che)-museum	502	1	Behind Alonso Hall
VSB 104 Cesar E.A. Virata Lecture Room	Main lecture room for the Virata School Of Business. It can hold around 100 people.	14.6553000999999998	121.072997999999998	vsb-104-cesar-e-a--virata-lecture-room	503	2	From the entrance, immediately turn right, past the elevator. It will be the first door you'll see.
Aldaba Hall	Recital hall at the back of the University Theater (Villamor Hall).  It was named in the honor of Dalisay J. Aldaba, who was renowned worldwide as an opera singer.\r\n- OICA Website	14.6571932	121.066276999999999	aldaba-hall	504	1	Aldaba Hall is located behind the University Theater.
Kamagong Residence Hall	Kamagong Residence Hall is a dormitory for graduate students in UP Diliman.	14.6484460999999992	121.062674999999999	kamagong-residence-hall	505	1	Kamagong is located along Emilio Jacinto, beside the Centennial Dormitory.
Post Office (PHLPOST)	PHLPOST UP Diliman branch	14.6595420999999995	121.068466000000001	post-office-(phlpost)	506	1	The Post Office is located along Roces St., near Area 2.
Sentro ng Wikang Filipino	The SWF is a language academy, research center, and university-based publishing house in UP Diliman\r\n-Wikipedia	14.6571999000000002	121.063004000000006	sentro-ng-wikang-filipino	507	2	The SWF is located on the third floor of the SURP building
Temporary Shopping Center	The Shopping Center has temorarily relocated and some of its stores including UP Maroons has set up shop here.	14.6599236000000008	121.069182999999995	temporary-shopping-center	508	1	The temporary location is located at the tennis court behind the original shopping center.
Office of the Vice Chancellor for Academic Affairs	The Office of the Vice Chancellor for Academic Affairs (OVCAA) assists the Chancellor in coordinating curricular, instructional, extension, library and other academic programs in U.P. Diliman.\r\n- OVCAA Website	14.6574001000000003	121.069999999999993	office-of-the-vice-chancellor-for-academic-affairs	509	2	OVCAA is located in Rm. 203, 2nd Floor, DILC Building.
Office of International Linkages in Diliman (OIL)	The Office of International Linkages in Diliman aims to engage the UP Diliman Community in internationalization goals through collaborative activities with institutions abroad.\r\n_ OIL Website	14.6574001000000003	121.069999999999993	office-of-international-linkages-in-diliman-(oil)	510	2	OIL is located in Rm. 102 in the DILC Bldg.
General Education Center (GEC)	The GEC supports the administration in monitoring and evaluating GE programs.\r\n_ UP Diliman Website	14.6574001000000003	121.069999999999993	general-education-center-(gec)	511	2	The GEC is located in the DILC Bldg.
National Service Training Program (NSTP)	The NSTP is a program aimed at enhancing civic consciousness and defense preparedness in the youth by developing the ethics of service and patriotism while undergoing training in any of its program components.\r\n- NSTP Website	14.6574001000000003	121.069999999999993	national-service-training-program-(nstp)	512	2	The NSTP Office is located on the 4th floor of the DILC Bldg.
Vinzons Hall Comfort Rooms	Female and male comfort rooms in Vinzons Hall.	14.6541823999999998	121.073600999999996	vinzons-hall-comfort-rooms	539	5	Located on the first floor, past the Food Service. On the left side is a narrow passage that leads to the comfort rooms.
Office of Field Activities (OFA)	The OFA's main task is to ensure the safe and relevant implementation of short-term and long-term local academic field activities (AFA) by the University. The main role of OFA Diliman is to ensure that the University’s policies on academic field activities are properly operationalized.\r\n- OFA Website	14.6574001000000003	121.069999999999993	office-of-field-activities-(ofa)	513	2	The OFA is located on the 4th floor of the DILC Bldg.
University Food Service	The University Food Service (UFS) provides food that is acceptable, nutritious, safe, wholesome and reasonably priced to its University clientele of students, faculty and administrative personnel. It is managed by professional dietitians and nutritionists.\r\n- UFS entry in iskWiki	14.6540823000000007	121.073532	university-food-service	514	3	The University Food service is located on the 1st floor of Vinzons Hall which is across the Sunken Garden.
Office of the Chief Security Officer	Office of the Chief Security Officer	14.6571999000000002	121.061995999999994	office-of-the-chief-security-officer	515	2	The Office of the Chief Security Officer is located in Rm. 109 of Bonifacio Hall (UP SOLAIR).
University Computer Center (UCC)	The role of the Center continues to change through the years in response to the various changes in the computing and information technology landscape. Originally, being the sole computing facility in the University, the Center performed many data processing functions which are now possible with a desktop computer. Nowadays, the Center has focused primarily in providing the infrastructure to interconnect computing facilities.\r\n- UCC Website	14.6573563	121.070160000000001	university-computer-center-(ucc)	516	1	The UCC is located along Magsaysay Ave., beside the Diliman Interactive Learning Center.
Utilities Management Team (UMT)	Utilities Management Team Office	14.6574001000000003	121.069999999999993	utilities-management-team-(umt)	517	2	The UMT Office is located in the University Computer Center, along Magsaysay Ave.
Magdangal	This  sculpture, deemed “Oble’s muse” and being jokingly referred to, around campus, as “Jolina” (referring to the actress of the same last name), is a work of National Artist and Father of Modern Sculptures, Napolean V. Abueva.\r\n-artinup.wordpress.com	14.6529893999999992	121.067359999999994	magdangal	518	6	The Magdangal statue is located in front of the CAL Building.
Balay Kalinaw (Ikeda Hall)	A performance and event venue	14.6599368999999999	121.072875999999994	balay-kalinaw-(ikeda-hall)	519	1	Take the usual ikot jeep route, and drop off near Ilang-ilang residence hall. Balay Kalinaw is right beside it.
ICE 312	Maria J Jardiolin Room	14.6485996000000007	121.066001999999997	ice-312	520	2	On the 3rd floor of ICE
Commission on Human Rights (CHR) Office 	contact them at: http://chr.gov.ph/contact-chr/	14.6573858000000001	121.060471000000007	commission-on-human-rights-(chr)-office-	521	1	From the Toki stop near UP Gymnasium, head through Magsaysay Ave. towards the archery range direction. It will be located at the near end of the street.
University Gymnasium (Ylanan Hall) (College of Human Kinetics) (CHK)	Read more about CHK in: http://chk.upd.edu.ph/p/about-chk.html	14.6591948999999993	121.062827999999996	university-gymnasium-(ylanan-hall)-(college-of-human-kinetics)-(chk)	522	1	Can be accessed from Commonwealth Ave. via bridge. Ikot and Toki jeeps also have a stop nearby, along where Magsaysay Ave. intersects Emilio Jacinto Ave. Look for a playground.
Gym Annex Basketball Court	Read more about CHK in: http://chk.upd.edu.ph/p/about-chk.html	14.6591948999999993	121.062827999999996	gym-annex-basketball-court	523	1	Behind the main CHK Gymnasium
NIGS Library	Library for NIGS	14.6479997999999991	121.069000000000003	nigs-library	524	2	From the NIGS entrance turn right. It will be the first room you'll see
University Hotel	Located at the intersection of Guerrero and Aglipay Streets, the University Hotel (UH) is the most popular lodging venue in UP Diliman. Formerly known as PCED (Philippine Center for Economic Development) Hostel, renamed University Hotel on August 13, 2001 by the Board of Overseers (BOO). The BOO supervises the operations of the establishment. -https://upd.edu.ph/accommodations-in-up-diliman/	14.6611261000000006	121.072890999999998	university-hotel	525	1	Go along F. Ma. Guerrero Ave. K. It is at the end of that street, past Balay Kalinaw, and Ilang-ilang residence hall
ICE 409	ICE Room 409 is the UP Aces Lecture Room	14.6485996000000007	121.066001999999997	ice-409	526	2	On the 4th floor of ICE
College of Law - Law Forum	Law Forum, used by College of Law	14.6569996000000007	121.071999000000005	college-of-law---law-forum	527	1	The Law Forum is located near Malcolm Hall
AECH Accenture Hall	Accenture Lecture Hall in UP Alumni Engineers' Centennial Hall (AECH).	14.6488999999999994	121.069000000000003	aech-accenture-hall	528	2	From the entrance, take the stairs on the left side to the second floor.
IB Auditorium	Auditorium in Institute of Biology.	14.6504002	121.070999	ib-auditorium	529	2	From the entrance next to the parking lot, climb the stairs to the second floor.
UP Biology - EDC Binhi Threatened Species Arboretum	Arboretum containing native trees	14.6507167999999997	121.070342999999994	up-biology---edc-binhi-threatened-species-arboretum	530	6	Entrance located behind the Institute of Biology building.
IB Library	Library of the Institute of Biology. A small room.	14.6504002	121.070999	ib-library	531	2	Located on the second floor of the Institute of Biology.
IB Cafeteria	Cafeteria in Institute of Biology. Can easily seat 40 people, more if more chairs are brought in.	14.6505069999999993	121.070671000000004	ib-cafeteria	532	3	Located on the second floor of IB, above the entrance near the parking lot.
DMMME Comfort Rooms	Male and female comfort rooms in the Department of Mining, Metallurgical and Materials Engineering.	14.6479292000000001	121.068054000000004	dmmme-comfort-rooms	533	5	The comfort rooms are located next to the stairs on every floor. You can reach them by going past the guard's station at the entrance, turning right, then left at the corner.
ICE Comfort Rooms	Female and male comfort rooms in the Institute of Chemical Engineering building.	14.6487426999999997	121.066032000000007	ice-comfort-rooms	534	5	They are located next to the stairs on each floor. From the entrance, turn right and you should see them on the left side of the corridor.
UP Veterinary Teaching Hospital	UP Veterinary Teaching Hospital	14.6521205999999999	121.061110999999997	up-veterinary-teaching-hospital	535	1	Located behind College of Fine Arts, off Emilio Jacinto St.
IC Cafeteria	Cafeteria in Institute of Chemistry Teaching Building.	14.6504010999999998	121.072700999999995	ic-cafeteria	536	3	On the first floor of ICT, at the far end of the building from the entrance.
Institute of Chemistry Research Building (ICR)	Research building of IC.	14.6506720000000001	121.072754000000003	institute-of-chemistry-research-building-(icr)	537	1	Located in National Science Complex, across from Institute of Chemistry Teaching Building.
IC Parking Strip	Parking Strip behind Institute of Chemistry.	14.6512279999999997	121.073623999999995	ic-parking-strip	538	4	Located behind Institute of Chemistry Research Building, near PAGASA Observatory.
Virata School of Business Parking Lot	Parking lot next to Virata School of Business, can hold around 30 vehicles.	14.6548748	121.073288000000005	virata-school-of-business-parking-lot	540	4	Located off the Academic Oval, on the right side of Virata School of Business.
Department of Computer Science Comfort Rooms	Comfort Rooms in the UP Alumni Engineers Centennial Hall	14.6487408000000006	121.068259999999995	department-of-computer-science-comfort-rooms	541	5	From the entrance, head to the very right past the stairs. Comfort rooms are located in every floor.
Main Library Parking Lots	Two parking lots located on either side of Gonzales Hall. They can hold at most 15 vehicles each.	14.6543875000000003	121.071044999999998	main-library-parking-lots	542	4	Located off the Academic Oval, next to Gonzales Hall.
UP Main Library - Social Sciences and Philosophy Library	Social Sciences and Philosophy Library in Gonzales Hall.	14.6550998999999997	121.070999	up-main-library---social-sciences-and-philosophy-library	543	2	From the entrance, turn right.
UP Main Library - Filipiniana Books Section	Library section containing the Filipiniana books and a reading area.	14.6550998999999997	121.070999	up-main-library---filipiniana-books-section	544	2	Located in the basement of Gonzales Hall, turn left from the entrance and take the stairs down.
Lagmay Hall Comfort Rooms	Comfort rooms in Palma Hall Annex	14.6534709999999997	121.071098000000006	lagmay-hall-comfort-rooms	545	5	From the front entrance, move past the lobby and turn right. The comfort rooms will be on the left side.
Lagmay Hall Library (Mandala Room)	Library in Lagmay Hall	14.6535996999999991	121.070999	lagmay-hall-library-(mandala-room)	546	2	On the third floor of the main building, in Room 305.
Office of the University Registrar Parking Lot	Faculty and visitors parking lot next to OUR.	14.6513223999999997	121.066612000000006	office-of-the-university-registrar-parking-lot	547	4	On Pardo de Tavera, next to the Office of the University Registrar.
Centennial Residence Hall Parking Lot	Parking lot that can hold up to 30 vehicles	14.6479864000000006	121.062149000000005	centennial-residence-hall-parking-lot	548	4	Located on Emilio Jacinto St., opposite Centennial Residence Hall.
Asian Institute of Tourism	Closed to entry.	14.6600342000000001	121.061126999999999	asian-institute-of-tourism	549	1	Located on the Circle-bound side of Commonwealth Ave.
DMMME Parking Lot	Parking lot that holds up to 30 vehicles	14.6476526000000007	121.067879000000005	dmmme-parking-lot	550	4	In front of the Department of Mining, Metallurgical, Materials Engineering.
IChE Comfort Rooms	Comfort rooms in Institute of Chemical Engineering.	14.6480187999999991	121.067183999999997	iche-comfort-rooms	551	5	Located next to the stairs on every floor. Turn right from the entrance and go down the hallway.
Institute of Chemical Engineering (IChE)	The Institute of Chemical Engineering is part of the College of Engineering.	14.6480999000000001	121.067001000000005	institute-of-chemical-engineering-(iche)	552	1	Located off C. P. Garcia, next to the Institute of Civil Engineering.
Environmental and Energy Engineering Program Building	Part of the Civil Engineering Complex, not in use.	14.6493225000000002	121.065865000000002	environmental-and-energy-engineering-program-building	553	1	On Pardo de Tavera, near the PAUW Child Care.Center.
Three Women Sewing the First Filipino Flag	Sculpture by Napoleon Abueva.	14.6549530000000008	121.066283999999996	three-women-sewing-the-first-filipino-flag	554	6	Located near the Lagoon, some distance behind Quezon Hall.
Untitled by Abdulmari Imao	A sculpture by Abdulmari Imao.	14.6535920999999991	121.066497999999996	untitled-by-abdulmari-imao	555	6	Located beside Vargas Museum, on the Academic Oval.
CSWCD Comfort Room	All gender comfort room for the UP College of Social Work and Communities Development	14.6570996999999998	121.063004000000006	cswcd-comfort-room	556	5	Enter the right most entrance with a visible elevator. Its to the right of the elevator.
IB Museum Public Exhibit Area	Museum in Institute of Biology.	14.6504002	121.070999	ib-museum-public-exhibit-area	557	2	From the entrance next to the parking lot, turn left.
UP Integrated School — 3-10 Building (UPIS)	UPIS grade school, run by College of Education.	14.6527004000000005	121.072997999999998	up-integrated-school-—-3-10-building-(upis)	558	1	Located at the corner of A. Ma. Regidor and Quirino Avenue.
GT Toyota Asian Center - Cafe Via Mare	Restaurant at GT Toyota Asian Center	14.6571435999999995	121.073784000000003	gt-toyota-asian-center---cafe-via-mare	559	3	On Magsaysay Avenue, past the Magsaysay Portal.
Rizal Statue	by Domingo Celis.	14.6533002999999997	121.070144999999997	rizal-statue	560	6	Located at the AS pond, from the main entrance, pass through the doorway on the far left to the AS Walk and head straight.
Spirit of Business	The Spirit of Business (Napoleon Abueva), as its title implies can be found in front of the College of Business Administration. Made of metal and done in 1979, the forward thrust of the spear-like elements is symbolic of how it propels us towards progress and development. At some point in the sculpture’s history, there was supposedly a mechanism that made parts of it rotate to further emphasize the drive towards growth and dynamism. - SculpTour	14.6551408999999992	121.073204000000004	spirit-of-business	561	6	On Academic Oval, in front of Virata School of Business Administration.
University Seal	The University Seal (Napoleon Abueva) is the welcoming icon at the entrance of the U.P. Main Library.  It rests in the middle of a white curvilinear grillwork that is reminiscent of organic shapes and somehow echoes the widespread wings of the copper-colored eagle.  The symbolic bird is perched atop a green shield that features emblems representing University ideals and Philippine icons. - SculpTour	14.6550808000000004	121.070946000000006	university-seal	562	6	Located above the entrance to the Main Library.
AECH Comfort Rooms	Comfort rooms in Alumni Engineers' Centennial Hall	14.6488037000000002	121.068550000000002	aech-comfort-rooms	563	5	The comfort rooms are located on the right side of the building from the entrance.
Cry of Balintawak by Ramon Martinez	Ala-ala ng Bayang Filipino sa mga Bayani ng ‘96 is a concrete polychromed statue done by Ramon Martinez between 1905 and 1911.  It was inaugurated in Balintawak on 3 September 1911 but was relocated to the U.P. Vinzons Hall in 29 November 1968 to give way to the construction of the North Luzon Expressway.  While often associated with Andres Bonifacio, it actually represents a nameless Katipunero. The statue is also popularly linked with the “Cry of Balintawak” because of its depiction of a katipunero’s battlecry.  Aptly located outside Vinzons Hall, the campus student center, it is a constant reminder of the brand of activism and nationalism that U.P. stands for. - SculpTour	14.6542931000000003	121.073204000000004	cry-of-balintawak-by-ramon-martinez	564	6	The statue is located in front of Vinzons Hall.
EEE 302	EEE 302 is the Electronics Prototyping Laboratory (EPL)	14.6495999999999995	121.069000000000003	eee-302	601	2	Located on the 3rd floor of EEEi
EEE 303	EEE 303 is the Instruments Room	14.6495999999999995	121.069000000000003	eee-303	602	2	Located on the 3rd floor of EEEi
EEE 305	EEE 305 is the Alexan Laboratory (ALab)	14.6495999999999995	121.069000000000003	eee-305	603	2	Located on the 3rd floor of EEEi
Sundial	After the destruction of the sundial in the front lawn of Melchor Hall, in 1972 the UP Alumni Engineers started the construction of the present-day sundial. It is located in G. Apacible St., now at the center of the engineering complex. It was Chato Calderon (CE’72) who was the supervising engineer. Following in the footsteps of her father, Quintin A. Calderon (CE’36) who was UPAE president 1970-1972, she was the first lady president of the UPAE.\r\n\r\nThe current sundial has a design similar to the one destroyed by Typhoon Yoling. At the base of its gnomon is the year 1947, which signifies the founding year of the UP Alumni Engineers. This shows how closely related the sundial is to the college of engineering as well as the great importance that the alumni of the college have given it. -iskWiki	14.6570797000000006	121.070487999999997	sundial	565	6	Behind DILC, along G. Apacible St.
Office of Extension Coordination	The Office of Extension Coordination (OEC) handles the international affairs of the University of the Philippines Diliman, as well as, its linkages to local institutions and government agencies.	14.6527995999999998	121.058998000000003	office-of-extension-coordination	566	2	Inside PHIVOLCS building
Philippine Institute of Volcanology and Seismology	The Philippine Institute of Volcanology and Seismology (PHIVOLCS) is a service institute of the Department of Science and Technology (DOST) that is principally mandated to mitigate disasters that may arise from volcanic eruptions, earthquakes, tsunami and other related geotectonic phenomena. - phivolcs.dost.gov.ph	14.6527995999999998	121.058998000000003	philippine-institute-of-volcanology-and-seismology	567	1	From University Avenue, turn onto C.P. Garcia. An outbound Philcoa jeep will pass by the PHIVOLCS building as well.
Oblation by Guillermo Tolentino	The iconic symbol of the University of the Philippines, the Oblation is commonly associated with freedom and its various aspects.  Guillermo Tolentino however, inspired by the second stanza of Jose Rizal’s Mi Ultimo Adios, envisioned this monument with its nakedness and outstretched arms to exemplify the virtue of sacrifice in the name of country, thus the term.  Its base is an assembly of river stones to symbolize the archipelagic nature of the Philippines, and the kataka-taka leaves that grazes its legs and which is endemic to the country signifies the Filipino people.  The Oblation is an excellent portrayal of the classical ideals dignity, balance and restraint as demonstrated in its stance and proportions.\r\n\r\nMeasuring almost 5 meters tall, this statue was unveiled in 1935 by the first Filipino U.P. President, Rafael Palma.  In 1949, it was transferred from its original location in U.P. Manila to the Diliman campus escorted by a huge motorcade composed of students, faculty and staff. - SculpTour	14.6549090999999994	121.064887999999996	oblation-by-guillermo-tolentino	568	6	Take any jeep to either the University Press stop or the College of Music stop, then walk into the Academic Oval to Quezon Hall.
ICE 311	Agustias J Bello Room	14.6485996000000007	121.066001999999997	ice-311	569	2	On the 3rd floor of ICE
ICE 319	ICE Room 319 is the Faculty Room	14.6485996000000007	121.066001999999997	ice-319	570	2	On the 3rd floor of ICE
ICE 408-B	ICE Room 408-b is the Holcim Lecture Hall	14.6485996000000007	121.066001999999997	ice-408-b	571	2	On the 4th floor of ICE
DMMME Disini Lecture Room	Lecture Room for DMMME	14.6478996000000006	121.068000999999995	dmmme-disini-lecture-room	572	2	Located on the 3rd floor of DMMME Building
ICE 410	Room 410 of ICE	14.6485996000000007	121.066001999999997	ice-410	573	2	Located on the 4th floor of ICE
ICE 411	Room 411 of ICE is the AMH Philippines, Inc. Lecture Room	14.6485996000000007	121.066001999999997	ice-411	574	2	Located on the 4th floor of ICE
ICE 412	Room 412 of ICE, is a lecture room	14.6485996000000007	121.066001999999997	ice-412	575	2	Located on the 4th floor of ICE
DMMME Dr. Perfecto Guerrero Lecture Room	Lecture Room for DMMME	14.6478996000000006	121.068000999999995	dmmme-dr--perfecto-guerrero-lecture-room	576	2	Located on the 3rd floor of DMMME Building
DMMME Roman B. Ramos Lecture Room	Lecture Room for DMMME	14.6478996000000006	121.068000999999995	dmmme-roman-b--ramos-lecture-room	577	2	Located on the 3rd floor of DMMME Building
DMMME Ernesto A. Villaluna, Sr. Lecture Room	Lecture Room for DMMME; also Room 305	14.6478996000000006	121.068000999999995	dmmme-ernesto-a--villaluna,-sr--lecture-room	578	2	Located on the 3rd floor of DMMME Building
EEE 123	EEE 123 is a lecture hall	14.6495999999999995	121.069000000000003	eee-123	579	2	Located on the 1st floor of EEEi
EEE 124	EEE 124 is an Astec Research Laboratory	14.6495999999999995	121.069000000000003	eee-124	580	2	Located on the 1st floor of EEEi
EEE 125	EEE 125 is the PEL Faculty Room	14.6495999999999995	121.069000000000003	eee-125	581	2	Located on the 1st floor of EEEi
EEE 126	EEE 126 is the Motor Drives Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-126	582	2	Located on the 1st floor of EEEi
EEE 129	EEE 129 is the Fabrication Laboratory	14.6495999999999995	121.069000000000003	eee-129	583	2	Located on the 1st floor of EEE
EEE 127	EEE 127 is the Electric Machines Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-127	584	2	Located on the 1st floor of EEEi
EEE 201	EEE 201 is a room in EEEi	14.6495999999999995	121.069000000000003	eee-201	585	2	Located on the 2nd floor of EEE
EEE 202	EEE 202 is a room in EEEi	14.6495999999999995	121.069000000000003	eee-202	586	2	Located on the 2nd floor of EEE
EEE 203	EEE 203 is a room in EEEi	14.6495999999999995	121.069000000000003	eee-203	587	2	Located on the 2nd floor of EEE
EEE 204	EEE 203 is a Samsung Doored Room	14.6495999999999995	121.069000000000003	eee-204	588	2	Located on the 2nd floor of EEE
EEE 205	EEE 205 is the Communications Electronics and Embedded Systems Laboratory (CEESL)	14.6495999999999995	121.069000000000003	eee-205	589	2	Located on the 2nd floor of EEE
EEE 206	EEE 206 is the room in EEEi	14.6495999999999995	121.069000000000003	eee-206	590	2	Located on the 2nd floor of EEEi
EEE 207	EEE 207 is the Computer Networks Laboratory (CNL)	14.6495999999999995	121.069000000000003	eee-207	591	2	Located on the 2nd floor of EEEi
EEE 208	EEE 208 is the Ubiquitous Computing Lab	14.6495999999999995	121.069000000000003	eee-208	592	2	Located on the 2nd floor of EEEi
EEE 209	EEE 209 is the CNL Faculty Room	14.6495999999999995	121.069000000000003	eee-209	593	2	Located on the 2nd floor of EEEi
EEE 210	EEE 210 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-210	594	2	Located on the 2nd floor of EEEi
EEE 220	EEE 220 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-220	595	2	Located on the 2nd floor of EEEi
EEE 225	EEE 225 is a Faculty Reading Room	14.6495999999999995	121.069000000000003	eee-225	596	2	Located on the 2nd floor of EEEi
EEE 227	EEE 227 is the UP-NOKIA Telecommunications Engineering Laboratory	14.6495999999999995	121.069000000000003	eee-227	597	2	Located on the 2nd floor of EEEi
EEE 228	EEE 228 is the PEL Instructional	14.6495999999999995	121.069000000000003	eee-228	598	2	Located on the 2nd floor of EEEi
EEE 229	EEE 229 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-229	599	2	Located on the 2nd floor of EEEi
EEE 301	EEE 301 is the Basic Electronics Laboratory (BELab)	14.6495999999999995	121.069000000000003	eee-301	600	2	Located on the 3rd floor of EEEi
EEE 304	EEE 304 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-304	604	2	Located on the 3rd floor of EEEi
EEE 307	EEE 307 is the Lecture Room II	14.6495999999999995	121.069000000000003	eee-307	605	2	Located on the 3rd floor of EEEi
EEE 308	EEE 308 is the SAL Training Center (STC)	14.6495999999999995	121.069000000000003	eee-308	606	2	Located on the 3rd floor of EEEi
EEE 309	EEE 309 is the Instrumentation Robotics and Control Laboratory (IRC)	14.6495999999999995	121.069000000000003	eee-309	607	2	Located on the 3rd floor of EEEi
EEE 310	EEE 310 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-310	608	2	Located on the 3rd floor of EEEi
EEE 320	EEE 320 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-320	609	2	Located on the 3rd floor of EEEi
EEE 321	EEE 321 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-321	610	2	Located on the 3rd floor of EEEi
EEE 322	EEE 322 is a Graduate Students Room in EEEi	14.6495999999999995	121.069000000000003	eee-322	611	2	Located on the 3rd floor of EEEi
EEE 323	EEE 323 is the RAL Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-323	612	2	Located on the 3rd floor of EEEi
EEE 324	EEE 324 is the RAL Research Laboratory	14.6495999999999995	121.069000000000003	eee-324	613	2	Located on the 3rd floor of EEEi
EEE 325	EEE 325 is the RAL Faculty Room	14.6495999999999995	121.069000000000003	eee-325	614	2	Located on the 3rd floor of EEEi
EEE 326	EEE 326 is the PSSL Faculty Room	14.6495999999999995	121.069000000000003	eee-326	615	2	Located on the 3rd floor of EEEi
EEE 327	EEE 327 is the PSSL Research Laboratory	14.6495999999999995	121.069000000000003	eee-327	616	2	Located on the 3rd floor of EEEi
EEE 329	EEE 329 is the PSSL Instructional Laboratory	14.6495999999999995	121.069000000000003	eee-329	617	2	Located on the 3rd floor of EEEi
EEE 401	EEE 401 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-401	618	2	Located on the 4th floor of EEEi
EEE 402	EEE 402 is the WCEL Faculty Room	14.6495999999999995	121.069000000000003	eee-402	619	2	Located on the 4th floor of EEEi
EEE 403	EEE 403 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-403	620	2	Located on the 4th floor of EEEi
EEE 404	EEE 404 is the Wireless Communications Engineering Laboratory (WCEL)	14.6495999999999995	121.069000000000003	eee-404	621	2	Located on the 4th floor of EEEi
EEE 405	EEE 405 is the Microlab/IML Research Office	14.6495999999999995	121.069000000000003	eee-405	622	2	Located on the 4th floor of EEEi
EEE 406	EEE 406 is a Room in EEEi	14.6495999999999995	121.069000000000003	eee-406	623	2	Located on the 4th floor of EEEi
EEE 407	EEE 407 is the Microelectronics and Microprocessors Laboratory (MICROLAB)	14.6495999999999995	121.069000000000003	eee-407	624	2	Located on the 4th floor of EEEi
EEE 408	EEE 408 is the Texas Instruments Elite Laboratory (TIEL)	14.6495999999999995	121.069000000000003	eee-408	625	2	Located on the 4th floor of EEEi
EEE 409	EEE 409 is the a Room in EEEi	14.6495999999999995	121.069000000000003	eee-409	626	2	Located on the 4th floor of EEEi
EEE 410	EEE 410 is the Digital Signal Processing Laboratory (DSP)	14.6495999999999995	121.069000000000003	eee-410	627	2	Located on the 4th floor of EEEi
EEE 412	EEE 412 is the DSP/TIEL Faculty Room	14.6495999999999995	121.069000000000003	eee-412	628	2	Located on the 4th floor of EEEi
EEE 420	EEE 420 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-420	629	2	Located on the 4th floor of EEEi
EEE 421	EEE 421 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-421	630	2	Located on the 4th floor of EEEi
EEE 422	EEE 422 is a Lecture Room in EEEi	14.6495999999999995	121.069000000000003	eee-422	631	2	Located on the 4th floor of EEEi
EEE 423	EEE 423 is a Graduate Students Room in EEEi	14.6495999999999995	121.069000000000003	eee-423	632	2	Located on the 4th floor of EEEi
EEE 424	EEE 424 is a Graduate Students Room in EEEi	14.6495999999999995	121.069000000000003	eee-424	633	2	Located on the 4th floor of EEEi
NIMBB 101	NIMBB 101 is a Conference Room	14.6506004000000001	121.071999000000005	nimbb-101	634	2	Located on the 1st Floor of NIMBB
NIMBB 202	NIMBB 202 is Molecular Biology Laboratory - B	14.6506004000000001	121.071999000000005	nimbb-202	635	2	Located on the 2nd Floor of NIMBB
NIMBB 203	NIMBB 203 is the Cell Culture Laboratory	14.6506004000000001	121.071999000000005	nimbb-203	636	2	Located on the 2nd Floor of NIMBB
NIMBB 205	NIMBB 205 is the Supply Office of NIMBB	14.6506004000000001	121.071999000000005	nimbb-205	637	2	Located on the 2nd Floor of NIMBB
NIMBB 206	NIMBB 206 is the Molecular Biology Training Room - A	14.6506004000000001	121.071999000000005	nimbb-206	638	2	Located on the 2nd Floor of NIMBB
NIMBB 214	NIMBB 214 is the Aquatic Biotechnology Laboratory (ABL)	14.6506004000000001	121.071999000000005	nimbb-214	639	2	Located on the 2nd Floor of NIMBB
NIMBB 215	NIMBB 215 is the Plant Molecular Biology and Virology Laboratory (PMVL)	14.6506004000000001	121.071999000000005	nimbb-215	640	2	Located on the 2nd Floor of NIMBB
NIMBB Bioinformatics	The Bioinformatics Laboratory of NIMBB	14.6506004000000001	121.071999000000005	nimbb-bioinformatics	641	2	Located on the 2nd Floor of NIMBB
NIMBB DNA Sequencing	The NIMBB Core Facility for DNA Sequencing	14.6506004000000001	121.071999000000005	nimbb-dna-sequencing	642	2	Located on the 2nd Floor of NIMBB
CMC Library	The College of Mass Communication Library	14.6564999	121.065002000000007	cmc-library	643	2	Located on the 1st and 2nd floor of the back portion Plaridel Hall
CMC Department of Communication Research	A research office at Plaridel Hall, the College of Mass Communication 	14.6564999	121.065002000000007	cmc-department-of-communication-research	644	2	Located on the 2nd floor of the back portion Plaridel Hall
CMC 205	CMC 205 is a Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-205	645	2	Located on the 2nd floor of the front portion Plaridel Hall
CMC 207	CMC 207 is a Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-207	646	2	Located on the 2nd floor of the front portion Plaridel Hall
CMC 209	CMC 209 is a Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-209	647	2	Located on the 2nd floor of the front portion Plaridel Hall
CMC Department of Broadcasting	CMC Room labelled Departamento ng Brodkasting	14.6564999	121.065002000000007	cmc-department-of-broadcasting	648	2	Located on the 2nd floor of the front portion Plaridel Hall
LH 201	LH 201 is Silid Abasolo-Domingo Hunyo 2004	14.6535996999999991	121.070999	lh-201	649	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 203	LH 203 is Silid Joset-Domingo Nobyembre 2004	14.6535996999999991	121.070999	lh-203	650	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 204	LH 204 is Room in Lagmay Hall	14.6535996999999991	121.070999	lh-204	651	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 205	LH 205 is Silid Samonte-Hinckley, Nobyembre, 2005	14.6535996999999991	121.070999	lh-205	652	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 207	LH 207 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-207	653	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 209	LH 209 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-209	654	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 213	LH 213 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-213	655	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 215	LH 215 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-215	656	2	Located on the 2nd Floor of the front portion of Lagmay Hall
LH 301	LH 301 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-301	657	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 302	LH 302 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-302	658	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 303	LH 303 is a Room in Lagmay Hall	14.6535996999999991	121.070999	lh-303	659	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 304	LH 304 is a Silid Kalaw-Ludesma of Lagmay Hall	14.6535996999999991	121.070999	lh-304	660	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 305	LH 305 is a Room in Lagmay Hall made by the donations of Mandala, 1999	14.6535996999999991	121.070999	lh-305	661	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 307	LH 307 is the Perceptual Experimental Laboratory of Lagmay Hall	14.6535996999999991	121.070999	lh-307	662	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 309	LH 309 is the Audio Visual Perception Laboratory of Lagmay Hall	14.6535996999999991	121.070999	lh-309	663	2	Located on the 3rd Floor of the front portion of Lagmay Hall
LH 313-315	LH 313-315 is the Social Cognition Laboratory of Lagmay Hall	14.6535996999999991	121.070999	lh-313-315	664	2	Located on the 3rd Floor of the front portion of Lagmay Hall
Bahay ng Alumni Comfort Rooms	Comfort rooms at the Bahay ng Alumni Lobby area	14.6577997	121.067001000000005	bahay-ng-alumni-comfort-rooms	665	2	The male comfort room is located on the left side while the female comfort room is located on the right side when facing inside the building. Both comfort rooms are located behind stairs.
Department of Computer Science Teaching Lab 1 (TL1)	Airconditioned computer laboratory. Holds about 40 people.	14.6488999999999994	121.069000000000003	department-of-computer-science-teaching-lab-1-(tl1)	666	2	Teaching Lab 1 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the left side of the balcony when coming up from the stairs.
Department of Computer Science Classroom 3 (CLR 3)	Airconditioned. Seats about 30 people.	14.6488999999999994	121.069000000000003	department-of-computer-science-classroom-3-(clr-3)	667	2	Classroom 3 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the right side of the balcony when coming up from the stairs
CSWCD 304	CSWCD 304 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-304	668	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
Department of Computer Science Classroom 2 (CLR 2)	Airconditioned. Seats about 20 people.	14.6488999999999994	121.069000000000003	department-of-computer-science-classroom-2-(clr-2)	669	2	Classroom 2 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the left side of the balcony when coming up from the stairs.
Department of Computer Science Engineering and Research for Technology Development (ERDT)	Airconditioned. Seats about 50 people.	14.6488999999999994	121.069000000000003	department-of-computer-science-engineering-and-research-for-technology-development-(erdt)	670	2	ERDT is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the right side of the balcony when coming up from the stairs.
DMST - Vanguard 204	Classroom in Vanguard Hall	14.6588001000000006	121.064003	dmst---vanguard-204	888	2	On the second floor of Vanguard building
UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)	The UP Alumni Engineers' Centennial Hall (AECH) houses Engineering Library 2 and the Department of Computer Science.	14.6488999999999994	121.069000000000003	up-alumni-engineers'-centennial-hall-(engineering-library-2)-(department-of-computer-science---dcs)	671	1	It is located on Velasquez Street, opposite the College of Science Library and the National Institute of Geological Sciences.
Art Circle Cafe	A restaurant in Bahay ng Alumni.	14.6577997	121.067001000000005	art-circle-cafe	672	2	Art Circle Cafe is located on the left side of Bahay ng Alumni.
Chocolate Kiss Cafe	Chocolate Kiss Cafe is a restaurant in Bahay ng Alumni.	14.6577997	121.067001000000005	chocolate-kiss-cafe	673	2	It is located on the 2nd floor, on the left side hallway.
College of Mass Communication - Media Center and DZUP Studio	The Media Center holds TV Studios and the DZUP Broadcasting station	14.6563996999999997	121.063004000000006	college-of-mass-communication---media-center-and-dzup-studio	674	1	The Media Center is located near Plaridel Hall.
Centennial Residence Hall - University Food Service	University Food Service branch in Centennial Residence Hall.	14.6479997999999991	121.063004000000006	centennial-residence-hall---university-food-service	675	2	It is located on the ground floor, at the front of the Centennial Residence Hall
YZA Printing Shop	A printing shop at Centennial Residence Hall.	14.6479997999999991	121.063004000000006	yza-printing-shop	676	2	It is located on the groundfloor, at the front of the building
Food Nook	Food Nook is a restaurant at the Centenial Residence Hall.	14.6479997999999991	121.063004000000006	food-nook	677	2	It is located on the groundfloor of the right-side building.
B.E. Scientific Glass Instruments	B.E. Scientific Glass Instruments is a glassware and laboratory equipment shop located at the Centennial Residence Hall.	14.6479997999999991	121.063004000000006	b-e--scientific-glass-instruments	678	2	It is on the groundfloor of the right-side building, beside Food Nook restaurant.
Acacia Residence Halls Commercial Area	These are some commercial stores located at the Acacia Residence Halls.	14.6592999000000006	121.069999999999993	acacia-residence-halls-commercial-area	679	1	These stores are located along Laurel Ave., across from the old Shopping Center.
Quicklean	Quicklean is a laundromat located outside of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	quicklean	680	2	Quicklean is one of the many stores located at the side of Acacia Residence Halls. It is located beside Khaleb restaurant
Khaleb	Khaleb is a shawarma restaurant located at the side of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	khaleb	681	2	Khaleb is located between Quicklean and Unlad Convenience Store.
Unlad Convenience Store	Unlad is a convenience store located at the side of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	unlad-convenience-store	682	2	Unlad is located beside Khaleb restaurant.
UP Click	UP Click is a computer and printing shop located at the side of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	up-click	683	2	UP Click is located beside Acacia Wellness.
Acacia Wellness	Acacia Wellness is a spa salon located at the side of Acacia Residence Hall.	14.6592999000000006	121.069999999999993	acacia-wellness	684	2	It is between Upbeat and UP Click
Upbeat	Upbeat is a UP mechandise shop located at the side of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	upbeat	685	2	It is located between Acacia Wellness and Orange Segment
Orange Segment	Orange Segment is a printing store located at the side of Acacia Residence Halls.	14.6592999000000006	121.069999999999993	orange-segment	686	2	It is the right-most store, located beside Upbeat.
Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)	The CSWCD offers graduate and undergraduate programs in both social work and community development, as well as graduate programs on women and development.\r\n\r\n - UP CSWCD Website	14.6571999000000002	121.064003	tandang-sora-hall-(center-for-social-work-and-community-development)-(cswcd)	687	1	Tandang Sora Hall is located along Magsaysay Ave., beside the UP Center for Women Studies.
CSWCD 101	CSWCD 101 is the Student Council Room of Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-101	688	2	Located on the 1st floor of Tandang Sora Hall (CSWCD)
CSWCD 105	CSWCD 105 is the Silid Silangan Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-105	689	2	Located on the 1st floor of Tandang Sora Hall (CSWCD)
CSWCD 102	CSWCD 102 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-102	690	2	Located on the 1st floor of Tandang Sora Hall (CSWCD)
CSWCD 106	CSWCD 106 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-106	691	2	Located on the 1st floor of Tandang Sora Hall (CSWCD)
CSWCD 201	CSWCD 201 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-201	692	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 202	CSWCD 202 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-202	693	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 203	CSWCD 203 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-203	694	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 204	CSWCD 204 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-204	695	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 205	CSWCD 205 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-205	696	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 206	CSWCD 206 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-206	697	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 208	CSWCD 208 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-208	698	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 207	CSWCD 207 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-207	699	2	Located on the 2nd floor of Tandang Sora Hall (CSWCD)
CSWCD 301	CSWCD 301 is a Field Insruction Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-301	700	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD 302	CSWCD 302 is a Seminar Room 1 in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-302	701	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD 303	CSWCD 303 is a Seminar Room 2 in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-303	702	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD 306	CSWCD 306 is the Research and Extension for Development Office (REDO) in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-306	703	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD 307	CSWCD 307 is the UPSARDF INC. Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-307	704	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD 308	CSWCD 308 is a Room in Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-308	705	2	Located on the 3rd floor of Tandang Sora Hall (CSWCD)
CSWCD Library	The CSWCD  Library of Tandang Sora Hall	14.6571999000000002	121.064003	cswcd-library	706	2	Located on the 1st floor of Tandang Sora Hall (CSWCD)
Law Office	Private law office located at Centennial Dormitory.	14.6479997999999991	121.063004000000006	law-office	707	2	The law office is located at the back of the Centennial Dormitory
UP Film Institute (UPFI)	The UP Film Institute of the premiere state university is the only internationally-accredited academic institution in the country offering film courses for both undergraduate and master’s degrees. - UP Film Institute Website	14.6562327999999997	121.063621999999995	up-film-institute-(upfi)	708	1	The UP Film Institute is located off Ylanan St., past Plaridel Hall. Any jeep will pass by the nearby College of Music jeepney stop.
UPFI 104	Room 104 in UP Film Institute	14.6562003999999995	121.064003	upfi-104	709	2	On the 1st floor of UPFI.
UPFI 105	Room 105 in UP Film Institute	14.6562003999999995	121.064003	upfi-105	710	2	On the 1st floor of UPFI.
UPFI 107	Room 107 in UP Film Institute	14.6562003999999995	121.064003	upfi-107	711	2	On the 1st floor of UPFI.
UPFI 202	Room 202 in UP Film Institute	14.6562003999999995	121.064003	upfi-202	712	2	On the 2nd floor of UPFI.
UPFI AVR 1	AVR 1 in UP Film Institute	14.6562003999999995	121.064003	upfi-avr-1	713	2	On the 2nd floor of UPFI.
UPFI AVR 2	AVR 2 in UP Film Institute	14.6562003999999995	121.064003	upfi-avr-2	714	2	On the 2nd floor of UPFI.
AECH Serials Section	Serials Section of Alumni Engineers' Centennial Hall.	14.6488999999999994	121.069000000000003	aech-serials-section	715	2	Located on the left side from the entrance.
AECH 213	Room 213 of Alumni Engineers' Centennial Hall.	14.6488999999999994	121.069000000000003	aech-213	716	2	Located on the 2nd floor from the entrance, on the left side.
AECH 210 - Teaching Lab 3	Room 210 of Alumni Engineers' Centennial Hall. A computer lab.	14.6488999999999994	121.069000000000003	aech-210---teaching-lab-3	717	2	Located on the 2nd floor from the entrance, on the right side.
AECH 212	Room 212 of Alumni Engineers' Centennial Hall.	14.6488999999999994	121.069000000000003	aech-212	718	2	Located on the 2nd floor from the entrance, on the right side down the corridor.
AECH 214 - Teaching Lab 2	Room 214 of Alumni Engineers' Centennial Hall. A computer lab.	14.6488999999999994	121.069000000000003	aech-214---teaching-lab-2	719	2	Located on the 2nd floor from the entrance, on the right side down the corridor.
AECH 215 - Seminar Room	Room 215 of Alumni Engineers' Centennial Hall. This room typically holds equipment and materials for building and prototyping electronic circuits. Work tables take up most of the floor space.	14.6488999999999994	121.069000000000003	aech-215---seminar-room	720	2	Located on the 2nd floor from the entrance, on the far end of the left side.
DMMME Adaptive Metallurgy Laboratory	Adaptive Metallurgy Laboratory of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-adaptive-metallurgy-laboratory	721	2	Located on the 1st floor.
DMMME 205-206	Room 205-206 of the Department of Mining, Metallurgical & Materials Engineering. A large lecture hall.	14.6478996000000006	121.068000999999995	dmmme-205-206	722	2	Located on the 2nd floor.
DMMME Composites Laboratory	The Composites Laboratory is in room 213 of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-composites-laboratory	723	2	Located on the 2nd floor.
DMMME 214	Room 214 of the Department of Mining, Metallurgical & Materials Engineering. Also labeled Fluor Daniels Room.	14.6478996000000006	121.068000999999995	dmmme-214	724	2	Located on the 2nd floor.
DMMME 216	Room 216 of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-216	725	2	Located on the 2nd floor.
DMMME 217	Room 217 of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-217	726	2	Located on the 2nd floor.
DMMME Administrative Office	Administrative Office of the Department of Mining, Metallurgical & Materials Engineering.	14.6567001000000001	121.065002000000007	dmmme-administrative-office	727	2	Located on the 2nd floor, to the right from the staircase closest to the entrance.
DMMME 301-302	Room 301-302 of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-301-302	728	2	Located on the 3rd floor.
DMMME 303-304	Room 303-304 of the Department of Mining, Metallurgical & Materials Engineering.	14.6478996000000006	121.068000999999995	dmmme-303-304	729	2	Located on the 3rd floor.
IChE A101	Lecture room A101 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a101	730	2	On the first floor of Building A, the building closest to C.P. Garcia
IChE A102	Lecture room A102 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a102	731	2	On the first floor of Building A, the building closest to C.P. Garcia
IChE A104	Lecture room A104 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a104	732	2	On the first floor of Building A, the building closest to C.P. Garcia
IChE A103	Lecture room A103 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a103	733	2	On the first floor of Building A, the building closest to C.P. Garcia
IChE A202 - Administration Office	Administration office in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a202---administration-office	734	2	On the second floor of Building A, the building closest to C.P. Garcia
IChE A301 - Computer Laboratory I	Computer lab in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a301---computer-laboratory-i	735	2	On the third floor of Building A, the building closest to C.P. Garcia
IChE A401	Lecture room A401 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a401	736	2	On the fourth floor of Building A, the building closest to C.P. Garcia
IChE A402	Lecture room A402 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a402	737	2	On the fourth floor of Building A, the building closest to C.P. Garcia
IChE A403	Lecture room A403 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a403	738	2	On the fourth floor of Building A, the building closest to C.P. Garcia
IChE A404	Lecture room A404 in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a404	739	2	On the fourth floor of Building A, the building closest to C.P. Garcia
IChE A302 - Computer Laboratory II	Computer lab in Institute of Chemical Engineering Building A	14.6480999000000001	121.067001000000005	iche-a302---computer-laboratory-ii	740	2	On the third floor of Building A, the building closest to C.P. Garcia
IChE B101 Process Systems Engineering Laboratory	Process Systems Engineering Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b101-process-systems-engineering-laboratory	741	2	On the first floor of Building B, reachable from Building A
IChE B102 Analytical Laboratory	Analytical Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b102-analytical-laboratory	742	2	On the first floor of Building B, reachable from Building A
IChE B103-B104 Polymers Laboratory	Polymers Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b103-b104-polymers-laboratory	743	2	On the first floor of Building B, reachable from Building A
IChE B105-B106 Catalysts Laboratory	Catalysts Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b105-b106-catalysts-laboratory	744	2	On the first floor of Building B, reachable from Building A
IChE B201-B202 Separations Engineering Laboratory	Separations Engineering Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b201-b202-separations-engineering-laboratory	745	2	On the second floor of Building B
IChE B203 Analytical Laboratory	Analytical Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b203-analytical-laboratory	746	2	On the second floor of Building B
IChE B204-B205 Fuels, Energy, and Thermal Systems Laboratory	Fuels, Energy, and Thermal Systems Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b204-b205-fuels,-energy,-and-thermal-systems-laboratory	747	2	On the second floor of Building B
IChE B206 Green Materials Laboratory	Green Materials Laboratory in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b206-green-materials-laboratory	748	2	On the second floor of Building B
IChE B301-B302 Chemical Engineering Commons	Chemical Engineering Commons in Institute of Chemical Engineering	14.6480999000000001	121.067001000000005	iche-b301-b302-chemical-engineering-commons	749	2	On the third floor of Building B
ICE 401	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-401	750	2	Located on the fourth floor, on the left side from the stairs
ICE 402	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-402	751	2	Located on the fourth floor, on the left side from the stairs
ICE 403	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-403	752	2	Located on the fourth floor, on the left side from the stairs
ICE 404	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-404	753	2	Located on the fourth floor, on the left side from the stairs
ICE 405	Large lecture hall in ICE, can fit at least 100.	14.6485996000000007	121.066001999999997	ice-405	754	2	Located on the fourth floor, on the left side from the stairs
ICE 301	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-301	755	2	Located on the third floor, on the left side from the stairs
ICE 302	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-302	756	2	Located on the third floor, on the left side from the stairs
ICE 303	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-303	757	2	Located on the third floor, on the left side from the stairs
ICE 304	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-304	758	2	Located on the third floor, on the left side from the stairs
ICE 305	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-305	759	2	Located on the third floor, on the left side from the stairs
ICE 306A	Large room in ICE	14.6485996000000007	121.066001999999997	ice-306a	760	2	Located on the third floor, on the left side from the stairs
ICE 306B	Large room in ICE	14.6485996000000007	121.066001999999997	ice-306b	761	2	Located on the third floor, on the left side from the stairs
ICE 307	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-307	762	2	Located on the third floor, in the center
ICE 308	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-308	763	2	Located on the third floor, in the center
ICE 309	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-309	764	2	Located on the third floor, in the center
ICE 310	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-310	765	2	Located on the third floor, in the center
ICE 201	Room in ICE	14.6485996000000007	121.066001999999997	ice-201	766	2	Located on the second floor, on the left side from the stairs
ICE 202	Room in ICE	14.6485996000000007	121.066001999999997	ice-202	767	2	Located on the second floor, on the left side from the stairs
ICE 203	Room in ICE	14.6485996000000007	121.066001999999997	ice-203	768	2	Located on the second floor, on the left side from the stairs
ICE 204	Large room in ICE	14.6485996000000007	121.066001999999997	ice-204	769	2	Located on the second floor, on the left side from the stairs
ICE 205 - Faculty Room	Faculty room in ICE	14.6485996000000007	121.066001999999997	ice-205---faculty-room	770	2	Located on the second floor, on the right side from the stairs
ICE 103	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-103	771	2	Located on the first floor, to the right from the entrance of ICE
ICE 104	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-104	772	2	Located on the first floor, to the right from the entrance of ICE
ICE 101	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-101	773	2	Located on the first floor, to the right from the entrance of ICE
ICE 102	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-102	774	2	Located on the first floor, to the right from the entrance of ICE
ICE 105	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-105	775	2	Located on the first floor, to the right from the entrance of ICE
ICE 106	Classroom in ICE	14.6485996000000007	121.066001999999997	ice-106	776	2	Located on the first floor, to the right from the entrance of ICE
ICE 108	Office in ICE	14.6485996000000007	121.066001999999997	ice-108	777	2	Located on the first floor, to the left from the entrance of ICE
ICE 107	Office in ICE	14.6485996000000007	121.066001999999997	ice-107	778	2	Located on the first floor, to the left from the entrance of ICE
College of Architecture Library	Library of College of Architecture	14.6513995999999995	121.065002000000007	college-of-architecture-library	779	2	On the upper floor of Juguilon Hall
UP School of Urban and Regional Planning (SURP)	Since June 2000, the U.P. School of Urban and Regional Planning has been offering the graduate Diploma, Master of Arts (M.A.) and Doctor of Philosophy (Ph.D) programs following the ladder structure. Courses taken in the lower degree (e.g. Diploma) are credited in the next higher degree (e.g. M.A.).\r\n- UP SURP Website\r\n\r\nThe new school building is currently under construction, with the new classrooms inside.	14.6571999000000002	121.063004000000006	up-school-of-urban-and-regional-planning-(surp)	780	1	UP SURP is located along Emilio Jacinto Rd., across UP SOLAIR.
Center for Women's and Gender Studies	Center for Women's and Gender Studies	14.6572885999999993	121.064453	center-for-women's-and-gender-studies	781	1	Any jeep will pass by the nearby College of Music jeepney stop. It is located at the corner of Magsaysay and Ylanan.
CMC M 107	Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-m-107	782	2	To the left, from the entrance
CMC 107	Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-107	783	2	In the building past the main building, on the left side of the first floor
CMC A-202	Room in Plaridel Hall	14.6564999	121.065002000000007	cmc-a-202	784	2	On the second floor of the building past the main building
Parish of The Holy Sacrifice - Gomburza Hall	Event hall in Parish of The Holy Sacrifice	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice---gomburza-hall	785	2	From the entrance closer to Acacia Residence Hall, it is next to the chapel.
Parish of The Holy Sacrifice - Delaney Hall	Event hall in Parish of The Holy Sacrifice	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice---delaney-hall	786	2	From the entrance closer to Acacia Residence Hall, turn right, it is on the right side.
Old UP Swimming Pool Lot	Previously housed the UP Arcade and the old Swimming Pool	14.6589498999999996	121.071845999999994	old-up-swimming-pool-lot	787	4	Corner of F. Agoncillo and Laurel Avenue, opposite Parish of The Holy Sacrifice
F. Agoncillo-Parish of The Holy Sacrifice Area	Street commonly parked on by visitors to Parish of The Holy Sacrifice	14.6588344999999993	121.071579	f--agoncillo-parish-of-the-holy-sacrifice-area	788	4	On F. Agoncillo
Balay Kalinaw Parking Lot	Parking lot that can hold about 15 vehicles	14.6597004000000002	121.072997999999998	balay-kalinaw-parking-lot	789	4	At the corner of F. Ma. Guerrero and Dagohoy, opposite Balay Kalinaw, next to Ilang-Ilang Residence Hall
Virata School of Business (VSB)	The Cesar E.A. Virata School of Business (VSB) of the University of the Philippines in Diliman is the leading institution on management education in the Philippines. 	14.6553000999999998	121.072997999999998	virata-school-of-business-(vsb)	790	1	Directly in front of the UP Grandstand near the Sunken Garden. It is between Vinsons Hall and the School of Economics
Virata School of Business Library	Library of the Cesar E. A. Virata School of Business	14.6553000999999998	121.072997999999998	virata-school-of-business-library	791	2	The entrance to the library is on the second floor.
VSB 201	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-201	792	2	Located on the second floor, left side.
VSB 203	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-203	793	2	Located on the second floor, left side.
VSB 205	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-205	794	2	Located on the second floor, left side.
VSB 207	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-207	795	2	Located on the second floor, left side.
VSB 209	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-209	796	2	Located on the second floor, left side.
VSB 211	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-211	797	2	Located on the second floor, left side.
VSB 213	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-213	798	2	Located on the second floor, left side.
VSB 215	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-215	799	2	Located on the second floor, left side.
VSB 202	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-202	800	2	Located on the second floor, right side.
VSB 204	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-204	801	2	Located on the second floor, right side.
VSB 206	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-206	802	2	Located on the second floor, right side.
VSB 208	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-208	803	2	Located on the second floor, right side.
VSB 210	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-210	804	2	Located on the second floor, right side.
VSB 212	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-212	805	2	Located on the second floor, right side.
VSB 214	Room in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-214	806	2	Located on the second floor, right side.
VSB 106	Classroom in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-106	807	2	Located on the first floor, right side.
VSB 108	Classroom in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-108	808	2	Located on the first floor, right side.
VSB 110	Classroom in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-110	809	2	Located on the first floor, right side.
VSB 118	Classroom in Virata School of Business	14.6553000999999998	121.072997999999998	vsb-118	810	2	Located on the first floor, right side.
IESM 101	Room in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-101	811	2	Located on the first floor.
IESM 102	Room in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-102	812	2	Located on the first floor.
IESM 103	Room in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-103	813	2	Located on the first floor.
IESM 104	Room in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-104	814	2	Located on the first floor.
IESM Administration Office	Admin office in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-administration-office	815	2	Located on the second floor.
IESM Auditorium	Auditorium in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-auditorium	816	2	Located on the first floor.
IESM 202	Room in Institute of Environmental Science and Meteorology	14.6483001999999995	121.069999999999993	iesm-202	817	2	Located on the second floor.
College of Science Library Parking Lot	This parking lot can accommodate about 25 four-wheeled vehicles.	14.6495999999999995	121.069000000000003	college-of-science-library-parking-lot	818	4	Located in front of the College of Science Library and Administration building, by the road that leads to the National Science Complex (from Velasquez St.).
MSI 201	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-201	819	2	From the entrance, turn left.
MSI 202	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-202	820	2	From the entrance, turn left.
MSI 203	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-203	821	2	From the entrance, turn left.
MSI 204	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-204	822	2	From the entrance, turn left.
NIMBB 110	NIMBB 110 is Lecture Hall - C	14.6506004000000001	121.071999000000005	nimbb-110	32	2	Located on the 1st Floor of NIMBB
NIMBB 112	NIMBB 112 is Lecture Hall - D	14.6506004000000001	121.071999000000005	nimbb-112	33	2	Located on the 1st Floor of NIMBB
MSI 205	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-205	823	2	From the entrance, turn left, then right at the end.
MSI 206	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-206	824	2	From the entrance, turn left, then right at the end.
MSI 207	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-207	825	2	From the entrance, turn left, then right at the end.
MSI 208	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-208	826	2	From the entrance, turn left, then right at the corner, then left.
MSI 209	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-209	827	2	From the entrance, turn left, then right at the corner, then left.
MSI 210	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-210	828	2	From the entrance, turn left, then right at the corner, then left.
MSI 211	Room in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-211	829	2	From the entrance, turn left, then right at the corner, then left.
MSI 219 - Library	Library in Marine Science Institute	14.6505002999999991	121.069000000000003	msi-219---library	830	2	From the entrance, turn right.
UP Marine Science Institute Comfort Rooms	Comfort rooms in UP Marine Science Institute	14.6506185999999996	121.068954000000005	up-marine-science-institute-comfort-rooms	831	5	From the entrance, turn right.
Archaeological Studies Program Solheim Library	Library in Albert Hall	14.6526002999999996	121.063004000000006	archaeological-studies-program-solheim-library	832	2	From the entrance, turn left.
ASP 103 - Administration	Administration Office in Albert Hall	14.6526002999999996	121.063004000000006	asp-103---administration	833	2	From the entrance, turn left. The room is on the right side.
ASP 109	Administration Office in Albert Hall	14.6526002999999996	121.063004000000006	asp-109	834	2	From the entrance, turn left. The room is on the right side.
ASP 113	Administration Office in Albert Hall	14.6526002999999996	121.063004000000006	asp-113	835	2	From the entrance, turn left. The room is on the right side.
ASP 115	Administration Office in Albert Hall	14.6526002999999996	121.063004000000006	asp-115	836	2	From the entrance, turn left. The room is on the right side.
ASP 117	Administration Office in Albert Hall	14.6526002999999996	121.063004000000006	asp-117	837	2	From the entrance, turn left. The room is on the right side.
Concordia Albarracin Residence Hall	Concordia Albarracin Residence Hall is a dormitory for students in UP Diliman, next to the Centennial Residence Hall.	14.6477003000000003	121.063004000000006	concordia-albarracin-residence-hall	838	1	Concordia Albarracin Residence Hall is located along Emilio Jacinto, near the Jacinto Portal leading to C.P. Garcia. It is next to Centennial Residence Hall.
Centennial Residence Hall	Centennial Residence Hall is a dormitory for students in UP Diliman. Next to it is the Concordia Albarracin Residence Hall.	14.6479997999999991	121.063004000000006	centennial-residence-hall	839	1	Centennial Residence Hall is located along Emilio Jacinto, near the Jacinto Portal leading to C.P. Garcia. It is next to Kamagong Residence Hall and Concordia Albarracin Residence Hall.
Centennial Residence Hall - The Food Nook	The Food Nook	14.6479826000000006	121.062531000000007	centennial-residence-hall---the-food-nook	840	3	First floor of Concordia Albarracin Hall
Centennial Residence Hall - UP Stop	UP Stop convenience store	14.6479826000000006	121.062531000000007	centennial-residence-hall---up-stop	841	3	First floor of Centennial Residence Hall
Centennial Residence Hall - FLUIDSURF	FLUIDSURF Store	14.6480370000000004	121.062522999999999	centennial-residence-hall---fluidsurf	842	6	First floor of Centennial Residence Hall
Centennial Residence Hall - ACT RC	ACT RC Australian Aid	14.6476764999999993	121.062507999999994	centennial-residence-hall---act-rc	843	6	First floor of Concordia Albarracin Residence Hall
Centennial Residence Hall - B E Scientific Glass	B.E. Scientific Glass glasswares store	14.6476764999999993	121.062507999999994	centennial-residence-hall---b-e-scientific-glass	844	6	First floor of Concordia Albarracin Residence Hall
Centennial Residence Hall - ST-ART 101	Art supplies store	14.6476764999999993	121.062507999999994	centennial-residence-hall---st-art-101	845	6	First floor of Concordia Albarracin Residence Hall
Centennial Residence Hall - YZA Printing	YZA Printing	14.6476764999999993	121.062507999999994	centennial-residence-hall---yza-printing	846	6	First floor of Concordia Albarracin Residence Hall
CHE 101A	Conference room in Alonso Hall	14.6521997000000006	121.072997999999998	che-101a	847	2	Located on the first floor.
CHE 102	Food laboratory in Alonso Hall	14.6521997000000006	121.072997999999998	che-102	848	2	Located on the first floor.
CHE 103	Food laboratory in Alonso Hall	14.6521997000000006	121.072997999999998	che-103	849	2	Located on the first floor.
CHE 104	Laboratory in Alonso Hall	14.6521997000000006	121.072997999999998	che-104	850	2	Located on the first floor.
CHE 106	Food laboratory in Alonso Hall	14.6521997000000006	121.072997999999998	che-106	851	2	Located on the first floor.
CHE 202 Computer Room	Computer room in Alonso Hall	14.6521997000000006	121.072997999999998	che-202-computer-room	852	2	Located on the second floor.
CHE 203-B	Room in Alonso Hall	14.6521997000000006	121.072997999999998	che-203-b	853	2	Located on the second floor.
CHE 203-A	Room in Alonso Hall	14.6521997000000006	121.072997999999998	che-203-a	854	2	Located on the second floor.
CHE 204	Personnel Service Section in Alonso Hall	14.6521997000000006	121.072997999999998	che-204	855	2	Located on the second floor.
NIGS 302	A lecture room in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-302	856	2	At the rear end of the building, one floor above the main entrance.
NIGS 230	Room in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-230	857	2	Located one floor above the main entrance.
NIGS 217	Faculty room in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-217	858	2	At the front end of the building, one floor above the main entrance.
NIGS 214 Geophysics Laboratory	Geophysics Laboratory in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-214-geophysics-laboratory	859	2	Located one floor above the main entrance.
College of Arts and Letters (CAL)	The University of the Philippines College of Arts and Letters (CAL) in Diliman, Quezon City was established in 1983, as a result of a three-way split of the College of Arts and Sciences (CAS) for reasons of administrative efficiency. It originated from the College of Philosophy, Science and Letters established in U.P. in 1910. A year later, it was renamed College of Liberal Arts and Sciences. It offered degrees in the humanities, social sciences and natural sciences and serviced the General Education Program.	14.6526832999999996	121.067383000000007	college-of-arts-and-letters	1	1	CAL is located close to the Roxas Avenue segment of the Academic Oval. The building can be seen between Vargas Museum and the now-demolished Bulwagang Rizal. All jeepney routes except Ikot can drop you off at a waiting shed a minute's walk away from College of Arts and Letters.
College of Home Economics Gusali 2 (CHE)	The College of Home Economics (CHE) was established by the Board of Regents on July 27, 1961. It emanated from the Department of Home Economics in the College of Education where the discipline was officially recognized on November 12, 1921, 40 years before the College was established. Gusali 2 (or Alonso Hall Annex) houses a few of the college's rooms.	14.6518698000000001	121.072151000000005	college-of-home-economics-gusali-2	2	1	The building is situated along Ma. Regidor St. The only jeepneys that can take drop you off here are the ones of the Toki route.
ICE 313	ICE Classroom 313	14.6485996000000007	121.066001999999997	ice-313	323	2	On the 3rd floor of ICE
NIGS 213 Structural Geology Laboratory	Structural Geology Laboratory in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-213-structural-geology-laboratory	860	2	Located one floor above the main entrance.
NIGS 212 Geomorphology Laboratory	Geomorphology Laboratory in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-212-geomorphology-laboratory	861	2	Located one floor above the main entrance.
NIGS 121 Computer Room	Computer Room in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-121-computer-room	862	2	Located to the right of the main entrance, near the library.
NIGS 111 Mineralogy Room	Amoco Mineralogy Room in National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-111-mineralogy-room	863	2	Located on the same floor as the main entrance.
NIGS Museum	Museum in the National Institute of Geological Sciences	14.6479997999999991	121.069000000000003	nigs-museum	864	2	Located to the left of the main entrance.
Alonso Hall (College of Home Economics) (CHE)	CHE celebrates 55 years as a College and 95 years as a discipline this 2016. The College of Home Economics (CHE) was established by the Board of Regents on July 27, 1961. It emanated from the Department of Home Economics in the College of Education where the discipline was officially recognized on November 12, 1921, 40 years before the College was established.  \r\n\r\n- http://www.che.upd.edu.ph/content/overview-1	14.6521997000000006	121.072997999999998	alonso-hall-(college-of-home-economics)-(che)	865	1	beside UPIS, across Quirino Ave.
IB 306	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-306	866	2	Located on the third floor, in the wing facing towards the CS Amphitheater.
IB 307	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-307	867	2	Located on the third floor, in the wing facing towards the CS Amphitheater.
IB 308	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-308	868	2	Located on the third floor, in the wing facing towards the CS Amphitheater.
IB 309	Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-309	869	2	Located on the third floor, on the left side of the middle area.
IB 318	Seminar Room in Institute of Biology	14.6504002	121.070999	ib-318	870	2	Located on the third floor, in the center area.
IB 319	Seminar Room in Institute of Biology	14.6504002	121.070999	ib-319	871	2	Located on the third floor, in the center area.
IB 321	Animal Physiology Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-321	872	2	Located on the third floor, in the center area.
IB 330	Plant Physiology Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-330	873	2	Located on the third floor, in right side of the center area.
IB 345	Lecture Room in Institute of Biology	14.6504002	121.070999	ib-345	874	2	Located on the third floor, in the wing facing away from the CS Amphitheater.
IB 260	Developmental Biology Teaching Lab in Institute of Biology	14.6504002	121.070999	ib-260	875	2	Located on the second floor, in right side of the center area.
IB 2605	Lecture Room in Institute of Biology	14.6504002	121.070999	ib-2605	876	2	Located on the second floor, in right side of the center area.
Romulo Hall (Institute for Islamic Studies)	The Institute of Islamic Studies of the University of the Philippines-Diliman is the face of scholarly and academic Muslim community in the entire country. [Its Master's program] has produced graduates that are now actively employed in various academic Institutions in Mindanao and Metro Manila. Other graduates occupied top rank positions in the government. It has fulfilled its vision and mission as government’s partner in attaining progress and development in the country.\r\n\r\n- UP IIS Website	14.6571999000000002	121.072997999999998	romulo-hall-(institute-for-islamic-studies)	889	1	Romulo Hall is located along Magsaysay Ave., beside the GT Toyota Asian Center
Church of the Risen Lord - Function Hall	Function Hall	14.6597004000000002	121.071999000000005	church-of-the-risen-lord---function-hall	890	2	Located on the second floor of the administration building
\.


--
-- Data for Name: location_copy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_copy (name, category, description, more_info, lat, lng, url, id) FROM stdin;
College of Arts and Letters (CAL)	College Buildings	The University of the Philippines College of Arts and Letters (CAL) in Diliman, Quezon City was established in 1983, as a result of a three-way split of the College of Arts and Sciences (CAS) for reasons of administrative efficiency. It originated from the College of Philosophy, Science and Letters established in U.P. in 1910. A year later, it was renamed College of Liberal Arts and Sciences. It offered degrees in the humanities, social sciences and natural sciences and serviced the General Education Program.	CAL is located close to the Roxas Avenue segment of the Academic Oval. The building can be seen between Vargas Museum and the now-demolished Bulwagang Rizal. All jeepney routes except Ikot can drop you off at a waiting shed a minute's walk away from College of Arts and Letters.	14.6526832999999996	121.067383000000007	college-of-arts-and-letters	1
College of Home Economics Gusali 2 (CHE)	College Buildings	The College of Home Economics (CHE) was established by the Board of Regents on July 27, 1961. It emanated from the Department of Home Economics in the College of Education where the discipline was officially recognized on November 12, 1921, 40 years before the College was established. Gusali 2 (or Alonso Hall Annex) houses a few of the college's rooms.	The building is situated along Ma. Regidor St. The only jeepneys that can take drop you off here are the ones of the Toki route.	14.6518698000000001	121.072151000000005	college-of-home-economics-gusali-2	2
UP School of Economics (SE)	College Buildings	The University of the Philippines School of Economics (UPSE) provides instruction leading to undergraduate and graduate degrees in economics. It is housed by Encarnacion Hall, named after Jose Encarnacion Jr. the National Scientist who developed the economics profession in the Philippines and served as the college's dean for 20 years (1974-1994).	UPSE is located at the far end of the Academic Oval (side closer to Katipunan Ave.) near F. Ma. Guerrero St.. Any jeepney ride can take you here, however,  more often than not, the UP Campus - Katipunan route does not pass by this building.	14.6558694999999997	121.073639	up-school-of-economics	3
Institute of Mathematics Annex (MBAn)	College Buildings	Formerly known as the Department of Mathematics, the Institute is the largest institute in the University of the Philippines System. It nurtures about 300 undergraduate and 200 graduate students, and handles all the mathematics courses of some 5000 undergraduate students in UP Diliman.	The Institute of Mathematics' annex building can is located within the National Science Complex, just beside the institute's main building, along C.P. Garcia Ave. Toki jeepneys have a stop at a waiting shed just outside the building's parking lot.	14.6485672000000005	121.071938000000003	institute-of-mathematics-annex	4
CAL 309	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 3rd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-309	5
Bocobo Hall (Law Center) (BOC)	College Buildings	Bocobo Hall houses the University of the Philippines Law Center and stands adjacent to Malcolm Hall. The Law Center was established in 1964 as an agency attached to the College of Law for the purpose of continuing legal education programs, as well as legal and research publications.	Bocobo Hall is situated behind Malcolm Hall, bounded by F. Ma. Guerrero St. and Magsaysay Ave.. All jeeps can stop across the building.	14.6569996000000007	121.071999000000005	bocobo-hall-(law-center)-(boc)	6
College of Architecture Building 2 (Juguilon Hall) (JH)	College Buildings	Some classrooms and administrative offices of the UP College of Architecture are housed by this Building 2.	UP Arki is built along E. De los Santos St. Any jeepney can stop near this building, notably at a waiting shed within the Academic Oval.	14.6513995999999995	121.065002000000007	college-of-architecture-building-2-(juguilon-hall)-(jh)	7
College of Architecture Building 1 (Archi Lab) (CA)	College Buildings	The UP College of Architecture is housed by this building. After being sponsored many years past by Melchor Hall (College of Engineering) and Gonzales Hall (now Main Library), the Architecture programs of the university finally found its home in 2005 in this building.	UP Arki is built along E. De los Santos St. Any jeepney can stop near this building, notably at a waiting shed within the Academic Oval.	14.6509999999999998	121.065002000000007	college-of-architecture-building-1-(archi-lab)-(ca)	8
Institute of Chemistry Teaching Building (IC)	College Buildings	The Institute of Chemistry (IChem) is one of the degree-granting units of the College of Science at the University of the Philippines in Diliman and was designated by the Commission on Higher Education (CHED) as a Center of Excellence in Chemistry and Chemical Education encompassing teaching, research and extension services. It is the training ground for the country's top chemists, consistently besting other universities in the annual Chemistry license examinations.	This building can be found within the National Science Complex of the university across the National Institute of Physics. A Toki jeepney ride can drop you off at a waiting shed by this building.	14.6501999000000005	121.072997999999998	institute-of-chemistry-teaching-building-(ic)	9
Melchor Hall (MH) (College of Engineering)	College Buildings	Melchor Hall houses the College of Engineering which is the largest degree-granting unit in the UP Diliman Campus in terms of student population. It is named after Alejandro Melchor, a renowned Filipino civil engineer and mathematician.	One can find Melchor Hall between Osmena Avenue (main entrance) and Magsaysay Avenue (rear entrance), and bounded by A. Roces St. on its right side. All jeepney routes except Ikot stop across Melchor Hall.	14.6565999999999992	121.069999999999993	melchor-hall-(mh)-(college-of-engineering)	10
Malcolm Hall (LAW) (College of Law)	College Buildings	The main offices and classrooms of the College of Law are located inside Malcolm Hall within the U.P. Diliman Campus. The UP College of Law was among the first seven Colleges established after the foundation of the University of the Philippines on June 18, 1908 through Act No. 1870 of the Philippine Assembly.	Malcolm Hall is situated on the block bounded by Osmena Avenue (along the Academic Oval) and F. Ma. Guerrero Street. All jeepneys within the campus stop at a waiting shed nearby, however, the UP Campus - Katipunan route may sometimes not pass by this building at all.	14.6566200000000002	121.072104999999993	malcolm-hall-(law)-(college-of-law)	11
National College of Public Administration & Governance (NCPAG)	College Buildings	The U.P. National College of Public Administration and Governance (NCPAG) is a degree-granting unit at the University of the Philippines Diliman. Founded as the Institute of Public Administration (IPA), it has produced government officials, bureaucrats, civil society leaders and academic among others. It also houses the Eastern Regional Organization on Public Administration (EROPA) secretariat and the Association of Schools of Public Administration in the Philippines (ASPAP) headquarters. 	NCPAG stands at the end of R.P. De Guzman St. which is accessible from E. Jacinto St. Only Ikot and Toki jeepneys can get you near this building.	14.6564837000000008	121.060432000000006	national-college-of-public-administration-&-governance	12
CAL 409	Rooms	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 4th floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-409	13
National Institute of Geological Sciences (NIGS)	College Buildings	The National Institute of Geological Sciences (NIGS) is a multidisciplinary forum for the study of processes that shape the Earth.  It is the national center of excellence for the advancement, dissemination and application of geology in the Philippines.	To the back of the institute is C.P. Garcia Avenue, and to its left side is Velasquez St. An Ikot or Toki ride can get you to NIGS.	14.6479701999999996	121.069450000000003	national-institute-of-geological-sciences	14
Palma Hall (PH)	College Buildings	Palma Hall houses the College of Social Science and Philosophy. Palma Hall, popularly known as AS (Arts and Sciences), is where most General Education subjects are taught so almost all students in UP get to have a class or two in this building. It is named after Rafael Palma, former president of UP and a journalist who supported liberalism and academic freedom	Palma Hall is located along the Roxas Ave. segment of the Academic Oval. All jeepneys within the campus can stop by Palma Hall.	14.6534767000000006	121.069892999999993	palma-hall	15
Palma Hall Pavilion I (PAV1)	College Buildings	Palma Hall Pavilion 1 (PAV 1) currently houses offices of some of the faculty of the College of Arts and Letters and its classrooms are where the latter college's classes take place as well. Some assets of the college were transferred here as a result of the CAL Faculty Center (Bulwagang Rizal) burning down back in 2015.	PAV1 is located on the left wing of Palma Hall, and is the building immediately beside the segment of A. Roces St. popularly known as "ASCAL." All jeepney routes have a stop just across this building.	14.6528796999999997	121.068825000000004	palma-hall-pavilion-i	16
National Institute of Physics (NIP)	College Buildings	The Institute was established in 1983 by Presidential Executive Order transforming the then Department of Physics of the College of Arts and Sciences. Its vision is to be the leading center of physics education and research in the Philippines which, through the generation of new knowledge in pure and applied physics, would exert scientific influence in the Asia-Pacific region. 	The institute is located at the farthest southeast side of the campus, near Katipunan Ave. and C.P Garcia Ave.. It is accessible from the outside through Katipunan Ave. jeepneys, and within the campus through Toki jeeps.	14.6490211000000006	121.073120000000003	national-institute-of-physics	17
School of Labor & Industrial Relations (SOLAIR)	College Buildings	The U.P. School of Labor and Industrial Relations (SOLAIR) traces its roots to the Labor Education Center (LEC). Founded in 1954, the Center was established to assist the fledgling labor movement at that time by providing training on the various aspects of trade union organizing and administration. The Center boasted of a highly capable training and professional staff of labor lawyers and trainers most of whom were recruited from the ranks of the trade union movement. 	UP SOLAIR can be located along E. Jacinto St. and the dead end of Magsaysay Ave.. The building is included in the routes of Toki and Ikot jeeps.	14.6571874999999991	121.061699000000004	school-of-labor-&-industrial-relations	18
CAL 201	Rooms	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-201	19
CAL 209	Rooms	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-209	20
CAL 210	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-210	21
CAL 301	Rooms	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 3rd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-301	22
School of Statistics (SS) (STAT)	College Buildings	The University of the Philippines School of Statistics (Stat) is the only Center of Excellence for Statistics in the country. Its BS Statistics program is accredited by the ASEAN University Quality Assurance [Network] (AUN-QA). It aims to advance the development and maintenance of a high level of efficiency in statistical activities in the country and in the Asia-Pacific region through its academic programs as well as research and extension services.	UP Stat can be located at the intersection of Pardo de Tavera St. and T. Kalaw St., in front of the Office of the University Registrar (OUR). A Toki jeepney can drop you off by this building. 	14.6512002999999993	121.067001000000005	school-of-statistics-(ss)-(stat)	23
JH 101	Rooms	This room has a seating capacity of 35 people. An air-conditioning system and whiteboard can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-101	24
JH 102	Rooms	This room has a seating capacity of 35 people. An air-conditioning system can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-102	25
JH 103	Rooms	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-103	26
JH 104	Rooms	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-104	27
JH 105	Rooms	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-105	28
JH 106	Rooms	This room has a seating capacity of 60 people. An air-conditioning system and whiteboard can be found inside.	Located on the 1st floor of College of Architecture Building 2.	14.6509999999999998	121.065002000000007	jh-106	29
NIMBB 105	Rooms	NIMBB 105 is Lecture Hall - A	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-105	30
NIMBB 107	Rooms	NIMBB 107 is Lecture Hall - B	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-107	31
NIMBB 110	Rooms	NIMBB 110 is Lecture Hall - C	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-110	32
NIMBB 112	Rooms	NIMBB 112 is Lecture Hall - D	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-112	33
NIMBB 200	Rooms	NIMBB 200 is Molecular Biology Laboratory - A	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-200	34
CAL 310	Rooms	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 3rd floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-310	35
CAL 401	Rooms	This room has a seating capacity of 35 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 4th floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-401	36
CAL 408	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 4th floor of the College of Arts and Letters building.	14.6526832999999996	121.067383000000007	cal-408	37
FA Auditorium	Rooms	This room has a seating capacity of 50 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-auditorium	38
FA RGEP 1	Rooms	This room has a seating capacity of 50 people. An air-conditioning system and a whiteboard can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-rgep-1	39
FA RGEP 2	Rooms	This room has a seating capacity of 50 people. An air-conditioning system and a whiteboard can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-rgep-2	40
FA T2	Rooms	This room has a seating capacity of 40 people. An air-conditioning system and a whiteboard can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-t2	41
FA T3	Rooms	This room has a seating capacity of 40 people. An air-conditioning system and a whiteboard can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-t3	42
FA B6	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-b6	43
FA B1 & B2	Rooms	This room has a seating capacity of 60 people. A chalkboard and electric fans can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-b1-&-b2	44
FA B4 & B5	Rooms	This room has a seating capacity of 60 people. A chalkboard and electric fans can be found inside.	Located on the 1st floor of the College of Fine Arts building.	14.6522778999999996	121.061501000000007	fa-b4-&-b5	45
CHE Room ABC	Rooms	This room has a seating capacity of 200 people. A whiteboard, projector, and air-conditioning systems can be found inside.	Hard to miss once you're in CHE Gusali 2.	14.6518698000000001	121.072151000000005	che-room-abc	46
CHE Room D	Rooms	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	Located once down the stairs outside CHE Gusali 2.	14.6518698000000001	121.072151000000005	che-room-d	47
CHE Room E	Rooms	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	Located once down the stairs outside CHE Gusali 2.	14.6518698000000001	121.072151000000005	che-room-e	48
IC 305-306	Rooms	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-305-306	49
IC 307-308	Rooms	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-307-308	50
IC 309-310	Rooms	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-309-310	51
IC 311-312	Rooms	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-311-312	52
IC 313-314	Rooms	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-313-314	53
IC 315-316	Rooms	This room has a seating capacity of 35 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-315-316	54
IC 330-331	Rooms	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, a projector and a computer can be found inside.	Located on the 3rd floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-330-331	55
IC CHEMREZ	Rooms	This room has a seating capacity of 65 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 1st floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-chemrez	56
IC Chevron	Rooms	This room has a seating capacity of 50 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 1st floor of the IC Teaching Building.	14.6502017999999996	121.073120000000003	ic-chevron	57
SE 105	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-105	58
SE 111	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-111	59
SE 114	Rooms	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-114	60
SE 121	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-121	61
SE 123	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-123	62
SE Auditorium	Rooms	This room has a seating capacity of 150 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the nth floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-auditorium	63
SE 103	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-103	64
SE 125	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-125	65
CAL Library	Rooms	Library of College of Arts and Letters	On the first floor of CAL, before the main entrance.	14.6527004000000005	121.067001000000005	cal-library	66
SE 127	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the UPSE building (Encarnacion Hall).	14.6558694999999997	121.073639	se-127	67
MH 301-303	Rooms	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, right wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-301-303	68
JH 107	Rooms	Room 107 of JH	located on the 1st floor of College of Architecture Building 2	14.6513995999999995	121.065002000000007	jh-107	69
MH 305-307	Rooms	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, right wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-305-307	70
MH 306-308	Rooms	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-306-308	71
MH 309-311	Rooms	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, right wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-309-311	72
MH 313-315	Rooms	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, right wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-313-315	73
MH 314-316	Rooms	This room has a seating capacity of 50 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-314-316	74
MH 318-320	Rooms	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 3rd floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-318-320	75
MH 416-418	Rooms	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 4th floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-416-418	76
MH 422-424	Rooms	This room has a seating capacity of 45 people. A whiteboard, chalkboard and electric fans can be found inside.	Located on the 4th floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-422-424	77
Procter & Gamble AVR	Rooms	This room has a seating capacity of 100 people. A whiteboard, projector, and air-conditioning systems can be found inside.	Located on the 5th floor, left wing of Melchor Hall.	14.6565961999999992	121.069641000000004	procter-&-gamble-avr	78
Engineering Theater	Rooms	This room has a seating capacity of 150 people. A whiteboard, projector, air-conditioning systems, and electric fans can be found inside. This is a soundproofed room	Located on the 2nd floor, center of Melchor Hall.	14.6565961999999992	121.069641000000004	engineering-theater	79
MH 501	Rooms	This room has a seating capacity of 75 people. A whiteboard, projector, and air-conditioning systems can be found inside.	Located on the 5th floor, right wing of Melchor Hall.	14.6565961999999992	121.069641000000004	mh-501	80
Penthouse Lecture Hall	Rooms	This room has a seating capacity of 240 people. An air-conditioning system and projector can be found inside.	Located on the 4th floor of Bocobo Hall.	14.6570319999999992	121.072113000000002	penthouse-lecture-hall	81
LAW 200	Rooms	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-200	82
LAW 203	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-203	83
LAW 204	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-204	84
LAW 208	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-208	85
LAW 303	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-303	86
LAW 304	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-304	87
LAW 307	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-307	88
LAW 308	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-308	89
LAW 311	Rooms	This room has a seating capacity of 60 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-311	90
LAW 312	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-312	91
LAW 322	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-322	92
LAW 110 (Ambion Room)	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-110-(ambion-room)	93
LAW Soliven Room	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-soliven-room	94
LAW Sarmiento Room	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-sarmiento-room	95
LAW 221	Rooms	This room has a seating capacity of 30 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of Malcolm Hall.	14.6566238000000002	121.072090000000003	law-221	96
MBAn 306	Rooms	This room has a seating capacity of 60 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 3rd floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-306	97
MBAn 313	Rooms	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 3rd floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-313	98
MBAn 401	Rooms	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 4th floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-401	99
MBAn 402	Rooms	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 4th floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-402	100
MBAn 403	Rooms	This room has a seating capacity of 40 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 4th floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-403	101
Rajah Sulayman	Jeepney Stops	by Anastacio Caedo.	In front of Vargas Museum.	14.6535367999999995	121.066733999999997	rajah-sulayman	102
MB 301	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-301	103
MB 302	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-302	104
MB 303	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-303	105
MB 304	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-304	106
MB 305	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-305	107
MB 306	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-306	108
MB 307	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-307	109
MB 308	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-308	110
MB 321	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-321	111
MB 322	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-322	112
MB 323	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-323	113
MB 329	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-329	114
MBAn AVR 2	Rooms	This room has a seating capacity of 100 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 4th floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-avr-2	115
MBAn AVR 1	Rooms	This room has a seating capacity of 100 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 4th floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-avr-1	116
MB 328	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485882000000007	121.071387999999999	mb-328	117
MBAn 305	Rooms	This room has a seating capacity of 60 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 3rd floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-305	118
MBAn 314	Rooms	This room has a seating capacity of 45 people. A whiteboard, air-conditioning systems, and a projector can be found inside.	Located on the 3rd floor of the Institute of Math Annex Building.	14.6485672000000005	121.071938000000003	mban-314	119
AH 202-204	Rooms	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	Located on the 2nd floor, left wing of Abelardo Hall.	14.6566896	121.065421999999998	ah-202-204	120
AH 206-208	Rooms	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	Located on the 2nd floor, left wing of Abelardo Hall.	14.6566896	121.065421999999998	ah-206-208	121
AH Annex 222	Rooms	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	Located on the 2nd floor, left wing of Abelardo Hall Annex.	14.6571484000000005	121.065406999999993	ah-annex-222	122
AH Annex 232	Rooms	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	Located on the 2nd floor, left wing of Abelardo Hall Annex.	14.6571484000000005	121.065406999999993	ah-annex-232	123
NCPAG 301-302	Rooms	This room has a seating capacity of 90 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-301-302	124
NCPAG 305	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-305	125
NCPAG 306	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-306	126
NCPAG 307A	Rooms	This room has a seating capacity of 70 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-307a	127
NCPAG 308	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-308	128
NCPAG 309	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-309	129
NCPAG AVR	Rooms	This room has a seating capacity of 90 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the NCPAG building.	14.6564837000000008	121.060432000000006	ncpag-avr	130
NIGS 125	Rooms	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor, right wing of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-125	131
NIGS 127	Rooms	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor, right wing of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-127	132
NIGS 128	Rooms	This room has a seating capacity of 45 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor, right wing of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-128	133
NIGS 211	Rooms	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-211	134
NIGS 215	Rooms	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-215	135
NIGS Seminar Room	Rooms	This room has a seating capacity of 60 people. A whiteboard, a projector and air-conditioning systems can be found inside.	Located on the 1st floor of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-seminar-room	136
DMMME 103	Rooms	Room 103 of DMMME	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-103	137
NIGS 301	Rooms	This room has a seating capacity of 100 people. A whiteboard, a projector and air-conditioning systems can be found inside.	Located on the 3rd floor of the NIGS building.	14.6479701999999996	121.069450000000003	nigs-301	138
PH 207ABC	Rooms	This room has a seating capacity of 80 people. A whiteboard, a television and sound system, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-207abc	139
PH 108-110	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 1st floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-108-110	140
PH 116-118	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 1st floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-116-118	141
PH 120-122	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 1st floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-120-122	142
PH 213-215	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 2nd floor, right wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-213-215	143
PH 216-218	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 2nd floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-216-218	144
PH 308-310	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 3rd floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-308-310	145
PH 312-314	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 3rd floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-312-314	146
PH 324-326	Rooms	This room has a seating capacity of 50 people. A whiteboard, a chalkboard, and electric fans can be found inside.	Located on the 3rd floor, left wing of Palma Hall.	14.6534767000000006	121.069892999999993	ph-324-326	147
PH Multimedia Room	Rooms	null	null	14.6534767000000006	121.069892999999993	ph-multimedia-room	148
PAV1 1114	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1114	149
PAV1 1115	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1115	150
PAV1 1119	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1119	151
PAV1 1206	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1206	152
PAV1 1210	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1210	153
PAV1 1213	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1213	154
PAV1 1214	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1214	155
PAV1 1222	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1222	156
PAV1 1228	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1228	157
PAV1 1230	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1230	158
PAV1 1232	Rooms	This room has a seating capacity of 50 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located along Palma Hall Pavilion 1.	14.6528796999999997	121.068825000000004	pav1-1232	159
NIP F209	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f209	160
NIP F210	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f210	161
NIP Lecture Pavilion 101	Rooms	This room has a seating capacity of 120 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor, left wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-101	162
NIP Lecture Pavilion 102	Rooms	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor, left wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-102	163
NIP Lecture Pavilion 103	Rooms	This room has a seating capacity of 80 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor, left wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-103	164
NIP Lecture Pavilion 104	Rooms	This room has a seating capacity of 120 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor, left wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-lecture-pavilion-104	165
NIP F208	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f208	166
NIP F204	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f204	167
NIP F205	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f205	168
NIP F206	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f206	169
DMMME 109	Rooms	Room 109 of DMMME	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-109	170
NIP F207	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f207	171
NIP F201	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f201	172
NIP F202	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f202	173
NIP F203	Rooms	This room has a seating capacity of 35 people. A whiteboard, electric fans, and air-conditioning systems can be found inside.	Located on the 2nd floor, right wing of the NIP building.	14.6490211000000006	121.073120000000003	nip-f203	174
SOLAIR Auditorium	Rooms	This room has a seating capacity of 120 people. A whiteboard and a projector can be found inside.	Located on the nth floor of the SOLAIR building.	14.6571874999999991	121.061699000000004	solair-auditorium	175
SOLAIR 201	Rooms	This room has a seating capacity of 50 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of the SOLAIR building.	14.6571874999999991	121.061699000000004	solair-201	176
SOLAIR 203	Rooms	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 2nd floor of the SOLAIR building.	14.6571874999999991	121.061699000000004	solair-203	177
SOLAIR 10	Rooms	This room has a seating capacity of 100 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 1st floor of the SOLAIR building.	14.6571874999999991	121.061699000000004	solair-10	178
SS 301	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-301	179
SS 302	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-302	180
SS 303	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-303	181
SS 304	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-304	182
SS 305	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-305	183
SS 306	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-306	184
SS 307	Rooms	This room has a seating capacity of 40 people. A whiteboard, a projector, and air-conditioning systems can be found inside.	Located on the 3rd floor of the UP School of Statistics building.	14.6511574000000007	121.067276000000007	ss-307	185
1F Lobby	Rooms	This room has a seating capacity of 60 people.	Located on the 1st floor of Bocobo Hall.	14.6570319999999992	121.072113000000002	1f-lobby	186
Malcolm Hall Theater	Rooms	This room has a seating capacity of 120 people. A whiteboard and air-conditioning systems can be found inside."	null	14.6566238000000002	121.072090000000003	malcolm-hall-theater	187
Arkivickie	Food Service	Arckivikie is a food kiosk just by the College of Architecture. They serve quick snacks and meals.	Located just across the College of Architecture complex. A Toki jeepney ride can take you near the place.	14.6518678999999992	121.064612999999994	arkivickie	188
ASCAL Food Kiosks	Food Service	These are small food kiosks built on the elevated land along ASCAL. They serve short-order snacks such as sandwiches, street food, and pancit canton.	Located along ASCAL (segment of A. Roces St. in between Palma Hall and Bulwagang Rizal).	14.6528253999999993	121.068588000000005	ascal-food-kiosks	189
Glorias Cafe	Food Service	A cafeteria located in Melchor Hall. They serve anywhere from snacks to full meals.	Located on the ground floor in the rightmost side of Melchor Hall.	14.6564999	121.068779000000006	glorias-cafe	190
NCPAG Cafe	Food Service	A cafeteria located in NCPAG. They serve anything from snacks to meals here.	Located in the NCPAG building.	14.6564511999999993	121.060019999999994	ncpag-cafe	191
NIGS Canteen	Food Service	NIGS Canteen is a food service establishment located in the building's lower ground floor. They serve anything from snacks to full meals.	Located on the lowest floor of NIGS on its right wing.	14.6477652000000003	121.069748000000004	nigs-canteen	192
Area 2	Food Service	Area 2 serves an assortment of various food that everyone would be sure to choose from no matter their taste. The area is a staple spot for many goers around the university. There are at least 15 different eateries translating to at least 15 different menus to choose from, with all of them set at reasonable, if not very affordable, prices.	The food service establishments are located along Jose P. Laurel and neighbouring streets, by the intersection of A. Roces. St. and Laurel Ave.. All jeepney routes can stop by two sheds that are a minute's walk from the location.	14.6596478999999995	121.067763999999997	area-2-food	193
CASAA Food Court	Food Service	After burning down a few years back, CASAA has set up a temporary food court close to its original home. They serve many types of food here from different food stalls.	CASAA is located by Quirino Ave. across Sampaguita Residence Hall, in the block enclosed by the Fernandez and Africa Streets.	14.6527499999999993	121.071342000000001	casaa-temp-food	194
Institute of Biology Parking Lot	Parking Areas	A parking lot that can accommodate no more than 30 sedan-sized vehicles.	Located in front of the Institute of Biology, within the National Science Complex.	14.6503735000000006	121.070808	bio-parking	224
CAL Jeepney Stop	Jeepney Stops	Jeepney stop for all routes that go into UP Diliman.	It is located across Vidal A. Tan Hall.	14.6524333999999996	121.067963000000006	cal-jeepney-stop	257
Kuya Ramon's Food Hub	Food Service	This small kiosk serves food from snacks such as street food and instant noodles to full meals such as chicken wings and rice, with deals that are sure to appeal to barkada. There are a good number of seats and tables around the stall.	Located along Velasquez St., to the right of the Institute of Electrical and Electronics Engineering (as viewed from the front). Ikot and Toki jeepneys stop at a waiting shed close to the location.	14.6505078999999991	121.068245000000005	kuya-ramons-food-hub	195
Mang Larry's Isawan	Food Service	Mang Larry's Isawan is an iconic spot in UPD and its popularity can be attributed to its three decades of serving the UP Diliman community. Here, they offer anywhere from your favorite street food to rice meals.	Mang Larry's Isawan is situated by Balagtas St., just beside Area 2. Ikot jeepneys can be taken to reach a jeepney stop across Bahay ng Alumni (Magsaysay Ave.), and take a minute's walk to the famous Isawan.	14.6590824000000008	121.067329000000001	isawan-ni-mang-larry	196
Landbank	College Buildings	Bank near Cash Office	At the side of the old Shopping Center, near Balay Atleta	14.6599111999999998	121.070366000000007	landbank	197
Catholic Parish Office	Rooms	Catholic Parish Office	From the entrance in front of Acacia Residence Hall, turn right, then head up the stairs.	14.6589003000000009	121.070999	catholic-parish-office	198
Vinzons Hall Food Kiosks	Food Service	The Vinzons Hall Food Kiosks serve quick snacks such as instant noodles, sandwiches and street food. They also offer a variety of drinks.	Located in spots in front of Vinzons Hall, across the Sunken Garden.	14.6540060000000008	121.073051000000007	vinzons-food-kiosks	199
E. de Los Santos Street	Parking Areas	E. de Los Santos Street is the street along which you can find the College of Architecture. It is not a busy street and can serve as a parking space for about 10 vehicles.	Located across the College of Architecture.	14.6513957999999995	121.065558999999993	e--de-los-santos-street	200
PH Parking Lot 1	Parking Areas	A parking lot in front of Palma Hall. Has space for more or less 30 cars.	Located in front of Palma Hall.	14.6539029999999997	121.069762999999995	ph-parking-lot-1	201
PH Parking Lot 2	Parking Areas	A parking lot in front of Palma Hall. Has space for about 30 cars.	Located just across Palma Hall.	14.6540432000000003	121.069702000000007	ph-parking-lot-2	202
CAL Parking Lot 1	Parking Areas	A parking lot near the College of Arts and Letters.	Located behind (then-) Bulwagang Rizal, near the CAL building.	14.6530255999999994	121.068023999999994	cal-parking-lot	203
Gusali 2 Parking Lot	Parking Areas	A parking lot in front of CHE Gusali 2. Has space for more or less 20 4-wheel vehicles.	Located just in front of CHE Gusali 2.	14.6518736000000001	121.072472000000005	gusali-2-parking-lot	204
Abelardo Hall Parking Lot	Parking Areas	A parking lot in front of Abelardo Hall. Has a parking capacity of more or less 10 cars.	Located just in front of the College of Music complex.	14.6563473000000002	121.065353000000002	abelardo-hall-parking-lot	205
School of Economics Parking Lot	Parking Areas	A parking lot beside UPSE. Has space for about 20 cars.	Located to the left of UPSE's Encarnacion Hall.	14.6556540000000002	121.073822000000007	school-of-economics-parking-lot	206
CFA Parking Lot	Parking Areas	The parking lot within the College of Fine Arts complex. Can hold more or less 15 cars.	Located within the CFA complex.	14.6522798999999999	121.061508000000003	cfa-parking-lot	207
Law Complex Parking Lot	Parking Areas	The parking lot behind Malcolm Hall and beside Bocobo Hall. Has space for about 15 cars.	Located in the University of the Philippines Law Complex.	14.6570034000000007	121.072495000000004	law-complex-parking-lot	208
Math Building Parking Lot 1	Parking Areas	The parking lot behind the main math building. Can hold around 40 cars.	Located behind the Institute of Math main building.	14.6488131999999993	121.071158999999994	math-building-parking-lot-1	209
NCPAG Parking Lot	Parking Areas	The parking lot by NCPAG. Can hold more or less 15 cars.	Located near NCPAG.	14.6564274000000001	121.060989000000006	ncpag-parking-lot	210
NIGS Parking Lot	Parking Areas	The parking lot just in front of NIGS. The area can accommodate around 35 cars.	Located immediately in front of NIGS.	14.6486502000000005	121.069519	nigs-parking-lot	211
SOLAIR Parking Lot	Parking Areas	The parking lot outside SOLAIR. Can hold about 15 cars.	Located just outside the School of Labor and Industrial Locations.	14.6570596999999996	121.062195000000003	solair-parking-lot	212
School of Statistics Parking Lot	Parking Areas	The parking lot in front of the UP School of Statistics. Can hold about 20 cars.	Located immediately in front of the UP School of Statistics.	14.6513442999999999	121.067252999999994	school-of-statistics-parking-lot	213
Parking Area across Center for Women's Studies	Parking Areas	A parking lot that can hold about 10 cars.	Located across the UP Center for Women's Studies, at the Magsaysay Ave. - Ylanan St. intersection	14.6577797000000007	121.064628999999996	womens-studies-lot	214
Law Complex Parking Lot 2	Parking Areas	A parking lot that can accommodate about 50 four-wheeled vehicles.	Located at the F. Ma. Guerrero St. - Magsaysay Ave. intersection, across the street from the Law Complex.	14.6577997	121.072243	law-complex-lot-2	215
Bahay ng Alumni Parking Lots	Parking Areas	The larger lot can hold 20 to 30 cars. The smaller one can hold about 15.	These lots are located beside (larger lot) and behind (smaller lot) the Bahay ng Alumni in the block by the Balagtas St. - Magsaysay Ave. intersection.	14.6579666	121.066215999999997	bahay-alumni-lots	216
Shopping Center Parking Lots	Parking Areas	This space can hold about 40 four-wheeled vehicles.	Can be found behind the ruins of the UP Shopping Center, by P. Valenzuela St..	14.6599530999999992	121.069739999999996	sc-parking-lots	217
School of Economics Street Parking	Parking Areas	This small street is reserved as a parking space, and can accommodate about 25 four-wheeled vehicles.	Located beside the UP School of Economics and can be approached from F. Ma. Guerrero St..	14.6564922000000006	121.073409999999996	econ-street-parking	218
College of Arts and Letters Parking Lot 2	Parking Areas	This lot can hold more or less 60 cars.	This area can only be approached from Velasquez St. or Quirino Ave..	14.6529427000000005	121.067993000000001	cal-parking-2	219
UP AECH Parking Lot	Parking Areas	This small parking lot can hold no more than 15 cars.	Located in front of the UP Alumni Engineers Centennial Hall, by Velasquez St..	14.6489983000000006	121.068755999999993	dcs-parking	220
UP Film Institute Parking Lot	Parking Areas	This parking lot can accommodate more or less 50 four-wheeled vehicles. Keep in mind that the lot has little cover and is exposed to direct sunlight.	Located beside the UP Film Institute (Cine Adarna) by Magsaysay Avenue.	14.6571464999999996	121.067267999999999	cine-adarna-parking	221
College of Home Economics Gusali 2 Parking Lot	Parking Areas	A small parking lot meant for goers to Gusali 2 or the College of Home Economics that can hold about 15 cars.	Located along Regidor St. between Alonso Hall (Gusali 2) and Alonso Hall Annex.	14.6519308000000006	121.072433000000004	che-g2-parking	222
Institute of Electrical and Electronics Engineering Parking Lot 1	Parking Areas	This is a large parking lot with half reserved for students and guests. The latter section has space for about 15 four-wheeled vehicles.	Located within the area of the Institute of Electrical and Electronics Engineering by Velasquez St..	14.6493453999999996	121.068695000000005	ieee-parking	223
Marine Science Institute Parking Lot	Parking Areas	This is a spacious parking lot with about 15 slots reserved for stuednts and guests.	Located in front of the Marine Science Institute by Velasquez St..	14.6507310999999998	121.068747999999999	msi-parking	225
Institute of Mathematics Parking Lot 2	Parking Areas	This parking lot can hold more or less 40 vehicles.	Located beside the Institute of Mathematics Main Building, closer to the National Science Complex Ampitheatre.	14.6489171999999996	121.071167000000003	math-parking-2	226
Kalinga Day Care Center	College Buildings	Kalinga Day Care Center	On Aglipay St., behind Church of the Risen Lord	14.6601686000000004	121.071967999999998	kalinga-day-care-center	227
Area 1	College Buildings	Residential area in UP.	Can be entered from Agoncillo St.	14.6614313000000003	121.070930000000004	area-1	228
Philippine Association of University Women (PAUW) Annex	College Buildings	Philippine Association of University Women (PAUW) Annex	On Dagohoy St., past Balay Kalinaw.	14.6599207000000007	121.073516999999995	philippine-association-of-university-women-(pauw)-annex	229
DMMME 203	Rooms	Room 203 of DMMME	Located on the 2nd floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-203	230
NIMBB Parking Strip	Parking Areas	This small strip has space for about 20 four-wheeled vehicles.	Located in front of the National Institute of Molecular Biology and Biotechnology within the National Science Complex.	14.6504793000000006	121.071579	nimbb-parking-1	231
NIMBB Parking Lot	Parking Areas	This parking lot is able to hold 15 cars.	Located behind the National Institute of Molecular Biology and Biotechnology beside Regidor St..	14.6509236999999999	121.071395999999993	nimbb-parking-2	232
NISMED Parking Lot	Parking Areas	A small parking lot that has 5 spaces reserved for guests.	This space can be approached from Velasquez St., and sits beside NISMED and the UP Information Technology Development Center. 	14.6517800999999999	121.068213999999998	nismed-parking	233
National Institute of Physics Parking Strip	Parking Areas	This strip can accommodate about 40 cars. Note that the space hasn't much cover from sunlight.	Located by the National Institute of Physics, on the side that faces Katipunan Avenue.	14.6494827000000001	121.073836999999997	nip-parking	234
Quirino Avenue	Parking Areas	This street can be used for parking, and can accommodate about 30 cars.	This avenue can be approached from Regidor St..	14.6525555000000001	121.073425	quirino-ave-parking	235
Regidor Street	Parking Areas	This street can be used for parking and can accommodate more or less 15 vehicles (on one side so as not to debilitate traffic).	Located between Benitez Hall and the UP Integrated School high school building.	14.6531420000000008	121.072806999999997	regidor-st-parking	236
University Theater Parking Lot	Parking Areas	This parking lot can hold about 20 cars.	Located behind the University Theater by Magsaysay Avenue.	14.6573533999999999	121.066108999999997	univ-theater-parking0	237
Palma Hall Toilets (Males)	Comfort Rooms	Comfort rooms for males in Palma Hall.	At the left wing of every floor or Palma Hall (except for the 4th), a comfort room for males is available.	14.6534691000000006	121.069289999999995	palma-hall-toilets-(males)	238
Palma Hall Toilets (Females)	Comfort Rooms	Comfort rooms in Palma Hall for females.	At the right wing of every floor in Palma Hall, a comfort room for females can be found.	14.6534996	121.070221000000004	palma-hall-toilets-(females)	239
CHE Gusali 2 Comfort Rooms	Comfort Rooms	Comfort rooms that can be found in Alonso Hall Annex (CHE Gusali 2).	Down the stairs of the building, there are comfort rooms for males and females.	14.6518525999999998	121.072288999999998	che-gusali-2-comfort-rooms	240
Abelardo Hall Comfort Rooms	Comfort Rooms	Comfort rooms that can be found in Abelardo Hall.	Inside Abelardo Hall, there are comfort rooms for both males and females.	14.6566658000000007	121.065376000000001	abelardo-hall-comfort-rooms	241
Encarnacion Hall Comfort Rooms	Comfort Rooms	Comfort rooms in UPSE (Encarnacion Hall).	Inside Encarnacion Hall. Comfort rooms are available for both sexes.	14.6558752000000005	121.073768999999999	encarnacion-hall-comfort-rooms	242
Melchor Hall Comfort Rooms (Right Wing)	Comfort Rooms	At the right wing of Melchor Hall, in every floor, there are comfort rooms for both sexes.	Right wing of all Melchor Hall levels.	14.6564893999999999	121.069000000000003	melchor-hall-comfort-rooms-(right-wing)	243
Melchor Hall Comfort Rooms (Left Wing)	Comfort Rooms	At the left wing of each Melchor Hall level, there are comfort rooms for both males and females.	The left wing of every Melchor Hall floor except the lowest and 5th.	14.6564607999999996	121.070014999999998	melchor-hall-comfort-rooms-(left-wing)	244
CFA Comfort Rooms	Comfort Rooms	Comfort rooms in the College of Fine Arts. Watch out for large images of people (as signs) denoting male and female restrooms.	Located within the College of Fine Arts complex.	14.6522960999999992	121.061577	cfa-comfort-rooms	245
MBAn Comfort Rooms	Comfort Rooms	Comfort rooms in the Institute of Mathematics Annex Building (MBAn).	On every floor of MBAn, there are comfort rooms available for males and females.	14.6485567000000003	121.071929999999995	mban-comfort-rooms	246
MB Comfort Rooms	Comfort Rooms	Comfort rooms inside the Institute of Mathematics Main Building (MB).	Inside MB there are multiple comfort rooms that serve males and females.	14.6485748000000005	121.071395999999993	mb-comfort-rooms	247
NIGS Comfort Rooms	Comfort Rooms	Comfort rooms inside the National Institute of Geological Sciences.	Located inside NIGS. There are restrooms on every floor on the right wing except the lowest.	14.6479234999999992	121.069632999999996	nigs-comfort-rooms	248
NIP Comfort Rooms	Comfort Rooms	Comfort rooms inside the National Institute of Physics building.	On every floor on the building's right wing there are restrooms for both Gents and Ladies.	14.6490755000000004	121.073302999999996	nip-comfort-rooms	249
SOLAIR Comfort Rooms	Comfort Rooms	Comfort rooms inside the School of Labor and Industrial Relations.	There are male and female comfort rooms on every floor of SOLAIR.	14.6571797999999998	121.061661000000001	solair-comfort-rooms	250
UP Stat Comfort Rooms	Comfort Rooms	Comfort rooms inside the School of Statistics.	On every floor of the building there are comfort rooms for both sexes along the hallways.	14.6511697999999999	121.067245	up-stat-comfort-rooms	251
Area 2 Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located outside All UP Worker's Union.	14.6594342999999991	121.068764000000002	area-2-jeepney-stop	252
Romulo Hall Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located outside of Romulo Hall.	14.6568097999999996	121.072829999999996	romulo-jeepney-stop	253
University Avenue Jeepney Stop 1	Jeepney Stops	Jeepney stop for PHILCOA, Pantranco and SM North EDSA routes.	It is located on the University Avenue.	14.6546716999999997	121.062140999999997	univ-ave-1-jeepney-stop	254
University Avenue Jeepney Stop 2	Jeepney Stops	Jeepney stop for PHILCOA, Pantranco and SM North EDSA routes.	It is located on the University Avenue.	14.6550560000000001	121.062072999999998	univ-ave-2-jeepney-stop	255
Dagohoy Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located near the Ilang-Ilang Residence Hall.	14.6590203999999993	121.072829999999996	dagohoy-jeepney-stop	256
Church of the Risen Lord Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located outside the Church of the Risen Lord.	14.6594552999999994	121.071731999999997	church-of-the-risen-lord-jeepney-stop	258
CS Library Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot jeeps.	It is located outside the College of Science Library.	14.6488999999999994	121.069000000000003	cs-library-jeepney-stop	259
Malcolm Hall Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Pantranco, Philcoa, and SM North EDSA jeeps.	It is located near Malcolm Hall.	14.6567001000000001	121.072997999999998	malcolm-hall-jeepney-stop	260
Shopping Center Jeepney Stop	Jeepney Stops	Jeepney stop for all jeeps that go within UP Diliman.	It is located in front of the University Shopping Center.	14.6593999999999998	121.069999999999993	shopping-center-jeepney-stop	261
Plaridel Hall Parking Lot	Parking Areas	This parking lot can hold about 10 vehicles.	Located by Ylanan St., in front of Plaridel Hall across from the College of Music.	14.6563996999999997	121.064003	plaridel-hall-parking-lot	262
ICE David Y Tan Lecture Room	Rooms	Lecture Room in ICE	Located on the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-david-y-tan-lecture-room	263
MBB Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located near the National Institute of Molecular Biology and Biotechnology, and the Institute of Chemistry.	14.6503639000000003	121.072090000000003	mbb-jeepney-stop	264
NIP Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located near the National Institute of Physics.	14.6498031999999991	121.073691999999994	nip-jeepney-stop	265
Swimming Pool Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located near the UP Swimming Pool.	14.6593704000000002	121.072472000000005	swimming-pool-jeepney-stop	266
EEE Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot and Toki.	It is located across the Electrical and Electronics Engineering Institute.	14.6498728000000007	121.068641999999997	eee-jeepney-stop	267
Centennial Residence Hall Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot.	It is located outside the Centennial Residence Hall.	14.6478280999999999	121.062293999999994	centennial-jeepney-stop	268
Biology Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located outside the Institute of Biology.	14.6511755000000008	121.071442000000005	biology-jeepney-stop	269
Arki Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located near the College of Architecture.	14.6514044000000005	121.065680999999998	arki-jeepney-stop	270
Institute of Electrical and Electronics Engineering Parking Lot 2	Parking Areas	A parking lot that can hold about 20 cars.	Located by Velasquez St., beside the IEEE buildings, across the street from the jeepney stop.	14.6500435000000007	121.06823	ieee-parking-lot-2	271
CAL Parking Lot 2	Parking Areas	A parking lot that can accommodate about 40 large vehicles.	Located near Palma Hall, behind the ASCAL Food Kiosks. The lot can be entered through Pardo de Tavera St..	14.6525859999999994	121.068175999999994	cal-parking-lot-2	272
Institute of Mathematics Cafeteria	Food Service	This is a cafeteria that serves 'lutong-bahay' recipes, including rice topping food items.	Located on the first floor of the Institute of Mathematics Main Building, on the side entrance close to the Science Complex Park. Toki Jeepneys stop at a shed that is a short walk away from this cafeteria.	14.6484527999999994	121.071074999999993	inst-of-math-cafeteria	273
Institute of Mathematics Food Kiosk	Food Service	A small kiosk that serves chips, pancit canton, sandwiches, street food, and a choice of drinks.	Located beside the Institute of Mathematics Main Building, near its parking lots.	14.6483048999999994	121.070876999999996	inst-of-math-food-kiosk	274
Sari-sari Stores across Bulwagang Rizal	Food Service	Two small stores across ASCAL, by A. Roces St., that serves sandwiches, drinks, and chips.	Located at the Roxas Ave. - A. Roces St. intersection, across the street from the ASCAL Jeepney Stop.	14.6540450999999994	121.068466000000001	ascal-sari-sari-stores	275
NISMED Canteen	Food Service	This canteen serves anywhere from lutong-bahay recipes, to snacks such as sandwiches, and a variety of chilled drinks. They are operated by the same group that runs the Math cafeteria.	This canteen can be found near the NISMED Parking Lot behind the UP Information Technology Development Center.	14.6514339000000007	121.068031000000005	nismed-canteen	276
Regidor St. Food Kiosk	Food Service	A by-the-road food kiosk that serves pancit canton, sandwiches, and street food.	This kiosk is situated along A. Ma. Regidor St., near Alonso Hall and the UP Integrated School buildings.	14.6523503999999996	121.072800000000001	regidor-st-food-kiosk	277
Vinzons Hall Parking Lots	Parking Areas	Vinzons Hall has two parking lots (one larger than the other). The larger lot has space for 20 cars, while the smaller can hold 5 cars.	The larger lot is located to the side of Vinzons Hall where the organization's tambayans can be located. The smaller lot is located right in front of the entrance to Vinzons Hall.	14.6541204	121.073227000000003	vinzons-hall-parking=lots	278
Bulwagang Rizal Jeepney Stop	Jeepney Stops	This jeepney stop is not in use at the moment.	Located along Roxas Avenue, by the A. Roces St. intersection.	14.6538868000000004	121.067963000000006	bulwagang-rizal-jeepney-stop	279
Kalayaan Jeepney Stop	Jeepney Stops	Jeepney stop for Toki, Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located across the Kalayaan Residence Hall.	14.6586999999999996	121.068000999999995	kalayaan-jeepney-stop	280
Lagmay Hall Jeepney Stop	Jeepney Stops	This jeepney stop is not in use at the moment.	This shed can be found in front of Lagmay Hall (Palma Hall Annex Building) along the Roxas Avenue stretch of the Academic Oval.	14.6538000000000004	121.070999	lagmay-hall-jeepney-stop	281
Melchor Hall Jeepney Stop	Jeepney Stops	This jeepney stop is currently not in use.	Located to the east of Melchor Hall (College of Engineering), along A. Roces St..	14.6562996000000005	121.068000999999995	melchor-hall-jeepney-stop	282
NIGS Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot jeeps.	It is located outside the National Institute of Geological Sciences.	14.6484889999999996	121.069038000000006	nigs-jeepney-stop	283
NSRI Jeepney Stop	Jeepney Stops	Jeepney stop for all jeeps that go within UP Diliman.	It is located outside the Natural Sciences Research Institute.	14.6524286000000004	121.068871000000001	nsri-jeepney-stop	284
OUR Jeepney Stop	Jeepney Stops	Jeepney stop for all jeeps that go within UP Diliman.	It is located outside the Office of the University Registrar.	14.6515999000000008	121.067001000000005	our-jeepney-stop	285
Quezon Hall Jeepney Stop	Jeepney Stops	This jeepney stop is currently not in use.	Located slightly in front of Quezon Hall, along Osmena Avenue on the end that leads to University Avenue.	14.6555003999999993	121.064003	quezon-hall-jeepney-stop	286
School of Economics Jeepney Stop	Jeepney Stops	Jeepneys of the Ikot, Pantranco, Philcoa, and SM North EDSA routes stop at this shed.	Located in front of the UP School of Economics by the concrete signage slab, across the Sunken Garden Grand Stand.	14.6561003000000003	121.072997999999998	school-of-economics-jeepney-stop	287
SURP Jeepney Stop	Jeepney Stops	Jeepney stop for all jeeps that go within the campus.	It is located outside the UP School of Urban and Regional Planning.	14.6569996000000007	121.061995999999994	surp-jeepney-stop	288
University Theater Jeepney Stop	Jeepney Stops	This jeepney stop is currently not in use.	Located along the Osmena Avenue stretch of the Academic Oval in front of the University Theater (Villamor Hall).	14.6562003999999995	121.066001999999997	university-theater-jeepney-stop	289
UPFI Jeepney Stop	Jeepney Stops	Jeepney stop for Toki.	It is located near Villamor Hall and the UP Film Institute.	14.6574001000000003	121.066001999999997	upfi-jeepney-stop	290
Vanguard Jeepney Stop	Jeepney Stops	Jeepney stop for all jeeps that go within UP Diliman.	It is located near the UP Center for Women Studies and the College of Music on Magsaysay Avenue.	14.6576003999999998	121.065002000000007	vanguard-jeepney-stop	291
Vinzons Hall Jeepney Stops	Jeepney Stops	These are three sheds that serve as stops for all routes except Toki and Katipunan.	Located in front of Vinzons Hall near the Sunken Garden Grand Stand.	14.6541996000000001	121.072997999999998	vinzons-hall-jeepney-stops	292
MB 107	Rooms	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-107	293
DMMME 105	Rooms	Room 105 of DMMME	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-105	294
DMMME 108	Rooms	Room 108 of DMMME	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-108	295
Vinzons Hall University Food Service	Food Service	According to the site iskWiki, the University Food Service (UFS) "provides food that is acceptable, nutritious, safe, wholesome and reasonably priced to its University clientele of students, faculty and administrative personnel. It is managed by professional dietitians and nutritionists." They are a university organization that operates a canteen in Vinzons Hall, and also provides the food that UPD dormitories serve to its residents.	Located in the first floor of Vinzons Hall, to the immediate right of the entrance.	14.6541262000000003	121.073502000000005	vinzons-hall-univ-food-service	296
Bocobo Hall Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Toki, Katipunan, and Pantranco/PhilCoA/SM North jeeps.	It is located near Bocobo Hall.	14.6570844999999998	121.072982999999994	bocobo-hall-jeepney-stop	297
Molave Residence Hall Jeepney Stop	Jeepney Stops	Jeepney stop for Ikot, Katipunan, PHILCOA, Pantranco and SM North EDSA routes.	It is located outside the Molave Residence Hall.	14.6577902000000009	121.068466000000001	molave-residence-hall-jeepney-stop	298
SS Lecture Hall 1	Rooms	A large hall, airconditioned.	Located on the 1st floor of the School of Statistics. Go left from the entrance of SS, then take the last right. Lec Hall 1 is at the end of the hallway, on the right side.	14.6512002999999993	121.067001000000005	ss-lecture-hall-1	299
SS Lecture Hall 2	Rooms	A large hall, airconditioned.	Located on the 2nd floor of the School of Statistics. Go up the first flight of stairs from the entrance, then turn right, and right again. Lec Hall 2 is at the end of the corridor, on the right side.	14.6512002999999993	121.067001000000005	ss-lecture-hall-2	300
AH 226	Rooms	This room has a seating capacity of 40 people. An air-conditioning system can be found inside.	Located on the 2nd floor, left wing of Abelardo Hall.	14.6567001000000001	121.065002000000007	ah-226	301
CMC - B Viewing Room	Rooms	Medium capacity, airconditioned 	from the entrance, go left	14.6564999	121.065002000000007	cmc---b-viewing-room	302
PH Multimedia Room (PH 400)	Rooms	A multimedia room with large seating capacity. Has air-conditioning.	Located on the 4th floor of Palma Hall. From the lobby of Palma Hall, ascend to the 4th floor and turn right.	14.6534996	121.069999999999993	ph-multimedia-room-(ph-400)	303
CMC - Auditorium	Rooms	Large capacity	The Auditorium is in a separate building from where the main entrance is. You should be able to see an exit at the back of the main building which goes straight to the building that houses the auditorium.	14.6564999	121.065002000000007	cmc---auditorium	304
CMC - PhilStar Room	Rooms	medium capacity	From the entrance, go to the second floor. There will be a short hallway to the left.	14.6564999	121.065002000000007	cmc---philstar-room	305
Law Center 3rd Floor Lobby	Rooms	Airconditioned, office-like room with medium capacity	From the front entrance of Bocobo Hall, head inside all the way to back stairs. Go up until the 3rd floor and head through the glass doors in between the two bonsai plants.	14.6569996000000007	121.071999000000005	law-center-3rd-floor-lobby	306
SOLAIR 12	Rooms	Small capacity	Go straight from the entrance. Room 12 should be beside the canteen area in the 1st floor.	14.6571999000000002	121.061995999999994	solair-12	307
SOLAIR 11	Rooms	This room has a seating capacity of 40 people. A whiteboard and air-conditioning systems can be found inside.	Located on the 1st floor of the SOLAIR building.	14.6571999000000002	121.061995999999994	solair-11	308
Law Center 1st Floor Lobby	Rooms	Large capacity	From the Bocobo hall front entrance, head inside and it will be the room to the right with the large painting in the middle	14.6569996000000007	121.071999000000005	law-center-1st-floor-lobby	309
Institute of Mathematics Main Building (MB)	College Buildings	Formerly known as the Department of Mathematics, the Institute is the largest institute in the University of the Philippines System. It nurtures about 300 undergraduate and 200 graduate students, and handles all the mathematics courses of some 5000 undergraduate students in UP Diliman.	The Institute of Mathematics' main building can be located within the National Science Complex, along C.P. Garcia Ave. Toki jeepneys have a stop at a waiting shed just outside the building's parking lot.\r\nThe building has two entrances, one at the side of the building next to the cafeteria, and a larger entrance at the side of the building facing C.P. Garcia.	14.6485996000000007	121.070999	institute-of-mathematics-main-building-(mb)	310
CAL 211	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-211	311
CAL 212	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-212	312
CAL 213	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 2nd floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-213	313
CAL 501	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 5th floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-501	314
CAL 502	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 5th floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-502	315
CAL 503	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 5th floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-503	316
Plaridel Hall (College of Mass Communication - CMC)	College Buildings	Plaridel Hall has housed the College of Mass Communication since 1966.	Ylanan Road, University of the Philippines\r\nDiliman, Quezon City 1101; beside the College of Music	14.6564999	121.065002000000007	plaridel-hall-(college-of-mass-communication---cmc)	317
CAL 510	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 5th floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-510	318
CAL 512	Rooms	This room has a seating capacity of 40 people. An air-conditioning system, a whiteboard, and a projector can be found inside.	Located on the 5th floor of the College of Arts and Letters building.	14.6527004000000005	121.067001000000005	cal-512	319
MB 105	Rooms	This room has a seating capacity of 40 people. A chalkboard and airconditoner can be found inside.	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-105	320
MB 108	Rooms	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	Located on the 1st foor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-108	321
MB 106	Rooms	This room has a seating capacity of 40 people. A chalkboard and airconditioner can be found inside.	Located on the 1st foor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-106	322
ICE 313	Rooms	ICE Classroom 313	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-313	323
MB 115	Rooms	This room has a seating capacity of 40 people.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-115	324
College of Fine Arts (CFA)	College Buildings	The University of the Philippines College of Fine Arts (UPCFA) is the oldest arts and design educational institution in the country. For more than a century now, the UP College of Fine Arts remains steadfast in its vision to be the eminent learning institution for arts and design, imbued with a deep sense of humanity that inspires the Filipino to strive for excellence. The UPCFA commits itself to the task of nurturing career artists dedicated to the perfection of their craft and the enrichment of Philippine society. The main building of UPCFA is Bartlett Hall. 	The college can be located along E. Jacinto St. An Ikot jeepney ride can drop you off immediately in front of the building.	14.6522998999999992	121.061995999999994	college-of-fine-arts-(cfa)	325
MB 117	Rooms	This room has a seating capacity of 40 people. 	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-117	326
MB 116	Rooms	This room has a seating capacity of 40 people.	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-116	327
MB 120	Rooms	This room has a seating capacity of 40 people.	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-120	328
MB 121	Rooms	This room has a seating capacity of 40 people. 	Located on the 1st floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-121	329
MB 313	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-313	330
MB 314	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-314	331
MB 319	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-319	332
MB 320	Rooms	This room has a seating capacity of 40 people. A chalkboard and electric fans can be found inside.	Located on the 3rd floor of the Institute of Math Main Building.	14.6485996000000007	121.070999	mb-320	333
Melchor Hall Parking Lot 1 (Engineering)	Parking Areas	Melchor Hall's larger parking lot. Can hold more or less 30 vehicles.	Located behind Melchor Hall's left wing.	14.6567001000000001	121.069999999999993	melchor-hall-parking-lot-1-(engineering)	334
Abelardo Hall Annex (College of Music Annex)	College Buildings	Abelardo Hall Annex houses rooms of the College of Music aside from those in the main hall. The college serves as a catalyst in national development by providing quality and professional instruction in diverse areas of music specialization. Its college administration and faculty are committed to provide a meaningful and personally relevant learning experience of music, as well as to guide students towards academic excellence. 	Abelardo Hall Annex is located behind the main Abelardo Hall building which is situated across Ylanan Street. You can ride any jeepney within the campues to get near this building.	14.6570996999999998	121.065002000000007	abelardo-hall-annex-(college-of-music-annex)	335
CAL Comfort Rooms 	Comfort Rooms	Comfort rooms of College Arts and Letters (CAL)	After entering the building by going up the stairs, turn immediately right. There will be a comfort room for both genders at the same place on every floor.	14.6526527000000009	121.067229999999995	cal-comfort-rooms-	336
CA Parking Lot 1	Parking Areas	Parking Area of the College of Architecture (CA)	Directly across the street from the College of Architecture	14.6517906	121.065430000000006	ca-parking-lot-1	337
CA Comfort Room	Comfort Rooms	Comfort room of the Architecture Lab (CA)	Enter the Archi Lab turn right, head to the corner, turn left, head to the corner. It's next to some stairs.	14.6514626000000003	121.064673999999997	ca-comfort-room	338
Malcolm Hall Comfort Rooms	Comfort Rooms	Male and female comfort rooms are on opposite wings (male is on the left side facing into the building from the entrance, female is on the right side).	There is a male comfort room on the left-side stairs (facing inside from the main entrance) and a female comfort room on the right-side stairs on every floor in the building.	14.6566372000000005	121.071869000000007	malcolm-hall-comfort-rooms	339
NCPAG Comfort Rooms	Comfort Rooms	There are comfort rooms on each floor of the building. The male comfort rooms are on the right side. The female comfort rooms are on the left side.	On every floor, the male comfort rooms are on the left side (facing into the building) and the female comfort rooms are on the right side.	14.6564473999999993	121.060462999999999	ncpag-comfort-rooms	340
Plaridel Hall (CMC) Comfort Rooms	Comfort Rooms	Comfort rooms in Plaridel Hall	There are comfort rooms in the lobby (located near the door leading outside, towards the auditorium) and comfort rooms near the auditorium itself. The male comfort room in the lobby is located on the left side while the female comfort room is located on the right side. The comfort rooms near the auditorium are in a hallway on the left, facing the auditorium.	14.6569213999999999	121.064514000000003	plaridel-hall-(cmc)-comfort-rooms	341
Benton Hall	College Buildings	Benton Hall is located to the east of Palma Hall, also facing the Academic Oval. It houses the Center for International Studies (CIS), as well as offices like the Office of Anti-Sexual Harassment (OASH) and the UP Diliman Gender Office (UPDGO). - iskWiki!	Directly to the left of Palma Hall when facing its entrance	14.6536387999999995	121.070892000000001	benton-hall	395
UP Integrated School – 7-12 Building (UPIS)	College Buildings	The UP Integrated School (UPIS) is one of the country's pioneer integrated schools, a school of the UP College of Education. It has been offering an integrated curriculum since its inception in 1976, and now offers a curriculum from Kindergarten to Grade 12.	The UPIS Grade 7-12 building is located at the corner of Quirino Avenue and Regidor St.	14.6527662000000003	121.073134999999994	up-integrated-school-–-7-12-building-(upis)	342
UPIS 110	Rooms	Room 110 of UPIS 7-12.	Located on the first floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-110	343
UPIS 111	Rooms	Room 111 of UPIS 7-12.	Located on the first floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-111	344
DMMME ANSyD	Rooms	Active Nanomaterials Synthesis and Devices Laboratory in DMMME	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-ansyd	345
DMMME Mechanical Testing Section	Rooms	Name is of location is self-explanatory	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-mechanical-testing-section	346
DMMME Rubber Processing Laboratory	Rooms	Name is of location is self-explanatory	Located on the 1st floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-rubber-processing-laboratory	347
EEE 428	Rooms	EEE 428 is the Electric Power Instructional Laboratory	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-428	348
EEE 429	Rooms	EEE 429 is the Electricity Market Instructional Laboratory	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-429	349
NIMBB 100	Rooms	NIMBB 100 is an Administration Office	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-100	350
Law Center Comfort Rooms	Comfort Rooms	Comfort rooms in Law Center, Bocobo Hall.	There are male and female comfort rooms on the left and right sides on the first two floors. On the third floor turning right from the stairs, the comfort rooms are on the right side.	14.6569996000000007	121.071999000000005	law-center-comfort-rooms	351
UPIS 1st Floor Comfort Rooms	Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	On the first floor, there are female, male, and PWD restrooms.	14.6527995999999998	121.072997999999998	upis-1st-floor-comfort-rooms	352
UPIS 2nd Floor Comfort Rooms	Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	On the second floor, there are female and male restrooms.	14.6527995999999998	121.072997999999998	upis-2nd-floor-comfort-rooms	353
UPIS 3rd Floor Comfort Rooms	Comfort Rooms	Comfort rooms inside the UPIS 7-12 building.	On the third floor, there are female and male restrooms.	14.6527995999999998	121.072997999999998	upis-3rd-floor-comfort-rooms	354
UPIS 113	Rooms	Room 113 of UPIS 7-12.	Located on the first floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-113	355
UPIS 120	Rooms	Room 120 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-120	356
UPIS 121	Rooms	Room 121 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-121	357
UPIS 122	Rooms	Room 122 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-122	358
UPIS 123	Rooms	Room 123 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-123	359
UPIS 124	Rooms	Room 124 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-124	360
UPIS 125	Rooms	Room 125 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-125	361
UPIS 126	Rooms	Room 126 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-126	362
UPIS 127	Rooms	Room 127 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-127	363
UPIS 128	Rooms	Room 128 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-128	364
UPIS 129	Rooms	Room 129 of UPIS 7-12.	Located on the second floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-129	365
UPIS 130	Rooms	Room 130 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-130	366
UPIS 131	Rooms	Room 131 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-131	367
UPIS 132	Rooms	Room 132 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-132	368
UPIS 133	Rooms	Room 133 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-133	369
UPIS 134	Rooms	Room 134 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-134	370
UPIS 135	Rooms	Room 135 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-135	371
UPIS 136	Rooms	Room 136 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-136	372
UPIS 137	Rooms	Room 137 of UPIS 7-12.	Located on the third floor of the UPIS 7-12 building.	14.6527995999999998	121.072997999999998	upis-137	373
UP Alumni Center (Fonacier Hall)	College Buildings	UP Alumni Center	Fonacier Hall is located along Magsaysay Ave., beside the Bahay ng Alumni.	14.6577386999999995	121.065894999999998	up-alumni-center-(fonacier-hall)	374
UP Center for Ethnomusicology	Rooms	UP Center for Ethnomusicology	It is located on the second floor (Rm 218-220) of the College of Music	14.6567001000000001	121.065002000000007	up-center-for-ethnomusicology	375
Department of Military Science and Tactics Complex (DMST)	College Buildings	The DMST Complex houses the Department of Military Science and Tactics and the UP ROTC	The DMST Complex is located on Ylanan st., near the College of Human Kinetics.	14.6588239999999992	121.064209000000005	department-of-military-science-and-tactics-complex-(dmst)	376
Balay Atleta	College Buildings	Balay Atleta is a dormitory for the athletes of UP Diliman	Balay Atleta is located along Apacible St., across the Cash Office	14.6603708000000008	121.070319999999995	balay-atleta	377
Viladolid Hall	College Buildings	Environmental Science Building	Along Lakandula street beside Albert Hall	14.6527004000000005	121.064003	viladolid-hall	378
UP Lagoon Beta Epsilon Theatrum	College Buildings	Aside from the forest glades that adorn the area, the UP Lagoon is now landscaped with decorative plants complete with benches, tables, wooden bridges, and paved pathways with street lamps. The presence of the Beta Theatrum (courtesy of the Beta Epsilon Fraternity) in the area makes it an ideal activity center for cultural endeavors such as concerts and variety shows throughout the year. - http://iskwiki.upd.edu.ph/index.php/UP_Lagoon_and_the_Academic_Oval#.W_FTHOgzZPY	Behind University Amphitheatre. Walkways toward it can be found at its adjacent sides in Roxas Ave. and Osmena Ave.	14.6547269999999994	121.066612000000006	up-lagoon-beta-epsilon-theatrum	394
College of Science Administration	College Buildings	CS Administration.	Located in National Science Complex.	14.6497784000000006	121.070899999999995	college-of-science-administration	452
Diliman Interactive Learning Center (DILC)	College Buildings	The Interactive Learning Center or ILC Diliman is under the Office of the Vice Chancellor for Academic Affairs (OVCAA) mandated to help in the development of faculty expertise in the use of technologies in teaching and learning.  It is located at Magsaysay Avenue corner Apacible Street.  ILC Diliman operates the on-line learning management system of the university, as well as promotes the production and use of interactive instructional materials.  ILC Diliman aims to facilitate and supplement teaching and learning through the use of education technologies.  It aspires for the mainstreaming of the development, application and promotion of interactive learning.  It strives to go beyond producing products and delivering services through the active and collaborative participation of the entire academic community.  ILC Diliman: promoting education technologies for Invaluable, Leading-edge, Collaborative and Dynamic teaching and learning!\r\n\r\n-from the ILC Diliman Website	The Diliman Interactive Learning Center is located across Ipil Residence Hall, beside the Computer Center.	14.6573876999999992	121.070426999999995	diliman-interactive-learning-center-(dilc)	379
College of Music - Dance Studio	College Buildings	The Dance Studio is where students from the College of Music practice dance performances.	The Dance Studio is a small building located behind Plaridel Hall, directly beside the UP Center for Women Studies	14.6575003000000006	121.065002000000007	college-of-music---dance-studio	380
Quezon Hall	College Buildings	Aside from being the home the Oblation, the Quezon Hall is the front-most building of the university from the University Avenue. It houses many of the administrative offices for the entire university. - iskWiki!	It's right behind the Oblation	14.6548996000000002	121.065002000000007	quezon-hall	381
Coral Building (Office of the Campus Architect) (OCA)	College Buildings	The Office of the Campus Architect is the infrastructure and physical planning delivery agency of the University of the Philippines Diliman. - www.oca.upd.edu.ph	Along Lakandula Street beside Villadolid Hall, to the corner of its intersection with Delos Reyes Street	14.6527004000000005	121.064003	coral-building-(office-of-the-campus-architect)-(oca)	382
Supply and Property Managment Office (SPMO)	College Buildings	As a service unit of the University, the Supply and Property Management Office (SPMO) is the overall in charge in the acquisition of new properties and equipment, its utilization and the disposition of unserviceable or no longer needed equipment of the University. - spmo.upd.edu.ph	Behind Albert Hall	14.6522998999999992	121.063004000000006	supply-and-property-managment-office-(spmo)	383
Diliman Legal Office (DLO)	Rooms	Office of Atty. Maria Luz R. Raval, Chief Legal Officer	Enter Quezon Hall from the front Oblation entrance and navigate to the right-most room at its back	14.6548996000000002	121.065002000000007	diliman-legal-office-(dlo)	384
ICE 314	Rooms	ICE Classroom 314	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-314	385
ICE 315	Rooms	ICE Classroom 315	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-315	386
Human Resources Development Office 	Rooms	Provides responsive and excellent service in the development and administration of effective human resource management through implementation of rules and policies on: recruitment, appointment and separation process, personnel benefits, training, skills and professional development, rationalized manpower and staffing pattern, monitoring of Administrative and REPS performance and management of personnel records and database system.\r\n- hrdo.upd.edu.ph \r\n	Down the 1st floor corridor of the right wing of Quezon Hall	14.6548996000000002	121.065002000000007	human-resources-development-office-	387
Office of the Chancellor (OC)	Rooms	Office of the UP Diliman Chancellor	1st room found at the 2nd floor of the south (right) wing of Quezon Hall	14.6548996000000002	121.065002000000007	office-of-the-chancellor-(oc)	388
Office of the Vice Chancellor for Administration (OVCA)	Rooms	The OVCA administers the university’s physical, financial and human resources. Under it are the Human Resources Development Office (HRDO), Accounting Office, Budget Office, Cash Office, Supply and Property Management Office, and the PABX and Utilities Monitoring Team - upd.edu.ph/about/administration/	At the end of the 1st floor of the south (right) wing of Quezon hall	14.6548996000000002	121.065002000000007	office-of-the-vice-chancellor-for-administration-(ovca)	389
Office of the Vice Chancellor for Student Affairs (OVCSA)	Rooms	The OVCSA is tasked to attend to several non-academic needs of students such as counseling, discipline, scholarships, food service, housing, tutorials/learning centers, student/graduate assistantships, loans, organizations and visa requirements for international students - upd.edu.ph/about/administration/	The first room through the 1st floor corridor of the south (right) wing of Quezon Hall	14.6548996000000002	121.065002000000007	office-of-the-vice-chancellor-for-student-affairs-(ovcsa)	390
UP Diliman Police (UPDP)	College Buildings	The primary missions of the UPDP are to maintain peace and order, secure and protect lives and property, enforce basic laws, applicable Quezon City Ordinances, and University Rules and Regulations including policies and standards; and to perform such other functions relative to the general safety and security of students, employees, and residents in the U.P. Diliman Campus. - iskWiki!	Along Epifania Delos Santos Street, towards the opposite side of the College of Architecture Building	14.6520243000000008	121.065453000000005	up-diliman-police-(updp)	391
Jorge B. Vargas Museum and Filipiniana Research Center	College Buildings	A center for Philippine art and culture, the Jorge B. Vargas Museum and Filipiniana Research Center’s main thrusts are research, exhibition and education. It enjoys the distinction of being one of the art repositories in the country embracing the entire range of Philippine artistic creativity from the 1880s to the 1960s. Through its collection of oil paintings, watercolors, pastels, drawings, and sculptures, Vargas Museum aims to contribute towards the appreciation of the country’s artistic heritage and to foster an awareness of the history of Philippine art. - vargasmuseum.wordpress.com/the-museum/	1st major building across Roxas Avenue of the University Oval, immediately after the 1st jeepney stop, just before the ruins of the previous Faculty Center (Bulwagang Center)	14.6533002999999997	121.067001000000005	jorge-b--vargas-museum-and-filipiniana-research-center	392
University Ampitheater	College Buildings	The University Amphitheater is a semi-circular open area located at the back of Quezon Hall.  While it is not a complete round or oval space, it has the main feature of an amphitheater—rising tiers—with flower boxes to demarcate the area.  The development of what was once a plain field into the Amphitheater commenced in the 1960s.  It is where the most awaited rite symbolizing the culmination of the students’ work in the University—the General Commencement Exercises—continues to be held with the Quezon Hall as the seemly stage.  The Lantern Parade also winds up at the Amphitheater where all participating groups converge and present their song, dance and other numbers. - https://upd.edu.ph/sites-of-interest/	Behind Quezon Hall	14.6549206000000005	121.065680999999998	university-ampitheater	393
Computational Science Research Center (CSRC)	College Buildings	Computational Science Research Center.	Located in National Science Complex.	14.6498183999999991	121.071465000000003	computational-science-research-center-(csrc)	453
UP Diliman Gender Office (UPDGO)	Rooms	The UPDGO has been giving Gender Sensitivity Trainings to faculty and students from different colleges; organizing fora on gender topics and issues; advocating for the integration of gender in the curriculum; providing list of courses on women, gender and sexuality; providing counseling services regardless of gender or sexual orientation. It has also participated in researches on gender and sexuality. It is working in partnership with the College of Law Office of Legal Aid, UP Health Service, UP Police and the Office of Guidance and Counseling in its efforts to respond to gender-related crisis situations. - dgo.upd.edu.ph/about-us-en-us/	Enter Benton Hall from the right entrance. Along the hallway, you should see a sign pointing to a passage leading to some stairs. UPDGO will be at the 2nd floor of those stairs.	14.6535996999999991	121.070999	up-diliman-gender-office-(updgo)	396
Kamia Residence Hall	College Buildings	Kamia Residence Hall was established in 1961 as a dormitory for upperclassmen. It is beside another dormitory called the Sampaguita Residence Hall. The two dormitories are connected by a covered walk. The dormitory has a basement, first floor, and second floor. Every floor is equipped with a communal toilet and a utility room. There is also a piano, a television, an intercom system and a public telephone.	Along Quirino Ave., just before the jeepney stop behind the CASAA Temporary Food Court	14.6520165999999996	121.070480000000003	kamia-residence-hall	397
Office of Anti-Sexual Harassment (OASH)	Rooms	The OASH is in charge of designing and implementing a continuing program of activities and initiatives for the prevention of sexual harassment; undertaking information and educational activities to ensure that the University policy, rules, regulations, and procedures on anti-sexual harassment are disseminated and become part of academic culture; and formulating procedures of such nature as to elicit trust and confidence on the part of interested parties in resolving problems arising from cases or incidents of sexual harassment, including counseling and grievance management - oash.upd.edu.ph/?page_id=396	Same place as the UP Diliman Gender Office. On the 2nd floor of the Benton Hall left wing	14.6535996999999991	121.070999	office-of-anti-sexual-harassment-(oash)	398
ICE 316	Rooms	ICE Classroom 316	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-316	399
Sampaguita Residence Hall	College Buildings	Sampaguita Residence Hall, situated along Quirino Avenue across the Zoology building and adjacent to the Kamia Residence Hall, was in June 1957 referred to as the UP Women's South Dorm II. Three years later, it was known as Halcon Hall, when acting UP President Virata designated it as such. It was only in 1962 that its present name was adopted. Mrs. Luz D. Padilla, the matron who had gone through the nine-year period during which the dorm's name was changed several times, handed over the administration of the dorm to Miss Carmelita Ynares, who opted for a two year term. Miss Erlinda N. Acosta took charge of Sampaguita Residence Hall in September 1967. Presently, Mrs. Teresita Ngayan manages the dormitory. -iskWiki!	Along Quirino Ave., behind the Ikot jeepney stop, beside Kamia residence hall	14.6521082000000007	121.070983999999996	sampaguita-residence-hall	400
UP Main Library (Gonzales Hall)	College Buildings	The Main Library, which is the seat of library administration, is situated at Gonzalez Hall in the middle of the academic oval. This was intended as to portray that it is the "heart" of all the colleges present around the academic oval. It is organized into three major divisions which covers the various functional sections: (a) Technical Services Division which formulates and adopts standard acquisition, cataloging and indexing policies and procedures, (b) Administrative Services which provides support to the functional sections/units of the Library, and (c) User Education and Services Division which lends books and provides reference, research, and bibliographic services; maintains and preserves books, documents, and archival materials; undertakes user education programs; and maintains computerized database applications. -iskWiki!	Behind the Sunken Garden. Pathways connect it to Osmena Ave. and to Roxas Ave.	14.6550540999999992	121.071067999999997	up-main-library-(gonzales-hall)	401
Center for International Studies	Rooms	Directory: 9818500 local 2460 and 2462 - iskWiki!	Inside Benton Hall left wing. The first doorway from the 1st floor entrance near Palma Hall.	14.6535996999999991	121.070999	center-for-international-studies	402
Diliman Learning Resource Center (DLRC)	Rooms	Learning Resource Centers (LRCs) were established by the UP Board of Regents on April 17, 1997 to supplement, complement and coordinate all learning assistance programs and instructional support services to students in each campus and to ensure that the goal of promoting academic excellence will be realized in a more caring and nurturing environment. The Diliman Learning Resource Center (DLRC), simultaneous with LRCs of other autonomous UP units, was institutionalized on April 28, 1997. It is supervised by the Office of the Vice Chancellor for Student Affairs and is headed by a Director.  - iskWiki!	From the Kamia Hall entrance, turn right, go up some stairs and enter the nearest door.	14.6520004000000004	121.069999999999993	diliman-learning-resource-center-(dlrc)	403
UP DOST Core Group	Rooms	TheUP-DOST Core Group was established in 1997 through a Memorandum of Agreement between the Department of Science and Technology-Science EducationInstitute (DOST-SEI) and the UP Diliman. Itsmain function is to attend to the Republic Act 7687 scholars of UP Diliman. Monitoring of the students' academic performance, release of their stipends, andmanagement of the Science and Technology Learning Assistance Program has becomepart of the service that DOST offers the students. Located at the DLRC-2 office, Kamia Residence Hall, DOST also offers 10 computers with printers acquired in 1998 for the use of the scholars. - iskWiki!	Same room as the DLRC. The first door on top of some stairs to the right of Kamia Residence Hall entrance	14.6520004000000004	121.069999999999993	up-dost-core-group	404
Bulwagan ng Dangal	College Buildings	The Bulwagan ng Dangal is a University Heritage Museum.	Beside UP Main Library towards the Roxas Ave. side.	14.6543454999999998	121.071037000000004	bulwagan-ng-dangal	405
Natural Sciences Research Institute (NSRI) (Miranda Hall)	College Buildings	The NSRI, recognizing the importance of science and technology (S&T) in the advancement of our country has continued to support the research endeavors of the NSRI in-house researchers and faculty-scientists of the UP Diliman College of Science, in particular the Institute of Biology, Institute of Chemistry, Institute of Environmental Science and Meteorology and the Institute of Mathematics. Through the years, the NSRI has supported projects on diverse fields of basic and applied sciences like environmental and medical microbiology, aquaculture, genetics, drug discovery, forensic biology, biochemistry, materials science, mathematics, etc. Indeed, the NSRI sees that all inclusive growth of S&T will lead to a better future for Filipinos. Our scientists have time and again proved how research and innovation can address cross-cutting issues which affect people’s lives. They do not lose sight of continually improving their craft with the goal of delivering quality research that would benefit the country. - nsri.upd.edu.ph/	On the corner of the intersection between Quirino Ave. and Velasquez Ave.	14.6521396999999993	121.068984999999998	natural-sciences-research-institute-(nsri)-(miranda-hall)	406
Yakal Residence Hall	College Buildings	a co-ed dormitory in UP Diliman with 49 male rooms (4 males per room) and 92 female rooms (2 females per room)	Yakal Residence Hall is located on Magsaysay Ave. between the Molave Residence Hall and Ipil Residence Hall.	14.6578817000000008	121.069168000000005	yakal-residence-hall	407
Office of the University Registrar	College Buildings	The Office of the University Registrar is a vital arm of the University. It is the official recorder and keeper of records of the students.	The Office of the University Registrar is located at the corner of T.M. Kalaw and Quirino. The Ikot passes by it, as do the Philcoa/Pantranco/SM North jeeps, although only when coming from outside the campus. The Katipunan jeep passes by it after getting on on the northern side of UP, but not when getting on the jeep on the southern side of UP.	14.6516141999999991	121.066513	office-of-the-university-registrar	408
Acacia Residence Halls	College Buildings	A co-ed dormitory in UP Diliman	Acacia is located along G. Apacible St., across the Parish of Holy Sacrifice.	14.6589335999999992	121.070380999999998	acacia-residence-halls	409
College of Arts and Letters Faculty Center	College Buildings	This building houses is where the offices of CAL faculty members are located.	The CAL Faculty Center is located on G. Apacible St., between Acacia Residence Halls and Ipil Residence Halls	14.6584625000000006	121.070480000000003	college-of-arts-and-letters-faculty-center	410
Ipil Residence Hall	College Buildings	Ipil Dormitory is an all male dorm located in UP Diliman	Ipil Dormitory is located on the corner of Magsaysay Ave. and G. Apacible St. The entrance that is currently being used is along G. Apacible St.	14.6580706000000003	121.070212999999995	ipil-residence-hall	411
Office of Student Housing	Rooms	The Office of Student Housing oversees all dormitories in UP Diliman	The Office of Student Housing is located on the second floor of the Acacia Residence Halls lobby. 	14.6589003000000009	121.069999999999993	office-of-student-housing	412
Espiritu Hall (College of Law Library)	College Buildings	Espirtu Hall is the library for the College of Law	Espiritu Hall is located along Magsaysay Ave., beside Bocobo Hall.	14.6569442999999993	121.072327000000001	espiritu-hall-(college-of-law-library)	413
Sanggumay Residence Hall	College Buildings	Sanggumay Residence Hall is an all female dormitory in UP Diliman	Sanggumay Residence Hall is located along A. Roces St. across Kalayaan Residence Hall	14.6585522000000008	121.068245000000005	sanggumay-residence-hall	414
Kalayaan Residence Halls	College Buildings	Kalayaan Residence Hall is the freshman dorm in UP Diliman	Kalayaan Residence Halls is located on A. Roces St., across Sanggumay Residence Halls.	14.6588984	121.068862999999993	kalayaan-residence-halls	415
Molave Residence Halls	College Buildings	Molave Residence Halls is an all male dormitory in UP Diliman	Molave is located on the corner of Magsaysay Ave. and A. Roces St.	14.6578397999999996	121.067711000000003	molave-residence-halls	416
Sunken Garden	Jeepney Stops	The General Antonio Luna Parade Grounds aka Sunken Garden is a large grassy open space for recreation and events.	Located off the Academic Oval, behind the Main Library.	14.6549748999999991	121.072204999999997	sunken-garden	417
Lagmay Hall (LH) (Palma Hall Annex)	College Buildings	Lagmay Hall, previously named Palma Hall Annex, is home to the UP Department of Psychology. Lagmay was the Department’s longest-serving chair. - https://upd.edu.ph/~updinfo/may15/articles/PHAN_is_now_AV_Lagmay_Hall.html	Directly beside Palma Hall to the east.	14.6535996999999991	121.070999	lagmay-hall-(lh)-(palma-hall-annex)	418
UPFI Film Center	College Buildings	This is the Film Center of the UP Film Institute.	The UP Film Institute Film Center is located along Osmeña Ave., beside the UP Carillion Tower.	14.6562242999999999	121.063598999999996	upfi-film-center	419
Church of the Risen Lord	College Buildings	The Church of the Risen Lord is a church located in UP Diliman. There is a function hall on the second floor of the building to the right of the entrance.	The Church of the Risen Lord is located along Laurel Ave., beside the UP Health Service.	14.6597004000000002	121.071999000000005	church-of-the-risen-lord	420
Parish of The Holy Sacrifice	College Buildings	The Parish of The Holy Sacrifice is a church located in UP Diliman.	The Parish of Holy Sacrifice is located on the corner of G. Apacible St. and Laurel Ave., across from the Acacia Residence Halls.	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice	421
UP School of Economics - Philippine Center for Economic Development (PCED)	College Buildings	The Philippine Center for Economic Development (PCED) was created on 15 March 1974 by Presidential Decree (PD) No. 453 with the primary responsibility of  giving “…financial and moral support to the research, teaching, training, and other programs of the School of Economics, University of the Philippines.” Through the PCED, the UPSE undertakes its academic functions at a larger scale while still maintaining a high degree of independence, relying on faculty initiative as the prime means of developing competent training and research.\r\n\r\n-PCED Website	The PCED Building is located along Osmeña Ave., near the Sunken Garden and beside the Cesar E.A. Virata School of Business.	14.6559000000000008	121.073997000000006	up-school-of-economics---philippine-center-for-economic-development-(pced)	422
National Institute for Science and Mathematics Education Development (NISMED)	College Buildings	Established in 1964 as the Science Teaching Center, NISMED has many facilities to accommodate various science teaching activities, and is a venue for many seminars and talks.	NISMED is on Quirino Avenue, across from the Office of the University Registrar. All jeepneys pass by it.	14.6519002999999994	121.068000999999995	national-institute-for-science-and-mathematics-education-development-(nismed)	423
UP National Center for Transportation Studies (UP NCTS)	College Buildings	NCTS offers technical expertise on traffic engineering and transportation planning, and advocates environmentally sustainable transport (EST), including low carbon transport, road safety and people-friendly transport infrastructure.\r\n\r\n- UP Diliman Website	UP NCTS is located along G. Apacible St., behind the UP Computer Center.	14.6569699999999994	121.069953999999996	up-national-center-for-transportation-studies-(up-ncts)	424
Juinio Hall (National Engineering Center)	College Buildings	The NEC serves as the UP College of Engineering's research and extension arm.\r\n\r\n- UP NEC Website	Juinio Hall is located along Osmeña Ave., in between Melchor Hall and Malcolm Hall.	14.6564379000000002	121.071090999999996	juinio-hall-(national-engineering-center)	425
Vidal A. Tan Hall	College Buildings	Vidal A. Tan Hall is an office building of the University of the Philippines. It contains, among other things, the Information Technology Development Center (ITDC).	Vidal A. Tan Hall is on Quirino Avenue, next to NISMED.	14.6522141000000001	121.068213999999998	vidal-a--tan-hall	426
PAUW Child Study Center	College Buildings	The PAUW Child Study Center, also called the Child Care Center, is a preschool run by the Philippine Association of University Women.	Located on Pardo de Tavera Street, a short distance from the Office of the University Registrar.	14.6498031999999991	121.066283999999996	pauw-child-study-center	427
Benitez 200	Rooms	Room 200 of Benitez Hall	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-200	480
Benitez 201	Rooms	Room 201 of Benitez Hall	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-201	481
Institute of Civil Engineering Cafeteria	Food Service	This spacious cafeteria can serve about 150 heads at any one time. There are three food stalls to choose from, with all items offered at most reasonable prices.	Located in the UP Engineering Complex, near the Executive House, a short walk from the Pardo de Tavera and Maramag Streets' intersection.	14.6487589000000007	121.065987000000007	institute-of-civil-engineering-cafeteria	428
Institute of Civil Engineering (ICE)	College Buildings	ICE is an institute under the College of Engineering. The complex is composed of the Office and Classroom Wing, Structural Engineering and Construction Engineering Management Laboratories, Water Resources Engineering and Geotechnical Engineering Laboraotries, Environment and Energy Engineering and a Fire Laboratory.	ICE is at the corner of Pardo de Tavera and C. P. Garcia.	14.6486139000000009	121.065978999999999	institute-of-civil-engineering-(ice)	429
Executive House	College Buildings	The Executive House is the residence of the UP President.	It is located on Maramag, off from Pardo de Tavera.	14.6492558000000006	121.067206999999996	executive-house	430
GT Toyota Asian Center	College Buildings	The University of the Philippines Asian Center (also referred to as UP Asian Center or UP AC) is a degree-granting unit of the University of the Philippines, and is the only unit of the university with a regional area of specialization. The Asian Center offers multidisciplinary graduate programs on Asian Studies and on Philippine Studies.\r\n\r\n-Wikipedia	The GT Toyota Asian Center is located along Magsaysay Ave., beside Romulo Hall.	14.6571236000000003	121.073936000000003	gt-toyota-asian-center	431
GT Toyota Asian Center Auditorium	Rooms	Auditorium located at the GT Toyota Asian Center	The Auditorium is located inside the complex, right across from the gate.	14.6570996999999998	121.073997000000006	gt-toyota-asian-center-auditorium	432
College of Engineering Admin Office	Rooms	The admin office for the College of Engineering	The admin office is located on the first floor, on the right side of the lobby.	14.6565999999999992	121.069999999999993	college-of-engineering-admin-office	433
College of Engineering Library I	Rooms	The College of Engineering library located at Melchor Hall.	The College of Engineering Library is located right across the main entrance of Melchor Hall.	14.6565999999999992	121.069999999999993	college-of-engineering-library-i	434
UP Meralco Innovation Hall	Rooms	A newly built lecture hall for the EEE	Instead of heading through the first floor entrance with the guard, go up the ramp instead. It will be the first door you see.	14.6495999999999995	121.069000000000003	up-meralco-innovation-hall	435
ICE 317	Rooms	ICE Room 317	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-317	436
ICE 318	Rooms	ICE Room 318	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-318	437
Electrical and Electronics Engineering Institute (EEEI)	College Buildings	The Electrical and Electronics Engineering Institute is part of the College of Engineering. EEEI is highly committed to produce a critical mass of highly-skilled electrical and electronics engineers who are equipped to solve today's technological problems and who would serve as forefronts of the country's push for technological competitiveness. The Institute is organized into 13 research laboratories, each with a specific line of research interest.	Located on Velasquez Street. An Ikot or a Toki jeep will pass this building.	14.6496258000000008	121.068641999999997	electrical-and-electronics-engineering-institute-(eeei)	438
Department of Mining, Metallurgical & Materials Engineering (DMMME)	College Buildings	DMMME is part of the College of Engineering, offering undergraduate, Master's, and PhD courses in the fields of Mining Metallurgical and Materials Engineering.	Located off C. P. Garcia and near the Alumni Engineers' Centennial Hall.	14.6479101000000007	121.068115000000006	department-of-mining,-metallurgical-&-materials-engineering-(dmmme)	439
UP Health Service	College Buildings	Infirmary located in UP Diliman	The UP Health Service is located along Laurel Ave., beside the Church of the Risen Lord.	14.6596507999999996	121.071060000000003	up-health-service	440
Abelardo Hall (ABH) (College of Music)	College Buildings	Abelardo Hall houses the College of Music. The college serves as a catalyst in national development by providing quality and professional instruction in diverse areas of music specialization. Its college administration and faculty are committed to provide a meaningful and personally relevant learning experience of music, as well as to guide students towards academic excellence. 	Abelardo Hall is located along Ylanan Street accros the College of Mass Communication. You can ride any jeepney except ones of the Ikot and Toki routes to get to this building.	14.6567001000000001	121.065002000000007	abelardo-hall-(abh)-(college-of-music)	441
PAGASA Observatory	College Buildings	PAGASA Observatory.	Located off Ma. Regidor, it is near the CHE Annex and the Philippine Genome Center.	14.6516886	121.072379999999995	pagasa-observatory	442
Epsilon Chi Center	College Buildings	Epsilon Chi Center has a basketball gym, 7-11, Rodic's Diner and SnackShack.	The Epsilon Chi Center is located between Bahay ng Alumni and Molave Residence Hall.	14.6581191999999998	121.067215000000004	epsilon-chi-center	443
EEE 425	Rooms	EEE 425 is the Electricity Market Research Laboratory	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-425	444
EEE 426	Rooms	EEE 426 is the EPRL Faculty Room	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-426	445
EEE 427	Rooms	EEE 427 is the Electrical Power Research Laboratory (EPRL)	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-427	446
German Yia Hall (IE and ME Building)	College Buildings	German Yia Hall houses facilities for Industrial Engineering and Mechanical Engineering. This building is currently under construction.	The German Yia Hall is located along Magsaysay Ave., behind Juinio Hall.	14.6572999999999993	121.070999	german-yia-hall-(ie-and-me-building)	447
UP Marine Science Institute (MSI)	College Buildings	The UP Marine Science Institute is one of seven academic institutes of the University of the Philippines’ College of Science. MSI was originally established as the Marine Sciences Center (MSC) on 28 March 1974. It is tasked to pursue research, teaching, and extension work in marine biology, marine chemistry, physical oceanography, marine geology, and related disciplines.	Located on Velasquez Street, it is a large building seen before reaching the road that leads into the National Science Complex.	14.6505480000000006	121.068848000000003	up-marine-science-institute-(msi)	448
Virata Hall (ISSI - Institute for Small Scale Industries)	College Buildings	UP ISSI conducted several consultancy training courses, seminars, technical studies in the field of medium and small-scale industries with emphasis on Philippine industries\r\n\r\n- UP ISSI Website	Virata Hall is located on Emilio Jacinto Rd, beside the UP School of Labor and Industrial Relations	14.6564989000000008	121.061829000000003	virata-hall-(issi---institute-for-small-scale-industries)	449
National Institute of Molecular Biology and Biotechnology (NIMBB)	College Buildings	National Institute of Molecular Biology and Biotechnology.	Located in National Science Complex.	14.6505832999999992	121.071631999999994	national-institute-of-molecular-biology-and-biotechnology-(nimbb)	450
College of Science Library (CS Library)	College Buildings	CS Library.	Located in National Science Complex.	14.6492739000000007	121.069114999999996	college-of-science-library-(cs-library)	451
Andres Bonifacio Centennial Carilion Tower and Plaza	College Buildings	The Carillon Tower and Plaza, the first in the country, is a 130-foot structure that originally housed 46 bronze bells cast by Van Bergen Bell, Chimes and Carillon Foundry of Holland.\r\n\r\n- UP Diliman Website	The Carillion Tower and Plaza is located along Osmeña Ave., between Villamor Hall and the UP Film Institute.	14.6565466000000004	121.066497999999996	andres-bonifacio-centennial-carilion-tower-and-plaza	454
National Science Complex Amphitheater	College Buildings	National Science Complex Amphitheater.	Located in National Science Complex.	14.6496057999999998	121.071922000000001	national-science-complex-amphitheater	455
Institute of Environmental Science and Meteorology (IESM)	College Buildings	Institute of Environmental Science and Meteorology.	Located in National Science Complex.	14.6483450000000008	121.070098999999999	institute-of-environmental-science-and-meteorology-(iesm)	456
Philippine Genome Center	College Buildings	Philippine Genome Center.	Located in National Science Complex, near PAGASA Observatory and Institute of Biology.	14.6514968999999997	121.071877000000001	philippine-genome-center	457
Villamor Hall (University Theater)	College Buildings	This is the venue for gala performances and concerts by local and international artists, as well as by UP’s own talents.\r\n\r\n- UP OICA Webiste	Villamor Hall is located along Osmeña Ave., between the UP College of Music and the UP Film Institute.	14.6567630999999992	121.066101000000003	villamor-hall-(university-theater)	458
Washington Sycip Garden of Native Trees 	College Buildings	Located between the University Theater and the UP Film Center and designed by the Office of the Campus Architect, the 4,700-square-meter area is dotted with over 100 different species of young native trees from all over the Philippines.\r\n-UP Diliman Website	The Washington Sycip Garden of Native Trees is located along Magsaysay Ave., beside the UP Film Institute	14.6570253000000008	121.066649999999996	washington-sycip-garden-of-native-trees-	459
Albert Hall (Archaeological Studies Program) (ASP)	College Buildings	The main building for the archaeological studies programs	Along Lakandula Street, near its intersection with Emilio Jacinto Street.	14.6526002999999996	121.063004000000006	albert-hall-(archaeological-studies-program)-(asp)	460
IChE Parking	Parking Areas	Parking lot for faculty that holds up to 10 vehicles.	On the right side of the Institute of Chemical Engineering.	14.6478634000000003	121.0672	iche-parking	461
Benitez Hall (College of Education)	College Buildings	The University of the Philippines College of Education is a degree-granting unit within the University of the Philippines Diliman. One of the first academic units established in the University, the College offers baccalaureate, graduate and non-degree programs in the field of teacher education.\r\n\r\nThe College of Education is housed by the Benitez Hall along the Academic Oval of the Diliman campus.\r\n- http://iskwiki.upd.edu.ph/index.php/UP_College_of_Education#.XACYuGgzZPY	Along Roxas Ave. Just before the Katipunan Jeepney stop, overlooking the Sunken Garden	14.6536378999999997	121.072151000000005	benitez-hall-(college-of-education)	462
UP Integrated School — K-2 Building (UPIS)	College Buildings	The UP Integrated School (est. 1976) is the laboratory school of the UP College of Education. It offers an integrated curriculum from Kindergarten to Grade 12. It is one of the country's pioneer integrated schools and has been offering an integrated curriculum from Kindergarten to Grade 10 since its inception until the mandatory implementation of the Department of Education's K-12 program in 2012.\r\n\r\nThis building is houses the kindergarden section of UPIS	Along the road-blocked part of Quirino Ave.	14.6524000000000001	121.072556000000006	up-integrated-school-—-k-2-building-(upis)	463
Accounting Budget and Cash Office Building	College Buildings	The Cash Office is where most payments to the university are made.	The Cash Office is located on Apacible St., across from Balay Atleta	14.6600999999999999	121.069999999999993	accounting-budget-and-cash-office-building	464
Palma Hall Parking Lot	Parking Areas	Parking lot for CSSP faculty and staff, but also open to the public	in front of Palma Hall steps	14.6540680000000005	121.069771000000003	palma-hall-parking-lot	465
Institute of Biology (IB)	College Buildings	Institute of Biology.	Located in National Science Complex.	14.6504002	121.070999	institute-of-biology-(ib)	466
Ang Bahay ng Alumni	College Buildings	Ang Bahay ng Alumni is one of the convention facilities in UP Diliman.	It is located along Magsaysay Ave., between Fonacier Hall and Molave Residence Hall.	14.6578111999999994	121.066581999999997	ang-bahay-ng-alumni	467
Ang Bahay ng Alumni Parking Area	Parking Areas	Parking space for Bahay ng Alumni	This parking is located on the left side facing the building, behind Fonacier Hall.	14.6579484999999998	121.066306999999995	ang-bahay-ng-alumni-parking-area	468
Ilang-ilang Residence Hall	College Buildings	Ilang-ilang Residence Hall	At the corner of F. Ma. Guerrero and Laurel Avenue.	14.6593169999999997	121.072959999999995	ilang-ilang-residence-hall	469
UP Biology - EDC BINHI (Threatened Species Arboretum)	College Buildings	Geothermal leader Energy Development Corporation (EDC) has established an arboretum of threatened native species at the UP Institute of Biology (UPIB) in Diliman, Quezon City.  The arboretum is a component of EDC’s BINHI Tree for the Future project which aims to save and propagate high-value but fast-dwindling Philippine trees such as yakal, tindalo, kamagong, mangkono and ipil.\r\n-https://www.energy.com.ph/edc-establishes-threatened-species-arboretum-in-up/	There is one entrance along Quirino Ave., another along Velazquez Ave. and another inside the Institute of Biology. See red dotted trail on map.	14.6523438000000006	121.069725000000005	up-biology---edc-binhi-(threatened-species-arboretum)	470
Institute of Biology (IB) Comfort Rooms	Comfort Rooms	Comfort rooms found in the Institute of Biology	from the A. Ma. Regidor entrance, head left for male cr or right for female cr.	14.6507997999999997	121.070999	institute-of-biology-(ib)-comfort-rooms	471
School of Economics (SE) Library 	Rooms	The library for the UP School of Economics	on the 2nd and 3rd floor of the Northern Building.	14.6559000000000008	121.073997000000006	school-of-economics-(se)-library-	472
Diosdado P Macapagal Hall	Rooms	Lecture Hall in the UP School of Economics	Turn left from the entrance of the Northern Building	14.6559000000000008	121.073997000000006	diosdado-p-macapagal-hall	473
Benitez Hall Comfort Rooms	Comfort Rooms	Comfort rooms of the College of Education	From the main entrance turn left for males or right for females. CRs are by the stairs.	14.653511	121.072449000000006	benitez-hall-comfort-rooms	474
School of Economics (SE) Comfort Rooms	Comfort Rooms	Comforts Rooms in the UP School of Economics	Quick left from the entrance of the Eastern building	14.6560001	121.073997000000006	school-of-economics-(se)-comfort-rooms	475
Benitez 105	Rooms	Room 105 of Benitez Hall	Located on the first floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-105	476
Benitez 108	Rooms	Room 108 of Benitez Hall	Located on the 1st floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-108	477
Benitez 109	Rooms	Room 108 of Benitez Hall	Located on the 1st floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-109	478
Benitez 110	Rooms	Room 110 of Benitez Hall	Located on the 1st floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-110	479
Benitez 203	Rooms	Room 203 of Benitez Hall	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-203	482
Benitez 205	Rooms	Room 205 of Benitez Hall. Split into two parts A and B	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-205	483
Benitez 206	Rooms	Room 206 of Benitez Hall	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-206	484
Benitez 212	Rooms	Room 212 of Benitez Hall	Located on the 2nd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-212	485
Benitez 304	Rooms	Room 304 of Benitez Hall	Located on the 3rd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-304	486
Benitez 312	Rooms	Room 312 of Benitez Hall	Located on the 3rd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-312	487
Benitez Hall Education Library	Rooms	Official Library of the College of Eduction	Located on the 3rd floor of Benitez Hall	14.6535996999999991	121.071999000000005	benitez-hall-education-library	488
Child Development Center (CDC)	College Buildings	Building behind Alonso Hall (CHE)	It's behind Alonso Hall	14.6521434999999993	121.073761000000005	child-development-center-(cdc)	489
College of Home Economics (CHE) Comfort Rooms	Comfort Rooms	Comfort rooms for the CHE	From the entrance, head left into the back most corner of the building 1st floor. Both male and female crs are there.	14.6520100000000006	121.073425	college-of-home-economics-(che)-comfort-rooms	490
College of Home Economics (CHE) Library	College Buildings	Library for CHE	Beside Alonso Hall is a narrow walkway leading the the CHE Annex Library	14.6517610999999999	121.072929000000002	college-of-home-economics-(che)-library	491
EEEI VLC	Rooms	very large classroom lecture hall for EEE	From the 1st floor entrance with the guard, it will be the nearest door to the right.	14.6495999999999995	121.069000000000003	eeei-vlc	492
EEEI LC1	Rooms	Large Classroom 1 of EEE	From the 1st floor entrance with the guard, immediately turn right and head down a narrow hallway	14.6495999999999995	121.069000000000003	eeei-lc1	493
EEEI LC2	Rooms	Large Classroom 2of EEE	From the 1st floor entrance with the guard, head as far back as you can. Then, turn right and head down a narrow hallway.	14.6495999999999995	121.069000000000003	eeei-lc2	494
Virata School of Business Comfort Rooms	Comfort Rooms	Comfort Rooms for the Virata School of Business	From the entrance, head to the far back left corner for females or the far back right corner for males	14.6554718000000008	121.073752999999996	virata-school-of-business-comfort-rooms	495
NIMBB Cafeteria	Food Service	Cafeteria for MBB	From the entrance head down hallway at the left.	14.6506995999999994	121.070999	nimbb-cafeteria	496
NIMBB Library	College Buildings	Library for MBB	From the entrance, take right turn and it will be the first door you'll see.	14.6507997999999997	121.071999000000005	nimbb-library	497
NIMBB Comfort Rooms	Comfort Rooms	Library for MBB	From the entrance, take right turn and head down to the very end of the hallway. It will be to the right near a water fountain. Alternatively, there is another CR at the MBB cafeteria.	14.6506995999999994	121.071845999999994	nimbb-comfort-rooms	498
Math Building Comfort Rooms	Comfort Rooms	Comfort Rooms scattered around the math building and annex.	One can be found on every floor at the bridge that connects the main building with the annex. \r\nOne can be found on every floor near stairs beside the cafeteria entrance.\r\nOne can be found on the top floor of MBAN between the two lecture halls	14.6485661999999994	121.071753999999999	math-building-comfort-rooms	499
DZUP Tower	College Buildings	broadcasting tower for the DZUP station	The DZUP Tower is located in the corner of Village B and Delos Reyes St.	14.6509733000000004	121.064025999999998	dzup-tower	500
CSWCD Parking Area	Parking Areas	CSWCD Parking Area	Parking area in front of the CSWCD Building	14.6574764000000002	121.063559999999995	cswcd-parking-area	501
College of Home Economics (CHE) Museum	College Buildings	Museum behind Alonso Hall (CHE)	Behind Alonso Hall	14.6524000000000001	121.073997000000006	college-of-home-economics-(che)-museum	502
VSB 104 Cesar E.A. Virata Lecture Room	Rooms	Main lecture room for the Virata School Of Business. It can hold around 100 people.	From the entrance, immediately turn right, past the elevator. It will be the first door you'll see.	14.6553000999999998	121.072997999999998	vsb-104-cesar-e-a--virata-lecture-room	503
Aldaba Hall	College Buildings	Recital hall at the back of the University Theater (Villamor Hall).  It was named in the honor of Dalisay J. Aldaba, who was renowned worldwide as an opera singer.\r\n- OICA Website	Aldaba Hall is located behind the University Theater.	14.6571932	121.066276999999999	aldaba-hall	504
Kamagong Residence Hall	College Buildings	Kamagong Residence Hall is a dormitory for graduate students in UP Diliman.	Kamagong is located along Emilio Jacinto, beside the Centennial Dormitory.	14.6484460999999992	121.062674999999999	kamagong-residence-hall	505
Post Office (PHLPOST)	College Buildings	PHLPOST UP Diliman branch	The Post Office is located along Roces St., near Area 2.	14.6595420999999995	121.068466000000001	post-office-(phlpost)	506
Sentro ng Wikang Filipino	Rooms	The SWF is a language academy, research center, and university-based publishing house in UP Diliman\r\n-Wikipedia	The SWF is located on the third floor of the SURP building	14.6571999000000002	121.063004000000006	sentro-ng-wikang-filipino	507
Temporary Shopping Center	College Buildings	The Shopping Center has temorarily relocated and some of its stores including UP Maroons has set up shop here.	The temporary location is located at the tennis court behind the original shopping center.	14.6599236000000008	121.069182999999995	temporary-shopping-center	508
Office of the Vice Chancellor for Academic Affairs	Rooms	The Office of the Vice Chancellor for Academic Affairs (OVCAA) assists the Chancellor in coordinating curricular, instructional, extension, library and other academic programs in U.P. Diliman.\r\n- OVCAA Website	OVCAA is located in Rm. 203, 2nd Floor, DILC Building.	14.6574001000000003	121.069999999999993	office-of-the-vice-chancellor-for-academic-affairs	509
Office of International Linkages in Diliman (OIL)	Rooms	The Office of International Linkages in Diliman aims to engage the UP Diliman Community in internationalization goals through collaborative activities with institutions abroad.\r\n_ OIL Website	OIL is located in Rm. 102 in the DILC Bldg.	14.6574001000000003	121.069999999999993	office-of-international-linkages-in-diliman-(oil)	510
General Education Center (GEC)	Rooms	The GEC supports the administration in monitoring and evaluating GE programs.\r\n_ UP Diliman Website	The GEC is located in the DILC Bldg.	14.6574001000000003	121.069999999999993	general-education-center-(gec)	511
National Service Training Program (NSTP)	Rooms	The NSTP is a program aimed at enhancing civic consciousness and defense preparedness in the youth by developing the ethics of service and patriotism while undergoing training in any of its program components.\r\n- NSTP Website	The NSTP Office is located on the 4th floor of the DILC Bldg.	14.6574001000000003	121.069999999999993	national-service-training-program-(nstp)	512
Vinzons Hall Comfort Rooms	Comfort Rooms	Female and male comfort rooms in Vinzons Hall.	Located on the first floor, past the Food Service. On the left side is a narrow passage that leads to the comfort rooms.	14.6541823999999998	121.073600999999996	vinzons-hall-comfort-rooms	539
Office of Field Activities (OFA)	Rooms	The OFA's main task is to ensure the safe and relevant implementation of short-term and long-term local academic field activities (AFA) by the University. The main role of OFA Diliman is to ensure that the University’s policies on academic field activities are properly operationalized.\r\n- OFA Website	The OFA is located on the 4th floor of the DILC Bldg.	14.6574001000000003	121.069999999999993	office-of-field-activities-(ofa)	513
University Food Service	Food Service	The University Food Service (UFS) provides food that is acceptable, nutritious, safe, wholesome and reasonably priced to its University clientele of students, faculty and administrative personnel. It is managed by professional dietitians and nutritionists.\r\n- UFS entry in iskWiki	The University Food service is located on the 1st floor of Vinzons Hall which is across the Sunken Garden.	14.6540823000000007	121.073532	university-food-service	514
Office of the Chief Security Officer	Rooms	Office of the Chief Security Officer	The Office of the Chief Security Officer is located in Rm. 109 of Bonifacio Hall (UP SOLAIR).	14.6571999000000002	121.061995999999994	office-of-the-chief-security-officer	515
University Computer Center (UCC)	College Buildings	The role of the Center continues to change through the years in response to the various changes in the computing and information technology landscape. Originally, being the sole computing facility in the University, the Center performed many data processing functions which are now possible with a desktop computer. Nowadays, the Center has focused primarily in providing the infrastructure to interconnect computing facilities.\r\n- UCC Website	The UCC is located along Magsaysay Ave., beside the Diliman Interactive Learning Center.	14.6573563	121.070160000000001	university-computer-center-(ucc)	516
Utilities Management Team (UMT)	Rooms	Utilities Management Team Office	The UMT Office is located in the University Computer Center, along Magsaysay Ave.	14.6574001000000003	121.069999999999993	utilities-management-team-(umt)	517
Magdangal	Jeepney Stops	This  sculpture, deemed “Oble’s muse” and being jokingly referred to, around campus, as “Jolina” (referring to the actress of the same last name), is a work of National Artist and Father of Modern Sculptures, Napolean V. Abueva.\r\n-artinup.wordpress.com	The Magdangal statue is located in front of the CAL Building.	14.6529893999999992	121.067359999999994	magdangal	518
Balay Kalinaw (Ikeda Hall)	College Buildings	A performance and event venue	Take the usual ikot jeep route, and drop off near Ilang-ilang residence hall. Balay Kalinaw is right beside it.	14.6599368999999999	121.072875999999994	balay-kalinaw-(ikeda-hall)	519
ICE 312	Rooms	Maria J Jardiolin Room	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-312	520
Commission on Human Rights (CHR) Office 	College Buildings	contact them at: http://chr.gov.ph/contact-chr/	From the Toki stop near UP Gymnasium, head through Magsaysay Ave. towards the archery range direction. It will be located at the near end of the street.	14.6573858000000001	121.060471000000007	commission-on-human-rights-(chr)-office-	521
University Gymnasium (Ylanan Hall) (College of Human Kinetics) (CHK)	College Buildings	Read more about CHK in: http://chk.upd.edu.ph/p/about-chk.html	Can be accessed from Commonwealth Ave. via bridge. Ikot and Toki jeeps also have a stop nearby, along where Magsaysay Ave. intersects Emilio Jacinto Ave. Look for a playground.	14.6591948999999993	121.062827999999996	university-gymnasium-(ylanan-hall)-(college-of-human-kinetics)-(chk)	522
Gym Annex Basketball Court	College Buildings	Read more about CHK in: http://chk.upd.edu.ph/p/about-chk.html	Behind the main CHK Gymnasium	14.6591948999999993	121.062827999999996	gym-annex-basketball-court	523
NIGS Library	Rooms	Library for NIGS	From the NIGS entrance turn right. It will be the first room you'll see	14.6479997999999991	121.069000000000003	nigs-library	524
University Hotel	College Buildings	Located at the intersection of Guerrero and Aglipay Streets, the University Hotel (UH) is the most popular lodging venue in UP Diliman. Formerly known as PCED (Philippine Center for Economic Development) Hostel, renamed University Hotel on August 13, 2001 by the Board of Overseers (BOO). The BOO supervises the operations of the establishment. -https://upd.edu.ph/accommodations-in-up-diliman/	Go along F. Ma. Guerrero Ave. K. It is at the end of that street, past Balay Kalinaw, and Ilang-ilang residence hall	14.6611261000000006	121.072890999999998	university-hotel	525
ICE 409	Rooms	ICE Room 409 is the UP Aces Lecture Room	On the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-409	526
College of Law - Law Forum	College Buildings	Law Forum, used by College of Law	The Law Forum is located near Malcolm Hall	14.6569996000000007	121.071999000000005	college-of-law---law-forum	527
AECH Accenture Hall	Rooms	Accenture Lecture Hall in UP Alumni Engineers' Centennial Hall (AECH).	From the entrance, take the stairs on the left side to the second floor.	14.6488999999999994	121.069000000000003	aech-accenture-hall	528
IB Auditorium	Rooms	Auditorium in Institute of Biology.	From the entrance next to the parking lot, climb the stairs to the second floor.	14.6504002	121.070999	ib-auditorium	529
UP Biology - EDC Binhi Threatened Species Arboretum	Jeepney Stops	Arboretum containing native trees	Entrance located behind the Institute of Biology building.	14.6507167999999997	121.070342999999994	up-biology---edc-binhi-threatened-species-arboretum	530
IB Library	Rooms	Library of the Institute of Biology. A small room.	Located on the second floor of the Institute of Biology.	14.6504002	121.070999	ib-library	531
IB Cafeteria	Food Service	Cafeteria in Institute of Biology. Can easily seat 40 people, more if more chairs are brought in.	Located on the second floor of IB, above the entrance near the parking lot.	14.6505069999999993	121.070671000000004	ib-cafeteria	532
DMMME Comfort Rooms	Comfort Rooms	Male and female comfort rooms in the Department of Mining, Metallurgical and Materials Engineering.	The comfort rooms are located next to the stairs on every floor. You can reach them by going past the guard's station at the entrance, turning right, then left at the corner.	14.6479292000000001	121.068054000000004	dmmme-comfort-rooms	533
ICE Comfort Rooms	Comfort Rooms	Female and male comfort rooms in the Institute of Chemical Engineering building.	They are located next to the stairs on each floor. From the entrance, turn right and you should see them on the left side of the corridor.	14.6487426999999997	121.066032000000007	ice-comfort-rooms	534
UP Veterinary Teaching Hospital	College Buildings	UP Veterinary Teaching Hospital	Located behind College of Fine Arts, off Emilio Jacinto St.	14.6521205999999999	121.061110999999997	up-veterinary-teaching-hospital	535
IC Cafeteria	Food Service	Cafeteria in Institute of Chemistry Teaching Building.	On the first floor of ICT, at the far end of the building from the entrance.	14.6504010999999998	121.072700999999995	ic-cafeteria	536
Institute of Chemistry Research Building (ICR)	College Buildings	Research building of IC.	Located in National Science Complex, across from Institute of Chemistry Teaching Building.	14.6506720000000001	121.072754000000003	institute-of-chemistry-research-building-(icr)	537
IC Parking Strip	Parking Areas	Parking Strip behind Institute of Chemistry.	Located behind Institute of Chemistry Research Building, near PAGASA Observatory.	14.6512279999999997	121.073623999999995	ic-parking-strip	538
Virata School of Business Parking Lot	Parking Areas	Parking lot next to Virata School of Business, can hold around 30 vehicles.	Located off the Academic Oval, on the right side of Virata School of Business.	14.6548748	121.073288000000005	virata-school-of-business-parking-lot	540
Department of Computer Science Comfort Rooms	Comfort Rooms	Comfort Rooms in the UP Alumni Engineers Centennial Hall	From the entrance, head to the very right past the stairs. Comfort rooms are located in every floor.	14.6487408000000006	121.068259999999995	department-of-computer-science-comfort-rooms	541
Main Library Parking Lots	Parking Areas	Two parking lots located on either side of Gonzales Hall. They can hold at most 15 vehicles each.	Located off the Academic Oval, next to Gonzales Hall.	14.6543875000000003	121.071044999999998	main-library-parking-lots	542
UP Main Library - Social Sciences and Philosophy Library	Rooms	Social Sciences and Philosophy Library in Gonzales Hall.	From the entrance, turn right.	14.6550998999999997	121.070999	up-main-library---social-sciences-and-philosophy-library	543
UP Main Library - Filipiniana Books Section	Rooms	Library section containing the Filipiniana books and a reading area.	Located in the basement of Gonzales Hall, turn left from the entrance and take the stairs down.	14.6550998999999997	121.070999	up-main-library---filipiniana-books-section	544
Lagmay Hall Comfort Rooms	Comfort Rooms	Comfort rooms in Palma Hall Annex	From the front entrance, move past the lobby and turn right. The comfort rooms will be on the left side.	14.6534709999999997	121.071098000000006	lagmay-hall-comfort-rooms	545
Lagmay Hall Library (Mandala Room)	Rooms	Library in Lagmay Hall	On the third floor of the main building, in Room 305.	14.6535996999999991	121.070999	lagmay-hall-library-(mandala-room)	546
Office of the University Registrar Parking Lot	Parking Areas	Faculty and visitors parking lot next to OUR.	On Pardo de Tavera, next to the Office of the University Registrar.	14.6513223999999997	121.066612000000006	office-of-the-university-registrar-parking-lot	547
Centennial Residence Hall Parking Lot	Parking Areas	Parking lot that can hold up to 30 vehicles	Located on Emilio Jacinto St., opposite Centennial Residence Hall.	14.6479864000000006	121.062149000000005	centennial-residence-hall-parking-lot	548
Asian Institute of Tourism	College Buildings	Closed to entry.	Located on the Circle-bound side of Commonwealth Ave.	14.6600342000000001	121.061126999999999	asian-institute-of-tourism	549
DMMME Parking Lot	Parking Areas	Parking lot that holds up to 30 vehicles	In front of the Department of Mining, Metallurgical, Materials Engineering.	14.6476526000000007	121.067879000000005	dmmme-parking-lot	550
IChE Comfort Rooms	Comfort Rooms	Comfort rooms in Institute of Chemical Engineering.	Located next to the stairs on every floor. Turn right from the entrance and go down the hallway.	14.6480187999999991	121.067183999999997	iche-comfort-rooms	551
Institute of Chemical Engineering (IChE)	College Buildings	The Institute of Chemical Engineering is part of the College of Engineering.	Located off C. P. Garcia, next to the Institute of Civil Engineering.	14.6480999000000001	121.067001000000005	institute-of-chemical-engineering-(iche)	552
Environmental and Energy Engineering Program Building	College Buildings	Part of the Civil Engineering Complex, not in use.	On Pardo de Tavera, near the PAUW Child Care.Center.	14.6493225000000002	121.065865000000002	environmental-and-energy-engineering-program-building	553
Three Women Sewing the First Filipino Flag	Jeepney Stops	Sculpture by Napoleon Abueva.	Located near the Lagoon, some distance behind Quezon Hall.	14.6549530000000008	121.066283999999996	three-women-sewing-the-first-filipino-flag	554
Untitled by Abdulmari Imao	Jeepney Stops	A sculpture by Abdulmari Imao.	Located beside Vargas Museum, on the Academic Oval.	14.6535920999999991	121.066497999999996	untitled-by-abdulmari-imao	555
CSWCD Comfort Room	Comfort Rooms	All gender comfort room for the UP College of Social Work and Communities Development	Enter the right most entrance with a visible elevator. Its to the right of the elevator.	14.6570996999999998	121.063004000000006	cswcd-comfort-room	556
IB Museum Public Exhibit Area	Rooms	Museum in Institute of Biology.	From the entrance next to the parking lot, turn left.	14.6504002	121.070999	ib-museum-public-exhibit-area	557
UP Integrated School — 3-10 Building (UPIS)	College Buildings	UPIS grade school, run by College of Education.	Located at the corner of A. Ma. Regidor and Quirino Avenue.	14.6527004000000005	121.072997999999998	up-integrated-school-—-3-10-building-(upis)	558
GT Toyota Asian Center - Cafe Via Mare	Food Service	Restaurant at GT Toyota Asian Center	On Magsaysay Avenue, past the Magsaysay Portal.	14.6571435999999995	121.073784000000003	gt-toyota-asian-center---cafe-via-mare	559
Rizal Statue	Jeepney Stops	by Domingo Celis.	Located at the AS pond, from the main entrance, pass through the doorway on the far left to the AS Walk and head straight.	14.6533002999999997	121.070144999999997	rizal-statue	560
Spirit of Business	Jeepney Stops	The Spirit of Business (Napoleon Abueva), as its title implies can be found in front of the College of Business Administration. Made of metal and done in 1979, the forward thrust of the spear-like elements is symbolic of how it propels us towards progress and development. At some point in the sculpture’s history, there was supposedly a mechanism that made parts of it rotate to further emphasize the drive towards growth and dynamism. - SculpTour	On Academic Oval, in front of Virata School of Business Administration.	14.6551408999999992	121.073204000000004	spirit-of-business	561
University Seal	Jeepney Stops	The University Seal (Napoleon Abueva) is the welcoming icon at the entrance of the U.P. Main Library.  It rests in the middle of a white curvilinear grillwork that is reminiscent of organic shapes and somehow echoes the widespread wings of the copper-colored eagle.  The symbolic bird is perched atop a green shield that features emblems representing University ideals and Philippine icons. - SculpTour	Located above the entrance to the Main Library.	14.6550808000000004	121.070946000000006	university-seal	562
AECH Comfort Rooms	Comfort Rooms	Comfort rooms in Alumni Engineers' Centennial Hall	The comfort rooms are located on the right side of the building from the entrance.	14.6488037000000002	121.068550000000002	aech-comfort-rooms	563
Cry of Balintawak by Ramon Martinez	Jeepney Stops	Ala-ala ng Bayang Filipino sa mga Bayani ng ‘96 is a concrete polychromed statue done by Ramon Martinez between 1905 and 1911.  It was inaugurated in Balintawak on 3 September 1911 but was relocated to the U.P. Vinzons Hall in 29 November 1968 to give way to the construction of the North Luzon Expressway.  While often associated with Andres Bonifacio, it actually represents a nameless Katipunero. The statue is also popularly linked with the “Cry of Balintawak” because of its depiction of a katipunero’s battlecry.  Aptly located outside Vinzons Hall, the campus student center, it is a constant reminder of the brand of activism and nationalism that U.P. stands for. - SculpTour	The statue is located in front of Vinzons Hall.	14.6542931000000003	121.073204000000004	cry-of-balintawak-by-ramon-martinez	564
EEE 302	Rooms	EEE 302 is the Electronics Prototyping Laboratory (EPL)	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-302	601
EEE 303	Rooms	EEE 303 is the Instruments Room	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-303	602
EEE 305	Rooms	EEE 305 is the Alexan Laboratory (ALab)	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-305	603
Sundial	Jeepney Stops	After the destruction of the sundial in the front lawn of Melchor Hall, in 1972 the UP Alumni Engineers started the construction of the present-day sundial. It is located in G. Apacible St., now at the center of the engineering complex. It was Chato Calderon (CE’72) who was the supervising engineer. Following in the footsteps of her father, Quintin A. Calderon (CE’36) who was UPAE president 1970-1972, she was the first lady president of the UPAE.\r\n\r\nThe current sundial has a design similar to the one destroyed by Typhoon Yoling. At the base of its gnomon is the year 1947, which signifies the founding year of the UP Alumni Engineers. This shows how closely related the sundial is to the college of engineering as well as the great importance that the alumni of the college have given it. -iskWiki	Behind DILC, along G. Apacible St.	14.6570797000000006	121.070487999999997	sundial	565
Office of Extension Coordination	Rooms	The Office of Extension Coordination (OEC) handles the international affairs of the University of the Philippines Diliman, as well as, its linkages to local institutions and government agencies.	Inside PHIVOLCS building	14.6527995999999998	121.058998000000003	office-of-extension-coordination	566
Philippine Institute of Volcanology and Seismology	College Buildings	The Philippine Institute of Volcanology and Seismology (PHIVOLCS) is a service institute of the Department of Science and Technology (DOST) that is principally mandated to mitigate disasters that may arise from volcanic eruptions, earthquakes, tsunami and other related geotectonic phenomena. - phivolcs.dost.gov.ph	From University Avenue, turn onto C.P. Garcia. An outbound Philcoa jeep will pass by the PHIVOLCS building as well.	14.6527995999999998	121.058998000000003	philippine-institute-of-volcanology-and-seismology	567
Oblation by Guillermo Tolentino	Jeepney Stops	The iconic symbol of the University of the Philippines, the Oblation is commonly associated with freedom and its various aspects.  Guillermo Tolentino however, inspired by the second stanza of Jose Rizal’s Mi Ultimo Adios, envisioned this monument with its nakedness and outstretched arms to exemplify the virtue of sacrifice in the name of country, thus the term.  Its base is an assembly of river stones to symbolize the archipelagic nature of the Philippines, and the kataka-taka leaves that grazes its legs and which is endemic to the country signifies the Filipino people.  The Oblation is an excellent portrayal of the classical ideals dignity, balance and restraint as demonstrated in its stance and proportions.\r\n\r\nMeasuring almost 5 meters tall, this statue was unveiled in 1935 by the first Filipino U.P. President, Rafael Palma.  In 1949, it was transferred from its original location in U.P. Manila to the Diliman campus escorted by a huge motorcade composed of students, faculty and staff. - SculpTour	Take any jeep to either the University Press stop or the College of Music stop, then walk into the Academic Oval to Quezon Hall.	14.6549090999999994	121.064887999999996	oblation-by-guillermo-tolentino	568
ICE 311	Rooms	Agustias J Bello Room	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-311	569
ICE 319	Rooms	ICE Room 319 is the Faculty Room	On the 3rd floor of ICE	14.6485996000000007	121.066001999999997	ice-319	570
ICE 408-B	Rooms	ICE Room 408-b is the Holcim Lecture Hall	On the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-408-b	571
DMMME Disini Lecture Room	Rooms	Lecture Room for DMMME	Located on the 3rd floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-disini-lecture-room	572
ICE 410	Rooms	Room 410 of ICE	Located on the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-410	573
ICE 411	Rooms	Room 411 of ICE is the AMH Philippines, Inc. Lecture Room	Located on the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-411	574
ICE 412	Rooms	Room 412 of ICE, is a lecture room	Located on the 4th floor of ICE	14.6485996000000007	121.066001999999997	ice-412	575
DMMME Dr. Perfecto Guerrero Lecture Room	Rooms	Lecture Room for DMMME	Located on the 3rd floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-dr--perfecto-guerrero-lecture-room	576
DMMME Roman B. Ramos Lecture Room	Rooms	Lecture Room for DMMME	Located on the 3rd floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-roman-b--ramos-lecture-room	577
DMMME Ernesto A. Villaluna, Sr. Lecture Room	Rooms	Lecture Room for DMMME; also Room 305	Located on the 3rd floor of DMMME Building	14.6478996000000006	121.068000999999995	dmmme-ernesto-a--villaluna,-sr--lecture-room	578
EEE 123	Rooms	EEE 123 is a lecture hall	Located on the 1st floor of EEEi	14.6495999999999995	121.069000000000003	eee-123	579
EEE 124	Rooms	EEE 124 is an Astec Research Laboratory	Located on the 1st floor of EEEi	14.6495999999999995	121.069000000000003	eee-124	580
EEE 125	Rooms	EEE 125 is the PEL Faculty Room	Located on the 1st floor of EEEi	14.6495999999999995	121.069000000000003	eee-125	581
EEE 126	Rooms	EEE 126 is the Motor Drives Instructional Laboratory	Located on the 1st floor of EEEi	14.6495999999999995	121.069000000000003	eee-126	582
EEE 129	Rooms	EEE 129 is the Fabrication Laboratory	Located on the 1st floor of EEE	14.6495999999999995	121.069000000000003	eee-129	583
EEE 127	Rooms	EEE 127 is the Electric Machines Instructional Laboratory	Located on the 1st floor of EEEi	14.6495999999999995	121.069000000000003	eee-127	584
EEE 201	Rooms	EEE 201 is a room in EEEi	Located on the 2nd floor of EEE	14.6495999999999995	121.069000000000003	eee-201	585
EEE 202	Rooms	EEE 202 is a room in EEEi	Located on the 2nd floor of EEE	14.6495999999999995	121.069000000000003	eee-202	586
EEE 203	Rooms	EEE 203 is a room in EEEi	Located on the 2nd floor of EEE	14.6495999999999995	121.069000000000003	eee-203	587
EEE 204	Rooms	EEE 203 is a Samsung Doored Room	Located on the 2nd floor of EEE	14.6495999999999995	121.069000000000003	eee-204	588
EEE 205	Rooms	EEE 205 is the Communications Electronics and Embedded Systems Laboratory (CEESL)	Located on the 2nd floor of EEE	14.6495999999999995	121.069000000000003	eee-205	589
EEE 206	Rooms	EEE 206 is the room in EEEi	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-206	590
EEE 207	Rooms	EEE 207 is the Computer Networks Laboratory (CNL)	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-207	591
EEE 208	Rooms	EEE 208 is the Ubiquitous Computing Lab	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-208	592
EEE 209	Rooms	EEE 209 is the CNL Faculty Room	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-209	593
EEE 210	Rooms	EEE 210 is a Room in EEEi	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-210	594
EEE 220	Rooms	EEE 220 is a Room in EEEi	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-220	595
EEE 225	Rooms	EEE 225 is a Faculty Reading Room	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-225	596
EEE 227	Rooms	EEE 227 is the UP-NOKIA Telecommunications Engineering Laboratory	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-227	597
EEE 228	Rooms	EEE 228 is the PEL Instructional	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-228	598
EEE 229	Rooms	EEE 229 is a Lecture Room in EEEi	Located on the 2nd floor of EEEi	14.6495999999999995	121.069000000000003	eee-229	599
EEE 301	Rooms	EEE 301 is the Basic Electronics Laboratory (BELab)	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-301	600
EEE 304	Rooms	EEE 304 is a Room in EEEi	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-304	604
EEE 307	Rooms	EEE 307 is the Lecture Room II	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-307	605
EEE 308	Rooms	EEE 308 is the SAL Training Center (STC)	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-308	606
EEE 309	Rooms	EEE 309 is the Instrumentation Robotics and Control Laboratory (IRC)	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-309	607
EEE 310	Rooms	EEE 310 is a Room in EEEi	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-310	608
EEE 320	Rooms	EEE 320 is a Lecture Room in EEEi	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-320	609
EEE 321	Rooms	EEE 321 is a Lecture Room in EEEi	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-321	610
EEE 322	Rooms	EEE 322 is a Graduate Students Room in EEEi	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-322	611
EEE 323	Rooms	EEE 323 is the RAL Instructional Laboratory	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-323	612
EEE 324	Rooms	EEE 324 is the RAL Research Laboratory	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-324	613
EEE 325	Rooms	EEE 325 is the RAL Faculty Room	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-325	614
EEE 326	Rooms	EEE 326 is the PSSL Faculty Room	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-326	615
EEE 327	Rooms	EEE 327 is the PSSL Research Laboratory	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-327	616
EEE 329	Rooms	EEE 329 is the PSSL Instructional Laboratory	Located on the 3rd floor of EEEi	14.6495999999999995	121.069000000000003	eee-329	617
EEE 401	Rooms	EEE 401 is a Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-401	618
EEE 402	Rooms	EEE 402 is the WCEL Faculty Room	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-402	619
EEE 403	Rooms	EEE 403 is a Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-403	620
EEE 404	Rooms	EEE 404 is the Wireless Communications Engineering Laboratory (WCEL)	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-404	621
EEE 405	Rooms	EEE 405 is the Microlab/IML Research Office	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-405	622
EEE 406	Rooms	EEE 406 is a Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-406	623
EEE 407	Rooms	EEE 407 is the Microelectronics and Microprocessors Laboratory (MICROLAB)	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-407	624
EEE 408	Rooms	EEE 408 is the Texas Instruments Elite Laboratory (TIEL)	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-408	625
EEE 409	Rooms	EEE 409 is the a Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-409	626
EEE 410	Rooms	EEE 410 is the Digital Signal Processing Laboratory (DSP)	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-410	627
EEE 412	Rooms	EEE 412 is the DSP/TIEL Faculty Room	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-412	628
EEE 420	Rooms	EEE 420 is a Lecture Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-420	629
EEE 421	Rooms	EEE 421 is a Lecture Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-421	630
EEE 422	Rooms	EEE 422 is a Lecture Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-422	631
EEE 423	Rooms	EEE 423 is a Graduate Students Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-423	632
EEE 424	Rooms	EEE 424 is a Graduate Students Room in EEEi	Located on the 4th floor of EEEi	14.6495999999999995	121.069000000000003	eee-424	633
NIMBB 101	Rooms	NIMBB 101 is a Conference Room	Located on the 1st Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-101	634
NIMBB 202	Rooms	NIMBB 202 is Molecular Biology Laboratory - B	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-202	635
NIMBB 203	Rooms	NIMBB 203 is the Cell Culture Laboratory	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-203	636
NIMBB 205	Rooms	NIMBB 205 is the Supply Office of NIMBB	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-205	637
NIMBB 206	Rooms	NIMBB 206 is the Molecular Biology Training Room - A	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-206	638
NIMBB 214	Rooms	NIMBB 214 is the Aquatic Biotechnology Laboratory (ABL)	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-214	639
NIMBB 215	Rooms	NIMBB 215 is the Plant Molecular Biology and Virology Laboratory (PMVL)	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-215	640
NIMBB Bioinformatics	Rooms	The Bioinformatics Laboratory of NIMBB	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-bioinformatics	641
NIMBB DNA Sequencing	Rooms	The NIMBB Core Facility for DNA Sequencing	Located on the 2nd Floor of NIMBB	14.6506004000000001	121.071999000000005	nimbb-dna-sequencing	642
CMC Library	Rooms	The College of Mass Communication Library	Located on the 1st and 2nd floor of the back portion Plaridel Hall	14.6564999	121.065002000000007	cmc-library	643
CMC Department of Communication Research	Rooms	A research office at Plaridel Hall, the College of Mass Communication 	Located on the 2nd floor of the back portion Plaridel Hall	14.6564999	121.065002000000007	cmc-department-of-communication-research	644
CMC 205	Rooms	CMC 205 is a Room in Plaridel Hall	Located on the 2nd floor of the front portion Plaridel Hall	14.6564999	121.065002000000007	cmc-205	645
CMC 207	Rooms	CMC 207 is a Room in Plaridel Hall	Located on the 2nd floor of the front portion Plaridel Hall	14.6564999	121.065002000000007	cmc-207	646
CMC 209	Rooms	CMC 209 is a Room in Plaridel Hall	Located on the 2nd floor of the front portion Plaridel Hall	14.6564999	121.065002000000007	cmc-209	647
CMC Department of Broadcasting	Rooms	CMC Room labelled Departamento ng Brodkasting	Located on the 2nd floor of the front portion Plaridel Hall	14.6564999	121.065002000000007	cmc-department-of-broadcasting	648
LH 201	Rooms	LH 201 is Silid Abasolo-Domingo Hunyo 2004	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-201	649
LH 203	Rooms	LH 203 is Silid Joset-Domingo Nobyembre 2004	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-203	650
LH 204	Rooms	LH 204 is Room in Lagmay Hall	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-204	651
LH 205	Rooms	LH 205 is Silid Samonte-Hinckley, Nobyembre, 2005	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-205	652
LH 207	Rooms	LH 207 is a Room in Lagmay Hall	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-207	653
LH 209	Rooms	LH 209 is a Room in Lagmay Hall	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-209	654
LH 213	Rooms	LH 213 is a Room in Lagmay Hall	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-213	655
LH 215	Rooms	LH 215 is a Room in Lagmay Hall	Located on the 2nd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-215	656
LH 301	Rooms	LH 301 is a Room in Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-301	657
LH 302	Rooms	LH 302 is a Room in Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-302	658
LH 303	Rooms	LH 303 is a Room in Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-303	659
LH 304	Rooms	LH 304 is a Silid Kalaw-Ludesma of Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-304	660
LH 305	Rooms	LH 305 is a Room in Lagmay Hall made by the donations of Mandala, 1999	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-305	661
LH 307	Rooms	LH 307 is the Perceptual Experimental Laboratory of Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-307	662
LH 309	Rooms	LH 309 is the Audio Visual Perception Laboratory of Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-309	663
LH 313-315	Rooms	LH 313-315 is the Social Cognition Laboratory of Lagmay Hall	Located on the 3rd Floor of the front portion of Lagmay Hall	14.6535996999999991	121.070999	lh-313-315	664
Bahay ng Alumni Comfort Rooms	Rooms	Comfort rooms at the Bahay ng Alumni Lobby area	The male comfort room is located on the left side while the female comfort room is located on the right side when facing inside the building. Both comfort rooms are located behind stairs.	14.6577997	121.067001000000005	bahay-ng-alumni-comfort-rooms	665
Department of Computer Science Teaching Lab 1 (TL1)	Rooms	Airconditioned computer laboratory. Holds about 40 people.	Teaching Lab 1 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the left side of the balcony when coming up from the stairs.	14.6488999999999994	121.069000000000003	department-of-computer-science-teaching-lab-1-(tl1)	666
Department of Computer Science Classroom 3 (CLR 3)	Rooms	Airconditioned. Seats about 30 people.	Classroom 3 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the right side of the balcony when coming up from the stairs	14.6488999999999994	121.069000000000003	department-of-computer-science-classroom-3-(clr-3)	667
CSWCD 304	Rooms	CSWCD 304 is a Room in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-304	668
Department of Computer Science Classroom 2 (CLR 2)	Rooms	Airconditioned. Seats about 20 people.	Classroom 2 is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the left side of the balcony when coming up from the stairs.	14.6488999999999994	121.069000000000003	department-of-computer-science-classroom-2-(clr-2)	669
Department of Computer Science Engineering and Research for Technology Development (ERDT)	Rooms	Airconditioned. Seats about 50 people.	ERDT is on the 2nd floor of the UP Alumni Engineers' Centennial Hall. It is located on the right side of the balcony when coming up from the stairs.	14.6488999999999994	121.069000000000003	department-of-computer-science-engineering-and-research-for-technology-development-(erdt)	670
UP Alumni Engineers' Centennial Hall (Engineering Library 2) (Department of Computer Science - DCS)	College Buildings	The UP Alumni Engineers' Centennial Hall (AECH) houses Engineering Library 2 and the Department of Computer Science.	It is located on Velasquez Street, opposite the College of Science Library and the National Institute of Geological Sciences.	14.6488999999999994	121.069000000000003	up-alumni-engineers'-centennial-hall-(engineering-library-2)-(department-of-computer-science---dcs)	671
Art Circle Cafe	Rooms	A restaurant in Bahay ng Alumni.	Art Circle Cafe is located on the left side of Bahay ng Alumni.	14.6577997	121.067001000000005	art-circle-cafe	672
Chocolate Kiss Cafe	Rooms	Chocolate Kiss Cafe is a restaurant in Bahay ng Alumni.	It is located on the 2nd floor, on the left side hallway.	14.6577997	121.067001000000005	chocolate-kiss-cafe	673
College of Mass Communication - Media Center and DZUP Studio	College Buildings	The Media Center holds TV Studios and the DZUP Broadcasting station	The Media Center is located near Plaridel Hall.	14.6563996999999997	121.063004000000006	college-of-mass-communication---media-center-and-dzup-studio	674
Centennial Residence Hall - University Food Service	Rooms	University Food Service branch in Centennial Residence Hall.	It is located on the ground floor, at the front of the Centennial Residence Hall	14.6479997999999991	121.063004000000006	centennial-residence-hall---university-food-service	675
YZA Printing Shop	Rooms	A printing shop at Centennial Residence Hall.	It is located on the groundfloor, at the front of the building	14.6479997999999991	121.063004000000006	yza-printing-shop	676
Food Nook	Rooms	Food Nook is a restaurant at the Centenial Residence Hall.	It is located on the groundfloor of the right-side building.	14.6479997999999991	121.063004000000006	food-nook	677
B.E. Scientific Glass Instruments	Rooms	B.E. Scientific Glass Instruments is a glassware and laboratory equipment shop located at the Centennial Residence Hall.	It is on the groundfloor of the right-side building, beside Food Nook restaurant.	14.6479997999999991	121.063004000000006	b-e--scientific-glass-instruments	678
Acacia Residence Halls Commercial Area	College Buildings	These are some commercial stores located at the Acacia Residence Halls.	These stores are located along Laurel Ave., across from the old Shopping Center.	14.6592999000000006	121.069999999999993	acacia-residence-halls-commercial-area	679
Quicklean	Rooms	Quicklean is a laundromat located outside of Acacia Residence Halls.	Quicklean is one of the many stores located at the side of Acacia Residence Halls. It is located beside Khaleb restaurant	14.6592999000000006	121.069999999999993	quicklean	680
Khaleb	Rooms	Khaleb is a shawarma restaurant located at the side of Acacia Residence Halls.	Khaleb is located between Quicklean and Unlad Convenience Store.	14.6592999000000006	121.069999999999993	khaleb	681
Unlad Convenience Store	Rooms	Unlad is a convenience store located at the side of Acacia Residence Halls.	Unlad is located beside Khaleb restaurant.	14.6592999000000006	121.069999999999993	unlad-convenience-store	682
UP Click	Rooms	UP Click is a computer and printing shop located at the side of Acacia Residence Halls.	UP Click is located beside Acacia Wellness.	14.6592999000000006	121.069999999999993	up-click	683
Acacia Wellness	Rooms	Acacia Wellness is a spa salon located at the side of Acacia Residence Hall.	It is between Upbeat and UP Click	14.6592999000000006	121.069999999999993	acacia-wellness	684
Upbeat	Rooms	Upbeat is a UP mechandise shop located at the side of Acacia Residence Halls.	It is located between Acacia Wellness and Orange Segment	14.6592999000000006	121.069999999999993	upbeat	685
Orange Segment	Rooms	Orange Segment is a printing store located at the side of Acacia Residence Halls.	It is the right-most store, located beside Upbeat.	14.6592999000000006	121.069999999999993	orange-segment	686
Tandang Sora Hall (Center for Social Work and Community Development) (CSWCD)	College Buildings	The CSWCD offers graduate and undergraduate programs in both social work and community development, as well as graduate programs on women and development.\r\n\r\n - UP CSWCD Website	Tandang Sora Hall is located along Magsaysay Ave., beside the UP Center for Women Studies.	14.6571999000000002	121.064003	tandang-sora-hall-(center-for-social-work-and-community-development)-(cswcd)	687
CSWCD 101	Rooms	CSWCD 101 is the Student Council Room of Tandang Sora Hall	Located on the 1st floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-101	688
CSWCD 105	Rooms	CSWCD 105 is the Silid Silangan Room in Tandang Sora Hall	Located on the 1st floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-105	689
CSWCD 102	Rooms	CSWCD 102 is a Room in Tandang Sora Hall	Located on the 1st floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-102	690
CSWCD 106	Rooms	CSWCD 106 is a Room in Tandang Sora Hall	Located on the 1st floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-106	691
CSWCD 201	Rooms	CSWCD 201 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-201	692
CSWCD 202	Rooms	CSWCD 202 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-202	693
CSWCD 203	Rooms	CSWCD 203 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-203	694
CSWCD 204	Rooms	CSWCD 204 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-204	695
CSWCD 205	Rooms	CSWCD 205 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-205	696
CSWCD 206	Rooms	CSWCD 206 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-206	697
CSWCD 208	Rooms	CSWCD 208 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-208	698
CSWCD 207	Rooms	CSWCD 207 is a Room in Tandang Sora Hall	Located on the 2nd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-207	699
CSWCD 301	Rooms	CSWCD 301 is a Field Insruction Room in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-301	700
CSWCD 302	Rooms	CSWCD 302 is a Seminar Room 1 in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-302	701
CSWCD 303	Rooms	CSWCD 303 is a Seminar Room 2 in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-303	702
CSWCD 306	Rooms	CSWCD 306 is the Research and Extension for Development Office (REDO) in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-306	703
CSWCD 307	Rooms	CSWCD 307 is the UPSARDF INC. Room in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-307	704
CSWCD 308	Rooms	CSWCD 308 is a Room in Tandang Sora Hall	Located on the 3rd floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-308	705
CSWCD Library	Rooms	The CSWCD  Library of Tandang Sora Hall	Located on the 1st floor of Tandang Sora Hall (CSWCD)	14.6571999000000002	121.064003	cswcd-library	706
Law Office	Rooms	Private law office located at Centennial Dormitory.	The law office is located at the back of the Centennial Dormitory	14.6479997999999991	121.063004000000006	law-office	707
UP Film Institute (UPFI)	College Buildings	The UP Film Institute of the premiere state university is the only internationally-accredited academic institution in the country offering film courses for both undergraduate and master’s degrees. - UP Film Institute Website	The UP Film Institute is located off Ylanan St., past Plaridel Hall. Any jeep will pass by the nearby College of Music jeepney stop.	14.6562327999999997	121.063621999999995	up-film-institute-(upfi)	708
UPFI 104	Rooms	Room 104 in UP Film Institute	On the 1st floor of UPFI.	14.6562003999999995	121.064003	upfi-104	709
UPFI 105	Rooms	Room 105 in UP Film Institute	On the 1st floor of UPFI.	14.6562003999999995	121.064003	upfi-105	710
UPFI 107	Rooms	Room 107 in UP Film Institute	On the 1st floor of UPFI.	14.6562003999999995	121.064003	upfi-107	711
UPFI 202	Rooms	Room 202 in UP Film Institute	On the 2nd floor of UPFI.	14.6562003999999995	121.064003	upfi-202	712
UPFI AVR 1	Rooms	AVR 1 in UP Film Institute	On the 2nd floor of UPFI.	14.6562003999999995	121.064003	upfi-avr-1	713
UPFI AVR 2	Rooms	AVR 2 in UP Film Institute	On the 2nd floor of UPFI.	14.6562003999999995	121.064003	upfi-avr-2	714
AECH Serials Section	Rooms	Serials Section of Alumni Engineers' Centennial Hall.	Located on the left side from the entrance.	14.6488999999999994	121.069000000000003	aech-serials-section	715
AECH 213	Rooms	Room 213 of Alumni Engineers' Centennial Hall.	Located on the 2nd floor from the entrance, on the left side.	14.6488999999999994	121.069000000000003	aech-213	716
AECH 210 - Teaching Lab 3	Rooms	Room 210 of Alumni Engineers' Centennial Hall. A computer lab.	Located on the 2nd floor from the entrance, on the right side.	14.6488999999999994	121.069000000000003	aech-210---teaching-lab-3	717
AECH 212	Rooms	Room 212 of Alumni Engineers' Centennial Hall.	Located on the 2nd floor from the entrance, on the right side down the corridor.	14.6488999999999994	121.069000000000003	aech-212	718
AECH 214 - Teaching Lab 2	Rooms	Room 214 of Alumni Engineers' Centennial Hall. A computer lab.	Located on the 2nd floor from the entrance, on the right side down the corridor.	14.6488999999999994	121.069000000000003	aech-214---teaching-lab-2	719
AECH 215 - Seminar Room	Rooms	Room 215 of Alumni Engineers' Centennial Hall. This room typically holds equipment and materials for building and prototyping electronic circuits. Work tables take up most of the floor space.	Located on the 2nd floor from the entrance, on the far end of the left side.	14.6488999999999994	121.069000000000003	aech-215---seminar-room	720
DMMME Adaptive Metallurgy Laboratory	Rooms	Adaptive Metallurgy Laboratory of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 1st floor.	14.6478996000000006	121.068000999999995	dmmme-adaptive-metallurgy-laboratory	721
DMMME 205-206	Rooms	Room 205-206 of the Department of Mining, Metallurgical & Materials Engineering. A large lecture hall.	Located on the 2nd floor.	14.6478996000000006	121.068000999999995	dmmme-205-206	722
DMMME Composites Laboratory	Rooms	The Composites Laboratory is in room 213 of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 2nd floor.	14.6478996000000006	121.068000999999995	dmmme-composites-laboratory	723
DMMME 214	Rooms	Room 214 of the Department of Mining, Metallurgical & Materials Engineering. Also labeled Fluor Daniels Room.	Located on the 2nd floor.	14.6478996000000006	121.068000999999995	dmmme-214	724
DMMME 216	Rooms	Room 216 of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 2nd floor.	14.6478996000000006	121.068000999999995	dmmme-216	725
DMMME 217	Rooms	Room 217 of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 2nd floor.	14.6478996000000006	121.068000999999995	dmmme-217	726
DMMME Administrative Office	Rooms	Administrative Office of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 2nd floor, to the right from the staircase closest to the entrance.	14.6567001000000001	121.065002000000007	dmmme-administrative-office	727
DMMME 301-302	Rooms	Room 301-302 of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 3rd floor.	14.6478996000000006	121.068000999999995	dmmme-301-302	728
DMMME 303-304	Rooms	Room 303-304 of the Department of Mining, Metallurgical & Materials Engineering.	Located on the 3rd floor.	14.6478996000000006	121.068000999999995	dmmme-303-304	729
IChE A101	Rooms	Lecture room A101 in Institute of Chemical Engineering Building A	On the first floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a101	730
IChE A102	Rooms	Lecture room A102 in Institute of Chemical Engineering Building A	On the first floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a102	731
IChE A104	Rooms	Lecture room A104 in Institute of Chemical Engineering Building A	On the first floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a104	732
IChE A103	Rooms	Lecture room A103 in Institute of Chemical Engineering Building A	On the first floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a103	733
IChE A202 - Administration Office	Rooms	Administration office in Institute of Chemical Engineering Building A	On the second floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a202---administration-office	734
IChE A301 - Computer Laboratory I	Rooms	Computer lab in Institute of Chemical Engineering Building A	On the third floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a301---computer-laboratory-i	735
IChE A401	Rooms	Lecture room A401 in Institute of Chemical Engineering Building A	On the fourth floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a401	736
IChE A402	Rooms	Lecture room A402 in Institute of Chemical Engineering Building A	On the fourth floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a402	737
IChE A403	Rooms	Lecture room A403 in Institute of Chemical Engineering Building A	On the fourth floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a403	738
IChE A404	Rooms	Lecture room A404 in Institute of Chemical Engineering Building A	On the fourth floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a404	739
IChE A302 - Computer Laboratory II	Rooms	Computer lab in Institute of Chemical Engineering Building A	On the third floor of Building A, the building closest to C.P. Garcia	14.6480999000000001	121.067001000000005	iche-a302---computer-laboratory-ii	740
IChE B101 Process Systems Engineering Laboratory	Rooms	Process Systems Engineering Laboratory in Institute of Chemical Engineering	On the first floor of Building B, reachable from Building A	14.6480999000000001	121.067001000000005	iche-b101-process-systems-engineering-laboratory	741
IChE B102 Analytical Laboratory	Rooms	Analytical Laboratory in Institute of Chemical Engineering	On the first floor of Building B, reachable from Building A	14.6480999000000001	121.067001000000005	iche-b102-analytical-laboratory	742
IChE B103-B104 Polymers Laboratory	Rooms	Polymers Laboratory in Institute of Chemical Engineering	On the first floor of Building B, reachable from Building A	14.6480999000000001	121.067001000000005	iche-b103-b104-polymers-laboratory	743
IChE B105-B106 Catalysts Laboratory	Rooms	Catalysts Laboratory in Institute of Chemical Engineering	On the first floor of Building B, reachable from Building A	14.6480999000000001	121.067001000000005	iche-b105-b106-catalysts-laboratory	744
IChE B201-B202 Separations Engineering Laboratory	Rooms	Separations Engineering Laboratory in Institute of Chemical Engineering	On the second floor of Building B	14.6480999000000001	121.067001000000005	iche-b201-b202-separations-engineering-laboratory	745
IChE B203 Analytical Laboratory	Rooms	Analytical Laboratory in Institute of Chemical Engineering	On the second floor of Building B	14.6480999000000001	121.067001000000005	iche-b203-analytical-laboratory	746
IChE B204-B205 Fuels, Energy, and Thermal Systems Laboratory	Rooms	Fuels, Energy, and Thermal Systems Laboratory in Institute of Chemical Engineering	On the second floor of Building B	14.6480999000000001	121.067001000000005	iche-b204-b205-fuels,-energy,-and-thermal-systems-laboratory	747
IChE B206 Green Materials Laboratory	Rooms	Green Materials Laboratory in Institute of Chemical Engineering	On the second floor of Building B	14.6480999000000001	121.067001000000005	iche-b206-green-materials-laboratory	748
IChE B301-B302 Chemical Engineering Commons	Rooms	Chemical Engineering Commons in Institute of Chemical Engineering	On the third floor of Building B	14.6480999000000001	121.067001000000005	iche-b301-b302-chemical-engineering-commons	749
ICE 401	Rooms	Classroom in ICE	Located on the fourth floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-401	750
ICE 402	Rooms	Classroom in ICE	Located on the fourth floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-402	751
ICE 403	Rooms	Classroom in ICE	Located on the fourth floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-403	752
ICE 404	Rooms	Classroom in ICE	Located on the fourth floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-404	753
ICE 405	Rooms	Large lecture hall in ICE, can fit at least 100.	Located on the fourth floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-405	754
ICE 301	Rooms	Classroom in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-301	755
ICE 302	Rooms	Classroom in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-302	756
ICE 303	Rooms	Classroom in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-303	757
ICE 304	Rooms	Classroom in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-304	758
ICE 305	Rooms	Classroom in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-305	759
ICE 306A	Rooms	Large room in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-306a	760
ICE 306B	Rooms	Large room in ICE	Located on the third floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-306b	761
ICE 307	Rooms	Classroom in ICE	Located on the third floor, in the center	14.6485996000000007	121.066001999999997	ice-307	762
ICE 308	Rooms	Classroom in ICE	Located on the third floor, in the center	14.6485996000000007	121.066001999999997	ice-308	763
ICE 309	Rooms	Classroom in ICE	Located on the third floor, in the center	14.6485996000000007	121.066001999999997	ice-309	764
ICE 310	Rooms	Classroom in ICE	Located on the third floor, in the center	14.6485996000000007	121.066001999999997	ice-310	765
ICE 201	Rooms	Room in ICE	Located on the second floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-201	766
ICE 202	Rooms	Room in ICE	Located on the second floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-202	767
ICE 203	Rooms	Room in ICE	Located on the second floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-203	768
ICE 204	Rooms	Large room in ICE	Located on the second floor, on the left side from the stairs	14.6485996000000007	121.066001999999997	ice-204	769
ICE 205 - Faculty Room	Rooms	Faculty room in ICE	Located on the second floor, on the right side from the stairs	14.6485996000000007	121.066001999999997	ice-205---faculty-room	770
ICE 103	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-103	771
ICE 104	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-104	772
ICE 101	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-101	773
ICE 102	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-102	774
ICE 105	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-105	775
ICE 106	Rooms	Classroom in ICE	Located on the first floor, to the right from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-106	776
ICE 108	Rooms	Office in ICE	Located on the first floor, to the left from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-108	777
ICE 107	Rooms	Office in ICE	Located on the first floor, to the left from the entrance of ICE	14.6485996000000007	121.066001999999997	ice-107	778
College of Architecture Library	Rooms	Library of College of Architecture	On the upper floor of Juguilon Hall	14.6513995999999995	121.065002000000007	college-of-architecture-library	779
UP School of Urban and Regional Planning (SURP)	College Buildings	Since June 2000, the U.P. School of Urban and Regional Planning has been offering the graduate Diploma, Master of Arts (M.A.) and Doctor of Philosophy (Ph.D) programs following the ladder structure. Courses taken in the lower degree (e.g. Diploma) are credited in the next higher degree (e.g. M.A.).\r\n- UP SURP Website\r\n\r\nThe new school building is currently under construction, with the new classrooms inside.	UP SURP is located along Emilio Jacinto Rd., across UP SOLAIR.	14.6571999000000002	121.063004000000006	up-school-of-urban-and-regional-planning-(surp)	780
Center for Women's and Gender Studies	College Buildings	Center for Women's and Gender Studies	Any jeep will pass by the nearby College of Music jeepney stop. It is located at the corner of Magsaysay and Ylanan.	14.6572885999999993	121.064453	center-for-women's-and-gender-studies	781
CMC M 107	Rooms	Room in Plaridel Hall	To the left, from the entrance	14.6564999	121.065002000000007	cmc-m-107	782
CMC 107	Rooms	Room in Plaridel Hall	In the building past the main building, on the left side of the first floor	14.6564999	121.065002000000007	cmc-107	783
CMC A-202	Rooms	Room in Plaridel Hall	On the second floor of the building past the main building	14.6564999	121.065002000000007	cmc-a-202	784
Parish of The Holy Sacrifice - Gomburza Hall	Rooms	Event hall in Parish of The Holy Sacrifice	From the entrance closer to Acacia Residence Hall, it is next to the chapel.	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice---gomburza-hall	785
Parish of The Holy Sacrifice - Delaney Hall	Rooms	Event hall in Parish of The Holy Sacrifice	From the entrance closer to Acacia Residence Hall, turn right, it is on the right side.	14.6589003000000009	121.070999	parish-of-the-holy-sacrifice---delaney-hall	786
Old UP Swimming Pool Lot	Parking Areas	Previously housed the UP Arcade and the old Swimming Pool	Corner of F. Agoncillo and Laurel Avenue, opposite Parish of The Holy Sacrifice	14.6589498999999996	121.071845999999994	old-up-swimming-pool-lot	787
F. Agoncillo-Parish of The Holy Sacrifice Area	Parking Areas	Street commonly parked on by visitors to Parish of The Holy Sacrifice	On F. Agoncillo	14.6588344999999993	121.071579	f--agoncillo-parish-of-the-holy-sacrifice-area	788
Balay Kalinaw Parking Lot	Parking Areas	Parking lot that can hold about 15 vehicles	At the corner of F. Ma. Guerrero and Dagohoy, opposite Balay Kalinaw, next to Ilang-Ilang Residence Hall	14.6597004000000002	121.072997999999998	balay-kalinaw-parking-lot	789
Virata School of Business (VSB)	College Buildings	The Cesar E.A. Virata School of Business (VSB) of the University of the Philippines in Diliman is the leading institution on management education in the Philippines. 	Directly in front of the UP Grandstand near the Sunken Garden. It is between Vinsons Hall and the School of Economics	14.6553000999999998	121.072997999999998	virata-school-of-business-(vsb)	790
Virata School of Business Library	Rooms	Library of the Cesar E. A. Virata School of Business	The entrance to the library is on the second floor.	14.6553000999999998	121.072997999999998	virata-school-of-business-library	791
VSB 201	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-201	792
VSB 203	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-203	793
VSB 205	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-205	794
VSB 207	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-207	795
VSB 209	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-209	796
VSB 211	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-211	797
VSB 213	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-213	798
VSB 215	Rooms	Room in Virata School of Business	Located on the second floor, left side.	14.6553000999999998	121.072997999999998	vsb-215	799
VSB 202	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-202	800
VSB 204	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-204	801
VSB 206	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-206	802
VSB 208	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-208	803
VSB 210	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-210	804
VSB 212	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-212	805
VSB 214	Rooms	Room in Virata School of Business	Located on the second floor, right side.	14.6553000999999998	121.072997999999998	vsb-214	806
VSB 106	Rooms	Classroom in Virata School of Business	Located on the first floor, right side.	14.6553000999999998	121.072997999999998	vsb-106	807
VSB 108	Rooms	Classroom in Virata School of Business	Located on the first floor, right side.	14.6553000999999998	121.072997999999998	vsb-108	808
VSB 110	Rooms	Classroom in Virata School of Business	Located on the first floor, right side.	14.6553000999999998	121.072997999999998	vsb-110	809
VSB 118	Rooms	Classroom in Virata School of Business	Located on the first floor, right side.	14.6553000999999998	121.072997999999998	vsb-118	810
IESM 101	Rooms	Room in Institute of Environmental Science and Meteorology	Located on the first floor.	14.6483001999999995	121.069999999999993	iesm-101	811
IESM 102	Rooms	Room in Institute of Environmental Science and Meteorology	Located on the first floor.	14.6483001999999995	121.069999999999993	iesm-102	812
IESM 103	Rooms	Room in Institute of Environmental Science and Meteorology	Located on the first floor.	14.6483001999999995	121.069999999999993	iesm-103	813
IESM 104	Rooms	Room in Institute of Environmental Science and Meteorology	Located on the first floor.	14.6483001999999995	121.069999999999993	iesm-104	814
IESM Administration Office	Rooms	Admin office in Institute of Environmental Science and Meteorology	Located on the second floor.	14.6483001999999995	121.069999999999993	iesm-administration-office	815
IESM Auditorium	Rooms	Auditorium in Institute of Environmental Science and Meteorology	Located on the first floor.	14.6483001999999995	121.069999999999993	iesm-auditorium	816
IESM 202	Rooms	Room in Institute of Environmental Science and Meteorology	Located on the second floor.	14.6483001999999995	121.069999999999993	iesm-202	817
College of Science Library Parking Lot	Parking Areas	This parking lot can accommodate about 25 four-wheeled vehicles.	Located in front of the College of Science Library and Administration building, by the road that leads to the National Science Complex (from Velasquez St.).	14.6495999999999995	121.069000000000003	college-of-science-library-parking-lot	818
MSI 201	Rooms	Room in Marine Science Institute	From the entrance, turn left.	14.6505002999999991	121.069000000000003	msi-201	819
MSI 202	Rooms	Room in Marine Science Institute	From the entrance, turn left.	14.6505002999999991	121.069000000000003	msi-202	820
MSI 203	Rooms	Room in Marine Science Institute	From the entrance, turn left.	14.6505002999999991	121.069000000000003	msi-203	821
MSI 204	Rooms	Room in Marine Science Institute	From the entrance, turn left.	14.6505002999999991	121.069000000000003	msi-204	822
MSI 205	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the end.	14.6505002999999991	121.069000000000003	msi-205	823
MSI 206	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the end.	14.6505002999999991	121.069000000000003	msi-206	824
MSI 207	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the end.	14.6505002999999991	121.069000000000003	msi-207	825
MSI 208	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the corner, then left.	14.6505002999999991	121.069000000000003	msi-208	826
MSI 209	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the corner, then left.	14.6505002999999991	121.069000000000003	msi-209	827
MSI 210	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the corner, then left.	14.6505002999999991	121.069000000000003	msi-210	828
MSI 211	Rooms	Room in Marine Science Institute	From the entrance, turn left, then right at the corner, then left.	14.6505002999999991	121.069000000000003	msi-211	829
MSI 219 - Library	Rooms	Library in Marine Science Institute	From the entrance, turn right.	14.6505002999999991	121.069000000000003	msi-219---library	830
UP Marine Science Institute Comfort Rooms	Comfort Rooms	Comfort rooms in UP Marine Science Institute	From the entrance, turn right.	14.6506185999999996	121.068954000000005	up-marine-science-institute-comfort-rooms	831
Archaeological Studies Program Solheim Library	Rooms	Library in Albert Hall	From the entrance, turn left.	14.6526002999999996	121.063004000000006	archaeological-studies-program-solheim-library	832
ASP 103 - Administration	Rooms	Administration Office in Albert Hall	From the entrance, turn left. The room is on the right side.	14.6526002999999996	121.063004000000006	asp-103---administration	833
ASP 109	Rooms	Administration Office in Albert Hall	From the entrance, turn left. The room is on the right side.	14.6526002999999996	121.063004000000006	asp-109	834
ASP 113	Rooms	Administration Office in Albert Hall	From the entrance, turn left. The room is on the right side.	14.6526002999999996	121.063004000000006	asp-113	835
ASP 115	Rooms	Administration Office in Albert Hall	From the entrance, turn left. The room is on the right side.	14.6526002999999996	121.063004000000006	asp-115	836
ASP 117	Rooms	Administration Office in Albert Hall	From the entrance, turn left. The room is on the right side.	14.6526002999999996	121.063004000000006	asp-117	837
Concordia Albarracin Residence Hall	College Buildings	Concordia Albarracin Residence Hall is a dormitory for students in UP Diliman, next to the Centennial Residence Hall.	Concordia Albarracin Residence Hall is located along Emilio Jacinto, near the Jacinto Portal leading to C.P. Garcia. It is next to Centennial Residence Hall.	14.6477003000000003	121.063004000000006	concordia-albarracin-residence-hall	838
Centennial Residence Hall	College Buildings	Centennial Residence Hall is a dormitory for students in UP Diliman. Next to it is the Concordia Albarracin Residence Hall.	Centennial Residence Hall is located along Emilio Jacinto, near the Jacinto Portal leading to C.P. Garcia. It is next to Kamagong Residence Hall and Concordia Albarracin Residence Hall.	14.6479997999999991	121.063004000000006	centennial-residence-hall	839
Centennial Residence Hall - The Food Nook	Food Service	The Food Nook	First floor of Concordia Albarracin Hall	14.6479826000000006	121.062531000000007	centennial-residence-hall---the-food-nook	840
Centennial Residence Hall - UP Stop	Food Service	UP Stop convenience store	First floor of Centennial Residence Hall	14.6479826000000006	121.062531000000007	centennial-residence-hall---up-stop	841
Centennial Residence Hall - FLUIDSURF	Jeepney Stops	FLUIDSURF Store	First floor of Centennial Residence Hall	14.6480370000000004	121.062522999999999	centennial-residence-hall---fluidsurf	842
Centennial Residence Hall - ACT RC	Jeepney Stops	ACT RC Australian Aid	First floor of Concordia Albarracin Residence Hall	14.6476764999999993	121.062507999999994	centennial-residence-hall---act-rc	843
Centennial Residence Hall - B E Scientific Glass	Jeepney Stops	B.E. Scientific Glass glasswares store	First floor of Concordia Albarracin Residence Hall	14.6476764999999993	121.062507999999994	centennial-residence-hall---b-e-scientific-glass	844
Centennial Residence Hall - ST-ART 101	Jeepney Stops	Art supplies store	First floor of Concordia Albarracin Residence Hall	14.6476764999999993	121.062507999999994	centennial-residence-hall---st-art-101	845
Centennial Residence Hall - YZA Printing	Jeepney Stops	YZA Printing	First floor of Concordia Albarracin Residence Hall	14.6476764999999993	121.062507999999994	centennial-residence-hall---yza-printing	846
CHE 101A	Rooms	Conference room in Alonso Hall	Located on the first floor.	14.6521997000000006	121.072997999999998	che-101a	847
CHE 102	Rooms	Food laboratory in Alonso Hall	Located on the first floor.	14.6521997000000006	121.072997999999998	che-102	848
CHE 103	Rooms	Food laboratory in Alonso Hall	Located on the first floor.	14.6521997000000006	121.072997999999998	che-103	849
CHE 104	Rooms	Laboratory in Alonso Hall	Located on the first floor.	14.6521997000000006	121.072997999999998	che-104	850
CHE 106	Rooms	Food laboratory in Alonso Hall	Located on the first floor.	14.6521997000000006	121.072997999999998	che-106	851
CHE 202 Computer Room	Rooms	Computer room in Alonso Hall	Located on the second floor.	14.6521997000000006	121.072997999999998	che-202-computer-room	852
CHE 203-B	Rooms	Room in Alonso Hall	Located on the second floor.	14.6521997000000006	121.072997999999998	che-203-b	853
CHE 203-A	Rooms	Room in Alonso Hall	Located on the second floor.	14.6521997000000006	121.072997999999998	che-203-a	854
CHE 204	Rooms	Personnel Service Section in Alonso Hall	Located on the second floor.	14.6521997000000006	121.072997999999998	che-204	855
NIGS 302	Rooms	A lecture room in National Institute of Geological Sciences	At the rear end of the building, one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-302	856
NIGS 230	Rooms	Room in National Institute of Geological Sciences	Located one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-230	857
NIGS 217	Rooms	Faculty room in National Institute of Geological Sciences	At the front end of the building, one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-217	858
NIGS 214 Geophysics Laboratory	Rooms	Geophysics Laboratory in National Institute of Geological Sciences	Located one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-214-geophysics-laboratory	859
NIGS 213 Structural Geology Laboratory	Rooms	Structural Geology Laboratory in National Institute of Geological Sciences	Located one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-213-structural-geology-laboratory	860
NIGS 212 Geomorphology Laboratory	Rooms	Geomorphology Laboratory in National Institute of Geological Sciences	Located one floor above the main entrance.	14.6479997999999991	121.069000000000003	nigs-212-geomorphology-laboratory	861
NIGS 121 Computer Room	Rooms	Computer Room in National Institute of Geological Sciences	Located to the right of the main entrance, near the library.	14.6479997999999991	121.069000000000003	nigs-121-computer-room	862
NIGS 111 Mineralogy Room	Rooms	Amoco Mineralogy Room in National Institute of Geological Sciences	Located on the same floor as the main entrance.	14.6479997999999991	121.069000000000003	nigs-111-mineralogy-room	863
NIGS Museum	Rooms	Museum in the National Institute of Geological Sciences	Located to the left of the main entrance.	14.6479997999999991	121.069000000000003	nigs-museum	864
Alonso Hall (College of Home Economics) (CHE)	College Buildings	CHE celebrates 55 years as a College and 95 years as a discipline this 2016. The College of Home Economics (CHE) was established by the Board of Regents on July 27, 1961. It emanated from the Department of Home Economics in the College of Education where the discipline was officially recognized on November 12, 1921, 40 years before the College was established.  \r\n\r\n- http://www.che.upd.edu.ph/content/overview-1	beside UPIS, across Quirino Ave.	14.6521997000000006	121.072997999999998	alonso-hall-(college-of-home-economics)-(che)	865
IB 306	Rooms	Teaching Lab in Institute of Biology	Located on the third floor, in the wing facing towards the CS Amphitheater.	14.6504002	121.070999	ib-306	866
IB 307	Rooms	Teaching Lab in Institute of Biology	Located on the third floor, in the wing facing towards the CS Amphitheater.	14.6504002	121.070999	ib-307	867
IB 308	Rooms	Teaching Lab in Institute of Biology	Located on the third floor, in the wing facing towards the CS Amphitheater.	14.6504002	121.070999	ib-308	868
IB 309	Rooms	Teaching Lab in Institute of Biology	Located on the third floor, on the left side of the middle area.	14.6504002	121.070999	ib-309	869
IB 318	Rooms	Seminar Room in Institute of Biology	Located on the third floor, in the center area.	14.6504002	121.070999	ib-318	870
IB 319	Rooms	Seminar Room in Institute of Biology	Located on the third floor, in the center area.	14.6504002	121.070999	ib-319	871
IB 321	Rooms	Animal Physiology Teaching Lab in Institute of Biology	Located on the third floor, in the center area.	14.6504002	121.070999	ib-321	872
IB 330	Rooms	Plant Physiology Teaching Lab in Institute of Biology	Located on the third floor, in right side of the center area.	14.6504002	121.070999	ib-330	873
IB 345	Rooms	Lecture Room in Institute of Biology	Located on the third floor, in the wing facing away from the CS Amphitheater.	14.6504002	121.070999	ib-345	874
IB 260	Rooms	Developmental Biology Teaching Lab in Institute of Biology	Located on the second floor, in right side of the center area.	14.6504002	121.070999	ib-260	875
IB 2605	Rooms	Lecture Room in Institute of Biology	Located on the second floor, in right side of the center area.	14.6504002	121.070999	ib-2605	876
IB 234 Supply and Property Office	Rooms	Supply and Property Office in Institute of Biology	Located on the second floor, on the left side of the center area.	14.6504002	121.070999	ib-234-supply-and-property-office	877
IB 117	Rooms	Lecture Room in Institute of Biology	Located on the first floor, in the wing facing towards the CS Amphitheater.	14.6504002	121.070999	ib-117	878
IB 118	Rooms	Teaching Lab in Institute of Biology	Located on the first floor, in the wing facing towards the CS Amphitheater.	14.6504002	121.070999	ib-118	879
IB 119	Rooms	Teaching Lab in Institute of Biology	Located on the first floor, on the left side of the center area.	14.6504002	121.070999	ib-119	880
IB 167 Fish Biology Lab	Rooms	Fish Biology Lab in Institute of Biology	Located on the first floor, in the wing facing away from the CS Amphitheater.	14.6504002	121.070999	ib-167-fish-biology-lab	881
IB 168	Rooms	Genetics Wet Lab in Institute of Biology	Located on the first floor, in the wing facing away from the CS Amphitheater.	14.6504002	121.070999	ib-168	882
DMST - Vanguard Comfort Rooms	Comfort Rooms	Comfort Rooms in Vanguard Hall	Located on the second and third floors.	14.6588162999999998	121.064239999999998	dmst---vanguard-comfort-rooms	883
DMST - Vanguard Rooftop	Rooms	Rooftop of Vanguard building	On the third floor of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-rooftop	884
DMST - Vanguard 201	Rooms	Classroom in Vanguard Hall	On the second floor of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-201	885
DMST - Vanguard 202	Rooms	Classroom in Vanguard Hall	On the second floor of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-202	886
DMST - Vanguard 203	Rooms	Classroom in Vanguard Hall	On the second floor of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-203	887
DMST - Vanguard 204	Rooms	Classroom in Vanguard Hall	On the second floor of Vanguard building	14.6588001000000006	121.064003	dmst---vanguard-204	888
Romulo Hall (Institute for Islamic Studies)	College Buildings	The Institute of Islamic Studies of the University of the Philippines-Diliman is the face of scholarly and academic Muslim community in the entire country. [Its Master's program] has produced graduates that are now actively employed in various academic Institutions in Mindanao and Metro Manila. Other graduates occupied top rank positions in the government. It has fulfilled its vision and mission as government’s partner in attaining progress and development in the country.\r\n\r\n- UP IIS Website	Romulo Hall is located along Magsaysay Ave., beside the GT Toyota Asian Center	14.6571999000000002	121.072997999999998	romulo-hall-(institute-for-islamic-studies)	889
Church of the Risen Lord - Function Hall	Rooms	Function Hall	Located on the second floor of the administration building	14.6597004000000002	121.071999000000005	church-of-the-risen-lord---function-hall	890
\.


--
-- Data for Name: login_tracker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_tracker (id, username, ip_addr, "consecutiveFails", "lastAttemptTime") FROM stdin;
5	teamdeep	172.217.161.142	0	2018-09-27 19:57:03.878139
\.


--
-- Data for Name: subarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subarea (sub_id, building_id) FROM stdin;
62	3
63	3
582	438
64	3
65	3
66	1
67	3
68	10
69	7
70	10
71	10
72	10
73	10
74	10
75	10
76	10
77	10
78	10
79	10
80	10
81	6
82	11
83	11
84	11
85	11
86	11
87	11
88	11
89	11
90	11
91	11
92	11
93	11
94	11
95	11
96	11
97	4
98	4
99	4
100	4
101	4
103	310
104	310
105	310
106	310
107	310
108	310
109	310
110	310
111	310
112	310
113	310
114	310
115	4
116	4
117	310
118	4
119	4
120	441
121	441
122	335
123	335
124	12
125	12
126	12
127	12
128	12
129	12
130	12
131	14
132	14
133	14
134	14
135	14
136	14
137	439
138	14
139	15
140	15
141	15
142	15
143	15
144	15
145	15
146	15
147	15
148	15
149	16
150	16
151	16
152	16
153	16
154	16
155	16
156	16
157	16
158	16
159	16
160	17
161	17
162	17
163	17
164	17
165	17
166	17
167	17
168	17
169	17
170	439
171	17
172	17
173	17
174	17
175	18
176	18
177	18
178	18
179	23
180	23
181	23
182	23
183	23
184	23
185	23
186	6
187	11
198	421
373	342
230	439
263	429
293	310
294	439
295	439
299	23
300	23
301	441
302	317
303	15
304	317
305	317
306	6
307	18
308	18
309	6
311	1
312	1
313	1
314	1
315	1
316	1
318	1
319	1
320	310
321	310
322	310
323	429
324	310
326	310
327	310
328	310
329	310
330	310
331	310
332	310
333	310
343	342
344	342
345	439
346	439
347	439
348	438
349	438
350	450
351	6
352	342
353	342
354	342
355	342
356	342
357	342
358	342
359	342
360	342
361	342
362	342
363	342
364	342
365	342
366	342
367	342
368	342
369	342
370	342
371	342
372	342
375	441
384	381
385	429
386	429
387	381
388	381
389	381
390	381
583	438
396	395
398	395
402	395
403	397
404	397
412	409
480	462
481	462
432	431
433	10
434	10
435	438
436	429
437	429
444	438
445	438
446	438
472	3
473	3
476	462
477	462
478	462
479	462
482	462
483	462
484	462
485	462
486	462
487	462
488	462
492	438
493	438
494	438
503	790
507	780
509	379
510	379
511	379
512	379
513	379
515	18
517	516
524	14
526	429
528	671
529	466
531	466
543	401
544	401
546	418
557	466
601	438
602	438
603	438
566	567
569	429
570	429
571	429
572	439
573	429
574	429
575	429
576	439
577	439
578	439
579	438
580	438
581	438
584	438
585	438
586	438
587	438
588	438
589	438
590	438
591	438
592	438
593	438
594	438
595	438
596	438
597	438
598	438
599	438
600	438
604	438
605	438
606	438
607	438
608	438
609	438
610	438
611	438
612	438
613	438
614	438
615	438
616	438
617	438
618	438
619	438
620	438
621	438
622	438
623	438
624	438
625	438
626	438
627	438
628	438
629	438
630	438
631	438
632	438
633	438
634	450
635	450
636	450
637	450
638	450
639	450
640	450
641	450
642	450
643	317
644	317
645	317
646	317
647	317
648	317
649	418
650	418
651	418
652	418
653	418
711	708
654	418
655	418
656	418
657	418
658	418
659	418
660	418
661	418
662	418
663	418
664	418
665	467
666	671
745	552
667	671
668	687
669	671
670	671
673	467
675	839
676	839
677	839
678	839
680	679
681	679
682	679
683	679
684	679
685	679
686	679
688	687
689	687
690	687
691	687
692	687
693	687
694	687
695	687
696	687
697	687
698	687
699	687
700	687
701	687
702	687
703	687
704	687
705	687
706	687
707	839
709	708
710	708
712	708
713	708
714	708
715	671
716	671
717	671
718	671
719	671
720	671
721	439
722	439
723	439
724	439
725	439
726	439
727	441
728	439
729	439
730	552
731	552
732	552
733	552
734	552
735	552
736	552
737	552
738	552
739	552
740	552
741	552
742	552
743	552
744	552
746	552
747	552
748	552
749	552
750	429
751	429
752	429
753	429
754	429
755	429
756	429
757	429
758	429
759	429
760	429
761	429
762	429
763	429
764	429
765	429
766	429
767	429
768	429
769	429
770	429
771	429
772	429
773	429
774	429
775	429
776	429
777	429
778	429
779	7
782	317
783	317
784	317
785	421
786	421
791	790
792	790
793	790
794	790
795	790
796	790
797	790
798	790
799	790
800	790
801	790
802	790
803	790
804	790
805	790
806	790
807	790
808	790
809	790
810	790
811	456
812	456
813	456
814	456
815	456
816	456
817	456
819	448
820	448
821	448
822	448
823	448
824	448
30	450
399	429
520	429
32	450
33	450
5	1
13	1
19	1
20	1
21	1
22	1
24	7
25	7
26	7
27	7
28	7
29	7
31	450
34	450
35	1
36	1
37	1
38	325
39	325
40	325
41	325
42	325
43	325
44	325
45	325
46	2
47	2
49	9
50	9
51	9
52	9
53	9
54	9
55	9
56	9
57	9
58	3
59	3
60	3
61	3
825	448
48	\N
672	467
826	448
827	448
828	448
829	448
830	448
832	460
833	460
834	460
835	460
836	460
837	460
847	865
848	865
849	865
850	865
851	865
852	865
853	865
854	865
855	865
856	14
857	14
858	14
859	14
860	14
861	14
862	14
863	14
864	14
866	466
867	466
868	466
869	466
870	466
871	466
872	466
873	466
874	466
875	466
876	466
877	466
878	466
879	466
880	466
881	466
882	466
884	376
885	376
886	376
887	376
888	376
890	420
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (id, name) FROM stdin;
1	College Building
2	Business
\.


--
-- Data for Name: tag_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_location (id, tag_id, location_id) FROM stdin;
1	1	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 891, true);


--
-- Name: login_tracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_tracker_id_seq', 5, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 2, true);


--
-- Name: tag_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_location_id_seq', 54, true);


--
-- Name: administrator DiskoverApp_administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "DiskoverApp_administrator_pkey" PRIMARY KEY (username);


--
-- Name: image DiskoverApp_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "DiskoverApp_image_pkey" PRIMARY KEY (img_url);


--
-- Name: inside DiskoverApp_inside_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inside
    ADD CONSTRAINT "DiskoverApp_inside_pkey" PRIMARY KEY (room);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: login_tracker login_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_tracker
    ADD CONSTRAINT login_tracker_pkey PRIMARY KEY (id);


--
-- Name: subarea subarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subarea
    ADD CONSTRAINT subarea_pkey PRIMARY KEY (sub_id);


--
-- Name: tag_location tag_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_location
    ADD CONSTRAINT tag_location_pkey PRIMARY KEY (id);


--
-- Name: tag_location tag_location_tag_id_location_id_95b8a876_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_location
    ADD CONSTRAINT tag_location_tag_id_location_id_95b8a876_uniq UNIQUE (tag_id, location_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: DiskoverApp_administrator_username_404381de_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiskoverApp_administrator_username_404381de_like" ON public.administrator USING btree (username varchar_pattern_ops);


--
-- Name: DiskoverApp_category_name_113ac38f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiskoverApp_category_name_113ac38f_like" ON public.category USING btree (name varchar_pattern_ops);


--
-- Name: DiskoverApp_image_img_url_19f766e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiskoverApp_image_img_url_19f766e5_like" ON public.image USING btree (img_url varchar_pattern_ops);


--
-- Name: DiskoverApp_inside_room_31dc4780_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiskoverApp_inside_room_31dc4780_like" ON public.inside USING btree (room varchar_pattern_ops);


--
-- Name: DiskoverApp_location_name_dbc45648_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DiskoverApp_location_name_dbc45648_like" ON public.location USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: tag_location_location_id_70720091; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tag_location_location_id_70720091 ON public.tag_location USING btree (location_id);


--
-- Name: tag_location_tag_id_0c888e3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tag_location_tag_id_0c888e3b ON public.tag_location USING btree (tag_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location location_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_category_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: subarea subarea_building_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subarea
    ADD CONSTRAINT subarea_building_fkey FOREIGN KEY (building_id) REFERENCES public.location(id) ON DELETE CASCADE;


--
-- Name: subarea subarea_sub_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subarea
    ADD CONSTRAINT subarea_sub_fkey FOREIGN KEY (sub_id) REFERENCES public.location(id) ON DELETE CASCADE;


--
-- Name: tag_location tag_location_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_location
    ADD CONSTRAINT tag_location_location_fkey FOREIGN KEY (location_id) REFERENCES public.location(id) ON DELETE CASCADE;


--
-- Name: tag_location tag_location_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_location
    ADD CONSTRAINT tag_location_tag_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

