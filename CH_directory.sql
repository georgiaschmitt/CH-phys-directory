--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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
-- Name: cities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    name character varying,
    coordinates numeric(20,15)
);


ALTER TABLE public.cities OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_city_id_seq OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.favorites (
    fav_id integer NOT NULL,
    physician_id integer
);


ALTER TABLE public.favorites OWNER TO vagrant;

--
-- Name: favorites_fav_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.favorites_fav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_fav_id_seq OWNER TO vagrant;

--
-- Name: favorites_fav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.favorites_fav_id_seq OWNED BY public.favorites.fav_id;


--
-- Name: institutions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.institutions (
    institution_id integer NOT NULL,
    name character varying,
    city_id integer
);


ALTER TABLE public.institutions OWNER TO vagrant;

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.institutions_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutions_institution_id_seq OWNER TO vagrant;

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions.institution_id;


--
-- Name: physicians; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.physicians (
    physician_id integer NOT NULL,
    name character varying,
    institution_id integer,
    city_id integer
);


ALTER TABLE public.physicians OWNER TO vagrant;

--
-- Name: physicians_physician_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.physicians_physician_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physicians_physician_id_seq OWNER TO vagrant;

--
-- Name: physicians_physician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.physicians_physician_id_seq OWNED BY public.physicians.physician_id;


--
-- Name: userfavorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.userfavorites (
    userfav_id integer NOT NULL,
    user_id integer,
    fav_id integer
);


ALTER TABLE public.userfavorites OWNER TO vagrant;

--
-- Name: userfavorites_userfav_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.userfavorites_userfav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userfavorites_userfav_id_seq OWNER TO vagrant;

--
-- Name: userfavorites_userfav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.userfavorites_userfav_id_seq OWNED BY public.userfavorites.userfav_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: favorites fav_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites ALTER COLUMN fav_id SET DEFAULT nextval('public.favorites_fav_id_seq'::regclass);


--
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- Name: physicians physician_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians ALTER COLUMN physician_id SET DEFAULT nextval('public.physicians_physician_id_seq'::regclass);


