--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ContactBoxApp_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_address" (
    id integer NOT NULL,
    city character varying(64) NOT NULL,
    street character varying(128) NOT NULL,
    house_nr integer,
    flat_nr integer
);


ALTER TABLE public."ContactBoxApp_address" OWNER TO postgres;

--
-- Name: ContactBoxApp_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_address_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_address_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_address_id_seq" OWNED BY public."ContactBoxApp_address".id;


--
-- Name: ContactBoxApp_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_email" (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    type integer,
    person_id integer NOT NULL
);


ALTER TABLE public."ContactBoxApp_email" OWNER TO postgres;

--
-- Name: ContactBoxApp_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_email_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_email_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_email_id_seq" OWNED BY public."ContactBoxApp_email".id;


--
-- Name: ContactBoxApp_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_groups" (
    id integer NOT NULL,
    groupname character varying(128) NOT NULL
);


ALTER TABLE public."ContactBoxApp_groups" OWNER TO postgres;

--
-- Name: ContactBoxApp_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_groups_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_groups_id_seq" OWNED BY public."ContactBoxApp_groups".id;


--
-- Name: ContactBoxApp_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_person" (
    id integer NOT NULL,
    first character varying(64) NOT NULL,
    last character varying(128) NOT NULL,
    description text NOT NULL,
    address_id integer
);


ALTER TABLE public."ContactBoxApp_person" OWNER TO postgres;

--
-- Name: ContactBoxApp_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_person_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_person_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_person_id_seq" OWNED BY public."ContactBoxApp_person".id;


--
-- Name: ContactBoxApp_persongroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_persongroups" (
    id integer NOT NULL,
    groups_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public."ContactBoxApp_persongroups" OWNER TO postgres;

--
-- Name: ContactBoxApp_persongroups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_persongroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_persongroups_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_persongroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_persongroups_id_seq" OWNED BY public."ContactBoxApp_persongroups".id;


--
-- Name: ContactBoxApp_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactBoxApp_phone" (
    id integer NOT NULL,
    number character varying(64),
    type integer,
    person_id integer NOT NULL
);


ALTER TABLE public."ContactBoxApp_phone" OWNER TO postgres;

--
-- Name: ContactBoxApp_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactBoxApp_phone_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ContactBoxApp_phone_id_seq" OWNER TO postgres;

