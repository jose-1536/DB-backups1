--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-10-15 23:49:43

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
-- TOC entry 3543 (class 1262 OID 24780)
-- Name: gym_dbpost_wsl; Type: DATABASE; Schema: -; Owner: jose
--

CREATE DATABASE gym_dbpost_wsl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE gym_dbpost_wsl OWNER TO jose;

\connect gym_dbpost_wsl

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
-- TOC entry 236 (class 1255 OID 32984)
-- Name: audit_members(); Type: FUNCTION; Schema: public; Owner: jose
--

CREATE FUNCTION public.audit_members() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO members_audit (member_id, action_member, after_data)
    VALUES (
      NEW.id,
      'INSERT',
      to_jsonb(NEW)
    );
    RETURN NEW;

  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO members_audit (member_id, action_member, before_data, after_data)
    VALUES (
      NEW.id,
      'UPDATE',
      to_jsonb(OLD),
      to_jsonb(NEW)
    );
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO members_audit (member_id, action_member, before_data)
    VALUES (
      OLD.id,
      'DELETE',
      to_jsonb(OLD)
    );
    RETURN OLD;
  END IF;
END;
$$;


ALTER FUNCTION public.audit_members() OWNER TO jose;

--
-- TOC entry 238 (class 1255 OID 32992)
-- Name: audit_payments(); Type: FUNCTION; Schema: public; Owner: jose
--

CREATE FUNCTION public.audit_payments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO payments_audit (payment_id, action_type, after_data)
    VALUES (
      NEW.id,
      'INSERT',
      to_jsonb(NEW)
    );
    RETURN NEW;

  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO payments_audit (payment_id, action_type, before_data, after_data)
    VALUES (
      NEW.id,
      'UPDATE',
      to_jsonb(OLD),
      to_jsonb(NEW)
    );
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO payments_audit (payment_id, action_type, before_data)
    VALUES (
      OLD.id,
      'DELETE',
      to_jsonb(OLD)
    );
    RETURN OLD;
  END IF;
END;
$$;


ALTER FUNCTION public.audit_payments() OWNER TO jose;

--
-- TOC entry 237 (class 1255 OID 32991)
-- Name: sp_member_plan_trainer(); Type: FUNCTION; Schema: public; Owner: jose
--

CREATE FUNCTION public.sp_member_plan_trainer() RETURNS TABLE(member_name character varying, plan_name character varying, trainer_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.name AS member_name,
        p.name AS plan_name,
        t.name AS trainer_name
    FROM members m
    JOIN memberships ms ON m.id = ms.member_id
    JOIN plans p ON ms.plan_id = p.id
    JOIN trainers t ON ms.trainer_id = t.id;
END;
$$;


ALTER FUNCTION public.sp_member_plan_trainer() OWNER TO jose;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 24839)
-- Name: attendances; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.attendances (
    id integer NOT NULL,
    attendance_date date NOT NULL,
    member_id integer
);


ALTER TABLE public.attendances OWNER TO jose;

--
-- TOC entry 225 (class 1259 OID 24838)
-- Name: attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.attendances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendances_id_seq OWNER TO jose;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 225
-- Name: attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.attendances_id_seq OWNED BY public.attendances.id;


--
-- TOC entry 230 (class 1259 OID 24868)
-- Name: exercises; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.exercises (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    muscle_group character varying(50)
);


ALTER TABLE public.exercises OWNER TO jose;

--
-- TOC entry 229 (class 1259 OID 24867)
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercises_id_seq OWNER TO jose;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 229
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- TOC entry 216 (class 1259 OID 24782)
-- Name: members; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.members (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    address character varying(100)
);


ALTER TABLE public.members OWNER TO jose;