--
-- Name: userfavorites userfav_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.userfavorites ALTER COLUMN userfav_id SET DEFAULT nextval('public.userfavorites_userfav_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.cities (city_id, name, coordinates) FROM stdin;
1	 "Anniston"	34.953030000000000
2	 "Huntsville"	34.953030000000000
3	 "Anchorage"	34.953030000000000
4	 "Mesa"	34.953030000000000
5	 "Phoenix"	34.953030000000000
6	 "Scottsdale"	34.953030000000000
7	 "Tempe"	34.953030000000000
8	 "Fayetteville"	34.953030000000000
9	 "Fort Smith"	34.953030000000000
10	 "Van Buren"	34.953030000000000
11	 "Fullerton"	34.953030000000000
12	 "La Mesa"	34.953030000000000
13	 "Los Angeles"	34.953030000000000
14	 "Mountain View "	34.953030000000000
15	 "Newport Beach"	34.953030000000000
16	 "Sacramento"	34.953030000000000
17	 "Red Bluff"	34.953030000000000
18	 "Redding"	34.953030000000000
19	 "San Francisco"	34.953030000000000
20	 "San Ramon"	34.953030000000000
21	 "Santa Ana"	34.953030000000000
22	 "Santa Monica"	34.953030000000000
23	 "Stanford"	34.953030000000000
24	 "Centennial"	34.953030000000000
25	 "Denver"	34.953030000000000
26	 "Englewood"	34.953030000000000
27	 "Loveland"	34.953030000000000
28	 "Bristol"	34.953030000000000
29	 "East Hartford"	34.953030000000000
30	 "Shelton"	34.953030000000000
31	 "Newark"	34.953030000000000
32	 "Altamonte Springs"	34.953030000000000
33	 "Davie"	34.953030000000000
34	 "Jacksonville"	34.953030000000000
35	 "Miami"	34.953030000000000
36	 "Pensacola"	34.953030000000000
37	 "Pompano Beach"	34.953030000000000
38	 "Saint Cloud"	34.953030000000000
39	 "Sebastian"	34.953030000000000
40	 "Venice"	34.953030000000000
41	 "Atlanta"	34.953030000000000
42	 "Decatur"	34.953030000000000
43	 "Fayetteville"	34.953030000000000
44	 "Lawrenceville"	34.953030000000000
45	 "Marietta"	34.953030000000000
46	 "Aurora"	34.953030000000000
47	 "Chicago"	34.953030000000000
48	 "Glenview"	34.953030000000000
49	 "Highland Park"	34.953030000000000
50	 "Northbrook"	34.953030000000000
51	 "Rockford"	34.953030000000000
52	 "Indianapolis"	34.953030000000000
53	 "Merrillville"	34.953030000000000
54	 "New Albany"	34.953030000000000
55	 "Johnston"	34.953030000000000
56	 "Pella"	34.953030000000000
57	 "Leawood"	34.953030000000000
58	 "Olathe"	34.953030000000000
59	 "Overland Park"	34.953030000000000
60	 "Wichita"	34.953030000000000
61	 "Crestview Hills"	34.953030000000000
62	 "Madisonville"	34.953030000000000
63	 "Baton Rouge"	34.953030000000000
64	 "Covington"	34.953030000000000
65	 "Lafayette"	34.953030000000000
66	 "Metairie"	34.953030000000000
67	 "New Iberia"	34.953030000000000
68	 "Lewiston"	34.953030000000000
69	 "Frederick"	34.953030000000000
70	 "Pikesville"	34.953030000000000
71	 "Towson"	34.953030000000000
72	 "Boston"	34.953030000000000
73	 "Lawrence"	34.953030000000000
74	 "Lexington"	34.953030000000000
75	 "North Easton"	34.953030000000000
76	 "Norwood"	34.953030000000000
77	 "Weymouth"	34.953030000000000
78	 "Ann Arbor"	34.953030000000000
79	 "Kentwood"	34.953030000000000
80	 "Lansing"	34.953030000000000
81	 "Portage"	34.953030000000000
82	 "Pontiac"	34.953030000000000
83	 "Cambridge"	34.953030000000000
84	 "Eagan"	34.953030000000000
85	 "Maplewood"	34.953030000000000
86	 "Ballwin"	34.953030000000000
87	 "Hannibal"	34.953030000000000
88	 "Kansas City"	34.953030000000000
89	 "Kennett"	34.953030000000000
90	 "St. Louis"	34.953030000000000
91	 "Holdrege"	34.953030000000000
92	 "Lincoln"	34.953030000000000
93	 "Reno"	34.953030000000000
94	 "Sparks"	34.953030000000000
95	 "Concord"	34.953030000000000
96	 "Laconia"	34.953030000000000
97	 "Bloomfield"	34.953030000000000
98	 "Edison"	34.953030000000000
99	 "Emerson"	34.953030000000000
100	 "Kearny"	34.953030000000000
101	 "Somers Point"	34.953030000000000
102	 "Stafford"	34.953030000000000
103	 "Summit"	34.953030000000000
104	 "Turnersville"	34.953030000000000
105	 "Alamogordo"	34.953030000000000
106	 "Albuquerque"	34.953030000000000
107	 "Capitan"	34.953030000000000
108	 "Bay Shore"	34.953030000000000
109	 "Bronx"	34.953030000000000
110	 "Camillus"	34.953030000000000
111	 "Canandaigua"	34.953030000000000
112	 "Cedarhurst"	34.953030000000000
113	 "New York"	34.953030000000000
114	 "Owego"	34.953030000000000
115	 "Rochester"	34.953030000000000
116	 "Schenectady"	34.953030000000000
117	 "Stony Brook"	34.953030000000000
118	 "White Plains"	34.953030000000000
119	 "Williamsville"	34.953030000000000
120	 "Asheville"	34.953030000000000
121	 "Chapel Hill"	34.953030000000000
122	 "Clyde"	34.953030000000000
123	 "Durham"	34.953030000000000
124	 "Matthews"	34.953030000000000
125	 "Raleigh"	34.953030000000000
126	 "Rocky Mount"	34.953030000000000
127	 "Winston-Salem"	34.953030000000000
128	 "Cincinnati"	34.953030000000000
129	 "Cleveland"	34.953030000000000
130	 "Columbus"	34.953030000000000
131	 "Grove City"	34.953030000000000
132	 "Hilliard"	34.953030000000000
133	 "Lewis Center"	34.953030000000000
134	 "Westlake"	34.953030000000000
135	 "Tulsa"	34.953030000000000
136	 "Albany"	34.953030000000000
137	 "Newport"	34.953030000000000
138	 "Bala Cynwyd"	34.953030000000000
139	 "Danville"	34.953030000000000
140	 "Doylestown"	34.953030000000000
141	 "Greensburg"	34.953030000000000
142	 "Hershey"	34.953030000000000
143	 "Jeannette"	34.953030000000000
144	 "Meadowbrook"	34.953030000000000
145	 "Philadelphia"	34.953030000000000
146	 "Pittsburgh"	34.953030000000000
147	 "Ridley Park "	34.953030000000000
148	 "Columbia"	34.953030000000000
149	 "Clarksville"	34.953030000000000
150	 "Germantown"	34.953030000000000
151	 "Memphis"	34.953030000000000
152	 "Nashville"	34.953030000000000
153	 "Ooltewah"	34.953030000000000
154	 "Abilene"	34.953030000000000
155	 "Austin"	34.953030000000000
156	 "Conroe"	34.953030000000000
157	 "Dallas"	34.953030000000000
158	 "Fort Worth"	34.953030000000000
159	 "Gladewater"	34.953030000000000
160	 "Houston"	34.953030000000000
161	 "Longview"	34.953030000000000
162	 "Pasadena"	34.953030000000000
163	 "Richardson"	34.953030000000000
164	 "Tyler"	34.953030000000000
165	 "Beaver"	34.953030000000000
166	 "Murray"	34.953030000000000
167	 "Salt Lake City"	34.953030000000000
168	 "Spanish Fork"	34.953030000000000
169	 "Burlington"	34.953030000000000
170	 "Rutland"	34.953030000000000
171	 "Alexandria"	34.953030000000000
172	 "Charlottesville"	34.953030000000000
173	 "Blacksburg"	34.953030000000000
174	 "Richmond"	34.953030000000000
175	 "Virginia Beach"	34.953030000000000
176	 "Woodbridge"	34.953030000000000
177	 "Issaquah"	34.953030000000000
178	 "Seattle"	34.953030000000000
179	 "Madison"	34.953030000000000
180	 "Manitowoc"	34.953030000000000
181	 "Milwaukee"	34.953030000000000
182	 "Stevens Point"	34.953030000000000
183	 "Calgary"	34.953030000000000
184	 "Edmonton"	34.953030000000000
185	 "Vancouver"	34.953030000000000
186	 "Winnipeg"	34.953030000000000
187	 "Huntsville"	34.953030000000000
188	 "Ottawa"	34.953030000000000
189	 "Toronto"	34.953030000000000
190	 "Montreal"	34.953030000000000
191	 "Trois-Rivières"	34.953030000000000
192	 "Saskatoon"	34.953030000000000
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.favorites (fav_id, physician_id) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.institutions (institution_id, name, city_id) FROM stdin;
1	”Anniston Neurology & Headache Management Center”	1
2	”Crown  Comprehensive Headache Center Inc”	2
3	null	3
4	null	4
5	”Southwest Pain Management Associates”	5
6	”Barrow Neurological Institute”	5
7	null	5
8	”Four Peaks Neurology”	6
9	null	6
10	null	7
11	”FirstCare Fayetteville North”	8
12	”Southwest Neurological Institute”	9
13	”Sparks Neurology Center”	9
14	”Summit Medical Center - Cornerstone Clinic”	10
15	”Fullerton Neurology and Headache”	11
16	null	12
17	null	12
18	”UCLA Medical System”	13
19	”Cedars-Sinai”	13
20	null	13
21	”David Geffen School of Medicine at UCLA”	13
22	”Northern California Headache Clinic”	14
23	”Newport Beach Neurologists”	15
24	null	16
25	”Kaiser Permanente”	16
26	”Lassen Medical Center”	17
27	”null”	18
28	”University of California, San Francisco - Headache Center”	19
29	”San Francisco Headache Clinic ”	19
30	”UUCSFMC Neurology Clinic”	19
31	null	20
32	null	20
33	null	21
34	null	22
35	”Stanford School of Medicine, Headache Clinic”	23
36	”Stanford School of Medicine, Headache Clinic”	23
37	”Alpine Neurology”	24
38	”Blue Sky Neurology”	25
39	”Blue Sky Neurology”	25
40	”Summit Headache and Neurologic Institute”	26
41	null	27
42	”Neurologic Associates”	28
43	”The Hartford Headache Center”	29
44	”Neurological Specialists”	30
45	”Neurosurgical Associates”	31
46	null	32
47	null	33
48	null	34
49	”Neurologic Center of South Florida”	35
50	”Ryan Wheeler Headache Treatment Center”	35
51	null	36
52	Sunrise Medical Group	37
53	Family Practice of Saint Cloud	38
54	”Espat and Rose”	39
55	null	40
56	”Peachtree Neurological Clinic”	41
57	null	42
58	”Southern Crescent Neurological Clinic”	43
59	”North Georgia Neurological Clinic”	44
60	”Northwest Neurology”	45
61	”Dreyer Medical Clinic ”	46
62	”Diamond Headache Clinic”	47
63	”University Neurologists”	47
64	null	47
65	”NorthShore - Glenbrook Hospital”	48
66	”North Suburban Wellness ”	49
67	”Robbins Headache Clinic”	50
68	”SwedishAmerican Neuro and Headache Center”	51
69	”Indiana Clinic Neurology”	52
70	null	52
71	”Northern Indiana Neurological”	53
72	”Northern Indiana Neurological”	53
73	null	54
74	”Mercy Johnston Medical Clinic”	55
75	null	56
76	null	57
77	null	58
78	Quivira Internal Medicine	59
79	”Wichita Clinic”	60
80	Neurology Consultants Of Kansas	60
81	”Neuroscience Associates of Northern Kentucky”	61
82	”MultiCare”	62
83	null	63
84	null	64
85	null	65
86	null	66
87	null	67
88	”Pediatric Associates of Lewiston”	68
89	Mid Maryland Neurology	69
90	”Mid-Atlantic Headache Institute ”	70
91	null	71
92	Brigham and Women's/Faulkner Neurology	72
93	”Massachusetts General Hospital ”	72
94	”New England Neurological Associates”	73
95	”Beth Israel Deaconess Healthcare- Medical Care Center”	74
96	null	75
97	null	76
98	null	77
99	”Michigan Headache & Neurological Institute\n”	78
100	”Greater Ann Arbor Neurology”	78
101	”University of Michigan Health System”	78
102	”South Kent Family Care”	79
103	null	80
104	”Promed Family Practice”	81
105	”St. Joseph Mercy Oakland ”	82
106	CCambridge Medical Center	83
107	”Park Nicollet Clinic—Eagan ”	84
108	”Noran Neurological Clinic”	85
109	null	86
110	”Hannibal Clinic”	87
111	”Neurological Consultants of Kansas City”	88
112	null	89
113	null	90
114	”Ryan Headache Center”	90
115	”Family Medical Specialties”	91
116	”East Lincoln Internal Medicine”	92
117	”Renown Health”	93
118	”Northern Nevada Medical Center”	94
119	null	95
120	Laconia Clinic	96
121	null	97
122	”Edison Neurologic Associates”	98
123	null	99
124	null	100
125	”Coastal Physicians & Surgeons”	101
126	UMDNJ - University Headache Center	102
127	”Vigman & Pollock”	103
128	”Neurology & Neurophysiology Associates of NJ”	104
129	White Mountain Neurology	105
130	”University of New Mexico - Clinic Neuroscience Center”	106
131	”Presbyterian Medical Group - Northside ”	106
132	null	107
133	”South Shore Neurologic Associates”	108
134	”Regional Neurological Associates”	109
135	”Montefiore Medical Center ”	109
136	null	109
137	”FamilyCare Medical Group – Neurological Division ”	110
138	”Ontario Neurology Associates”	111
139	”Five Towns Neurology”	112
140	”Mount Sinai Center for Headache and Pain Medicine ”	113
141	”New York Headache Center”	113
142	”The Headache Institute St. Luke's Hospital”	113
143	null	114
144	Pain Symptom Management Center	115
145	”Greater Rochester Neurological”	115
146	Schenectady Neurological Consultants and the Headache Center of Northeastern NY	116
147	null	117
148	”Neurologic Consultants of Westchester”	118
149	”Kinkel Neurologic Center”	119
150	Blue Ridge Headache Center	120
151	Carolina Headache Institute	121
152	”Mountain Medical Associates”	122
153	Duke Health Center at Morreene Road	123
154	”Carolinas Headache Clinic”	124
155	”Raleigh Neurology ”	125
156	”Raleigh Neurology ”	125
157	”Boice-Willis Clinic”	126
158	”Triad Neurological Associates”	127
159	”University of Cincinnati Physicians”	128
160	Cleveland Clinic - Neurological Center for Pain	129
161	”Cleveland Neurological Center”	129
162	”OrthoNeuro”	130
163	”Grove City Family Health”	131
164	”ExpressMed”	132
165	OSU Family Medicine at CarePoint Lewis Center Primary Care	133
166	null	134
167	”Tulsa Neurology Clinic”	135
168	”OMNI Medical Group”	135
169	”The Corvallis Clinic at Waverly Drive”	136
170	Samaritan Pacific Internal Medicine	137
171	”Headache and Neurologic Center of Philadelphia”	138
172	”Geisinger Health System ”	139
173	null	140
174	Gumm Family Practice	141
175	Penn State Hershey Neurology	142
176	null	143
177	Meadowbrook Neurology Group	144
178	”null”	145
179	Jefferson Headache Center	145
180	Jefferson Headache Center	145
181	”UPMC Headache Center”	146
182	”Associates in Neurology of Pittsburgh”	146
183	”Swarthmore Neurology Associates”	147
184	South Hampton Family Practice	148
185	South Hampton Family Practice	148
186	”Neurological Medicine”	149
187	null	150
188	”Semmes-Murphey Neurologic & Spine Institute”	151
189	”Nashville Neuroscience Group”	152
190	Erlanger Ooltewah Family Medicine	153
191	null	154
192	”Associated Neurological Specialties ”	155
193	”Austin Pain Associates ”	155
194	Headache & Pain Center	155
195	”Austin Headache Clinic ”	155
196	null	155
197	null	156
198	”Sadler Clinic”	156
199	”Dallas Headache Clinic”	157
200	”Texas Neurology ”	157
201	Anodyne Headache and PainCare	157
202	”Dallas Headache Clinic”	157
203	null	158
204	”Hugman-Kent Clinic”	159
205	Methodist Neurological Institute	160
206	”Memorial Neurological Association ”	160
207	”Houston Neurology Associates”	160
208	”Houston Headache Clinic”	160
209	”Houston Headache Clinic”	160
210	”Diagnostic Clinic of Longview”	161
211	”Houston Neurological Institute - Pasadena”	162
212	”Dallas Neurological Associates”	163
213	”East Texas Neurology ”	164
214	”Beaver/Milford/Parowan Medical Clinics”	165
215	Rocky Mountain Neurological Associates	166
216	”University Health Neurology”	167
217	”John A. Moran Eye Center”	167
218	Lifetree Clinical Research and Pain Clinic	167
219	”Canyon View Medical Group”	168
220	”University of Vermont Medical Group at Fletcher Allen”	169
221	null	170
222	Neurology & Headache Treatment Center	171
223	”University of Virginia Health System”	172
224	Neurology Services of Southwest VA	173
225	”Neurological Associates Inc”	174
226	”Neurological Associates Inc”	174
227	”Holland Road Family Medicine”	175
228	Prince William Neurology Inc	176
229	null	177
230	Neurology Headache and Multiple Sclerosis Clinic at UWMC	178
231	”Krischner Gordon and Erlich Mds”	178
232	”UW Neurology Clinic”	179
233	Aurora Health Center	180
234	”Columbia St. Mary's”	181
235	null	182
236	”Klasinski Clinic ”	182
237	null	183
238	null	183
239	null	184
240	null	185
241	null	186
242	null	187
243	null	188
244	null	188
245	null	189
246	”Montreal Migraine Clinic ”	190
247	null	191
248	null	192
\.


--
-- Data for Name: physicians; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.physicians (physician_id, name, institution_id, city_id) FROM stdin;
1	Dr. Anthony J. Esposito	1	1
2	Dr. Harry Lee McDaris, Jr	2	2
3	Dr. Mary Downs	3	3
4	Dr. George Wang 	3	4
5	Dr. Joseph R Cohen (DDS)	4	5
6	Dr. James L. Frey	5	5
7	Dr. Alan Hamilton (PCP)	6	5
8	Dr. Constantine G. Moschonas 	7	6
9	Dr. Jeffrey D. Steier 	8	6
10	Dr. Stephen D. Chakmakian PCP)	8	7
11	Dr. Joseph R. O'Connell (PCP)	9	8
12	Dr. William L. Griggs	10	9
13	Dr. Duane L. Birky 	11	9
14	Dr. R. Wendell Ross (PCP)	12	10
15	Dr. Jack H. Florin	13	11
16	Dr. Robert William Hogan II (PCP) (Kaiser)	14	12
17	Dr. Yu Dennis Cheng	14	12
18	Dr. Antonio A. De Salles	15	13
19	Dr. Stephen Graff-Radford (DDS)	16	13
20	Dr. Paul B. Kazimiroff	17	13
21	Dr. Alan M. Rapoport	18	13
22	Dr. Kenneth S. Peters	19	14
23	Dr. Phillip O'Carroll	20	15
24	Dr. Olana Aberra (PCP)	21	16
25	Dr. John Bissell 	22	16
26	Dr. Daniel McDaniel\n	23	17
27	Dr. Hamid Rabiee	24	18
28	Dr. Peter Goadsby	25	19
29	Dr. Jerome Goldstein	26	19
30	Dr. Neil H. Raskin 	27	19
31	Dr. Eric Collins	28	20
32	Dr. Kulveen Sachdeva	28	20
33	Dr. David E. Sosin 	28	21
34	Dr. David B. Kudrow	28	22
35	Sheena Aurora, MD	29	23
36	Robert P. Cowan, MD	29	23
37	Dr. John A. Myers	30	24
38	Dr. Pamela R. Kinder	31	25
39	Dr. Judy C. Lane	31	25
40	Dr. Cori Millen	32	26
41	Dr. Joseph Schmitt	33	27
42	Dr. Alexander Komm	34	28
43	Dr. Tanya R. Bilchik	35	29
44	Dr. James B Butler	36	30
45	Dr. Sung Ho Bae	37	31
46	Dr. Todd C. Hartley	38	32
47	Dr. Samuel K. Snyder (DO)	38	33
48	Dr. Michael L. Waters	38	34
49	Dr. Steven A. Kobetz	39	35
50	Dr. Steve D. Wheeler	40	35
51	Dr. James D Torrisi	41	36
52	Dr. James L. Cimera	42	37
53	Dr. John F. Wilker (PCP)	43	38
54	Dr. Roberta S. Rose	44	39
55	Dr. Frank J. Wierichs	45	40
56	Dr. Ellis V. Hedaya	46	41
57	Dr. Jerome M. Walker	47	42
58	Dr. Kenneth J. Lazarus	48	43
59	Dr. Micheal Todd Williamson\n	49	44
60	Dr. Robert G. Bashuk	50	45
61	Dr. Karen Burgner (PCP)	51	46
62	Diamond Doctors	52	47
63	Dr. Robert Wright	53	47
64	Dr. Kenneth L. Moore	54	47
65	Dr. Thomas Freedom	55	48
66	Dr. Trupti Gokani	56	49
67	Dr. Lawrence Robbins	57	50
68	Dr. Jeffery Royce	58	51
69	Dr. Robert J. Alonso	59	52
70	Dr. Bette G Maybury	60	52
71	Dr. Kathryn A. Hanlon	61	53
72	Dr.Larry Salberg	61	53
73	Dr. Joseph F. Seipel	62	54
74	Dr. Kelly Scott Bast (PCP)\n	63	55
75	Dr. Kurt Vander Ploeg (PCP)	64	56
76	Dr. Christine M Boylan (PCP)	64	57
77	Dr. Jay S. Zwibelman	64	58
78	Dr. Martin S. Buckman (PCP)	65	59
79	Dr. Tammie L. Nelson 	66	60
80	Dr. Gautham P. Reddy	67	60
81	Dr. John B. Kelly	68	61
82	Dr. Tim McGhee	69	62
83	Dr. Steven Zuckerman	70	63
84	Dr. Srinivas Ganji	70	64
85	Dr.Steven J. Snatic 	70	65
86	Dr. Daniel J. Trahant	70	66
87	Dr. Timothy F. Himel	70	67
88	Ann S. Hurd, PA	71	68
89	Dr. Richard T. Leschek	72	69
90	Dr. Marcia Ribeiro	73	70
91	Dr. Abraham Allan Genut	74	71
92	Dr. Elizabeth W. Loder	75	72
93	Dr. James Arthur Morrill (PCP)	76	72
94	Dr. Andreas P. Schoeck	77	73
95	Dr. Peter J. Zuromskis	78	74
96	Dr. Albert Ackil 	79	75
97	Dr. Bryan Lieberman	79	76
98	Dr. Paul S. Blachman	79	77
99	Dr. Joel R. Saper	80	78
100	Dr. James Gramprie	81	78
101	Dr. Wade M. Cooper	82	78
102	Dr. Michael Bolan (PCP)	83	79
103	Dr. Richard S. Ferro (Pain Medicine)	84	80
104	Dr. Michael T. Ku (PCP)	85	81
105	Dr. Lionel Glass	86	82
106	Dr. Jane M. Achenbach	87	83
107	Dr. John Peers Robrock (PCP)\n	88	84
108	Dr. Michael P. Sethna	89	85
109	Dr. Andrew Y. Chao (PCP)	90	86
110	Dr. Brett D. Hosley	91	87
111	Dr. Charles Weinstein	92	88
112	Dr. Gustavo Adolfo Granada\n	93	89
113	Dr. Juan C. Escandon	93	90
114	Ryan Doctors	94	90
115	Dr. Scott M. Ehresman (PCP)	95	91
116	John Stefkovich, PA-C 	96	92
117	Dr. John F. Rothrock 	97	93
118	Dr. Jonathan W. Spivack	98	94
119	Dr. Patrick Carroll	99	95
120	Dr. Philip V. Savia	100	96
121	Dr. Joseph A. Carluccio	101	97
122	Dr. Michael Merkin	102	98
123	Dr. William L. Cantor (ENT)	103	99
124	Dr. Frederick Weisbrot	103	100
125	Dr. Kevin E. Hunter	104	101
126	Dr. Loretta L. Mueller	105	102
127	Dr. Melvin Paul Vigman	106	103
128	Dr. Ramon Manon-Espaillat	107	104
129	Dr. Terry D. Rolan	108	105
130	Dr. Joanna Katzman	109	106
131	Dr. Jeffrey D. Miller (PCP)	110	106
132	Dr. Harvey J. Featherstone	111	107
133	Dr. Norman L. Pflaster	112	108
134	Dr. Randall G. Berliner	113	109
135	Dr. Seymour Solomon	114	109
136	Dr. Derek G. Randall	115	109
137	Dr. Kevin W Thomas	116	110
138	Dr.  Robert S. Knapp	117	111
139	Dr. David Steiner	118	112
140	Dr. Mark W. Green\n	119	113
141	Dr. Alexander Mauskop	120	113
142	Dr. Lawrence C. Newman	121	113
143	Dr. Keith Nichols (PCP)	122	114
144	Dr. Gilbert Proper 	123	115
145	Dr. Joseph I. Mann	124	115
146	Dr. Bruno P. Tolge	125	116
147	Dr. Patrick E. Poole 	126	117
148	Dr. Ronald M. Silverman 	127	118
149	Dr. Peter R. Kinkel	128	119
150	Dr. Morris Maizels	129	120
151	Dr. Alan Finkel	130	121
152	Dr. Howard W. Palay	131	122
153	Dr. Timothy Collins 	132	123
154	Dr. Sara E. Sacco, MD	133	124
155	Dr. Rhonda W. Gabr	134	125
156	Dr. David A. Konanc	134	125
157	Dr. Aurora K. Pajeau, MD	135	126
158	Dr. Paul G. Martin	136	127
159	Dr. Joseph Nicolas	137	128
160	Dr. Mark Stillman	138	129
161	Dr. Stewart J. Tepper	139	129
162	Dr. Francis J. O'Donnell	140	130
163	Dr. John Horn (PCP)	141	131
164	Dr. Donata Rechnitzer (PCP)	142	132
165	Dr. Perry D. Mostov, D.O.\n	143	133
166	Dr. Carl Ansevin	144	134
167	Dr. Jay K. Johnson	145	135
168	Dr. Trudy Milner\n	146	135
169	Dr. Gerald Riess	147	136
170	Dr. John Watkins\n	148	137
171	Dr. Michael Cohen 	149	138
172	Dr. Todd D Rozen	150	139
173	Dr. Abraham Ashkenazi	151	140
174	Dr. Edward A. Gumm (PCP)\n\n	152	141
175	Dr. Stephen C. Ross	153	142
176	Dr. Jill M. Constantine (PCP)	154	143
177	Dr. Gregory Cooper	155	144
178	Dr. Steven Mandel	156	145
179	Dr. Stephen D. Silberstein	157	145
180	Dr. William B. Young	157	145
181	Dr. Robert G. Kaniecki	158	146
182	Dr. John B. Talbott	159	146
183	Dr. Steven D. Grossinger	160	147
184	Dr. Martha Parker Hester (PCP)\n	161	148
185	Dr. B.  Martin Hester (PCP)	161	148
186	Dr. Constance Johnson	162	149
187	Dr. E. Arthur Franklin (PCP)	163	150
188	Dr. Michael H. DeShazo	164	151
189	Dr. Jan Lewis Brandes 	165	152
190	Dr. David V. Lounsberry (PCP)	166	153
191	Dr. Rexford K. Anderson	167	154
192	Dr. Robert M. Cain	168	155
193	Dr. Craig DuBois	169	155
194	Dr. Rajat Gupta	170	155
195	Dr. Marci A. Roy 	171	155
196	Dr. Sheila Shung	172	155
197	Dr. M. Vestal Caperton (PCP)\n	172	156
198	Dr. Gary Sharpless (PCP)	173	156
199	Dr. Stuart B. Black	174	157
200	Dr. Steven P. Herzog	175	157
201	Dr. John Claude Krusz	176	157
202	Dr. Maureen Wooten Watts	177	157
203	Dr. John A. Sklar	178	158
204	Dr. Warren H Hunt	179	159
205	Dr. Howard S. Derman	180	160
206	Dr. Herbert P. Edmundson, Jr.	181	160
207	Dr. Leonard Hershkowitz	182	160
208	Dr. Ninan T. Mathew	183	160
209	Lori Meadors, PA	183	160
210	Dr. Richard Hamer	184	161
211	Dr. Philip S. Blum	185	162
212	Dr. John Harney\n	186	163
213	Dr. Preston E. Harrison	187	164
214	Dr. R. Wade Oakden	188	165
215	Dr. Diana D Banks	189	166
216	Dr. Dana DeWitt	190	167
217	Dr. Kathleen B. Digre (Neuro-Ophthalmology)\n	191	167
218	Dr. Lynn R. Webster (Pain Management)	192	167
219	Dr. Jeffrey J. Juchau (PCP)	193	168
220	Dr. Robert Shapiro	194	169
221	Dr. Peter J. Szostak	195	170
222	Dr. Stuart Robert Stark	196	171
223	Priscilla F. Potter, MD	197	172
224	Dr. Steven D. Nack 	198	173
225	Dr. Michael Mareska  	199	174
226	Kara Clark, NP	199	174
227	Dr. Allen R. Fenderson	200	175
228	Dr. Naurang S Gill	201	176
229	Dr Lily Jung Henson	202	177
230	Dr. Sylvia Lucas	203	178
231	Dr. Elena Robinson	204	178
232	Dr. Ivy J. Dreizin	205	179
233	Dr. Donald J. DeBruyn (PCP)	206	180
234	Dr. Suzanne M. Wilkerson (PCP)	207	181
235	Dr. Pamela V. Gedney	208	182
236	Dr. Michele M. Klasinski	209	182
237	Dr. Werner J. Becker	210	183
238	Dr. Arnolda Eloff 	210	183
239	Dr. Grant K. Campbell (PCP)\n	210	184
240	Dr. R. Gordon Robinson\n	210	185
241	Dr. Doug Hobson\n	210	186
242	Dr. R. Blaine Taylor Foell	210	187
243	Dr. Heather Elaine Mills (PCP)	210	188
244	Dr. Lucian Sitwell 	210	188
245	Dr. Marek Gawel 	210	189
246	Montreal Migraine Doctors	211	190
247	Dr. André F. Gagnon\n	212	191
248	Dr. Christopher Voll 	212	192
\.


--
-- Data for Name: userfavorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.userfavorites (userfav_id, user_id, fav_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, email, password) FROM stdin;
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 192, true);


--
-- Name: favorites_fav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.favorites_fav_id_seq', 1, false);


--
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 248, true);


--
-- Name: physicians_physician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.physicians_physician_id_seq', 248, true);


--
-- Name: userfavorites_userfav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.userfavorites_userfav_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (fav_id);


--
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- Name: physicians physicians_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_pkey PRIMARY KEY (physician_id);


--
-- Name: userfavorites userfavorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.userfavorites
    ADD CONSTRAINT userfavorites_pkey PRIMARY KEY (userfav_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: favorites favorites_physician_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_physician_id_fkey FOREIGN KEY (physician_id) REFERENCES public.physicians(physician_id);


--
-- Name: institutions institutions_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: physicians physicians_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: physicians physicians_institution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_institution_id_fkey FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id);


--
-- Name: userfavorites userfavorites_fav_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.userfavorites
    ADD CONSTRAINT userfavorites_fav_id_fkey FOREIGN KEY (fav_id) REFERENCES public.favorites(fav_id);


--
-- Name: userfavorites userfavorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.userfavorites
    ADD CONSTRAINT userfavorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

