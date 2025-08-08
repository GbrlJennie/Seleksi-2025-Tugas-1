--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: circuits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.circuits (
    circuit_id integer NOT NULL,
    circuit_name character varying(100) NOT NULL,
    location character varying(100),
    country character varying(50)
);


ALTER TABLE public.circuits OWNER TO postgres;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.circuits_circuit_id_seq OWNER TO postgres;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits.circuit_id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    driver_id integer NOT NULL,
    team_id integer,
    driver_name character varying(100) NOT NULL,
    driver_number integer,
    nationality character varying(10),
    points numeric(5,1),
    detail_url character varying(255)
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_driver_id_seq OWNER TO postgres;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_driver_id_seq OWNED BY public.drivers.driver_id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    race_id integer NOT NULL,
    circuit_id integer,
    grand_prix character varying(100) NOT NULL,
    race_date date,
    laps integer,
    winner_name character varying(100),
    "time" character varying(50),
    detail_url character varying(255)
);


ALTER TABLE public.races OWNER TO postgres;

--
-- Name: races_race_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.races_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.races_race_id_seq OWNER TO postgres;

--
-- Name: races_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.races_race_id_seq OWNED BY public.races.race_id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    result_id integer NOT NULL,
    race_id integer,
    driver_id integer,
    "position" integer,
    laps integer,
    time_or_status character varying(50),
    points numeric(4,1)
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: results_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.results_result_id_seq OWNER TO postgres;

--
-- Name: results_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_result_id_seq OWNED BY public.results.result_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team_name character varying(100) NOT NULL,
    points numeric(5,1),
    detail_url character varying(255)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_team_id_seq OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: circuits circuit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits ALTER COLUMN circuit_id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: drivers driver_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN driver_id SET DEFAULT nextval('public.drivers_driver_id_seq'::regclass);


--
-- Name: races race_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races ALTER COLUMN race_id SET DEFAULT nextval('public.races_race_id_seq'::regclass);