--
-- TOC entry 233 (class 1259 OID 32973)
-- Name: members_audit; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.members_audit (
    id integer NOT NULL,
    member_id integer NOT NULL,
    action_member character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    changed_by character varying(255) DEFAULT CURRENT_USER,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT members_audit_action_member_check CHECK (((action_member)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.members_audit OWNER TO jose;

--
-- TOC entry 232 (class 1259 OID 32972)
-- Name: members_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.members_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_audit_id_seq OWNER TO jose;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 232
-- Name: members_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.members_audit_id_seq OWNED BY public.members_audit.id;


--
-- TOC entry 215 (class 1259 OID 24781)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO jose;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 215
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- TOC entry 222 (class 1259 OID 24803)
-- Name: memberships; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.memberships (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    member_id integer,
    plan_id integer,
    trainer_id integer
);


ALTER TABLE public.memberships OWNER TO jose;

--
-- TOC entry 221 (class 1259 OID 24802)
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memberships_id_seq OWNER TO jose;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 221
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- TOC entry 224 (class 1259 OID 24825)
-- Name: payments; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL,
    membership_id integer
);


ALTER TABLE public.payments OWNER TO jose;

--
-- TOC entry 235 (class 1259 OID 32997)
-- Name: payments_audit; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.payments_audit (
    id integer NOT NULL,
    payment_id integer NOT NULL,
    action_type character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    changed_by character varying(255) DEFAULT CURRENT_USER,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT payments_audit_action_type_check CHECK (((action_type)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.payments_audit OWNER TO jose;

--
-- TOC entry 234 (class 1259 OID 32996)
-- Name: payments_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.payments_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_audit_id_seq OWNER TO jose;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 234
-- Name: payments_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.payments_audit_id_seq OWNED BY public.payments_audit.id;


--
-- TOC entry 223 (class 1259 OID 24824)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO jose;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 220 (class 1259 OID 24796)
-- Name: plans; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.plans OWNER TO jose;

--
-- TOC entry 219 (class 1259 OID 24795)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plans_id_seq OWNER TO jose;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 219
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- TOC entry 231 (class 1259 OID 24874)
-- Name: routine_exercises; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.routine_exercises (
    routine_id integer NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.routine_exercises OWNER TO jose;

--
-- TOC entry 228 (class 1259 OID 24851)
-- Name: routines; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.routines (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    member_id integer,
    trainer_id integer
);


ALTER TABLE public.routines OWNER TO jose;

--
-- TOC entry 227 (class 1259 OID 24850)
-- Name: routines_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.routines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routines_id_seq OWNER TO jose;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 227
-- Name: routines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.routines_id_seq OWNED BY public.routines.id;


--
-- TOC entry 218 (class 1259 OID 24789)
-- Name: trainers; Type: TABLE; Schema: public; Owner: jose
--

CREATE TABLE public.trainers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specialty character varying(80)
);


ALTER TABLE public.trainers OWNER TO jose;

--
-- TOC entry 217 (class 1259 OID 24788)
-- Name: trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: jose
--

CREATE SEQUENCE public.trainers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainers_id_seq OWNER TO jose;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 217
-- Name: trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jose
--

ALTER SEQUENCE public.trainers_id_seq OWNED BY public.trainers.id;


--
-- TOC entry 3324 (class 2604 OID 24842)
-- Name: attendances id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances ALTER COLUMN id SET DEFAULT nextval('public.attendances_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 24871)
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 24785)
-- Name: members id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 32976)
-- Name: members_audit id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members_audit ALTER COLUMN id SET DEFAULT nextval('public.members_audit_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 24806)
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 24828)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 33000)
-- Name: payments_audit id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments_audit ALTER COLUMN id SET DEFAULT nextval('public.payments_audit_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 24799)
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 24854)
-- Name: routines id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines ALTER COLUMN id SET DEFAULT nextval('public.routines_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 24792)
-- Name: trainers id; Type: DEFAULT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.trainers ALTER COLUMN id SET DEFAULT nextval('public.trainers_id_seq'::regclass);


--
-- TOC entry 3528 (class 0 OID 24839)
-- Dependencies: 226
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.attendances (id, attendance_date, member_id) FROM stdin;
1	2025-04-21	1
2	2025-05-06	2
3	2025-01-23	3
4	2025-11-22	4
5	2025-07-23	5
6	2025-07-18	6
7	2025-04-19	7
8	2025-02-09	8
9	2025-12-05	9
10	2025-09-19	10
11	2025-01-25	11
12	2025-05-21	12
13	2025-07-05	13
14	2025-04-16	14
15	2025-12-02	15
16	2025-01-20	16
17	2025-05-05	17
18	2025-12-08	18
19	2025-10-23	19
20	2025-12-22	20
21	2025-09-19	21
22	2025-06-10	22
23	2025-12-02	23
24	2025-09-29	24
25	2025-06-06	25
26	2025-04-26	26
27	2025-03-04	27
28	2025-04-13	28
29	2025-05-06	29
30	2025-02-23	30
31	2025-04-04	31
32	2025-09-25	32
33	2025-11-19	33
34	2025-07-19	34
35	2025-04-19	35
36	2025-09-09	36
37	2025-07-09	37
38	2025-11-27	38
39	2025-09-30	39
40	2025-10-19	40
41	2025-02-25	41
42	2025-08-24	42
43	2025-10-16	43
44	2025-06-04	44
45	2025-12-06	45
46	2025-12-16	46
47	2025-04-09	47
48	2025-12-17	48
49	2025-03-09	49
50	2025-03-07	50
51	2025-01-25	51
52	2025-07-27	52
53	2025-06-27	53
54	2025-06-05	54
55	2025-06-01	55
56	2025-03-06	56
57	2025-07-07	57
58	2025-04-02	58
59	2025-06-29	59
60	2025-12-25	60
61	2025-11-08	1
62	2025-08-28	2
63	2025-07-23	3
64	2025-02-20	4
65	2025-01-09	5
66	2025-12-04	6
67	2025-09-07	7
68	2025-11-09	8
69	2025-05-28	9
70	2025-07-19	10
71	2025-12-04	11
72	2025-11-04	12
73	2025-10-11	13
74	2025-11-30	14
75	2025-05-29	15
76	2025-02-19	16
77	2025-06-13	17
78	2025-09-19	18
79	2025-05-17	19
80	2025-05-12	20
81	2025-07-08	21
82	2025-07-14	22
83	2025-04-08	23
84	2025-02-20	24
85	2025-05-06	25
86	2025-02-20	26
87	2025-05-11	27
88	2025-12-12	28
89	2025-09-15	29
90	2025-01-25	30
91	2025-11-11	31
92	2025-04-27	32
93	2025-06-14	33
94	2025-10-31	34
95	2025-07-25	35
96	2025-12-18	36
97	2025-11-11	37
98	2025-06-17	38
99	2025-02-03	39
100	2025-02-17	40
101	2025-08-19	41
102	2025-11-02	42
103	2025-07-28	43
104	2025-08-06	44
105	2025-08-07	45
106	2025-10-14	46
107	2025-08-15	47
108	2025-11-18	48
109	2025-03-29	49
110	2025-11-09	50
111	2025-08-24	51
112	2025-09-21	52
113	2025-02-20	53
114	2025-07-23	54
115	2025-09-21	55
116	2025-05-21	56
117	2025-02-19	57
118	2025-02-20	58
119	2025-12-10	59
120	2025-08-24	60
\.


--
-- TOC entry 3532 (class 0 OID 24868)
-- Dependencies: 230
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.exercises (id, name, description, muscle_group) FROM stdin;
1	Push Up	Push up exercise	Chest
2	Squat	Squat exercise	Legs
3	Plank	Plank exercise	Core
4	Lunge	Lunge exercise	Legs
5	Bicep Curl	Bicep exercise	Arms
6	Jumping Jacks	Cardio warmup	Full Body
7	Burpees	Full body exercise	Full Body
8	Sit Up	Abdominal exercise	Core
9	Bench Press	Chest exercise	Chest
10	Deadlift	Back and legs	Back
11	Push Up	Bodyweight push-up exercise	Chest
12	Incline Bench Press	Bench press on incline bench	Chest
13	Decline Bench Press	Bench press on decline bench	Chest
14	Chest Fly	Dumbbell chest fly on flat bench	Chest
15	Cable Crossover	Cable machine chest isolation	Chest
16	Dumbbell Pullover	Chest and lats stretch exercise	Chest
17	Pec Deck	Machine-based chest fly exercise	Chest
18	Wide Push Up	Push up with wide hand placement	Chest
19	Diamond Push Up	Push up focusing on triceps and chest	Chest
20	Clap Push Up	Explosive push up for power	Chest
21	Squat	Standard barbell squat	Legs
22	Front Squat	Squat with barbell on front shoulders	Legs
23	Goblet Squat	Squat holding a dumbbell	Legs
24	Sumo Squat	Wide stance squat targeting inner thighs	Legs
25	Split Squat	Single leg static squat	Legs
26	Bulgarian Split Squat	Rear leg elevated squat	Legs
27	Leg Press	Machine-based leg press exercise	Legs
28	Walking Lunge	Alternating forward lunges	Legs
29	Reverse Lunge	Backward step lunge	Legs
30	Side Lunge	Lateral lunge for adductors	Legs
31	Plank	Core stabilization hold	Core
32	Side Plank	Oblique stabilization hold	Core
33	Sit Up	Classic abdominal flexion	Core
34	Crunch	Abdominal crunch exercise	Core
35	Reverse Crunch	Leg lift crunch for lower abs	Core
36	Hanging Leg Raise	Core exercise from hanging position	Core
37	Mountain Climbers	Dynamic plank movement for abs	Core
38	Flutter Kicks	Alternating leg kicks for abs	Core
39	V-Ups	Full body crunch for abs	Core
40	Ab Wheel Rollout	Rollout exercise using ab wheel	Core
41	Deadlift	Full body lift for back and legs	Back
42	Romanian Deadlift	Hamstring focused deadlift	Back
43	Sumo Deadlift	Wide stance deadlift for inner legs	Back
44	Pull Up	Bodyweight upper back exercise	Back
45	Chin Up	Underhand grip pull-up	Back
46	Lat Pulldown	Cable pulldown for lats	Back
47	Seated Row	Cable row for mid back	Back
48	Bent Over Row	Barbell row for lats and traps	Back
49	T-Bar Row	Row variation with T-bar handle	Back
50	Good Morning	Hamstring and back strengthening exercise	Back
51	Bicep Curl	Dumbbell curl for biceps	Arms
52	Barbell Curl	Barbell curl for biceps strength	Arms
53	Preacher Curl	Isolated bicep curl	Arms
54	Concentration Curl	Seated one-arm curl	Arms
55	Cable Curl	Cable-based curl for constant tension	Arms
56	Hammer Curl	Neutral grip curl for forearms and biceps	Arms
57	Tricep Extension	Overhead dumbbell tricep extension	Arms
58	Tricep Pushdown	Cable tricep extension with bar	Arms
59	Close Grip Bench Press	Bench press variation for triceps	Arms
60	Dips	Bodyweight tricep and chest exercise	Arms
61	Shoulder Press	Overhead dumbbell press	Shoulders
62	Arnold Press	Rotational shoulder press	Shoulders
63	Lateral Raise	Dumbbell raise to the side	Shoulders
64	Front Raise	Dumbbell raise to the front	Shoulders
65	Rear Delt Fly	Reverse fly for rear delts	Shoulders
66	Upright Row	Barbell row for traps and delts	Shoulders
67	Shrugs	Dumbbell shrugs for trapezius	Shoulders
68	Military Press	Barbell press for shoulders	Shoulders
69	Face Pull	Cable pull for rear delts	Shoulders
70	Cable Lateral Raise	Machine-based shoulder raise	Shoulders
71	Burpees	Full body explosive exercise	Full Body
72	Jumping Jacks	Cardio warm-up exercise	Full Body
73	High Knees	Dynamic cardio exercise	Full Body
74	Mountain Climbers	Fast-paced core and cardio move	Full Body
75	Bear Crawl	Crawling movement for total body	Full Body
76	Kettlebell Swing	Full body hip hinge movement	Full Body
77	Clean and Press	Olympic lift for power	Full Body
78	Snatch	Explosive Olympic lift	Full Body
79	Thruster	Squat to press combination	Full Body
80	Farmer’s Carry	Weighted carry for grip and stability	Full Body
81	Calf Raise	Standing calf raise	Legs
82	Seated Calf Raise	Machine-based calf raise	Legs
83	Hip Thrust	Glute bridge with weights	Legs
84	Glute Kickback	Cable glute isolation exercise	Legs
85	Leg Curl	Hamstring isolation on machine	Legs
86	Leg Extension	Quadriceps isolation on machine	Legs
87	Step Up	Step onto elevated platform	Legs
88	Box Jump	Explosive jump for power	Legs
89	Donkey Kick	Glute activation exercise	Legs
90	Wall Sit	Static lower body endurance exercise	Legs
\.


--
-- TOC entry 3518 (class 0 OID 24782)
-- Dependencies: 216
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.members (id, name, email, phone, address) FROM stdin;
2	Maria Lopez	maria2@mail.com	3001000002	Calle 2
3	Andres Gomez	andres3@mail.com	3001000003	Calle 3
4	Luisa Martinez	luisa4@mail.com	3001000004	Calle 4
5	Carlos Torres	carlos5@mail.com	3001000005	Calle 5
7	Miguel Sanchez	miguel7@mail.com	3001000007	Calle 7
8	Sofia Diaz	sofia8@mail.com	3001000008	Calle 8
9	Luis Herrera	luis9@mail.com	3001000009	Calle 9
10	Camila Morales	camila10@mail.com	3001000010	Calle 10
11	Jorge Rojas	jorge11@mail.com	3001000011	Calle 11
12	Paula Castillo	paula12@mail.com	3001000012	Calle 12
13	Daniel Alvarez	daniel13@mail.com	3001000013	Calle 13
14	Valeria Sanchez	valeria14@mail.com	3001000014	Calle 14
15	Andres Molina	andres15@mail.com	3001000015	Calle 15
16	Carolina Herrera	carolina16@mail.com	3001000016	Calle 16
17	Diego Gomez	diego17@mail.com	3001000017	Calle 17
18	Laura Perez	laura18@mail.com	3001000018	Calle 18
19	Ricardo Diaz	ricardo19@mail.com	3001000019	Calle 19
20	Andrea Morales	andrea20@mail.com	3001000020	Calle 20
21	Felipe Torres	felipe21@mail.com	3001000021	Calle 21
22	Natalia Martinez	natalia22@mail.com	3001000022	Calle 22
23	Javier Ramirez	javier23@mail.com	3001000023	Calle 23
24	Karen Castillo	karen24@mail.com	3001000024	Calle 24
25	Esteban Alvarez	esteban25@mail.com	3001000025	Calle 25
26	Daniela Sanchez	daniela26@mail.com	3001000026	Calle 26
27	Mario Molina	mario27@mail.com	3001000027	Calle 27
28	Monica Herrera	monica28@mail.com	3001000028	Calle 28
29	Andres Diaz	andres29@mail.com	3001000029	Calle 29
30	Sofia Morales	sofia30@mail.com	3001000030	Calle 30
31	Juan Perez	juan31@mail.com	3001000031	Calle 31
32	Paula Lopez	paula32@mail.com	3001000032	Calle 32
33	Carlos Gomez	carlos33@mail.com	3001000033	Calle 33
34	Ana Martinez	ana34@mail.com	3001000034	Calle 34
35	Miguel Torres	miguel35@mail.com	3001000035	Calle 35
36	Sofia Ramirez	sofia36@mail.com	3001000036	Calle 36
37	Luis Fernandez	luis37@mail.com	3001000037	Calle 37
38	Camila Diaz	camila38@mail.com	3001000038	Calle 38
39	Jorge Morales	jorge39@mail.com	3001000039	Calle 39
40	Paula Perez	paula40@mail.com	3001000040	Calle 40
41	Daniel Gomez	daniel41@mail.com	3001000041	Calle 41
42	Valeria Martinez	valeria42@mail.com	3001000042	Calle 42
43	Andres Ramirez	andres43@mail.com	3001000043	Calle 43
44	Carolina Sanchez	carolina44@mail.com	3001000044	Calle 44
45	Diego Herrera	diego45@mail.com	3001000045	Calle 45
46	Laura Diaz	laura46@mail.com	3001000046	Calle 46
47	Ricardo Morales	ricardo47@mail.com	3001000047	Calle 47
48	Andrea Perez	andrea48@mail.com	3001000048	Calle 48
49	Felipe Lopez	felipe49@mail.com	3001000049	Calle 49
50	Natalia Gomez	natalia50@mail.com	3001000050	Calle 50
51	Javier Martinez	javier51@mail.com	3001000051	Calle 51
52	Karen Torres	karen52@mail.com	3001000052	Calle 52
53	Esteban Ramirez	esteban53@mail.com	3001000053	Calle 53
54	Daniela Herrera	daniela54@mail.com	3001000054	Calle 54
55	Mario Diaz	mario55@mail.com	3001000055	Calle 55
56	Monica Morales	monica56@mail.com	3001000056	Calle 56
57	Andres Perez	andres57@mail.com	3001000057	Calle 57
58	Sofia Lopez	sofia58@mail.com	3001000058	Calle 58
59	Juan Gomez	juan59@mail.com	3001000059	Calle 59
60	Paula Martinez	paula60@mail.com	3001000060	Calle 60
61	Mateo Rojas	mateo1@mail.com	3002000001	Calle 1
62	Isabella Torres	isabella2@mail.com	3002000002	Calle 2
63	Sebastian Alvarez	sebastian3@mail.com	3002000003	Calle 3
64	Valentina Castro	valentina4@mail.com	3002000004	Calle 4
65	Santiago Ruiz	santiago5@mail.com	3002000005	Calle 5
66	Gabriela Herrera	gabriela6@mail.com	3002000006	Calle 6
67	Emilio Vargas	emilio7@mail.com	3002000007	Calle 7
68	Lucia Cabrera	lucia8@mail.com	3002000008	Calle 8
69	Martín Pardo	martin9@mail.com	3002000009	Calle 9
70	Renata León	renata10@mail.com	3002000010	Calle 10
71	Julian Cortes	julian11@mail.com	3002000011	Calle 11
72	Mariana Silva	mariana12@mail.com	3002000012	Calle 12
73	Tomas Peña	tomas13@mail.com	3002000013	Calle 13
74	Antonia Lara	antonia14@mail.com	3002000014	Calle 14
75	Emmanuel Vargas	emmanuel15@mail.com	3002000015	Calle 15
76	Zoe Ramirez	zoe16@mail.com	3002000016	Calle 16
77	Nicolas Gutierrez	nicolas17@mail.com	3002000017	Calle 17
78	Regina Soto	regina18@mail.com	3002000018	Calle 18
79	Samuel Rios	samuel19@mail.com	3002000019	Calle 19
80	Martina Suarez	martina20@mail.com	3002000020	Calle 20
81	Alejandro Vera	alejandro21@mail.com	3002000021	Calle 21
82	Emma Blanco	emma22@mail.com	3002000022	Calle 22
83	Dylan Pineda	dylan23@mail.com	3002000023	Calle 23
84	Mia Robles	mia24@mail.com	3002000024	Calle 24
85	Thiago Serrano	thiago25@mail.com	3002000025	Calle 25
86	Victoria Campos	victoria26@mail.com	3002000026	Calle 26
87	Benjamin Lozano	benjamin27@mail.com	3002000027	Calle 27
88	Sara Naranjo	sara28@mail.com	3002000028	Calle 28
89	Liam Marquez	liam29@mail.com	3002000029	Calle 29
90	Emily Peña	emily30@mail.com	3002000030	Calle 30
91	David Beltran	david31@mail.com	3002000031	Calle 31
92	Chloe Cabrales	chloe32@mail.com	3002000032	Calle 32
93	Aaron Maldonado	aaron33@mail.com	3002000033	Calle 33
94	Luciana Torres	luciana34@mail.com	3002000034	Calle 34
6	Ana Ramirez	ana6@mail.com	3001000006	Calle 35
95	Adrian Varela	adrian35@mail.com	3002000035	Calle 35
96	Salome Lozano	salome36@mail.com	3002000036	Calle 36
97	Ian Castillo	ian37@mail.com	3002000037	Calle 37
98	Josefa Duarte	josefa38@mail.com	3002000038	Calle 38
99	Gabriel Patiño	gabriel39@mail.com	3002000039	Calle 39
100	Clara Ortiz	clara40@mail.com	3002000040	Calle 40
101	Emiliano Prada	emiliano41@mail.com	3002000041	Calle 41
102	Angela Moreno	angela42@mail.com	3002000042	Calle 42
103	Leonardo Castaño	leonardo43@mail.com	3002000043	Calle 43
104	Camila Bernal	camila44@mail.com	3002000044	Calle 44
105	Cristian Zapata	cristian45@mail.com	3002000045	Calle 45
106	Daniela Rueda	daniela46@mail.com	3002000046	Calle 46
107	Pablo Gil	pablo47@mail.com	3002000047	Calle 47
108	Valeria Ortiz	valeria48@mail.com	3002000048	Calle 48
109	Franco Jimenez	franco49@mail.com	3002000049	Calle 49
110	Isabel Castro	isabel50@mail.com	3002000050	Calle 50
111	Maximiliano Salazar	maximiliano51@mail.com	3002000051	Calle 51
112	Amelia Rivera	amelia52@mail.com	3002000052	Calle 52
113	Cristobal Muñoz	cristobal53@mail.com	3002000053	Calle 53
114	Julieta Nieto	julieta54@mail.com	3002000054	Calle 54
115	Matias Camacho	matias55@mail.com	3002000055	Calle 55
116	Olivia Serrano	olivia56@mail.com	3002000056	Calle 56
117	Lucas Espinosa	lucas57@mail.com	3002000057	Calle 57
118	Eva Cardenas	eva58@mail.com	3002000058	Calle 58
119	Aaron Reyes	aaron59@mail.com	3002000059	Calle 59
120	Luciana Vega	luciana60@mail.com	3002000060	Calle 60
121	Carlos Ruiz	carlos@gmail.com	3001234567	Calle 10
122	Manuel Perez	maunel@gmail.com	3002264457	Calle 1
1	Jose Fernandez	jose1@mail.com	3001000001	Calle 15
\.


--
-- TOC entry 3535 (class 0 OID 32973)
-- Dependencies: 233
-- Data for Name: members_audit; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.members_audit (id, member_id, action_member, changed_at, changed_by, before_data, after_data) FROM stdin;
1	121	INSERT	2025-10-15 23:08:21.789021	jose	\N	{"id": 121, "name": "Carlos Ruiz", "email": "carlos@gmail.com", "phone": "3001234567", "address": "Calle 10"}
2	122	INSERT	2025-10-15 23:09:25.468491	jose	\N	{"id": 122, "name": "Manuel Perez", "email": "maunel@gmail.com", "phone": "3002264457", "address": "Calle 1"}
3	1	UPDATE	2025-10-15 23:09:28.179882	jose	{"id": 1, "name": "Jose Fernandez", "email": "jose1@mail.com", "phone": "3001000001", "address": "Calle 1"}	{"id": 1, "name": "Jose Fernandez", "email": "jose1@mail.com", "phone": "3001000001", "address": "Calle 15"}
4	6	UPDATE	2025-10-15 23:09:35.417774	jose	{"id": 6, "name": "Ana Ramirez", "email": "ana6@mail.com", "phone": "3001000006", "address": "Calle 6"}	{"id": 6, "name": "Ana Ramirez", "email": "ana6@mail.com", "phone": "3001000006", "address": "Calle 35"}
\.


--
-- TOC entry 3524 (class 0 OID 24803)
-- Dependencies: 222
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.memberships (id, start_date, end_date, member_id, plan_id, trainer_id) FROM stdin;
61	2025-08-20	2025-05-05	1	1	3
62	2025-09-21	2025-05-25	2	2	4
63	2025-09-01	2025-10-31	3	1	2
64	2025-04-25	2025-02-26	4	1	3
65	2025-10-04	2025-03-16	5	3	2
66	2025-04-16	2025-12-15	6	2	5
67	2025-05-25	2025-08-02	7	3	1
68	2025-04-27	2025-08-21	8	1	1
69	2025-09-27	2025-02-11	9	3	1
70	2025-12-12	2025-07-30	10	1	2
71	2025-03-22	2025-06-15	11	1	1
72	2025-04-04	2026-01-26	12	1	4
73	2025-07-28	2025-07-21	13	2	5
74	2025-10-14	2025-02-26	14	3	1
75	2025-05-08	2026-01-20	15	2	2
76	2025-04-02	2025-04-16	16	3	3
77	2025-08-22	2025-09-04	17	1	4
78	2025-09-20	2025-04-13	18	1	1
79	2025-12-04	2025-04-19	19	2	4
80	2025-06-14	2025-05-23	20	2	4
81	2025-04-23	2025-08-01	21	3	4
82	2025-08-15	2025-05-15	22	1	5
83	2025-06-11	2025-08-03	23	3	1
84	2025-05-24	2025-12-07	24	2	1
85	2025-02-12	2025-02-26	25	2	1
86	2025-04-21	2025-10-01	26	3	2
87	2025-08-30	2025-09-18	27	1	3
88	2025-04-21	2025-08-18	28	3	3
89	2025-04-08	2025-05-13	29	3	5
90	2025-10-20	2025-07-30	30	3	1
91	2025-08-05	2025-05-08	31	3	4
92	2025-12-31	2025-07-23	32	3	5
93	2025-01-10	2025-12-15	33	2	2
94	2025-03-16	2026-01-05	34	3	4
95	2025-07-26	2025-02-04	35	3	2
96	2025-10-09	2025-06-05	36	3	1
97	2025-06-01	2025-06-24	37	2	3
98	2025-11-07	2025-10-04	38	1	1
99	2025-07-03	2025-04-28	39	3	4
100	2025-01-14	2025-06-18	40	1	4
101	2025-10-30	2025-12-06	41	2	3
102	2025-02-13	2025-11-10	42	1	2
103	2025-01-31	2025-04-17	43	2	4
104	2025-02-02	2025-02-23	44	1	4
105	2025-08-08	2025-04-02	45	3	3
106	2025-02-15	2025-09-05	46	3	2
107	2025-01-20	2025-02-20	47	2	1
108	2025-10-08	2025-03-13	48	1	5
109	2025-01-26	2025-02-09	49	3	5
110	2025-12-30	2025-07-08	50	2	3
111	2025-12-10	2025-03-30	51	3	1
112	2025-09-09	2025-09-25	52	1	2
113	2025-01-19	2025-04-28	53	1	3
114	2025-08-12	2025-02-24	54	1	1
115	2025-09-17	2025-09-17	55	2	4
116	2025-05-01	2025-03-05	56	3	3
117	2025-04-02	2025-08-16	57	2	2
118	2025-10-19	2025-09-30	58	2	3
119	2025-02-20	2025-04-22	59	2	3
120	2025-10-16	2026-01-24	60	3	5
121	2025-05-17	2025-10-12	61	1	1
122	2025-06-13	2025-04-07	62	3	5
123	2025-08-02	2025-02-18	63	1	4
124	2025-11-16	2025-04-15	64	3	2
125	2025-09-30	2025-10-13	65	3	5
126	2025-09-23	2025-05-23	66	1	5
127	2025-10-30	2026-01-15	67	1	1
128	2025-03-11	2025-04-03	68	2	2
129	2025-10-30	2025-11-16	69	2	1
130	2025-10-04	2025-03-01	70	2	3
131	2025-09-16	2025-04-05	71	1	3
132	2025-01-20	2025-11-28	72	2	3
133	2025-02-22	2025-04-15	73	2	3
134	2025-03-19	2025-09-06	74	3	4
135	2025-08-26	2025-06-25	75	1	4
136	2025-04-16	2025-08-21	76	2	1
137	2025-03-07	2025-12-30	77	3	4
138	2025-04-24	2025-11-28	78	1	2
139	2025-01-17	2025-12-22	79	1	1
140	2025-09-25	2026-01-25	80	2	3
141	2025-02-09	2025-06-25	81	3	2
142	2025-09-13	2025-04-08	82	3	3
143	2025-09-21	2025-05-16	83	3	5
144	2025-05-09	2025-05-06	84	1	1
145	2025-04-18	2025-02-21	85	3	4
146	2025-04-16	2025-03-01	86	2	4
147	2025-09-28	2025-05-03	87	3	3
148	2025-06-19	2025-03-07	88	1	3
149	2025-04-18	2025-08-17	89	1	2
150	2025-08-08	2025-09-26	90	2	4
151	2025-08-04	2025-04-13	91	3	5
152	2025-02-18	2025-03-21	92	3	3
153	2025-12-24	2026-01-05	93	1	5
154	2025-07-30	2025-12-16	94	1	1
155	2025-09-15	2025-06-20	95	3	4
156	2025-11-29	2025-07-09	96	3	4
157	2025-01-20	2025-10-06	97	1	4
158	2025-01-12	2026-01-16	98	1	1
159	2025-08-24	2025-07-18	99	1	2
160	2025-01-04	2025-12-07	100	3	1
161	2025-06-09	2026-01-20	101	3	1
162	2025-12-12	2025-04-16	102	1	3
163	2025-10-29	2025-03-14	103	2	3
164	2025-02-28	2025-05-27	104	2	5
165	2025-10-15	2025-07-14	105	1	2
166	2025-09-30	2025-12-25	106	2	4
167	2025-10-11	2025-10-08	107	3	1
168	2025-06-28	2025-11-01	108	1	4
169	2025-04-13	2025-11-30	109	1	1
170	2025-07-01	2025-10-11	110	1	3
171	2025-09-25	2025-02-02	111	2	3
172	2025-03-28	2025-09-11	112	1	1
173	2025-01-28	2025-09-08	113	2	1
174	2025-02-19	2025-07-24	114	3	3
175	2025-09-26	2025-06-06	115	2	2
176	2025-11-30	2025-07-29	116	2	5
177	2025-03-03	2026-01-21	117	3	3
178	2025-06-29	2025-12-07	118	3	4
179	2025-06-08	2025-12-04	119	2	5
180	2025-09-22	2025-05-20	120	2	4
\.


--
-- TOC entry 3526 (class 0 OID 24825)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.payments (id, amount, payment_date, membership_id) FROM stdin;
76	80.00	2025-01-22	75
77	120.00	2025-02-09	76
78	50.00	2025-02-26	77
79	50.00	2025-12-08	78
80	80.00	2025-05-01	79
81	80.00	2025-04-15	80
82	120.00	2025-01-03	81
83	50.00	2025-04-23	82
84	120.00	2025-06-04	83
86	80.00	2025-11-22	85
87	120.00	2025-11-27	86
88	50.00	2025-06-13	87
89	120.00	2025-03-14	88
90	120.00	2025-10-09	89
91	120.00	2025-07-03	90
92	120.00	2025-05-31	91
93	120.00	2025-11-16	92
94	80.00	2025-02-23	93
95	120.00	2025-12-07	94
96	120.00	2025-11-21	95
97	120.00	2025-02-24	96
98	80.00	2025-10-12	97
99	50.00	2025-07-27	98
100	120.00	2025-05-11	99
101	50.00	2025-12-17	100
102	80.00	2025-08-25	101
103	50.00	2025-03-01	102
104	80.00	2025-03-31	103
105	50.00	2025-04-27	104
106	120.00	2025-05-14	105
107	120.00	2025-04-05	106
108	80.00	2025-06-01	107
109	50.00	2025-02-09	108
110	120.00	2025-11-30	109
111	80.00	2025-08-05	110
112	120.00	2025-12-28	111
113	50.00	2025-06-11	112
114	50.00	2025-04-17	113
115	50.00	2025-02-27	114
116	80.00	2025-05-07	115
117	120.00	2025-10-28	116
118	80.00	2025-08-11	117
119	80.00	2025-07-26	118
120	80.00	2025-01-03	119
121	120.00	2025-02-19	120
122	50.00	2025-08-04	121
123	120.00	2025-01-20	122
124	50.00	2025-11-30	123
125	120.00	2025-03-27	124
126	120.00	2025-07-24	125
127	50.00	2025-08-03	126
128	50.00	2025-01-16	127
129	80.00	2025-03-30	128
130	80.00	2025-02-16	129
131	80.00	2025-02-10	130
132	50.00	2025-10-08	131
133	80.00	2025-09-08	132
134	80.00	2025-04-20	133
135	120.00	2025-08-18	134
136	50.00	2025-09-26	135
137	80.00	2025-02-05	136
138	120.00	2025-07-25	137
139	50.00	2025-11-16	138
140	50.00	2025-08-27	139
141	80.00	2025-08-11	140
142	120.00	2025-01-24	141
143	120.00	2025-03-03	142
144	120.00	2025-11-01	143
145	50.00	2025-04-28	144
146	120.00	2025-05-05	145
147	80.00	2025-05-14	146
148	120.00	2025-08-18	147
149	50.00	2025-04-01	148
150	50.00	2025-01-06	149
151	80.00	2025-08-08	150
152	120.00	2025-12-03	151
153	120.00	2025-05-04	152
154	50.00	2025-07-01	153
155	50.00	2025-09-29	154
156	120.00	2025-07-07	155
157	120.00	2025-07-19	156
158	50.00	2025-11-18	157
159	50.00	2025-10-27	158
161	120.00	2025-05-25	160
162	120.00	2025-10-30	161
163	50.00	2025-10-16	162
164	80.00	2025-01-16	163
165	80.00	2025-05-11	164
166	50.00	2025-03-05	165
167	80.00	2025-03-17	166
168	120.00	2025-12-04	167
169	50.00	2025-11-21	168
170	50.00	2025-11-22	169
171	50.00	2025-10-15	170
172	80.00	2025-06-30	171
173	50.00	2025-11-19	172
174	80.00	2025-03-03	173
175	120.00	2025-09-07	174
176	80.00	2025-01-18	175
177	80.00	2025-01-15	176
178	120.00	2025-02-11	177
179	120.00	2025-04-18	178
180	80.00	2025-10-10	179
181	80.00	2025-05-05	180
160	80.00	2025-03-27	159
1	50.00	2025-03-08	61
2	80.00	2025-11-26	62
3	50.00	2025-12-05	63
4	50.00	2025-02-08	64
5	120.00	2025-05-17	65
6	80.00	2025-09-21	66
7	120.00	2025-04-21	67
8	50.00	2025-07-09	68
9	120.00	2025-12-09	69
10	50.00	2025-09-14	70
11	50.00	2025-03-03	71
12	50.00	2025-05-21	72
13	80.00	2025-03-11	73
14	120.00	2025-08-18	74
15	50.00	2025-04-20	\N
\.


--
-- TOC entry 3537 (class 0 OID 32997)
-- Dependencies: 235
-- Data for Name: payments_audit; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.payments_audit (id, payment_id, action_type, changed_at, changed_by, before_data, after_data) FROM stdin;
1	160	UPDATE	2025-10-15 23:42:52.668048	jose	{"id": 160, "amount": 50.00, "payment_date": "2025-03-27", "membership_id": 159}	{"id": 160, "amount": 80.00, "payment_date": "2025-03-27", "membership_id": 159}
2	1	UPDATE	2025-10-15 23:43:14.443237	jose	{"id": 62, "amount": 50.00, "payment_date": "2025-03-08", "membership_id": 61}	{"id": 1, "amount": 50.00, "payment_date": "2025-03-08", "membership_id": 61}
3	2	UPDATE	2025-10-15 23:43:14.45649	jose	{"id": 63, "amount": 80.00, "payment_date": "2025-11-26", "membership_id": 62}	{"id": 2, "amount": 80.00, "payment_date": "2025-11-26", "membership_id": 62}
4	3	UPDATE	2025-10-15 23:43:14.464641	jose	{"id": 64, "amount": 50.00, "payment_date": "2025-12-05", "membership_id": 63}	{"id": 3, "amount": 50.00, "payment_date": "2025-12-05", "membership_id": 63}
5	85	DELETE	2025-10-15 23:43:29.41195	jose	{"id": 85, "amount": 80.00, "payment_date": "2025-04-22", "membership_id": 84}	\N
6	4	UPDATE	2025-10-15 23:46:23.020249	jose	{"id": 65, "amount": 50.00, "payment_date": "2025-02-08", "membership_id": 64}	{"id": 4, "amount": 50.00, "payment_date": "2025-02-08", "membership_id": 64}
7	5	UPDATE	2025-10-15 23:46:23.082304	jose	{"id": 66, "amount": 120.00, "payment_date": "2025-05-17", "membership_id": 65}	{"id": 5, "amount": 120.00, "payment_date": "2025-05-17", "membership_id": 65}
8	6	UPDATE	2025-10-15 23:46:23.092715	jose	{"id": 67, "amount": 80.00, "payment_date": "2025-09-21", "membership_id": 66}	{"id": 6, "amount": 80.00, "payment_date": "2025-09-21", "membership_id": 66}
9	7	UPDATE	2025-10-15 23:46:23.105858	jose	{"id": 68, "amount": 120.00, "payment_date": "2025-04-21", "membership_id": 67}	{"id": 7, "amount": 120.00, "payment_date": "2025-04-21", "membership_id": 67}
10	8	UPDATE	2025-10-15 23:46:23.126313	jose	{"id": 69, "amount": 50.00, "payment_date": "2025-07-09", "membership_id": 68}	{"id": 8, "amount": 50.00, "payment_date": "2025-07-09", "membership_id": 68}
11	9	UPDATE	2025-10-15 23:46:23.135216	jose	{"id": 70, "amount": 120.00, "payment_date": "2025-12-09", "membership_id": 69}	{"id": 9, "amount": 120.00, "payment_date": "2025-12-09", "membership_id": 69}
12	10	UPDATE	2025-10-15 23:46:23.143301	jose	{"id": 71, "amount": 50.00, "payment_date": "2025-09-14", "membership_id": 70}	{"id": 10, "amount": 50.00, "payment_date": "2025-09-14", "membership_id": 70}
13	11	UPDATE	2025-10-15 23:46:23.151935	jose	{"id": 72, "amount": 50.00, "payment_date": "2025-03-03", "membership_id": 71}	{"id": 11, "amount": 50.00, "payment_date": "2025-03-03", "membership_id": 71}
14	12	UPDATE	2025-10-15 23:46:23.161502	jose	{"id": 73, "amount": 50.00, "payment_date": "2025-05-21", "membership_id": 72}	{"id": 12, "amount": 50.00, "payment_date": "2025-05-21", "membership_id": 72}
15	13	UPDATE	2025-10-15 23:46:23.1709	jose	{"id": 74, "amount": 80.00, "payment_date": "2025-03-11", "membership_id": 73}	{"id": 13, "amount": 80.00, "payment_date": "2025-03-11", "membership_id": 73}
16	14	UPDATE	2025-10-15 23:46:23.180328	jose	{"id": 75, "amount": 120.00, "payment_date": "2025-08-18", "membership_id": 74}	{"id": 14, "amount": 120.00, "payment_date": "2025-08-18", "membership_id": 74}
17	15	INSERT	2025-10-15 23:47:04.227876	jose	\N	{"id": 15, "amount": 50.00, "payment_date": "2025-04-20", "membership_id": null}
\.


--
-- TOC entry 3522 (class 0 OID 24796)
-- Dependencies: 220
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.plans (id, name, description, price) FROM stdin;
1	Basic	Acceso al gimnasio 3 veces por semana	50.00
2	Standard	Acceso ilimitado al gimnasio	80.00
3	Premium	Acceso ilimitado + clases grupales	120.00
\.


--
-- TOC entry 3533 (class 0 OID 24874)
-- Dependencies: 231
-- Data for Name: routine_exercises; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.routine_exercises (routine_id, exercise_id) FROM stdin;
25	10
163	3
68	5
32	5
1	1
83	4
155	1
17	8
81	10
50	7
70	6
49	8
35	7
163	4
110	2
87	6
173	6
160	4
1	5
179	9
160	7
61	6
84	2
21	2
19	8
26	1
84	7
171	1
81	7
52	1
105	7
173	5
38	10
104	3
16	10
93	6
80	2
123	9
133	3
104	8
115	6
56	5
157	3
83	2
98	4
139	9
106	4
77	10
56	6
131	5
111	10
36	9
19	4
142	9
20	2
6	6
33	6
4	3
117	4
29	3
135	6
135	5
132	9
90	8
46	7
69	8
62	7
60	9
18	7
13	4
38	8
15	7
139	1
176	6
28	7
57	5
165	1
90	10
171	8
113	3
89	9
127	9
88	7
22	7
89	7
45	4
28	1
157	4
175	4
161	7
166	10
114	10
134	4
50	4
147	2
20	8
175	10
148	3
92	10
156	5
3	10
133	8
136	1
168	9
40	7
51	9
24	10
180	8
149	4
65	5
2	5
76	3
101	10
74	5
40	1
13	2
43	2
16	6
37	8
144	4
109	9
134	5
95	6
153	2
157	8
120	5
67	5
72	2
31	6
79	10
\.


--
-- TOC entry 3530 (class 0 OID 24851)
-- Dependencies: 228
-- Data for Name: routines; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.routines (id, name, description, member_id, trainer_id) FROM stdin;
1	Routine 1	Custom routine	1	1
2	Routine 2	Custom routine	2	4
3	Routine 3	Custom routine	3	2
4	Routine 4	Custom routine	4	4
5	Routine 5	Custom routine	5	5
6	Routine 6	Custom routine	6	5
7	Routine 7	Custom routine	7	1
8	Routine 8	Custom routine	8	4
9	Routine 9	Custom routine	9	3
10	Routine 10	Custom routine	10	2
11	Routine 11	Custom routine	11	3
12	Routine 12	Custom routine	12	1
13	Routine 13	Custom routine	13	1
14	Routine 14	Custom routine	14	3
15	Routine 15	Custom routine	15	3
16	Routine 16	Custom routine	16	5
17	Routine 17	Custom routine	17	3
18	Routine 18	Custom routine	18	5
19	Routine 19	Custom routine	19	3
20	Routine 20	Custom routine	20	1
21	Routine 21	Custom routine	21	1
22	Routine 22	Custom routine	22	1
23	Routine 23	Custom routine	23	3
24	Routine 24	Custom routine	24	4
25	Routine 25	Custom routine	25	5
26	Routine 26	Custom routine	26	5
27	Routine 27	Custom routine	27	4
28	Routine 28	Custom routine	28	3
29	Routine 29	Custom routine	29	4
30	Routine 30	Custom routine	30	4
31	Routine 31	Custom routine	31	1
32	Routine 32	Custom routine	32	4
33	Routine 33	Custom routine	33	5
34	Routine 34	Custom routine	34	4
35	Routine 35	Custom routine	35	1
36	Routine 36	Custom routine	36	2
37	Routine 37	Custom routine	37	3
38	Routine 38	Custom routine	38	5
39	Routine 39	Custom routine	39	4
40	Routine 40	Custom routine	40	1
41	Routine 41	Custom routine	41	1
42	Routine 42	Custom routine	42	3
43	Routine 43	Custom routine	43	4
44	Routine 44	Custom routine	44	5
45	Routine 45	Custom routine	45	1
46	Routine 46	Custom routine	46	2
47	Routine 47	Custom routine	47	4
48	Routine 48	Custom routine	48	3
49	Routine 49	Custom routine	49	1
50	Routine 50	Custom routine	50	3
51	Routine 51	Custom routine	51	2
52	Routine 52	Custom routine	52	3
53	Routine 53	Custom routine	53	3
54	Routine 54	Custom routine	54	1
55	Routine 55	Custom routine	55	5
56	Routine 56	Custom routine	56	3
57	Routine 57	Custom routine	57	1
58	Routine 58	Custom routine	58	1
59	Routine 59	Custom routine	59	5
60	Routine 60	Custom routine	60	3
61	Routine 1	Custom routine	1	4
62	Routine 2	Custom routine	2	3
63	Routine 3	Custom routine	3	4
64	Routine 4	Custom routine	4	1
65	Routine 5	Custom routine	5	4
66	Routine 6	Custom routine	6	3
67	Routine 7	Custom routine	7	5
68	Routine 8	Custom routine	8	2
69	Routine 9	Custom routine	9	3
70	Routine 10	Custom routine	10	3
71	Routine 11	Custom routine	11	5
72	Routine 12	Custom routine	12	2
73	Routine 13	Custom routine	13	4
74	Routine 14	Custom routine	14	4
75	Routine 15	Custom routine	15	4
76	Routine 16	Custom routine	16	5
77	Routine 17	Custom routine	17	4
78	Routine 18	Custom routine	18	4
79	Routine 19	Custom routine	19	2
80	Routine 20	Custom routine	20	2
81	Routine 21	Custom routine	21	1
82	Routine 22	Custom routine	22	5
83	Routine 23	Custom routine	23	5
84	Routine 24	Custom routine	24	1
85	Routine 25	Custom routine	25	5
86	Routine 26	Custom routine	26	1
87	Routine 27	Custom routine	27	5
88	Routine 28	Custom routine	28	1
89	Routine 29	Custom routine	29	5
90	Routine 30	Custom routine	30	4
91	Routine 31	Custom routine	31	1
92	Routine 32	Custom routine	32	3
93	Routine 33	Custom routine	33	2
94	Routine 34	Custom routine	34	2
95	Routine 35	Custom routine	35	1
96	Routine 36	Custom routine	36	1
97	Routine 37	Custom routine	37	5
98	Routine 38	Custom routine	38	3
99	Routine 39	Custom routine	39	2
100	Routine 40	Custom routine	40	4
101	Routine 41	Custom routine	41	2
102	Routine 42	Custom routine	42	1
103	Routine 43	Custom routine	43	1
104	Routine 44	Custom routine	44	5
105	Routine 45	Custom routine	45	3
106	Routine 46	Custom routine	46	1
107	Routine 47	Custom routine	47	2
108	Routine 48	Custom routine	48	1
109	Routine 49	Custom routine	49	5
110	Routine 50	Custom routine	50	1
111	Routine 51	Custom routine	51	2
112	Routine 52	Custom routine	52	5
113	Routine 53	Custom routine	53	2
114	Routine 54	Custom routine	54	4
115	Routine 55	Custom routine	55	4
116	Routine 56	Custom routine	56	4
117	Routine 57	Custom routine	57	2
118	Routine 58	Custom routine	58	1
119	Routine 59	Custom routine	59	2
120	Routine 60	Custom routine	60	3
121	Routine 61	Custom routine	61	4
122	Routine 62	Custom routine	62	2
123	Routine 63	Custom routine	63	1
124	Routine 64	Custom routine	64	2
125	Routine 65	Custom routine	65	4
126	Routine 66	Custom routine	66	4
127	Routine 67	Custom routine	67	3
128	Routine 68	Custom routine	68	2
129	Routine 69	Custom routine	69	4
130	Routine 70	Custom routine	70	1
131	Routine 71	Custom routine	71	1
132	Routine 72	Custom routine	72	4
133	Routine 73	Custom routine	73	4
134	Routine 74	Custom routine	74	5
135	Routine 75	Custom routine	75	1
136	Routine 76	Custom routine	76	5
137	Routine 77	Custom routine	77	3
138	Routine 78	Custom routine	78	2
139	Routine 79	Custom routine	79	4
140	Routine 80	Custom routine	80	3
141	Routine 81	Custom routine	81	5
142	Routine 82	Custom routine	82	1
143	Routine 83	Custom routine	83	1
144	Routine 84	Custom routine	84	1
145	Routine 85	Custom routine	85	4
146	Routine 86	Custom routine	86	3
147	Routine 87	Custom routine	87	3
148	Routine 88	Custom routine	88	2
149	Routine 89	Custom routine	89	3
150	Routine 90	Custom routine	90	2
151	Routine 91	Custom routine	91	5
152	Routine 92	Custom routine	92	5
153	Routine 93	Custom routine	93	2
154	Routine 94	Custom routine	94	5
155	Routine 95	Custom routine	95	5
156	Routine 96	Custom routine	96	1
157	Routine 97	Custom routine	97	1
158	Routine 98	Custom routine	98	2
159	Routine 99	Custom routine	99	4
160	Routine 100	Custom routine	100	2
161	Routine 101	Custom routine	101	3
162	Routine 102	Custom routine	102	4
163	Routine 103	Custom routine	103	5
164	Routine 104	Custom routine	104	4
165	Routine 105	Custom routine	105	2
166	Routine 106	Custom routine	106	5
167	Routine 107	Custom routine	107	5
168	Routine 108	Custom routine	108	5
169	Routine 109	Custom routine	109	2
170	Routine 110	Custom routine	110	4
171	Routine 111	Custom routine	111	2
172	Routine 112	Custom routine	112	4
173	Routine 113	Custom routine	113	2
174	Routine 114	Custom routine	114	4
175	Routine 115	Custom routine	115	5
176	Routine 116	Custom routine	116	5
177	Routine 117	Custom routine	117	5
178	Routine 118	Custom routine	118	3
179	Routine 119	Custom routine	119	2
180	Routine 120	Custom routine	120	4
\.


--
-- TOC entry 3520 (class 0 OID 24789)
-- Dependencies: 218
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: jose
--

COPY public.trainers (id, name, specialty) FROM stdin;
1	Carlos Perez	Strength Training
2	Ana Gomez	Cardio
3	Luis Martinez	Yoga
4	Sofia Ramirez	Pilates
5	Juan Torres	Crossfit
6	Mariana Lopez	HIIT
7	Daniel Ramirez	Functional Training
8	Laura Fernandez	Zumba
9	Andres Morales	Calisthenics
10	Valeria Herrera	Aerobics
11	Jorge Sanchez	Strength Training
12	Camila Diaz	Cardio
13	Felipe Rojas	Yoga
14	Carolina Torres	Pilates
15	Miguel Alvarez	Crossfit
16	Natalia Gutierrez	HIIT
17	Ricardo Mendoza	Functional Training
18	Paula Ruiz	Zumba
19	Esteban Morales	Calisthenics
20	Andrea Castillo	Aerobics
21	Juan Gomez	Strength Training
22	Sofia Vargas	Cardio
23	Andres Perez	Yoga
24	Maria Morales	Pilates
25	Carlos Rojas	Crossfit
26	Daniela Sanchez	HIIT
27	Luis Torres	Functional Training
28	Camila Ramirez	Zumba
29	Felipe Herrera	Calisthenics
30	Laura Alvarez	Aerobics
31	Ricardo Lopez	Strength Training
32	Valeria Gomez	Cardio
33	Miguel Torres	Yoga
34	Carolina Rojas	Pilates
35	Andres Martinez	Crossfit
36	Paula Gutierrez	HIIT
37	Jorge Ramirez	Functional Training
38	Natalia Ruiz	Zumba
39	Daniel Morales	Calisthenics
40	Andrea Vargas	Aerobics
41	Juan Herrera	Strength Training
42	Sofia Perez	Cardio
43	Luis Morales	Yoga
44	Camila Torres	Pilates
45	Felipe Ramirez	Crossfit
46	Laura Sanchez	HIIT
47	Carlos Gutierrez	Functional Training
48	Valeria Rojas	Zumba
49	Miguel Morales	Calisthenics
50	Daniela Alvarez	Aerobics
51	Ricardo Torres	Strength Training
52	Carolina Gomez	Cardio
53	Andres Herrera	Yoga
54	Paula Lopez	Pilates
55	Jorge Torres	Crossfit
56	Natalia Alvarez	HIIT
57	Luis Gutierrez	Functional Training
58	Camila Morales	Zumba
59	Felipe Perez	Calisthenics
60	Laura Gomez	Aerobics
61	Ricardo Martinez	Strength Training
62	Valeria Morales	Cardio
63	Miguel Herrera	Yoga
64	Carolina Perez	Pilates
65	Andres Gomez	Crossfit
66	Paula Torres	HIIT
67	Jorge Martinez	Functional Training
68	Natalia Lopez	Zumba
69	Daniel Morales	Calisthenics
70	Andrea Gomez	Aerobics
71	Juan Torres	Strength Training
72	Sofia Morales	Cardio
73	Luis Gomez	Yoga
74	Camila Herrera	Pilates
75	Felipe Morales	Crossfit
76	Laura Torres	HIIT
77	Carlos Morales	Functional Training
78	Valeria Torres	Zumba
79	Miguel Gomez	Calisthenics
80	Daniela Torres	Aerobics
81	Ricardo Morales	Strength Training
82	Carolina Torres	Cardio
83	Andres Morales	Yoga
84	Paula Morales	Pilates
85	Jorge Morales	Crossfit
86	Natalia Morales	HIIT
87	Luis Morales	Functional Training
88	Camila Morales	Zumba
89	Felipe Morales	Calisthenics
90	Laura Morales	Aerobics
91	Ricardo Morales	Strength Training
92	Valeria Morales	Cardio
93	Miguel Morales	Yoga
94	Carolina Morales	Pilates
95	Andres Morales	Crossfit
96	Paula Morales	HIIT
97	Jorge Morales	Functional Training
98	Natalia Morales	Zumba
99	Daniel Morales	Calisthenics
100	Andrea Morales	Aerobics
\.


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 225
-- Name: attendances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.attendances_id_seq', 120, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 229
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.exercises_id_seq', 90, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 232
-- Name: members_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.members_audit_id_seq', 4, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 215
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.members_id_seq', 122, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 221
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.memberships_id_seq', 180, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 234
-- Name: payments_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.payments_audit_id_seq', 17, true);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.payments_id_seq', 186, true);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 219
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.plans_id_seq', 3, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 227
-- Name: routines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.routines_id_seq', 180, true);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 217
-- Name: trainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jose
--

SELECT pg_catalog.setval('public.trainers_id_seq', 100, true);


--
-- TOC entry 3348 (class 2606 OID 24844)
-- Name: attendances attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 24873)
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 32983)
-- Name: members_audit members_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members_audit
    ADD CONSTRAINT members_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 24787)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 24808)
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 33007)
-- Name: payments_audit payments_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments_audit
    ADD CONSTRAINT payments_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 24832)
