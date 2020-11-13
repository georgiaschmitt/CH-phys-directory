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
-- Name: favorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.favorites (
    fav_id integer NOT NULL,
    user_id integer NOT NULL,
    physician_id integer NOT NULL
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
-- Name: locations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    institution character varying,
    city character varying,
    state character varying,
    lat numeric(20,15),
    lng numeric(20,15)
);


ALTER TABLE public.locations OWNER TO vagrant;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO vagrant;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: physicians; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.physicians (
    physician_id integer NOT NULL,
    name character varying,
    location_id integer
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
-- Name: favorites fav_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites ALTER COLUMN fav_id SET DEFAULT nextval('public.favorites_fav_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Name: physicians physician_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians ALTER COLUMN physician_id SET DEFAULT nextval('public.physicians_physician_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.favorites (fav_id, user_id, physician_id) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.locations (location_id, institution, city, state, lat, lng) FROM stdin;
3	\N	Anchorage	Alaska	43.034558600000000	-89.429237399999990
4	\N	Mesa	Arizona	43.034558600000000	-89.429237399999990
5	Southwest Pain Management Associates	Phoenix	Arizona	33.622581400000000	-112.030166600000000
6	Barrow Neurological Institute	Phoenix	Arizona	33.482026200000000	-112.079142600000000
7	\N	Phoenix	Arizona	43.034558600000000	-89.429237399999990
9	\N	Scottsdale	Arizona	43.034558600000000	-89.429237399999990
10	\N	Tempe	Arizona	43.034558600000000	-89.429237399999990
11	FirstCare Fayetteville North	Fayetteville	Arkansas	36.111842200000000	-94.143452799999990
13	Sparks Neurology Center	Fort Smith	Arkansas	35.379996200000000	-94.416543199999990
14	Summit Medical Center - Cornerstone Clinic	Van Buren	Arkansas	43.163690600000000	-89.260017100000000
15	Fullerton Neurology and Headache	Fullerton	California	33.892504000000000	-117.929969000000000
16	\N	La Mesa	California	43.034558600000000	-89.429237399999990
18	UCLA Medical System	Los Angeles	California	34.054178700000000	-118.463199400000000
19	Cedars-Sinai	Los Angeles	California	34.075395400000000	-118.380255900000000
22	Northern California Headache Clinic	Mountain View 	California	37.367037800000000	-122.083788900000000
23	Newport Beach Neurologists	Newport Beach	California	33.658743600000000	-117.864705100000000
24	\N	Sacramento	California	43.034558600000000	-89.429237399999990
25	Kaiser Permanente	Sacramento	California	43.070426000000000	-89.523996000000000
26	Lassen Medical Center	Red Bluff	California	40.149402100000000	-122.222295100000000
27	\N	Redding	California	43.034558600000000	-89.429237399999990
29	San Francisco Headache Clinic 	San Francisco	California	37.784466500000000	-122.440442500000000
30	UUCSFMC Neurology Clinic	San Francisco	California	37.774929500000000	-122.419415500000000
31	\N	San Ramon	California	43.034558600000000	-89.429237399999990
32	\N	San Ramon	California	43.034558600000000	-89.429237399999990
33	\N	Santa Ana	California	43.034558600000000	-89.429237399999990
34	\N	Santa Monica	California	43.034558600000000	-89.429237399999990
36	Alpine Neurology	Centennial	Colorado	39.594395899999990	-104.835212200000000
37	Blue Sky Neurology	Denver	Colorado	39.732441100000000	-104.932179100000000
39	\N	Loveland	Colorado	43.034558600000000	-89.429237399999990
40	Neurologic Associates	Bristol	Connecticut	43.023912600000000	-88.239732100000000
41	The Hartford Headache Center	East Hartford	Connecticut	41.759613400000000	-72.739732899999990
42	Neurological Specialists	Shelton	Connecticut	41.802079600000000	-87.934759000000000
43	Neurosurgical Associates	Newark	Delaware	42.990540000000000	-87.951011000000000
45	\N	Davie	Florida	43.034558600000000	-89.429237399999990
46	\N	Jacksonville	Florida	43.034558600000000	-89.429237399999990
48	Ryan Wheeler Headache Treatment Center	Miami	Florida	25.761679800000000	-80.191790200000000
49	\N	Pensacola	Florida	43.034558600000000	-89.429237399999990
50	Sunrise Medical Group	Pompano Beach	Florida	42.781083600000000	-78.781223500000000
52	Espat and Rose	Sebastian	Florida	27.847448200000000	-80.488484399999990
53	\N	Venice	Florida	43.034558600000000	-89.429237399999990
54	Peachtree Neurological Clinic	Atlanta	Georgia	33.841899300000000	-84.426539499999990
55	\N	Decatur	Georgia	43.034558600000000	-89.429237399999990
57	North Georgia Neurological Clinic	Lawrenceville	Georgia	33.964291000000000	-84.010952000000000
58	Northwest Neurology	Marietta	Georgia	42.187678299999990	-88.183097800000000
59	Dreyer Medical Clinic 	Aurora	Illinois	41.793560500000000	-88.368044400000000
60	Diamond Headache Clinic	Chicago	Illinois	41.907982300000000	-87.648743200000010
62	\N	Chicago	Illinois	43.034558600000000	-89.429237399999990
63	NorthShore - Glenbrook Hospital	Glenview	Illinois	42.092669200000000	-87.854443400000000
65	Robbins Headache Clinic	Northbrook	Illinois	42.154100199999990	-87.892021700000000
66	SwedishAmerican Neuro and Headache Center	Rockford	Illinois	42.265290000000000	-89.074075000000000
67	Indiana Clinic Neurology	Indianapolis	Indiana	39.775496100000000	-86.176618400000000
68	\N	Indianapolis	Indiana	43.034558600000000	-89.429237399999990
70	\N	New Albany	Indiana	43.034558600000000	-89.429237399999990
71	Mercy Johnston Medical Clinic	Johnston	Iowa	41.662261900000000	-93.735019700000000
72	\N	Pella	Iowa	43.034558600000000	-89.429237399999990
73	\N	Leawood	Kansas	43.034558600000000	-89.429237399999990
76	Wichita Clinic	Wichita	Kansas	37.722246299999990	-97.229800799999990
77	Neurology Consultants Of Kansas 	Wichita	Kansas	37.721490300000000	-97.198371999999990
79	MultiCare	Madisonville	Kentucky	37.328100500000010	-87.498888200000000
80	\N	Baton Rouge	Louisiana	43.034558600000000	-89.429237399999990
81	\N	Covington	Louisiana	43.034558600000000	-89.429237399999990
82	\N	Lafayette	Louisiana	43.034558600000000	-89.429237399999990
83	\N	Metairie	Louisiana	43.034558600000000	-89.429237399999990
84	\N	New Iberia	Louisiana	43.034558600000000	-89.429237399999990
86	Mid Maryland Neurology	Frederick	Maryland	39.442043000000000	-77.405222999999990
87	Mid-Atlantic Headache Institute 	Pikesville	Maryland	39.386464400000000	-76.734670800000000
88	\N	Towson	Maryland	43.034558600000000	-89.429237399999990
90	Massachusetts General Hospital 	Boston	Massachusetts	42.362610900000000	-71.067566000000000
91	New England Neurological Associates	Lawrence	Massachusetts	42.642097000000010	-71.305702300000010
93	\N	North Easton	Massachusetts	43.034558600000000	-89.429237399999990
94	\N	Norwood	Massachusetts	43.034558600000000	-89.429237399999990
95	\N	Weymouth	Massachusetts	43.034558600000000	-89.429237399999990
96	Michigan Headache & Neurological Institute	Ann Arbor	Michigan	42.255000100000000	-83.697736700000000
97	Greater Ann Arbor Neurology	Ann Arbor	Michigan	42.569023300000000	-83.806315700000000
99	South Kent Family Care	Kentwood	Michigan	42.905122899999990	-85.610844800000000
100	\N	Lansing	Michigan	43.034558600000000	-89.429237399999990
101	Promed Family Practice	Portage	Michigan	42.202956700000000	-85.642702000000000
102	St. Joseph Mercy Oakland 	Pontiac	Michigan	42.614925100000000	-83.276690100000000
104	Park Nicollet Clinic—Eagan 	Eagan	Minnesota	44.788471000000000	-93.200723000000000
105	Noran Neurological Clinic	Maplewood	Minnesota	44.950967899999990	-93.262998900000000
106	\N	Ballwin	Missouri	43.034558600000000	-89.429237399999990
107	Hannibal Clinic	Hannibal	Missouri	39.711098300000000	-91.447097399999990
109	\N	Kennett	Missouri	43.034558600000000	-89.429237399999990
110	\N	St. Louis	Missouri	43.034558600000000	-89.429237399999990
111	Ryan Headache Center	St. Louis	Missouri	38.652161300000000	-90.502428900000000
113	East Lincoln Internal Medicine	Lincoln	Nebraska	40.767394499999990	-96.626859900000000
114	Renown Health	Reno	Nevada	39.529632900000000	-119.813802700000000
115	Northern Nevada Medical Center	Sparks	Nevada	39.541115700000000	-119.697359700000000
116	\N	Concord	New Hampshire	43.034558600000000	-89.429237399999990
118	\N	Bloomfield	New Jersey	43.034558600000000	-89.429237399999990
119	Edison Neurologic Associates	Edison	New Jersey	40.597655900000000	-74.357510200000000
120	\N	Emerson	New Jersey	43.034558600000000	-89.429237399999990
121	\N	Kearny	New Jersey	43.034558600000000	-89.429237399999990
123	UMDNJ - University Headache Center 	Stafford	New Jersey	40.743425800000000	-74.191820800000000
124	Vigman & Pollock	Summit	New Jersey	40.717040500000000	-74.359404800000000
126	White Mountain Neurology	Alamogordo	New Mexico	32.899532500000000	-105.960265000000000
127	University of New Mexico - Clinic Neuroscience Center	Albuquerque	New Mexico	35.089060700000000	-106.617605800000000
128	Presbyterian Medical Group - Northside 	Albuquerque	New Mexico	35.084385900000000	-106.650422000000000
129	\N	Capitan	New Mexico	43.034558600000000	-89.429237399999990
131	Regional Neurological Associates	Bronx	New York	40.896212600000000	-73.859829200000000
132	Montefiore Medical Center 	Bronx	New York	40.880429100000000	-73.880040999999990
133	\N	Bronx	New York	43.034558600000000	-89.429237399999990
135	Ontario Neurology Associates	Canandaigua	New York	43.126013400000000	-77.518176799999990
136	Five Towns Neurology	Cedarhurst	New York	40.629131000000000	-73.708950000000000
137	Mount Sinai Center for Headache and Pain Medicine 	New York	New York	40.789077000000010	-73.954008000000000
138	New York Headache Center	New York	New York	40.774140000000000	-73.963436000000000
139	The Headache Institute St. Luke's Hospital	New York	New York	40.712775300000000	-74.005972800000000
140	\N	Owego	New York	43.034558600000000	-89.429237399999990
142	Greater Rochester Neurological	Rochester	New York	43.120290999999990	-77.591575100000000
144	\N	Stony Brook	New York	43.034558600000000	-89.429237399999990
145	Neurologic Consultants of Westchester	White Plains	New York	40.967683800000000	-73.884028800000000
146	Kinkel Neurologic Center	Williamsville	New York	42.964263600000000	-78.712411699999990
147	Blue Ridge Headache Center	Asheville	North Carolina	35.595058100000000	-82.551486900000000
148	Carolina Headache Institute	Chapel Hill	North Carolina	35.915903800000000	-78.933333900000000
149	Mountain Medical Associates	Clyde	North Carolina	35.526478700000000	-82.947820400000000
150	Duke Health Center at Morreene Road	Durham	North Carolina	36.009347300000000	-78.955140399999990
152	Raleigh Neurology 	Raleigh	North Carolina	35.800678600000000	-78.731413000000000
153	Boice-Willis Clinic	Rocky Mount	North Carolina	35.978985000000000	-77.842920999999990
154	Triad Neurological Associates	Winston-Salem	North Carolina	36.060010700000000	-80.297631000000000
156	Cleveland Clinic - Neurological Center for Pain	Cleveland	Ohio	41.507574900000000	-81.605818599999990
157	Cleveland Neurological Center	Cleveland	Ohio	41.505667700000000	-81.605269700000000
158	OrthoNeuro	Columbus	Ohio	40.122744600000000	-82.947434899999990
159	Grove City Family Health	Grove City	Ohio	39.840117000000000	-83.072859999999990
162	\N	Westlake	Oklahoma	43.034558600000000	-89.429237399999990
163	Tulsa Neurology Clinic	Tulsa	Oklahoma	36.059895600000000	-95.923043600000000
164	OMNI Medical Group	Tulsa	Oklahoma	43.060479200000000	-87.926647300000010
165	The Corvallis Clinic at Waverly Drive	Albany	Oregon	44.624872200000010	-123.071887200000000
166	Samaritan Pacific Internal Medicine 	Newport	Oregon	44.627201900000000	-124.062091200000000
168	Geisinger Health System 	Danville	Pennsylvania	40.814725600000000	-77.941762799999990
169	\N	Doylestown	Pennsylvania	43.034558600000000	-89.429237399999990
170	Gumm Family Practice	Greensburg	Pennsylvania	43.763591100000000	-87.748883800000000
171	Penn State Hershey Neurology	Hershey	Pennsylvania	40.268786700000000	-76.660221999999990
172	\N	Jeannette	Pennsylvania	43.034558600000000	-89.429237399999990
174	\N	Philadelphia	Pennsylvania	43.034558600000000	-89.429237399999990
175	Jefferson Headache Center	Philadelphia	Pennsylvania	39.948083900000000	-75.156145600000000
176	UPMC Headache Center	Pittsburgh	Pennsylvania	40.446429100000000	-79.954938400000000
178	Swarthmore Neurology Associates	Ridley Park 	Pennsylvania	39.863873700000000	-75.337050300000000
179	South Hampton Family Practice	Columbia	South Carolina	33.983697700000000	-80.968482299999990
180	Neurological Medicine	Clarksville	Tennessee	43.200299700000000	-88.700007700000000
181	\N	Germantown	Tennessee	43.034558600000000	-89.429237399999990
183	Nashville Neuroscience Group	Nashville	Tennessee	36.152285000000000	-86.801853499999990
184	Erlanger Ooltewah FamilyMedicine	Ooltewah	Tennessee	35.090463600000000	-85.064423699999990
185	\N	Abilene	Texas	43.034558600000000	-89.429237399999990
186	Associated Neurological Specialties 	Austin	Texas	30.006698300000000	-97.851731199999990
187	Austin Pain Associates 	Austin	Texas	30.232807700000000	-97.803022500000000
189	Austin Headache Clinic 	Austin	Texas	30.295857300000000	-97.824906300000000
190	\N	Austin	Texas	43.034558600000000	-89.429237399999990
191	\N	Conroe	Texas	43.034558600000000	-89.429237399999990
193	Dallas Headache Clinic	Dallas	Texas	32.872545900000000	-96.771191000000000
194	Texas Neurology 	Dallas	Texas	32.839929700000000	-96.773743400000000
196	\N	Fort Worth	Texas	43.034558600000000	-89.429237399999990
197	Hugman-Kent Clinic	Gladewater	Texas	32.537184000000000	-94.944454000000010
198	Methodist Neurological Institute	Houston	Texas	29.710785100000000	-95.400646400000000
200	Houston Neurology Associates	Houston	Texas	29.692531000000000	-95.518800000000000
201	Houston Headache Clinic	Houston	Texas	29.783275000000000	-95.529548999999990
202	Diagnostic Clinic of Longview	Longview	Texas	32.533440000000000	-94.731403300000000
204	Dallas Neurological Associates	Richardson	Texas	32.834457600000000	-96.705853600000000
205	East Texas Neurology 	Tyler	Texas	31.316103899999990	-94.752129300000000
206	Beaver/Milford/Parowan Medical Clinics	Beaver	Utah	37.842605800000000	-112.819947900000000
207	Rocky Mountain Neurological Associates	Murray	Utah	40.673900900000000	-111.850476300000000
209	John A. Moran Eye Center	Salt Lake City	Utah	40.769532600000000	-111.837665000000000
210	Lifetree Clinical Research and Pain Clinic	Salt Lake City	Utah	40.687699900000000	-111.872741600000000
211	Canyon View Medical Group	Spanish Fork	Utah	40.108493700000000	-111.660576200000000
1	Anniston Neurology & Headache Management Center	Anniston	Alabama	33.659599800000000	-85.825337600000000
2	Crown  Comprehensive Headache Center Inc	Huntsville	Alabama	34.724235500000000	-86.578382000000000
8	Four Peaks Neurology	Scottsdale	Arizona	33.574076500000000	-111.885839400000000
12	Southwest Neurological Institute	Fort Smith	Arkansas	35.385924200000000	-94.398547499999990
17	\N	La Mesa	California	43.034558600000000	-89.429237399999990
20	\N	Los Angeles	California	43.034558600000000	-89.429237399999990
21	David Geffen School of Medicine at UCLA	Los Angeles	California	34.064282899999990	-118.442356200000000
28	University of California San Francisco - Headache Center	San Francisco	California	37.784466500000000	-122.440442500000000
35	Stanford School of Medicine Headache Clinic	Stanford	California	37.433045100000000	-122.175111800000000
38	Summit Headache and Neurologic Institute	Englewood	Colorado	39.653473400000000	-104.980214500000000
44	\N	Altamonte Springs	Florida	43.034558600000000	-89.429237399999990
47	Neurologic Center of South Florida	Miami	Florida	25.702134800000000	-80.347650100000000
51	Family Practice of Saint Cloud	Saint Cloud	Florida	28.246155000000000	-81.303815000000000
56	Southern Crescent Neurological Clinic	Fayetteville	Georgia	33.449953500000000	-84.508294900000000
61	University Neurologists	Chicago	Illinois	43.075370799999990	-89.433046199999990
64	North Suburban Wellness 	Highland Park	Illinois	42.183867400000000	-87.798779700000000
69	Northern Indiana Neurological	Merrillville	Indiana	41.461922500000010	-87.330937699999990
74	\N	Olathe	Kansas	43.034558600000000	-89.429237399999990
75	Quivira Internal Medicine	Overland Park	Kansas	38.936266800000000	-94.721973699999990
78	Neuroscience Associates of Northern Kentucky	Crestview Hills	Kentucky	39.023819900000000	-84.564528099999990
85	Pediatric Associates of Lewiston	Lewiston	Maine	44.123378100000000	-70.196659200000000
89	Brigham and Women's/Faulkner Neurology 	Boston	Massachusetts	42.301641100000000	-71.128781699999990
92	Beth Israel Deaconess Healthcare- Medical Care Center 	Lexington	Massachusetts	42.339606300000000	-71.104981999999990
98	University of Michigan Health System	Ann Arbor	Michigan	42.283914300000010	-83.733276600000000
103	CCambridge Medical Center	Cambridge	Minnesota	43.013742200000000	-89.027678200000000
108	Neurological Consultants of Kansas City	Kansas City	Missouri	39.047224900000000	-94.591774899999990
112	Family Medical Specialties	Holdrege	Nebraska	40.449555600000000	-99.386214999999990
117	Laconia Clinic	Laconia	New Hampshire	43.530370800000000	-71.472226800000000
122	Coastal Physicians & Surgeons	Somers Point	New Jersey	39.315528500000000	-74.591612500000000
125	Neurology & Neurophysiology Associates of NJ	Turnersville	New Jersey	39.741419100000000	-75.047915600000000
130	South Shore Neurologic Associates	Bay Shore	New York	40.729303200000000	-73.209231300000000
134	FamilyCare Medical Group – Neurological Division 	Camillus	New York	43.039233000000000	-76.304096500000000
141	Pain Symptom Management Center	Rochester	New York	43.156577899999990	-77.608846500000000
143	Schenectady Neurological Consultants and the Headache Center of Northeastern NY	Schenectady	New York	40.774140000000000	-73.963436000000000
151	Carolinas Headache Clinic	Matthews	North Carolina	35.120765400000000	-80.713934000000000
155	University of Cincinnati Physicians	Cincinnati	Ohio	39.136565399999990	-84.504946800000000
160	ExpressMed	Hilliard	Ohio	40.033396100000000	-83.158245100000000
161	OSU Family Medicine at CarePoint Lewis Center Primary Care	Lewis Center	Ohio	40.198388400000000	-83.010098700000000
167	Headache and Neurologic Center of Philadelphia	Bala Cynwyd	Pennsylvania	40.005330099999990	-75.219190400000000
173	Meadowbrook Neurology Group	Meadowbrook	Pennsylvania	40.185159400000000	-75.078727000000000
177	Associates in Neurology of Pittsburgh	Pittsburgh	Pennsylvania	40.445349200000000	-79.827182499999990
182	Semmes-Murphey Neurologic & Spine Institute	Memphis	Tennessee	35.125713900000000	-89.853169400000000
188	Headache & Pain Center	Austin	Texas	43.054939800000000	-89.397697600000000
192	Sadler Clinic	Conroe	Texas	30.311876900000000	-95.456051199999990
195	Anodyne Headache and PainCare	Dallas	Texas	32.883121000000000	-96.767795999999990
199	Memorial Neurological Association 	Houston	Texas	29.693175500000000	-95.521950300000000
203	Houston Neurological Institute - Pasadena	Pasadena	Texas	29.659169100000000	-95.181569000000010
208	University Health Neurology	Salt Lake City	Utah	43.077308599999990	-89.431556700000000
212	University of Vermont Medical Group at Fletcher Allen	Burlington	Vermont	44.479661700000000	-73.194246700000000
213	\N	Rutland	Vermont	43.034558600000000	-89.429237399999990
214	Neurology & Headache Treatment Center 	Alexandria	Virginia	38.828289900000000	-77.110407200000000
215	University of Virginia Health System	Charlottesville	Virginia	38.031758800000000	-78.500715399999990
216	Neurology Services of Southwest VA	Blacksburg	Virginia	37.196400000000000	-80.401300000000000
217	Neurological Associates Inc	Richmond	Virginia	42.096908900000000	-87.797537600000000
218	Holland Road Family Medicine	Virginia Beach	Virginia	36.828659000000000	-76.129180900000000
219	Prince William Neurology Inc 	Woodbridge	Virginia	40.557598600000000	-74.284602200000000
220	\N	Issaquah	Washington	43.034558600000000	-89.429237399999990
221	Neurology Headache and Multiple Sclerosis Clinic at UWMC	Seattle	Washington	47.649872200000000	-122.308229600000000
222	Krischner Gordon and Erlich Mds	Seattle	Washington	47.606209500000000	-122.332070800000000
223	UW Neurology Clinic	Madison	Wisconsin	43.077308599999990	-89.431556700000000
224	Aurora Health Center	Manitowoc	Wisconsin	43.065674700000000	-88.467457600000000
225	Columbia St. Mary's	Milwaukee	Wisconsin	43.061011300000000	-87.880376099999990
226	\N	Stevens Point	Wisconsin	43.034558600000000	-89.429237399999990
227	Klasinski Clinic 	Stevens Point	Wisconsin	44.530834600000000	-89.576653600000000
228	\N	Calgary	Alberta	43.034558600000000	-89.429237399999990
229	\N	Calgary	Alberta	43.034558600000000	-89.429237399999990
230	\N	Edmonton	Alberta	43.034558600000000	-89.429237399999990
231	\N	Vancouver	British Columbia	43.034558600000000	-89.429237399999990
232	\N	Winnipeg	Manitoba	43.034558600000000	-89.429237399999990
233	\N	Huntsville	Ontario	43.034558600000000	-89.429237399999990
234	\N	Ottawa	Ontario	43.034558600000000	-89.429237399999990
235	\N	Ottawa	Ontario	43.034558600000000	-89.429237399999990
236	\N	Toronto	Ontario	43.034558600000000	-89.429237399999990
237	Montreal Migraine Clinic 	Montreal	Quebec	45.528792300000000	-73.563975200000000
238	\N	Trois-Rivières	Quebec	43.034558600000000	-89.429237399999990
239	\N	Saskatoon	Saskatchewan	43.034558600000000	-89.429237399999990
\.


--
-- Data for Name: physicians; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.physicians (physician_id, name, location_id) FROM stdin;
1	Dr. Anthony J. Esposito	1
2	Dr. Harry Lee McDaris, Jr	2
3	Dr. Mary Downs	3
4	Dr. George Wang	4
5	Dr. Joseph R Cohen (DDS)	5
6	Dr. James L. Frey	6
7	Dr. Alan Hamilton (PCP)	7
8	Dr. Constantine G. Moschonas	8
9	Dr. Jeffrey D. Steier	9
10	Dr. Stephen D. Chakmakian PCP)	10
11	Dr. Joseph R. O'Connell (PCP)	11
12	Dr. William L. Griggs	12
13	Dr. Duane L. Birky	13
14	Dr. R. Wendell Ross (PCP)	14
15	Dr. Jack H. Florin	15
16	Dr. Robert William Hogan II (PCP) (Kaiser)	16
17	Dr. Yu Dennis Cheng	17
18	Dr. Antonio A. De Salles	18
19	Dr. Stephen Graff-Radford (DDS)	19
20	Dr. Paul B. Kazimiroff	20
21	Dr. Alan M. Rapoport	21
22	Dr. Kenneth S. Peters	22
23	Dr. Phillip O'Carroll	23
24	Dr. Olana Aberra (PCP)	24
25	Dr. John Bissell	25
26	Dr. Daniel McDaniel	26
27	Dr. Hamid Rabiee	27
28	Dr. Peter Goadsby	28
29	Dr. Jerome Goldstein	29
30	Dr. Neil H. Raskin	30
31	Dr. Eric Collins	31
32	Dr. Kulveen Sachdeva	32
33	Dr. David E. Sosin	33
34	Dr. David B. Kudrow	34
35	Sheena Aurora, MD	35
36	Robert P. Cowan, MD	35
37	Dr. John A. Myers	36
38	Dr. Pamela R. Kinder	37
39	Dr. Judy C. Lane	37
40	Dr. Cori Millen	38
41	Dr. Joseph Schmitt	39
42	Dr. Alexander Komm	40
43	Dr. Tanya R. Bilchik	41
44	Dr. James B Butler	42
45	Dr. Sung Ho Bae	43
46	Dr. Todd C. Hartley	44
47	Dr. Samuel K. Snyder (DO)	45
48	Dr. Michael L. Waters	46
49	Dr. Steven A. Kobetz	47
50	Dr. Steve D. Wheeler	48
51	Dr. James D Torrisi	49
52	Dr. James L. Cimera	50
53	Dr. John F. Wilker (PCP)	51
54	Dr. Roberta S. Rose	52
55	Dr. Frank J. Wierichs	53
56	Dr. Ellis V. Hedaya	54
57	Dr. Jerome M. Walker	55
58	Dr. Kenneth J. Lazarus	56
59	Dr. Micheal Todd Williamson	57
60	Dr. Robert G. Bashuk	58
61	Dr. Karen Burgner (PCP)	59
62	Diamond Doctors	60
63	Dr. Robert Wright	61
64	Dr. Kenneth L. Moore	62
65	Dr. Thomas Freedom	63
66	Dr. Trupti Gokani	64
67	Dr. Lawrence Robbins	65
68	Dr. Jeffery Royce	66
69	Dr. Robert J. Alonso	67
70	Dr. Bette G Maybury	68
71	Dr. Kathryn A. Hanlon	69
72	Dr.Larry Salberg	69
73	Dr. Joseph F. Seipel	70
74	Dr. Kelly Scott Bast (PCP)	71
75	Dr. Kurt Vander Ploeg (PCP)	72
76	Dr. Christine M Boylan (PCP)	73
77	Dr. Jay S. Zwibelman	74
78	Dr. Martin S. Buckman (PCP)	75
79	Dr. Tammie L. Nelson	76
80	Dr. Gautham P. Reddy	77
81	Dr. John B. Kelly	78
82	Dr. Tim McGhee	79
83	Dr. Steven Zuckerman	80
84	Dr. Srinivas Ganji	81
85	Dr.Steven J. Snatic	82
86	Dr. Daniel J. Trahant	83
87	Dr. Timothy F. Himel	84
88	Ann S. Hurd, PA	85
89	Dr. Richard T. Leschek	86
90	Dr. Marcia Ribeiro	87
91	Dr. Abraham Allan Genut	88
92	Dr. Elizabeth W. Loder	89
93	Dr. James Arthur Morrill (PCP)	90
94	Dr. Andreas P. Schoeck	91
95	Dr. Peter J. Zuromskis	92
96	Dr. Albert Ackil	93
97	Dr. Bryan Lieberman	94
98	Dr. Paul S. Blachman	95
99	Dr. Joel R. Saper	96
100	Dr. James Gramprie	97
101	Dr. Wade M. Cooper	98
102	Dr. Michael Bolan (PCP)	99
103	Dr. Richard S. Ferro (Pain Medicine)	100
104	Dr. Michael T. Ku (PCP)	101
105	Dr. Lionel Glass	102
106	Dr. Jane M. Achenbach	103
107	Dr. John Peers Robrock (PCP)	104
108	Dr. Michael P. Sethna	105
109	Dr. Andrew Y. Chao (PCP)	106
110	Dr. Brett D. Hosley	107
111	Dr. Charles Weinstein	108
112	Dr. Gustavo Adolfo Granada	109
113	Dr. Juan C. Escandon	110
114	Ryan Doctors	111
115	Dr. Scott M. Ehresman (PCP)	112
116	John Stefkovich, PA-C	113
117	Dr. John F. Rothrock	114
118	Dr. Jonathan W. Spivack	115
119	Dr. Patrick Carroll	116
120	Dr. Philip V. Savia	117
121	Dr. Joseph A. Carluccio	118
122	Dr. Michael Merkin	119
123	Dr. William L. Cantor (ENT)	120
124	Dr. Frederick Weisbrot	121
125	Dr. Kevin E. Hunter	122
126	Dr. Loretta L. Mueller	123
127	Dr. Melvin Paul Vigman	124
128	Dr. Ramon Manon-Espaillat	125
129	Dr. Terry D. Rolan	126
130	Dr. Joanna Katzman	127
131	Dr. Jeffrey D. Miller (PCP)	128
132	Dr. Harvey J. Featherstone	129
133	Dr. Norman L. Pflaster	130
134	Dr. Randall G. Berliner	131
135	Dr. Seymour Solomon	132
136	Dr. Derek G. Randall	133
137	Dr. Kevin W Thomas	134
138	Dr.  Robert S. Knapp	135
139	Dr. David Steiner	136
140	Dr. Mark W. Green	137
141	Dr. Alexander Mauskop	138
142	Dr. Lawrence C. Newman	139
143	Dr. Keith Nichols (PCP)	140
144	Dr. Gilbert Proper	141
145	Dr. Joseph I. Mann	142
146	Dr. Bruno P. Tolge	143
147	Dr. Patrick E. Poole	144
148	Dr. Ronald M. Silverman	145
149	Dr. Peter R. Kinkel	146
150	Dr. Morris Maizels	147
151	Dr. Alan Finkel	148
152	Dr. Howard W. Palay	149
153	Dr. Timothy Collins	150
154	Dr. Sara E. Sacco, MD	151
155	Dr. Rhonda W. Gabr	152
156	Dr. David A. Konanc	152
157	Dr. Aurora K. Pajeau, MD	153
158	Dr. Paul G. Martin	154
159	Dr. Joseph Nicolas	155
160	Dr. Mark Stillman	156
161	Dr. Stewart J. Tepper	157
162	Dr. Francis J. O'Donnell	158
163	Dr. John Horn (PCP)	159
164	Dr. Donata Rechnitzer (PCP)	160
165	Dr. Perry D. Mostov, D.O.	161
166	Dr. Carl Ansevin	162
167	Dr. Jay K. Johnson	163
168	Dr. Trudy Milner	164
169	Dr. Gerald Riess	165
170	Dr. John Watkins	166
171	Dr. Michael Cohen	167
172	Dr. Todd D Rozen	168
173	Dr. Abraham Ashkenazi	169
174	Dr. Edward A. Gumm (PCP)	170
175	Dr. Stephen C. Ross	171
176	Dr. Jill M. Constantine (PCP)	172
177	Dr. Gregory Cooper	173
178	Dr. Steven Mandel	174
179	Dr. Stephen D. Silberstein	175
180	Dr. William B. Young	175
181	Dr. Robert G. Kaniecki	176
182	Dr. John B. Talbott	177
183	Dr. Steven D. Grossinger	178
184	Dr. Martha Parker Hester (PCP)	179
185	Dr. B.  Martin Hester (PCP)	179
186	Dr. Constance Johnson	180
187	Dr. E. Arthur Franklin (PCP)	181
188	Dr. Michael H. DeShazo	182
189	Dr. Jan Lewis Brandes	183
190	Dr. David V. Lounsberry (PCP)	184
191	Dr. Rexford K. Anderson	185
192	Dr. Robert M. Cain	186
193	Dr. Craig DuBois	187
194	Dr. Rajat Gupta	188
195	Dr. Marci A. Roy	189
196	Dr. Sheila Shung	190
197	Dr. M. Vestal Caperton (PCP)	191
198	Dr. Gary Sharpless (PCP)	192
199	Dr. Stuart B. Black	193
200	Dr. Steven P. Herzog	194
201	Dr. John Claude Krusz	195
202	Dr. Maureen Wooten Watts	193
203	Dr. John A. Sklar	196
204	Dr. Warren H Hunt	197
205	Dr. Howard S. Derman	198
206	Dr. Herbert P. Edmundson, Jr.	199
207	Dr. Leonard Hershkowitz	200
208	Dr. Ninan T. Mathew	201
209	Lori Meadors, PA	201
210	Dr. Richard Hamer	202
211	Dr. Philip S. Blum	203
212	Dr. John Harney	204
213	Dr. Preston E. Harrison	205
214	Dr. R. Wade Oakden	206
215	Dr. Diana D Banks	207
216	Dr. Dana DeWitt	208
217	Dr. Kathleen B. Digre (Neuro-Ophthalmology)	209
218	Dr. Lynn R. Webster (Pain Management)	210
219	Dr. Jeffrey J. Juchau (PCP)	211
220	Dr. Robert Shapiro	212
221	Dr. Peter J. Szostak	213
222	Dr. Stuart Robert Stark	214
223	Priscilla F. Potter, MD	215
224	Dr. Steven D. Nack	216
225	Dr. Michael Mareska 	217
226	Kara Clark, NP	217
227	Dr. Allen R. Fenderson	218
228	Dr. Naurang S Gill	219
229	Dr Lily Jung Henson	220
230	Dr. Sylvia Lucas	221
231	Dr. Elena Robinson	222
232	Dr. Ivy J. Dreizin	223
233	Dr. Donald J. DeBruyn (PCP)	224
234	Dr. Suzanne M. Wilkerson (PCP)	225
235	Dr. Pamela V. Gedney	226
236	Dr. Michele M. Klasinski	227
237	Dr. Werner J. Becker	228
238	Dr. Arnolda Eloff	229
239	Dr. Grant K. Campbell (PCP)	230
240	Dr. R. Gordon Robinson	231
241	Dr. Doug Hobson	232
242	Dr. R. Blaine Taylor Foell	233
243	Dr. Heather Elaine Mills (PCP)	234
244	Dr. Lucian Sitwell	235
245	Dr. Marek Gawel	236
246	Montreal Migraine Doctors	237
247	Dr. André F. Gagnon	238
248	Dr. Christopher Voll	239
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, email, password) FROM stdin;
\.


--
-- Name: favorites_fav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.favorites_fav_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 239, true);


--
-- Name: physicians_physician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.physicians_physician_id_seq', 248, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (fav_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: physicians physicians_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_pkey PRIMARY KEY (physician_id);


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
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: physicians physicians_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);


--
-- PostgreSQL database dump complete
--