--
-- Name: results result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results ALTER COLUMN result_id SET DEFAULT nextval('public.results_result_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.circuits (circuit_id, circuit_name, location, country) FROM stdin;
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (driver_id, team_id, driver_name, driver_number, nationality, points, detail_url) FROM stdin;
1	2	Max Verstappen	33	NED	395.5	https://www.formula1.com/../../en/results/2021/drivers/MAXVER01/max-verstappen
2	1	Lewis Hamilton	44	GBR	387.5	https://www.formula1.com/../../en/results/2021/drivers/LEWHAM01/lewis-hamilton
3	1	Valtteri Bottas	77	FIN	226.0	https://www.formula1.com/../../en/results/2021/drivers/VALBOT01/valtteri-bottas
4	2	Sergio Perez	11	MEX	190.0	https://www.formula1.com/../../en/results/2021/drivers/SERPER01/sergio-perez
5	3	Carlos Sainz	55	ESP	164.5	https://www.formula1.com/../../en/results/2021/drivers/CARSAI01/carlos-sainz
6	4	Lando Norris	4	GBR	160.0	https://www.formula1.com/../../en/results/2021/drivers/LANNOR01/lando-norris
7	3	Charles Leclerc	16	MON	159.0	https://www.formula1.com/../../en/results/2021/drivers/CHALEC01/charles-leclerc
8	4	Daniel Ricciardo	3	AUS	115.0	https://www.formula1.com/../../en/results/2021/drivers/DANRIC01/daniel-ricciardo
9	6	Pierre Gasly	10	FRA	110.0	https://www.formula1.com/../../en/results/2021/drivers/PIEGAS01/pierre-gasly
10	5	Fernando Alonso	14	ESP	81.0	https://www.formula1.com/../../en/results/2021/drivers/FERALO01/fernando-alonso
11	5	Esteban Ocon	31	FRA	74.0	https://www.formula1.com/../../en/results/2021/drivers/ESTOCO01/esteban-ocon
12	7	Sebastian Vettel	5	GER	43.0	https://www.formula1.com/../../en/results/2021/drivers/SEBVET01/sebastian-vettel
13	7	Lance Stroll	18	CAN	34.0	https://www.formula1.com/../../en/results/2021/drivers/LANSTR01/lance-stroll
14	6	Yuki Tsunoda	22	JPN	32.0	https://www.formula1.com/../../en/results/2021/drivers/YUKTSU01/yuki-tsunoda
15	8	George Russell	63	GBR	16.0	https://www.formula1.com/../../en/results/2021/drivers/GEORUS01/george-russell
16	9	Kimi Räikkönen	7	FIN	10.0	https://www.formula1.com/../../en/results/2021/drivers/KIMRAI01/kimi-r-ikk-nen
17	8	Nicholas Latifi	6	CAN	7.0	https://www.formula1.com/../../en/results/2021/drivers/NICLAF01/nicholas-latifi
18	9	Antonio Giovinazzi	99	ITA	3.0	https://www.formula1.com/../../en/results/2021/drivers/ANTGIO01/antonio-giovinazzi
19	10	Mick Schumacher	47	GER	0.0	https://www.formula1.com/../../en/results/2021/drivers/MICSCH02/mick-schumacher
20	9	Robert Kubica	88	POL	0.0	https://www.formula1.com/../../en/results/2021/drivers/ROBKUB01/robert-kubica
21	10	Nikita Mazepin	9	RAF	0.0	https://www.formula1.com/../../en/results/2021/drivers/NIKMAZ01/nikita-mazepin
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (race_id, circuit_id, grand_prix, race_date, laps, winner_name, "time", detail_url) FROM stdin;
1	\N	Bahrain	2021-03-28	56	Lewis Hamilton	1:32:03.897	https://www.formula1.com/../../en/results/2021/races/1064/bahrain/race-result
2	\N	Emilia-Romagna	2021-04-18	63	Max Verstappen	2:02:34.598	https://www.formula1.com/../../en/results/2021/races/1065/emilia-romagna/race-result
3	\N	Portugal	2021-05-02	66	Lewis Hamilton	1:34:31.421	https://www.formula1.com/../../en/results/2021/races/1066/portugal/race-result
4	\N	Spain	2021-05-09	66	Lewis Hamilton	1:33:07.680	https://www.formula1.com/../../en/results/2021/races/1086/spain/race-result
5	\N	Monaco	2021-05-23	78	Max Verstappen	1:38:56.820	https://www.formula1.com/../../en/results/2021/races/1067/monaco/race-result
6	\N	Azerbaijan	2021-06-06	51	Sergio Perez	2:13:36.410	https://www.formula1.com/../../en/results/2021/races/1068/azerbaijan/race-result
7	\N	France	2021-06-20	53	Max Verstappen	1:27:25.770	https://www.formula1.com/../../en/results/2021/races/1070/france/race-result
8	\N	Styria	2021-06-27	71	Max Verstappen	1:22:18.925	https://www.formula1.com/../../en/results/2021/races/1092/styria/race-result
9	\N	Austria	2021-07-04	71	Max Verstappen	1:23:54.543	https://www.formula1.com/../../en/results/2021/races/1071/austria/race-result
10	\N	Great Britain	2021-07-18	52	Lewis Hamilton	1:58:23.284	https://www.formula1.com/../../en/results/2021/races/1072/great-britain/race-result
11	\N	Hungary	2021-08-01	70	Esteban Ocon	2:04:43.199	https://www.formula1.com/../../en/results/2021/races/1073/hungary/race-result
12	\N	Belgium	2021-08-29	1	Max Verstappen	3:27.071	https://www.formula1.com/../../en/results/2021/races/1074/belgium/race-result
13	\N	Netherlands	2021-09-05	72	Max Verstappen	1:30:05.395	https://www.formula1.com/../../en/results/2021/races/1075/netherlands/race-result
14	\N	Italy	2021-09-12	53	Daniel Ricciardo	1:21:54.365	https://www.formula1.com/../../en/results/2021/races/1076/italy/race-result
15	\N	Russia	2021-09-26	53	Lewis Hamilton	1:30:41.001	https://www.formula1.com/../../en/results/2021/races/1077/russia/race-result
16	\N	Turkey	2021-10-10	58	Valtteri Bottas	1:31:04.103	https://www.formula1.com/../../en/results/2021/races/1078/turkey/race-result
17	\N	United States	2021-10-24	56	Max Verstappen	1:34:36.552	https://www.formula1.com/../../en/results/2021/races/1102/united-states/race-result
18	\N	Mexico	2021-11-07	71	Max Verstappen	1:38:39.086	https://www.formula1.com/../../en/results/2021/races/1103/mexico/race-result
19	\N	Brazil	2021-11-14	71	Lewis Hamilton	1:32:22.851	https://www.formula1.com/../../en/results/2021/races/1104/brazil/race-result
20	\N	Qatar	2021-11-21	57	Lewis Hamilton	1:24:28.471	https://www.formula1.com/../../en/results/2021/races/1105/qatar/race-result
21	\N	Saudi Arabia	2021-12-05	50	Lewis Hamilton	2:06:15.118	https://www.formula1.com/../../en/results/2021/races/1106/saudi-arabia/race-result
22	\N	Abu Dhabi	2021-12-12	58	Max Verstappen	1:30:17.345	https://www.formula1.com/../../en/results/2021/races/1107/abu-dhabi/race-result
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (result_id, race_id, driver_id, "position", laps, time_or_status, points) FROM stdin;
1	1	2	1	56	1:32:03.897	25.0
2	1	1	2	56	+0.745s	18.0
3	1	3	3	56	+37.383s	16.0
4	1	6	4	56	+46.466s	12.0
5	1	4	5	56	+52.047s	10.0
6	1	7	6	56	+59.090s	8.0
7	1	8	7	56	+66.004s	6.0
8	1	5	8	56	+67.100s	4.0
9	1	14	9	56	+85.692s	2.0
10	1	13	10	56	+86.713s	1.0
11	1	16	11	56	+88.864s	0.0
12	1	18	12	55	+1 lap	0.0
13	1	11	13	55	+1 lap	0.0
14	1	15	14	55	+1 lap	0.0
15	1	12	15	55	+1 lap	0.0
16	1	19	16	55	+1 lap	0.0
17	1	9	17	52	DNF	0.0
18	1	17	18	51	DNF	0.0
19	1	10	20	32	DNF	0.0
20	1	21	20	0	DNF	0.0
21	2	1	1	63	2:02:34.598	25.0
22	2	2	2	63	+22.000s	19.0
23	2	6	3	63	+23.702s	15.0
24	2	7	4	63	+25.579s	12.0
25	2	5	5	63	+27.036s	10.0
26	2	8	6	63	+51.220s	8.0
27	2	9	7	63	+52.818s	6.0
28	2	13	8	63	+56.909s	4.0
29	2	11	9	63	+65.704s	2.0
30	2	10	10	63	+66.561s	1.0
31	2	4	11	63	+67.151s	0.0
32	2	14	12	63	+73.184s	0.0
33	2	16	13	63	+94.773s	0.0
34	2	18	14	62	+1 lap	0.0
35	2	12	15	61	DNF	0.0
36	2	19	16	61	+2 laps	0.0
37	2	21	17	61	+2 laps	0.0
38	2	3	20	30	DNF	0.0
39	2	15	20	30	DNF	0.0
40	2	17	20	0	DNF	0.0
41	3	2	1	66	1:34:31.421	25.0
42	3	1	2	66	+29.148s	18.0
43	3	3	3	66	+33.530s	16.0
44	3	4	4	66	+39.735s	12.0
45	3	6	5	66	+51.369s	10.0
46	3	7	6	66	+55.781s	8.0
47	3	11	7	66	+63.749s	6.0
48	3	10	8	66	+64.808s	4.0
49	3	8	9	66	+75.369s	2.0
50	3	9	10	66	+76.463s	1.0
51	3	5	11	66	+78.955s	0.0
52	3	18	12	65	+1 lap	0.0
53	3	12	13	65	+1 lap	0.0
54	3	13	14	65	+1 lap	0.0
55	3	14	15	65	+1 lap	0.0
56	3	15	16	65	+1 lap	0.0
57	3	19	17	64	+2 laps	0.0
58	3	17	18	64	+2 laps	0.0
59	3	21	19	64	+2 laps	0.0
60	3	16	20	1	DNF	0.0
61	4	2	1	66	1:33:07.680	25.0
62	4	1	2	66	+15.841s	19.0
63	4	3	3	66	+26.610s	15.0
64	4	7	4	66	+54.616s	12.0
65	4	4	5	66	+63.671s	10.0
66	4	8	6	66	+73.768s	8.0
67	4	5	7	66	+74.670s	6.0
68	4	6	8	65	+1 lap	4.0
69	4	11	9	65	+1 lap	2.0
70	4	9	10	65	+1 lap	1.0
71	4	13	11	65	+1 lap	0.0
72	4	16	12	65	+1 lap	0.0
73	4	12	13	65	+1 lap	0.0
74	4	15	14	65	+1 lap	0.0
75	4	18	15	65	+1 lap	0.0
76	4	17	16	65	+1 lap	0.0
77	4	10	17	65	+1 lap	0.0
78	4	19	18	64	+2 laps	0.0
79	4	21	19	64	+2 laps	0.0
80	4	14	20	6	DNF	0.0
81	5	1	1	78	1:38:56.820	25.0
82	5	5	2	78	+8.968s	18.0
83	5	6	3	78	+19.427s	15.0
84	5	4	4	78	+20.490s	12.0
85	5	12	5	78	+52.591s	10.0
86	5	9	6	78	+53.896s	8.0
87	5	2	7	78	+68.231s	7.0
88	5	13	8	77	+1 lap	4.0
89	5	11	9	77	+1 lap	2.0
90	5	18	10	77	+1 lap	1.0
91	5	16	11	77	+1 lap	0.0
92	5	8	12	77	+1 lap	0.0
93	5	10	13	77	+1 lap	0.0
94	5	15	14	77	+1 lap	0.0
95	5	17	15	77	+1 lap	0.0
96	5	14	16	77	+1 lap	0.0
97	5	21	17	75	+3 laps	0.0
98	5	19	18	75	+3 laps	0.0
99	5	3	20	29	DNF	0.0
100	5	7	20	0	DNS	0.0
101	6	4	1	51	2:13:36.410	25.0
102	6	12	2	51	+1.385s	18.0
103	6	9	3	51	+2.762s	15.0
104	6	7	4	51	+3.828s	12.0
105	6	6	5	51	+4.754s	10.0
106	6	10	6	51	+6.382s	8.0
107	6	14	7	51	+6.624s	6.0
108	6	5	8	51	+7.709s	4.0
109	6	8	9	51	+8.874s	2.0
110	6	16	10	51	+9.576s	1.0
111	6	18	11	51	+10.254s	0.0
112	6	3	12	51	+11.264s	0.0
113	6	19	13	51	+14.241s	0.0
114	6	21	14	51	+14.315s	0.0
115	6	2	15	51	+17.668s	0.0
116	6	17	16	51	+42.379s	0.0
117	6	15	17	48	DNF	0.0
118	6	1	18	45	DNF	0.0
119	6	13	20	29	DNF	0.0
120	6	11	20	3	DNF	0.0
121	7	1	1	53	1:27:25.770	26.0
122	7	2	2	53	+2.904s	18.0
123	7	4	3	53	+8.811s	15.0
124	7	3	4	53	+14.618s	12.0
125	7	6	5	53	+64.032s	10.0
126	7	8	6	53	+75.857s	8.0
127	7	9	7	53	+76.596s	6.0
128	7	10	8	53	+77.695s	4.0
129	7	12	9	53	+79.666s	2.0
130	7	13	10	53	+91.946s	1.0
131	7	5	11	53	+99.337s	0.0
132	7	15	12	52	+1 lap	0.0
133	7	14	13	52	+1 lap	0.0
134	7	11	14	52	+1 lap	0.0
135	7	18	15	52	+1 lap	0.0
136	7	7	16	52	+1 lap	0.0
137	7	16	17	52	+1 lap	0.0
138	7	17	18	52	+1 lap	0.0
139	7	19	19	52	+1 lap	0.0
140	7	21	20	52	+1 lap	0.0
141	8	1	1	71	1:22:18.925	25.0
142	8	2	2	71	+35.743s	19.0
143	8	3	3	71	+46.907s	15.0
144	8	4	4	71	+47.434s	12.0
145	8	6	5	70	+1 lap	10.0
146	8	5	6	70	+1 lap	8.0
147	8	7	7	70	+1 lap	6.0
148	8	13	8	70	+1 lap	4.0
149	8	10	9	70	+1 lap	2.0
150	8	14	10	70	+1 lap	1.0
151	8	16	11	70	+1 lap	0.0
152	8	12	12	70	+1 lap	0.0
153	8	8	13	70	+1 lap	0.0
154	8	11	14	70	+1 lap	0.0
155	8	18	15	70	+1 lap	0.0
156	8	19	16	69	+2 laps	0.0
157	8	17	17	68	+3 laps	0.0
158	8	21	18	68	+3 laps	0.0
159	8	15	20	36	DNF	0.0
160	8	9	20	1	DNF	0.0
161	9	1	1	71	1:23:54.543	26.0
162	9	3	2	71	+17.973s	18.0
163	9	6	3	71	+20.019s	15.0
164	9	2	4	71	+46.452s	12.0
165	9	5	5	71	+57.144s	10.0
166	9	4	6	71	+57.915s	8.0
167	9	8	7	71	+60.395s	6.0
168	9	7	8	71	+61.195s	4.0
169	9	9	9	71	+61.844s	2.0
170	9	10	10	70	+1 lap	1.0
171	9	15	11	70	+1 lap	0.0
172	9	14	12	70	+1 lap	0.0
173	9	13	13	70	+1 lap	0.0
174	9	18	14	70	+1 lap	0.0
175	9	16	15	70	+1 lap	0.0
176	9	17	16	70	+1 lap	0.0
177	9	12	17	69	DNF	0.0
178	9	19	18	69	+2 laps	0.0
179	9	21	19	69	+2 laps	0.0
180	9	11	20	0	DNF	0.0
181	10	2	1	52	1:58:23.284	25.0
182	10	7	2	52	+3.871s	18.0
183	10	3	3	52	+11.125s	15.0
184	10	6	4	52	+28.573s	12.0
185	10	8	5	52	+42.624s	10.0
186	10	5	6	52	+43.454s	8.0
187	10	10	7	52	+72.093s	6.0
188	10	13	8	52	+74.289s	4.0
189	10	11	9	52	+76.162s	2.0
190	10	14	10	52	+82.065s	1.0
191	10	9	11	52	+85.327s	0.0
192	10	15	12	51	+1 lap	0.0
193	10	18	13	51	+1 lap	0.0
194	10	17	14	51	+1 lap	0.0
195	10	16	15	51	+1 lap	0.0
196	10	4	16	51	+1 lap	0.0
197	10	21	17	51	+1 lap	0.0
198	10	19	18	51	+1 lap	0.0
199	10	12	20	40	DNF	0.0
200	10	1	20	0	DNF	0.0
201	11	11	1	70	2:04:43.199	25.0
202	11	12	20	70	+1.859s	0.0
203	11	2	2	70	+2.736s	18.0
204	11	5	3	70	+15.018s	15.0
205	11	10	4	70	+15.651s	12.0
206	11	9	5	70	+63.614s	11.0
207	11	14	6	70	+75.803s	8.0
208	11	17	7	70	+77.910s	6.0
209	11	15	8	70	+79.094s	4.0
210	11	1	9	70	+80.244s	2.0
211	11	16	10	69	+1 lap	1.0
212	11	8	11	69	+1 lap	0.0
213	11	19	12	69	+1 lap	0.0
214	11	18	13	69	+1 lap	0.0
215	11	21	20	3	DNF	0.0
216	11	6	20	2	DNF	0.0
217	11	3	20	0	DNF	0.0
218	11	4	20	0	DNF	0.0
219	11	7	20	0	DNF	0.0
220	11	13	20	0	DNF	0.0
221	12	1	1	1	3:27.071	12.5
222	12	15	2	1	+1.995s	9.0
223	12	2	3	1	+2.601s	7.5
224	12	8	4	1	+4.496s	6.0
225	12	12	5	1	+7.479s	5.0
226	12	9	6	1	+10.177s	4.0
227	12	11	7	1	+11.579s	3.0
228	12	7	8	1	+12.608s	2.0
229	12	17	9	1	+15.484s	1.0
230	12	5	10	1	+16.166s	0.5
231	12	10	11	1	+20.590s	0.0
232	12	3	12	1	+22.414s	0.0
233	12	18	13	1	+24.163s	0.0
234	12	6	14	1	+27.109s	0.0
235	12	14	15	1	+28.329s	0.0
236	12	19	16	1	+29.507s	0.0
237	12	21	17	1	+31.993s	0.0
238	12	16	18	1	+36.054s	0.0
239	12	4	19	1	+38.205s	0.0
240	12	13	20	1	+44.108s	0.0
241	13	1	1	72	1:30:05.395	25.0
242	13	2	2	72	+20.932s	19.0
243	13	3	3	72	+56.460s	15.0
244	13	9	4	71	+1 lap	12.0
245	13	7	5	71	+1 lap	10.0
246	13	10	6	71	+1 lap	8.0
247	13	5	7	71	+1 lap	6.0
248	13	4	8	71	+1 lap	4.0
249	13	11	9	71	+1 lap	2.0
250	13	6	10	71	+1 lap	1.0
251	13	8	11	71	+1 lap	0.0
252	13	13	12	70	+2 laps	0.0
253	13	12	13	70	+2 laps	0.0
254	13	18	14	70	+2 laps	0.0
255	13	20	15	70	+2 laps	0.0
256	13	17	16	70	+2 laps	0.0
257	13	15	17	69	DNF	0.0
258	13	19	18	69	+3 laps	0.0
259	13	14	20	48	DNF	0.0
260	13	21	20	41	DNF	0.0
261	14	8	1	53	1:21:54.365	26.0
262	14	6	2	53	+1.747s	18.0
263	14	3	3	53	+4.921s	15.0
264	14	7	4	53	+7.309s	12.0
265	14	4	5	53	+8.723s	10.0
266	14	5	6	53	+10.535s	8.0
267	14	13	7	53	+15.804s	6.0
268	14	10	8	53	+17.201s	4.0
269	14	15	9	53	+19.742s	2.0
270	14	11	10	53	+20.868s	1.0
271	14	17	11	53	+23.743s	0.0
272	14	12	12	53	+24.621s	0.0
273	14	18	13	53	+27.216s	0.0
274	14	20	14	53	+29.769s	0.0
275	14	19	15	53	+51.088s	0.0
276	14	21	20	41	DNF	0.0
277	14	2	20	25	DNF	0.0
278	14	1	20	25	DNF	0.0
279	14	9	20	3	DNF	0.0
280	14	14	20	0	DNS	0.0
281	15	2	1	53	1:30:41.001	25.0
282	15	1	2	53	+53.271s	18.0
283	15	5	3	53	+62.475s	15.0
284	15	8	4	53	+65.607s	12.0
285	15	3	5	53	+67.533s	10.0
286	15	10	6	53	+81.321s	8.0
287	15	6	7	53	+87.224s	7.0
288	15	16	8	53	+88.955s	4.0
289	15	4	9	53	+90.076s	2.0
290	15	15	10	53	+100.551s	1.0
291	15	13	11	53	+116.198s	0.0
292	15	12	12	52	+1 lap	0.0
293	15	9	13	52	+1 lap	0.0
294	15	11	14	52	+1 lap	0.0
295	15	7	15	52	+1 lap	0.0
296	15	18	16	52	+1 lap	0.0
297	15	14	17	52	+1 lap	0.0
298	15	21	18	51	+2 laps	0.0
299	15	17	19	47	DNF	0.0
300	15	19	20	32	DNF	0.0
301	16	3	1	58	1:31:04.103	26.0
302	16	1	2	58	+14.584s	18.0
303	16	4	3	58	+33.471s	15.0
304	16	7	4	58	+37.814s	12.0
305	16	2	5	58	+41.812s	10.0
306	16	9	6	58	+44.292s	8.0
307	16	6	7	58	+47.213s	6.0
308	16	5	8	58	+51.526s	4.0
309	16	13	9	58	+82.018s	2.0
310	16	11	10	57	+1 lap	1.0
311	16	18	11	57	+1 lap	0.0
312	16	16	12	57	+1 lap	0.0
313	16	8	13	57	+1 lap	0.0
314	16	14	14	57	+1 lap	0.0
315	16	15	15	57	+1 lap	0.0
316	16	10	16	57	+1 lap	0.0
317	16	17	17	57	+1 lap	0.0
318	16	12	18	57	+1 lap	0.0
319	16	19	19	56	+2 laps	0.0
320	16	21	20	56	+2 laps	0.0
321	17	1	1	56	1:34:36.552	25.0
322	17	2	2	56	+1.333s	19.0
323	17	4	3	56	+42.223s	15.0
324	17	7	4	56	+52.246s	12.0
325	17	8	5	56	+76.854s	10.0
326	17	3	6	56	+80.128s	8.0
327	17	5	7	56	+83.545s	6.0
328	17	6	8	56	+84.395s	4.0
329	17	14	9	55	+1 lap	2.0
330	17	12	10	55	+1 lap	1.0
331	17	18	11	55	+1 lap	0.0
332	17	13	12	55	+1 lap	0.0
333	17	16	13	55	+1 lap	0.0
334	17	15	14	55	+1 lap	0.0
335	17	17	15	55	+1 lap	0.0
336	17	19	16	54	+2 laps	0.0
337	17	21	17	54	+2 laps	0.0
338	17	10	20	49	DNF	0.0
339	17	11	20	40	DNF	0.0
340	17	9	20	14	DNF	0.0
341	18	1	1	71	1:38:39.086	25.0
342	18	2	2	71	+16.555s	18.0
343	18	4	3	71	+17.752s	15.0
344	18	9	4	71	+63.845s	12.0
345	18	7	5	71	+81.037s	10.0
346	18	5	6	70	+1 lap	8.0
347	18	12	7	70	+1 lap	6.0
348	18	16	8	70	+1 lap	4.0
349	18	10	9	70	+1 lap	2.0
350	18	6	10	70	+1 lap	1.0
351	18	18	11	70	+1 lap	0.0
352	18	8	12	70	+1 lap	0.0
353	18	11	13	70	+1 lap	0.0
354	18	13	14	69	+2 laps	0.0
355	18	3	15	69	+2 laps	0.0
356	18	15	16	69	+2 laps	0.0
357	18	17	17	69	+2 laps	0.0
358	18	21	18	68	+3 laps	0.0
359	18	19	20	0	DNF	0.0
360	18	14	20	0	DNF	0.0
361	19	2	1	71	1:32:22.851	25.0
362	19	1	2	71	+10.496s	18.0
363	19	3	3	71	+13.576s	15.0
364	19	4	4	71	+39.940s	13.0
365	19	7	5	71	+49.517s	10.0
366	19	5	6	71	+51.820s	8.0
367	19	9	7	70	+1 lap	6.0
368	19	11	8	70	+1 lap	4.0
369	19	10	9	70	+1 lap	2.0
370	19	6	10	70	+1 lap	1.0
371	19	12	11	70	+1 lap	0.0
372	19	16	12	70	+1 lap	0.0
373	19	15	13	70	+1 lap	0.0
374	19	18	14	70	+1 lap	0.0
375	19	14	15	70	+1 lap	0.0
376	19	17	16	70	+1 lap	0.0
377	19	21	17	69	+2 laps	0.0
378	19	19	18	69	+2 laps	0.0
379	19	8	20	49	DNF	0.0
380	19	13	20	47	DNF	0.0
381	20	2	1	57	1:24:28.471	25.0
382	20	1	2	57	+25.743s	19.0
383	20	10	3	57	+59.457s	15.0
384	20	4	4	57	+62.306s	12.0
385	20	11	5	57	+80.570s	10.0
386	20	13	6	57	+81.274s	8.0
387	20	5	7	57	+81.911s	6.0
388	20	7	8	57	+83.126s	4.0
389	20	6	9	56	+1 lap	2.0
390	20	12	10	56	+1 lap	1.0
391	20	9	11	56	+1 lap	0.0
392	20	8	12	56	+1 lap	0.0
393	20	14	13	56	+1 lap	0.0
394	20	16	14	56	+1 lap	0.0
395	20	18	15	56	+1 lap	0.0
396	20	19	16	56	+1 lap	0.0
397	20	15	17	55	+2 laps	0.0
398	20	21	18	55	+2 laps	0.0
399	20	17	20	50	DNF	0.0
400	20	3	20	48	DNF	0.0
401	21	2	1	50	2:06:15.118	26.0
402	21	1	2	50	+21.825s	18.0
403	21	3	3	50	+27.531s	15.0
404	21	11	4	50	+27.633s	12.0
405	21	8	5	50	+40.121s	10.0
406	21	9	6	50	+41.613s	8.0
407	21	7	7	50	+44.475s	6.0
408	21	5	8	50	+46.606s	4.0
409	21	18	9	50	+58.505s	2.0
410	21	6	10	50	+61.358s	1.0
411	21	13	11	50	+77.212s	0.0
412	21	17	12	50	+83.249s	0.0
413	21	10	13	49	+1 lap	0.0
414	21	14	14	49	+1 lap	0.0
415	21	16	15	49	+1 lap	0.0
416	21	12	20	44	DNF	0.0
417	21	4	20	14	DNF	0.0
418	21	21	20	14	DNF	0.0
419	21	15	20	14	DNF	0.0
420	21	19	20	8	DNF	0.0
421	22	1	1	58	1:30:17.345	26.0
422	22	2	2	58	+2.256s	18.0
423	22	5	3	58	+5.173s	15.0
424	22	14	4	58	+5.692s	12.0
425	22	9	5	58	+6.531s	10.0
426	22	3	6	58	+7.463s	8.0
427	22	6	7	58	+59.200s	6.0
428	22	10	8	58	+61.708s	4.0
429	22	11	9	58	+64.026s	2.0
430	22	7	10	58	+66.057s	1.0
431	22	12	11	58	+67.527s	0.0
432	22	8	12	57	+1 lap	0.0
433	22	13	13	57	+1 lap	0.0
434	22	19	14	57	+1 lap	0.0
435	22	4	15	55	DNF	0.0
436	22	17	20	50	DNF	0.0
437	22	18	20	33	DNF	0.0
438	22	15	20	26	DNF	0.0
439	22	16	20	25	DNF	0.0
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, team_name, points, detail_url) FROM stdin;
1	Mercedes	613.5	https://www.formula1.com/../../en/results/2021/team/Mercedes
2	Red Bull Racing Honda	585.5	https://www.formula1.com/../../en/results/2021/team/Red-Bull-Racing-Honda
3	Ferrari	323.5	https://www.formula1.com/../../en/results/2021/team/Ferrari
4	McLaren Mercedes	275.0	https://www.formula1.com/../../en/results/2021/team/McLaren-Mercedes
5	Alpine Renault	155.0	https://www.formula1.com/../../en/results/2021/team/Alpine-Renault
6	AlphaTauri Honda	142.0	https://www.formula1.com/../../en/results/2021/team/AlphaTauri-Honda
7	Aston Martin Mercedes	77.0	https://www.formula1.com/../../en/results/2021/team/Aston-Martin-Mercedes
8	Williams Mercedes	23.0	https://www.formula1.com/../../en/results/2021/team/Williams-Mercedes
9	Alfa Romeo Racing Ferrari	13.0	https://www.formula1.com/../../en/results/2021/team/Alfa-Romeo-Racing-Ferrari
10	Haas Ferrari	0.0	https://www.formula1.com/../../en/results/2021/team/Haas-Ferrari
\.


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_driver_id_seq', 21, true);


--
-- Name: races_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.races_race_id_seq', 22, true);


--
-- Name: results_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_result_id_seq', 439, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 10, true);


--
-- Name: circuits circuits_circuit_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_circuit_name_key UNIQUE (circuit_name);


--
-- Name: circuits circuits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (circuit_id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (race_id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (result_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: teams teams_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_name_key UNIQUE (team_name);


--
-- Name: drivers drivers_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: races races_circuit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_circuit_id_fkey FOREIGN KEY (circuit_id) REFERENCES public.circuits(circuit_id);


--
-- Name: results results_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id);


--
-- Name: results results_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.races(race_id);


--
-- PostgreSQL database dump complete
--