-- Name: payments payments_membership_id_key; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_membership_id_key UNIQUE (membership_id);


--
-- TOC entry 3346 (class 2606 OID 24830)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 24801)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 24878)
-- Name: routine_exercises routine_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_pkey PRIMARY KEY (routine_id, exercise_id);


--
-- TOC entry 3350 (class 2606 OID 24856)
-- Name: routines routines_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 24794)
-- Name: trainers trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2620 OID 32987)
-- Name: members ad_members_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER ad_members_audit AFTER DELETE ON public.members FOR EACH ROW EXECUTE FUNCTION public.audit_members();


--
-- TOC entry 3371 (class 2620 OID 32995)
-- Name: payments ad_payments_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER ad_payments_audit AFTER DELETE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.audit_payments();


--
-- TOC entry 3369 (class 2620 OID 32985)
-- Name: members ai_members_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER ai_members_audit AFTER INSERT ON public.members FOR EACH ROW EXECUTE FUNCTION public.audit_members();


--
-- TOC entry 3372 (class 2620 OID 32993)
-- Name: payments ai_payments_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER ai_payments_audit AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.audit_payments();


--
-- TOC entry 3370 (class 2620 OID 32986)
-- Name: members au_members_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER au_members_audit AFTER UPDATE ON public.members FOR EACH ROW EXECUTE FUNCTION public.audit_members();