--
-- Name: ContactBoxApp_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactBoxApp_phone_id_seq" OWNED BY public."ContactBoxApp_phone".id;


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
    last_name character varying(30) NOT NULL,
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_address" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_address_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_email" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_email_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_groups" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_groups_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_person" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_person_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_persongroups" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_persongroups_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_phone" ALTER COLUMN id SET DEFAULT nextval('public."ContactBoxApp_phone_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: ContactBoxApp_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_address" (id, city, street, house_nr, flat_nr) FROM stdin;
1	Wrocław	Śliczna	29	7
122	????		\N	\N
123	????		\N	\N
124			\N	\N
125			\N	\N
6	Wrocław	Magellana	28	13
126			\N	\N
127			\N	\N
10	Wrocław		\N	\N
128			\N	\N
8	Wrocław	Borowska	\N	\N
89	Wrocław	Śliczna	29	8
\.


--
-- Name: ContactBoxApp_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_address_id_seq"', 128, true);


--
-- Data for Name: ContactBoxApp_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_email" (id, email, type, person_id) FROM stdin;
6	ola.wadolowska@gmail.com	1	6
7	radek.wadolowski@gmail.com	1	7
9	tsmok@wp.pl	1	9
3	tobiaszkazanowski@gmail.com	1	3
19	ewelkakaz@gmail.com	1	13
20	ekaz@cs.wroc.pl	2	13
8	grzegorzbronowicki@gmail.com	1	8
\.


--
-- Name: ContactBoxApp_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_email_id_seq"', 27, true);


--
-- Data for Name: ContactBoxApp_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_groups" (id, groupname) FROM stdin;
1	Rodzina
5	Praca
6	Najbliżsi
3	Dzieci
4	Znajomi
\.


--
-- Name: ContactBoxApp_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_groups_id_seq"', 17, true);


--
-- Data for Name: ContactBoxApp_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_person" (id, first, last, description, address_id) FROM stdin;
6	Ola	Wądołowska	siostra	6
7	Radosław	Wądołowski	szwagier	6
9	Tomek	Smok	wykończeniówka	8
5	Tymuś	Kazanowski	synek	89
4	Zosia	Kazanowska	córeczka	89
3	Tobiasz	Kazanowski	mój	89
13	Ewelka	Kazanowska	żona ukochana	89
8	Grzesiu	Bronowicki	wykończeniówka	8
\.


--
-- Name: ContactBoxApp_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_person_id_seq"', 20, true);


--
-- Data for Name: ContactBoxApp_persongroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_persongroups" (id, groups_id, person_id) FROM stdin;
2	1	3
3	1	4
4	1	5
5	1	6
6	1	7
7	5	8
8	5	9
13	4	8
40	1	13
41	6	13
47	3	4
48	3	5
49	6	4
\.


--
-- Name: ContactBoxApp_persongroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_persongroups_id_seq"', 56, true);


--
-- Data for Name: ContactBoxApp_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ContactBoxApp_phone" (id, number, type, person_id) FROM stdin;
6	888888888	1	6
7	888888888	1	7
9	888888888	1	9
3	605532712	2	3
42	888888888	1	13
37	888888888	2	8
41	777777777	1	8
\.


--
-- Name: ContactBoxApp_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ContactBoxApp_phone_id_seq"', 49, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add email	7	add_email
20	Can change email	7	change_email
21	Can delete email	7	delete_email
22	Can add phone	8	add_phone
23	Can change phone	8	change_phone
24	Can delete phone	8	delete_phone
25	Can add person	9	add_person
26	Can change person	9	change_person
27	Can delete person	9	delete_person
28	Can add person groups	10	add_persongroups
29	Can change person groups	10	change_persongroups
30	Can delete person groups	10	delete_persongroups
31	Can add groups	11	add_groups
32	Can change groups	11	change_groups
33	Can delete groups	11	delete_groups
34	Can add address	12	add_address
35	Can change address	12	change_address
36	Can delete address	12	delete_address
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$QNPy59WPHpa9$Y2bSEAG7sXDF2fh4lCBvpjX508urqDFvrctexr/2L9I=	2018-05-15 00:38:17.759288+02	t	admin			tobiaszkazanowski@gmail.com	t	t	2018-05-11 01:25:51.839786+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-05-11 01:27:00.480306+02	1	Rodzina	1	[{"added": {}}]	11	1
2	2018-05-11 01:27:15.461245+02	2	Najbliżsi	1	[{"added": {}}]	11	1
3	2018-05-12 13:19:16.29084+02	9	,  None	3		12	1
4	2018-05-12 13:19:16.305378+02	7	,  None	3		12	1
5	2018-05-12 13:19:16.316696+02	5	,  None	3		12	1
6	2018-05-12 13:19:16.327689+02	4	,  None	3		12	1
7	2018-05-12 13:19:16.338881+02	3	,  None	3		12	1
8	2018-05-12 13:19:41.243685+02	2	Wrocław, Śliczna 29/7	3		12	1
9	2018-05-12 21:02:14.291514+02	10	Tobiasz Kazanowski 888888888 - home	1	[{"added": {}}]	8	1
10	2018-05-13 00:58:40.316901+02	35	Wrocław, Borowska None	3		12	1
11	2018-05-13 00:58:40.337303+02	34	Wrocław, Borowska None	3		12	1
12	2018-05-13 00:58:40.348441+02	33	Wrocław, Borowska None	3		12	1
13	2018-05-13 00:58:40.359559+02	32	Wrocław, Borowska None	3		12	1
14	2018-05-13 00:58:40.370397+02	31	Wrocław, Borowska None	3		12	1
15	2018-05-13 00:58:40.381397+02	30	Wrocław, Borowska None	3		12	1
16	2018-05-13 00:58:40.392719+02	29	Wrocław, Borowska None	3		12	1
17	2018-05-13 00:58:40.403754+02	28	Wrocław, Borowska None	3		12	1
18	2018-05-13 00:58:40.41478+02	27	Wrocław, Borowska None	3		12	1
19	2018-05-13 00:58:40.42584+02	26	Wrocław, Borowska None	3		12	1
20	2018-05-13 00:58:40.436855+02	25	Wrocław, Borowska None	3		12	1
21	2018-05-13 00:58:40.44797+02	24	Wrocław, Borowska None	3		12	1
22	2018-05-13 00:58:40.45925+02	23	Wrocław, Borowska None	3		12	1
23	2018-05-13 00:58:40.470169+02	22	Wrocław, Borowska None	3		12	1
24	2018-05-13 00:58:40.481309+02	21	Wrocław, Borowska None	3		12	1
25	2018-05-13 00:58:40.492363+02	20	Wrocław, Borowska None	3		12	1
26	2018-05-13 00:58:40.503357+02	19	Wrocław, Borowska None	3		12	1
27	2018-05-13 00:58:40.514313+02	18	Wrocław,  None	3		12	1
28	2018-05-13 00:58:40.526425+02	17	Wrocław,  None	3		12	1
29	2018-05-13 00:58:40.536554+02	16	Wrocław,  None	3		12	1
30	2018-05-13 00:58:40.547776+02	15	Wrocław,  None	3		12	1
31	2018-05-13 00:58:40.558766+02	14	Wrocław, Borowska None	3		12	1
32	2018-05-13 00:58:40.56984+02	13	Wrocław,  None	3		12	1
33	2018-05-13 00:58:40.581049+02	12	Wrocław,  None	3		12	1
34	2018-05-13 00:58:40.591906+02	11	Wrocław,  None	3		12	1
35	2018-05-13 00:59:55.622174+02	12	Grzesiu Praca	3		10	1
36	2018-05-14 22:56:39.905478+02	25	Grzesiu Bronowicki None - None	3		8	1
37	2018-05-14 22:56:39.985679+02	24	Grzesiu Bronowicki None - None	3		8	1
38	2018-05-14 22:56:40.030042+02	23	Grzesiu Bronowicki 888888888 - home	3		8	1
39	2018-05-14 22:56:40.041075+02	22	Grzesiu Bronowicki None - None	3		8	1
40	2018-05-14 22:56:40.051978+02	21	Grzesiu Bronowicki None - None	3		8	1
41	2018-05-14 22:56:40.063166+02	20	Grzesiu Bronowicki 888888888 - home	3		8	1
42	2018-05-14 22:56:40.07444+02	19	Grzesiu Bronowicki None - None	3		8	1
43	2018-05-14 22:56:40.085344+02	18	Grzesiu Bronowicki None - None	3		8	1
44	2018-05-14 22:56:40.09646+02	17	Grzesiu Bronowicki 888888888 - home	3		8	1
45	2018-05-14 23:01:56.865362+02	28	Grzesiu Bronowicki None - None	3		8	1
46	2018-05-14 23:01:56.8832+02	27	Grzesiu Bronowicki None - None	3		8	1
47	2018-05-14 23:01:56.894298+02	26	Grzesiu Bronowicki None - None	3		8	1
48	2018-05-14 23:12:09.014443+02	30	Grzesiu Bronowicki None - None	3		8	1
49	2018-05-14 23:15:36.798537+02	34	Grzesiu Bronowicki None - None	3		8	1
50	2018-05-14 23:15:36.817089+02	33	Grzesiu Bronowicki None - None	3		8	1
51	2018-05-14 23:15:36.828236+02	32	Grzesiu Bronowicki None - None	3		8	1
52	2018-05-14 23:15:36.839367+02	31	Grzesiu Bronowicki None - None	3		8	1
53	2018-05-15 00:33:27.333923+02	12	Grzesiu Bronowicki -  - None	3		7	1
54	2018-05-15 00:33:27.358937+02	11	Grzesiu Bronowicki -  - business	3		7	1
55	2018-05-15 00:38:31.916492+02	16	Grzesiu Bronowicki -  - None	3		7	1
56	2018-05-15 00:38:31.939317+02	15	Grzesiu Bronowicki -  - None	3		7	1
57	2018-05-15 00:38:31.950396+02	14	Grzesiu Bronowicki -  - None	3		7	1
58	2018-05-15 00:38:31.961421+02	13	Grzesiu Bronowicki -  - None	3		7	1
59	2018-05-15 23:21:42.964777+02	35	Ewelka Najbliżsi	3		10	1
60	2018-05-15 23:21:43.001683+02	34	Ewelka Rodzina	3		10	1
61	2018-05-15 23:21:43.012528+02	33	Ewelka Rodzina	3		10	1
62	2018-05-15 23:21:43.023302+02	31	Ewelka Najbliżsi	3		10	1
63	2018-05-15 23:21:43.0346+02	30	Ewelka Rodzina	3		10	1
64	2018-05-15 23:21:43.045642+02	29	Ewelka Rodzina	3		10	1
65	2018-05-15 23:21:43.056706+02	27	Ewelka Najbliżsi	3		10	1
66	2018-05-15 23:21:43.067773+02	26	Ewelka Rodzina	3		10	1
67	2018-05-15 23:21:43.079024+02	25	Ewelka Rodzina	3		10	1
68	2018-05-15 23:21:43.090122+02	24	Ewelka Najbliżsi	3		10	1
69	2018-05-15 23:21:43.101056+02	23	Ewelka Rodzina	3		10	1
70	2018-05-15 23:21:43.112145+02	22	Ewelka Rodzina	3		10	1
71	2018-05-15 23:21:43.123212+02	20	Ewelka Rodzina	3		10	1
72	2018-05-16 00:07:39.143661+02	39	Ewelka Znajomi	3		10	1
73	2018-05-16 00:07:39.176732+02	38	Ewelka Dzieci	3		10	1
74	2018-05-16 00:07:39.187627+02	37	Ewelka Najbliżsi	3		10	1
75	2018-05-16 00:07:39.198757+02	36	Ewelka Rodzina	3		10	1
76	2018-05-16 00:07:39.209938+02	21	Ewelka Najbliżsi	3		10	1
77	2018-05-16 00:07:39.220826+02	17	Ewelka Rodzina	3		10	1
78	2018-05-16 00:11:56.612963+02	44	Ewelka Dzieci	3		10	1
79	2018-05-16 00:11:56.652617+02	43	Ewelka Najbliżsi	3		10	1
80	2018-05-16 00:11:56.663182+02	42	Ewelka Rodzina	3		10	1
81	2018-05-16 00:22:58.918093+02	45	Ewelka Dzieci	3		10	1
82	2018-05-16 00:26:08.247396+02	46	Ewelka Dzieci	3		10	1
83	2018-05-16 00:37:21.353036+02	121	Wrocław, Śliczna 29/7	3		12	1
84	2018-05-16 00:37:21.39757+02	120	Wrocław, Śliczna 29/7	3		12	1
85	2018-05-16 00:37:21.408468+02	119	Wrocław, Śliczna 29/8	3		12	1
86	2018-05-16 00:37:21.419429+02	118	Wrocław, Śliczna 29/8	3		12	1
87	2018-05-16 00:37:21.470662+02	117	Wrocław, Śliczna 29/8	3		12	1
88	2018-05-16 00:37:21.497062+02	116	Wrocław, Śliczna 29/8	3		12	1
89	2018-05-16 00:37:21.507976+02	115	Wrocław, Śliczna 29/8	3		12	1
90	2018-05-16 00:37:21.519173+02	114	Wrocław, Śliczna 29/8	3		12	1
91	2018-05-16 00:37:21.530274+02	113	Wrocław, Śliczna 29/8	3		12	1
92	2018-05-16 00:37:21.541339+02	112	Wrocław, Śliczna 29/8	3		12	1
93	2018-05-16 00:37:21.552449+02	111	Wrocław, Śliczna 29/8	3		12	1
94	2018-05-16 00:37:21.563542+02	110	Wrocław, Śliczna 29/8	3		12	1
95	2018-05-16 00:37:21.574371+02	109	Wrocław, Śliczna 29/8	3		12	1
96	2018-05-16 00:37:21.5856+02	108	Wrocław, Śliczna 29/8	3		12	1
97	2018-05-16 00:37:21.596825+02	107	Wrocław, Śliczna 29/8	3		12	1
98	2018-05-16 00:37:21.607675+02	106	Wrocław, Śliczna 29/8	3		12	1
99	2018-05-16 00:37:21.618707+02	105	Wrocław, Śliczna 29/8	3		12	1
100	2018-05-16 00:37:21.630086+02	104	Wrocław, Śliczna 29/8	3		12	1
101	2018-05-16 00:37:21.641224+02	103	Wrocław, Śliczna 29/8	3		12	1
102	2018-05-16 00:37:21.652157+02	102	Wrocław, Śliczna 29/8	3		12	1
103	2018-05-16 00:37:21.66327+02	101	Wrocław, Śliczna 29/8	3		12	1
104	2018-05-16 00:37:21.674151+02	100	Wrocław, Śliczna 29/8	3		12	1
105	2018-05-16 00:37:21.685264+02	99	Wrocław, Śliczna 29/8	3		12	1
106	2018-05-16 00:37:21.696596+02	98	Wrocław, Śliczna 29/8	3		12	1
107	2018-05-16 00:37:21.707166+02	97	Wrocław, Śliczna 29/8	3		12	1
108	2018-05-16 00:37:21.718398+02	96	Wrocław, Śliczna 29/8	3		12	1
109	2018-05-16 00:37:21.729341+02	95	Wrocław, Śliczna 29/8	3		12	1
110	2018-05-16 00:37:21.740395+02	94	Wrocław, Śliczna 29/8	3		12	1
111	2018-05-16 00:37:21.751519+02	93	Wrocław, Śliczna 29/8	3		12	1
112	2018-05-16 00:37:21.762641+02	92	Wrocław, Śliczna 29/8	3		12	1
113	2018-05-16 00:37:21.773674+02	91	Wrocław, Śliczna 29/8	3		12	1
114	2018-05-16 00:37:21.784928+02	90	Wrocław, Śliczna 29/8	3		12	1
115	2018-05-16 00:37:21.796152+02	88	Wrocław, Śliczna 29/7	3		12	1
116	2018-05-16 00:37:21.807017+02	87	,  None	3		12	1
117	2018-05-16 00:37:21.818345+02	86	Wrocław, Śliczna 29/7	3		12	1
118	2018-05-16 00:37:21.829326+02	85	Wrocław, Borowska None	3		12	1
119	2018-05-16 00:37:21.840297+02	84	Wrocław, Borowska None	3		12	1
120	2018-05-16 00:37:21.851478+02	83	Wrocław, Borowska None	3		12	1
121	2018-05-16 00:37:21.862579+02	82	Wrocław, Borowska None	3		12	1
122	2018-05-16 00:37:21.873447+02	81	Wrocław, Borowska None	3		12	1
123	2018-05-16 00:37:21.884885+02	80	Wrocław, Borowska None	3		12	1
124	2018-05-16 00:37:21.895719+02	79	Wrocław, Borowska None	3		12	1
125	2018-05-16 00:37:21.906777+02	78	Wrocław, Borowska None	3		12	1
126	2018-05-16 00:37:21.918034+02	77	Wrocław, Borowska None	3		12	1
127	2018-05-16 00:37:21.9291+02	76	Wrocław, Borowska None	3		12	1
128	2018-05-16 00:37:21.93992+02	75	Wrocław, Borowska None	3		12	1
129	2018-05-16 00:37:21.951141+02	74	Wrocław, Borowska None	3		12	1
130	2018-05-16 00:37:21.962402+02	73	Wrocław, Borowska None	3		12	1
131	2018-05-16 00:37:21.973274+02	72	Wrocław, Borowska None	3		12	1
132	2018-05-16 00:37:21.984438+02	71	Wrocław, Borowska None	3		12	1
133	2018-05-16 00:37:22.03691+02	70	Wrocław, Borowska None	3		12	1
134	2018-05-16 00:37:22.09532+02	69	Wrocław, Borowska None	3		12	1
135	2018-05-16 00:37:22.10622+02	68	Wrocław, Borowska None	3		12	1
136	2018-05-16 00:37:22.117429+02	67	Wrocław, Borowska None	3		12	1
137	2018-05-16 00:37:22.128313+02	66	Wrocław, Borowska None	3		12	1
138	2018-05-16 00:37:22.13962+02	65	Wrocław, Borowska None	3		12	1
139	2018-05-16 00:37:22.150509+02	64	Wrocław, Borowska None	3		12	1
140	2018-05-16 00:37:22.162003+02	63	Wrocław, Borowska None	3		12	1
141	2018-05-16 00:37:22.172773+02	62	Wrocław, Borowska None	3		12	1
142	2018-05-16 00:37:22.183766+02	61	Wrocław, Borowska None	3		12	1
143	2018-05-16 00:37:22.195039+02	60	Wrocław, Borowska None	3		12	1
144	2018-05-16 00:37:22.206082+02	59	Wrocław, Borowska None	3		12	1
145	2018-05-16 00:37:22.217003+02	58	Wrocław, Borowska None	3		12	1
146	2018-05-16 00:37:22.228131+02	57	Wrocław, Borowska None	3		12	1
147	2018-05-16 00:37:22.239225+02	56	Wrocław, Borowska None	3		12	1
148	2018-05-16 00:37:22.250309+02	55	Wrocław, Borowska None	3		12	1
149	2018-05-16 00:37:22.261423+02	54	Wrocław, Borowska None	3		12	1
150	2018-05-16 00:37:22.272258+02	53	Wrocław, Borowska None	3		12	1
151	2018-05-16 00:37:22.283552+02	52	Wrocław, Borowska None	3		12	1
152	2018-05-16 00:37:22.294337+02	51	Wrocław, Borowska None	3		12	1
153	2018-05-16 00:37:22.305328+02	50	Wrocław, Borowska None	3		12	1
154	2018-05-16 00:37:22.31646+02	49	Wrocław, Borowska None	3		12	1
155	2018-05-16 00:37:22.327627+02	48	Wrocław, Borowska None	3		12	1
156	2018-05-16 00:37:22.338778+02	47	Wrocław, Borowska None	3		12	1
157	2018-05-16 00:37:22.349926+02	46	Wrocław, Borowska None	3		12	1
158	2018-05-16 00:37:22.361186+02	45	Wrocław, Borowska None	3		12	1
159	2018-05-16 00:37:22.37201+02	44	Wrocław, Borowska None	3		12	1
160	2018-05-16 00:37:22.383167+02	43	Wrocław, Borowska None	3		12	1
161	2018-05-16 00:37:22.394264+02	42	Wrocław, Borowska None	3		12	1
162	2018-05-16 00:37:22.405325+02	41	Wrocław, Borowska None	3		12	1
163	2018-05-16 00:37:22.416362+02	40	Wrocław, Borowska None	3		12	1
164	2018-05-16 00:37:22.427469+02	39	Wrocław, Borowska None	3		12	1
165	2018-05-16 00:37:22.438407+02	38	Wrocław, Borowska None	3		12	1
166	2018-05-16 00:37:22.449508+02	37	Wrocław, Borowska None	3		12	1
167	2018-05-16 00:37:22.460531+02	36	Wrocław, Borowska None	3		12	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 167, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	ContactBoxApp	email
8	ContactBoxApp	phone
9	ContactBoxApp	person
10	ContactBoxApp	persongroups
11	ContactBoxApp	groups
12	ContactBoxApp	address
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	ContactBoxApp	0001_initial	2018-05-11 01:25:28.920078+02
2	contenttypes	0001_initial	2018-05-11 01:25:29.063162+02
3	auth	0001_initial	2018-05-11 01:25:30.073157+02
4	admin	0001_initial	2018-05-11 01:25:30.33884+02
5	admin	0002_logentry_remove_auto_add	2018-05-11 01:25:30.382369+02
6	contenttypes	0002_remove_content_type_name	2018-05-11 01:25:30.493494+02
7	auth	0002_alter_permission_name_max_length	2018-05-11 01:25:30.526435+02
8	auth	0003_alter_user_email_max_length	2018-05-11 01:25:30.571521+02
9	auth	0004_alter_user_username_opts	2018-05-11 01:25:30.601576+02
10	auth	0005_alter_user_last_login_null	2018-05-11 01:25:30.637318+02
11	auth	0006_require_contenttypes_0002	2018-05-11 01:25:30.64747+02
12	auth	0007_alter_validators_add_error_messages	2018-05-11 01:25:30.6833+02
13	auth	0008_alter_user_username_max_length	2018-05-11 01:25:30.780906+02
14	sessions	0001_initial	2018-05-11 01:25:30.946921+02
15	ContactBoxApp	0002_auto_20180515_2330	2018-05-16 01:31:31.227607+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
9aq2v7afaczigxbz7i9znc1ojb220jhr	YzA0YzIyMzNmYzY1NTczMWEzZDRmZDlmZjkyZjczNjBlMWJiNDdiMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI0Y2ZlZTQ5NmUyN2UzYjlmOTY0ZjE2ZTNjNDViZjVjY2M3Zjg4YWQ4In0=	2018-05-25 01:26:51.305996+02
ylcojw6e8hpo8pfdoxlwtgdsg6wcifmn	NjA2MzE4YjhlNGUyNDM2M2I3Yzc3Mjk0YzQ4YmNjZWFlNzQ4MDVmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjZmVlNDk2ZTI3ZTNiOWY5NjRmMTZlM2M0NWJmNWNjYzdmODhhZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-29 00:38:17.771954+02
\.


--
-- Name: ContactBoxApp_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_address"
    ADD CONSTRAINT "ContactBoxApp_address_pkey" PRIMARY KEY (id);


--
-- Name: ContactBoxApp_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_email"
    ADD CONSTRAINT "ContactBoxApp_email_pkey" PRIMARY KEY (id);


--
-- Name: ContactBoxApp_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_groups"
    ADD CONSTRAINT "ContactBoxApp_groups_pkey" PRIMARY KEY (id);


--
-- Name: ContactBoxApp_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_person"
    ADD CONSTRAINT "ContactBoxApp_person_pkey" PRIMARY KEY (id);


--
-- Name: ContactBoxApp_persongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_persongroups"
    ADD CONSTRAINT "ContactBoxApp_persongroups_pkey" PRIMARY KEY (id);


--
-- Name: ContactBoxApp_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_phone"
    ADD CONSTRAINT "ContactBoxApp_phone_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ContactBoxApp_email_person_id_6bbe669c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactBoxApp_email_person_id_6bbe669c" ON public."ContactBoxApp_email" USING btree (person_id);


--
-- Name: ContactBoxApp_person_address_id_0276899c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactBoxApp_person_address_id_0276899c" ON public."ContactBoxApp_person" USING btree (address_id);


--
-- Name: ContactBoxApp_persongroups_groups_id_4bbdbcef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactBoxApp_persongroups_groups_id_4bbdbcef" ON public."ContactBoxApp_persongroups" USING btree (groups_id);


--
-- Name: ContactBoxApp_persongroups_person_id_8b484eda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactBoxApp_persongroups_person_id_8b484eda" ON public."ContactBoxApp_persongroups" USING btree (person_id);


--
-- Name: ContactBoxApp_phone_person_id_ae29fe1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ContactBoxApp_phone_person_id_ae29fe1f" ON public."ContactBoxApp_phone" USING btree (person_id);


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
-- Name: ContactBoxApp_email_person_id_6bbe669c_fk_ContactBo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_email"
    ADD CONSTRAINT "ContactBoxApp_email_person_id_6bbe669c_fk_ContactBo" FOREIGN KEY (person_id) REFERENCES public."ContactBoxApp_person"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ContactBoxApp_person_address_id_0276899c_fk_ContactBo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_person"
    ADD CONSTRAINT "ContactBoxApp_person_address_id_0276899c_fk_ContactBo" FOREIGN KEY (address_id) REFERENCES public."ContactBoxApp_address"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ContactBoxApp_person_groups_id_4bbdbcef_fk_ContactBo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_persongroups"
    ADD CONSTRAINT "ContactBoxApp_person_groups_id_4bbdbcef_fk_ContactBo" FOREIGN KEY (groups_id) REFERENCES public."ContactBoxApp_groups"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ContactBoxApp_person_person_id_8b484eda_fk_ContactBo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_persongroups"
    ADD CONSTRAINT "ContactBoxApp_person_person_id_8b484eda_fk_ContactBo" FOREIGN KEY (person_id) REFERENCES public."ContactBoxApp_person"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ContactBoxApp_phone_person_id_ae29fe1f_fk_ContactBo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactBoxApp_phone"
    ADD CONSTRAINT "ContactBoxApp_phone_person_id_ae29fe1f_fk_ContactBo" FOREIGN KEY (person_id) REFERENCES public."ContactBoxApp_person"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