--
-- TOC entry 3373 (class 2620 OID 32994)
-- Name: payments au_payments_audit; Type: TRIGGER; Schema: public; Owner: jose
--

CREATE TRIGGER au_payments_audit AFTER UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.audit_payments();


--
-- TOC entry 3363 (class 2606 OID 24845)
-- Name: attendances attendances_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3359 (class 2606 OID 24809)
-- Name: memberships memberships_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3360 (class 2606 OID 24814)
-- Name: memberships memberships_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 3361 (class 2606 OID 24819)
-- Name: memberships memberships_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES public.trainers(id);


--
-- TOC entry 3362 (class 2606 OID 24833)
-- Name: payments payments_membership_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_membership_id_fkey FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- TOC entry 3366 (class 2606 OID 24884)
-- Name: routine_exercises routine_exercises_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- TOC entry 3367 (class 2606 OID 24879)
-- Name: routine_exercises routine_exercises_routine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routine_exercises
    ADD CONSTRAINT routine_exercises_routine_id_fkey FOREIGN KEY (routine_id) REFERENCES public.routines(id);


--
-- TOC entry 3364 (class 2606 OID 24857)
-- Name: routines routines_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- TOC entry 3365 (class 2606 OID 24862)
-- Name: routines routines_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jose
--

ALTER TABLE ONLY public.routines
    ADD CONSTRAINT routines_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES public.trainers(id);


-- Completed on 2025-10-15 23:49:43

--
-- PostgreSQL database dump complete
--

