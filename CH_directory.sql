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
1	Anniston Neurology & Headache Management Center	Anniston	Alabama	\N	\N
2	Crown  Comprehensive Headache Center Inc	Huntsville	Alabama	\N	\N
3	\N	Anchorage	Alaska	\N	\N
4	\N	Mesa	Arizona	\N	\N
5	Southwest Pain Management Associates	Phoenix	Arizona	\N	\N
6	Barrow Neurological Institute	Phoenix	Arizona	\N	\N
7	\N	Phoenix	Arizona	\N	\N
8	Four Peaks Neurology	Scottsdale	Arizona	\N	\N
9	\N	Scottsdale	Arizona	\N	\N
10	\N	Tempe	Arizona	\N	\N
11	FirstCare Fayetteville North	Fayetteville	Arkansas	\N	\N
12	Southwest Neurological Institute	Fort Smith	Arkansas	\N	\N
13	Sparks Neurology Center	Fort Smith	Arkansas	\N	\N
14	Summit Medical Center - Cornerstone Clinic	Van Buren	Arkansas	\N	\N
15	Fullerton Neurology and Headache	Fullerton	California	\N	\N
16	\N	La Mesa	California	\N	\N
17	\N	La Mesa	California	\N	\N
18	UCLA Medical System	Los Angeles	California	\N	\N
19	Cedars-Sinai	Los Angeles	California	\N	\N
20	\N	Los Angeles	California	\N	\N
21	David Geffen School of Medicine at UCLA	Los Angeles	California	\N	\N
22	Northern California Headache Clinic	Mountain View 	California	\N	\N
23	Newport Beach Neurologists	Newport Beach	California	\N	\N
24	\N	Sacramento	California	\N	\N
25	Kaiser Permanente	Sacramento	California	\N	\N
26	Lassen Medical Center	Red Bluff	California	\N	\N
27	\N	Redding	California	\N	\N
28	University of California San Francisco - Headache Center	San Francisco	California	\N	\N
29	San Francisco Headache Clinic 	San Francisco	California	\N	\N
30	UUCSFMC Neurology Clinic	San Francisco	California	\N	\N
31	\N	San Ramon	California	\N	\N
32	\N	San Ramon	California	\N	\N
33	\N	Santa Ana	California	\N	\N
34	\N	Santa Monica	California	\N	\N
35	Stanford School of Medicine Headache Clinic	Stanford	California	\N	\N
36	Alpine Neurology	Centennial	Colorado	\N	\N
37	Blue Sky Neurology	Denver	Colorado	\N	\N
38	Summit Headache and Neurologic Institute	Englewood	Colorado	\N	\N
39	\N	Loveland	Colorado	\N	\N
40	Neurologic Associates	Bristol	Connecticut	\N	\N
41	The Hartford Headache Center	East Hartford	Connecticut	\N	\N
42	Neurological Specialists	Shelton	Connecticut	\N	\N
43	Neurosurgical Associates	Newark	Delaware	\N	\N
44	\N	Altamonte Springs	Florida	\N	\N
45	\N	Davie	Florida	\N	\N
46	\N	Jacksonville	Florida	\N	\N
47	Neurologic Center of South Florida	Miami	Florida	\N	\N
48	Ryan Wheeler Headache Treatment Center	Miami	Florida	\N	\N
49	\N	Pensacola	Florida	\N	\N
50	Sunrise Medical Group	Pompano Beach	Florida	\N	\N
51	Family Practice of Saint Cloud	Saint Cloud	Florida	\N	\N
52	Espat and Rose	Sebastian	Florida	\N	\N
53	\N	Venice	Florida	\N	\N
54	Peachtree Neurological Clinic	Atlanta	Georgia	\N	\N
55	\N	Decatur	Georgia	\N	\N
56	Southern Crescent Neurological Clinic	Fayetteville	Georgia	\N	\N
57	North Georgia Neurological Clinic	Lawrenceville	Georgia	\N	\N
58	Northwest Neurology	Marietta	Georgia	\N	\N
59	Dreyer Medical Clinic 	Aurora	Illinois	\N	\N
60	Diamond Headache Clinic	Chicago	Illinois	\N	\N
61	University Neurologists	Chicago	Illinois	\N	\N
62	\N	Chicago	Illinois	\N	\N
63	NorthShore - Glenbrook Hospital	Glenview	Illinois	\N	\N
64	North Suburban Wellness 	Highland Park	Illinois	\N	\N
65	Robbins Headache Clinic	Northbrook	Illinois	\N	\N
66	SwedishAmerican Neuro and Headache Center	Rockford	Illinois	\N	\N
67	Indiana Clinic Neurology	Indianapolis	Indiana	\N	\N
68	\N	Indianapolis	Indiana	\N	\N
69	Northern Indiana Neurological	Merrillville	Indiana	\N	\N
70	\N	New Albany	Indiana	\N	\N
71	Mercy Johnston Medical Clinic	Johnston	Iowa	\N	\N
72	\N	Pella	Iowa	\N	\N
73	\N	Leawood	Kansas	\N	\N
74	\N	Olathe	Kansas	\N	\N
75	Quivira Internal Medicine	Overland Park	Kansas	\N	\N
76	Wichita Clinic	Wichita	Kansas	\N	\N
77	Neurology Consultants Of Kansas 	Wichita	Kansas	\N	\N
78	Neuroscience Associates of Northern Kentucky	Crestview Hills	Kentucky	\N	\N
79	MultiCare	Madisonville	Kentucky	\N	\N
80	\N	Baton Rouge	Louisiana	\N	\N
81	\N	Covington	Louisiana	\N	\N
82	\N	Lafayette	Louisiana	\N	\N
83	\N	Metairie	Louisiana	\N	\N
84	\N	New Iberia	Louisiana	\N	\N
85	Pediatric Associates of Lewiston	Lewiston	Maine	\N	\N
86	Mid Maryland Neurology	Frederick	Maryland	\N	\N
87	Mid-Atlantic Headache Institute 	Pikesville	Maryland	\N	\N
88	\N	Towson	Maryland	\N	\N
89	Brigham and Women's/Faulkner Neurology 	Boston	Massachusetts	\N	\N
90	Massachusetts General Hospital 	Boston	Massachusetts	\N	\N
91	New England Neurological Associates	Lawrence	Massachusetts	\N	\N
92	Beth Israel Deaconess Healthcare- Medical Care Center 	Lexington	Massachusetts	\N	\N
93	\N	North Easton	Massachusetts	\N	\N
94	\N	Norwood	Massachusetts	\N	\N
95	\N	Weymouth	Massachusetts	\N	\N
96	Michigan Headache & Neurological Institute	Ann Arbor	Michigan	\N	\N
97	Greater Ann Arbor Neurology	Ann Arbor	Michigan	\N	\N
98	University of Michigan Health System	Ann Arbor	Michigan	\N	\N
99	South Kent Family Care	Kentwood	Michigan	\N	\N
100	\N	Lansing	Michigan	\N	\N
101	Promed Family Practice	Portage	Michigan	\N	\N
102	St. Joseph Mercy Oakland 	Pontiac	Michigan	\N	\N
103	CCambridge Medical Center	Cambridge	Minnesota	\N	\N
104	Park Nicollet Clinic—Eagan 	Eagan	Minnesota	\N	\N
105	Noran Neurological Clinic	Maplewood	Minnesota	\N	\N
106	\N	Ballwin	Missouri	\N	\N
107	Hannibal Clinic	Hannibal	Missouri	\N	\N
108	Neurological Consultants of Kansas City	Kansas City	Missouri	\N	\N
109	\N	Kennett	Missouri	\N	\N
110	\N	St. Louis	Missouri	\N	\N
111	Ryan Headache Center	St. Louis	Missouri	\N	\N
112	Family Medical Specialties	Holdrege	Nebraska	\N	\N
113	East Lincoln Internal Medicine	Lincoln	Nebraska	\N	\N
114	Renown Health	Reno	Nevada	\N	\N
115	Northern Nevada Medical Center	Sparks	Nevada	\N	\N
116	\N	Concord	New Hampshire	\N	\N
117	Laconia Clinic	Laconia	New Hampshire	\N	\N
118	\N	Bloomfield	New Jersey	\N	\N
119	Edison Neurologic Associates	Edison	New Jersey	\N	\N
120	\N	Emerson	New Jersey	\N	\N
121	\N	Kearny	New Jersey	\N	\N
122	Coastal Physicians & Surgeons	Somers Point	New Jersey	\N	\N
123	UMDNJ - University Headache Center 	Stafford	New Jersey	\N	\N
124	Vigman & Pollock	Summit	New Jersey	\N	\N
125	Neurology & Neurophysiology Associates of NJ	Turnersville	New Jersey	\N	\N
126	White Mountain Neurology	Alamogordo	New Mexico	\N	\N
127	University of New Mexico - Clinic Neuroscience Center	Albuquerque	New Mexico	\N	\N
128	Presbyterian Medical Group - Northside 	Albuquerque	New Mexico	\N	\N
129	\N	Capitan	New Mexico	\N	\N
130	South Shore Neurologic Associates	Bay Shore	New York	\N	\N
131	Regional Neurological Associates	Bronx	New York	\N	\N
132	Montefiore Medical Center 	Bronx	New York	\N	\N
133	\N	Bronx	New York	\N	\N
134	FamilyCare Medical Group – Neurological Division 	Camillus	New York	\N	\N
135	Ontario Neurology Associates	Canandaigua	New York	\N	\N
136	Five Towns Neurology	Cedarhurst	New York	\N	\N
137	Mount Sinai Center for Headache and Pain Medicine 	New York	New York	\N	\N
138	New York Headache Center	New York	New York	\N	\N
139	The Headache Institute St. Luke's Hospital	New York	New York	\N	\N
140	\N	Owego	New York	\N	\N
141	Pain Symptom Management Center	Rochester	New York	\N	\N
142	Greater Rochester Neurological	Rochester	New York	\N	\N
143	Schenectady Neurological Consultants and the Headache Center of Northeastern NY	Schenectady	New York	\N	\N
144	\N	Stony Brook	New York	\N	\N
145	Neurologic Consultants of Westchester	White Plains	New York	\N	\N
146	Kinkel Neurologic Center	Williamsville	New York	\N	\N
147	Blue Ridge Headache Center	Asheville	North Carolina	\N	\N
148	Carolina Headache Institute	Chapel Hill	North Carolina	\N	\N
149	Mountain Medical Associates	Clyde	North Carolina	\N	\N
150	Duke Health Center at Morreene Road	Durham	North Carolina	\N	\N
151	Carolinas Headache Clinic	Matthews	North Carolina	\N	\N
152	Raleigh Neurology 	Raleigh	North Carolina	\N	\N
153	Boice-Willis Clinic	Rocky Mount	North Carolina	\N	\N
154	Triad Neurological Associates	Winston-Salem	North Carolina	\N	\N
155	University of Cincinnati Physicians	Cincinnati	Ohio	\N	\N
156	Cleveland Clinic - Neurological Center for Pain	Cleveland	Ohio	\N	\N
157	Cleveland Neurological Center	Cleveland	Ohio	\N	\N
158	OrthoNeuro	Columbus	Ohio	\N	\N
159	Grove City Family Health	Grove City	Ohio	\N	\N
160	ExpressMed	Hilliard	Ohio	\N	\N
161	OSU Family Medicine at CarePoint Lewis Center Primary Care	Lewis Center	Ohio	\N	\N
162	\N	Westlake	Oklahoma	\N	\N
163	Tulsa Neurology Clinic	Tulsa	Oklahoma	\N	\N
164	OMNI Medical Group	Tulsa	Oklahoma	\N	\N
165	The Corvallis Clinic at Waverly Drive	Albany	Oregon	\N	\N
166	Samaritan Pacific Internal Medicine 	Newport	Oregon	\N	\N
167	Headache and Neurologic Center of Philadelphia	Bala Cynwyd	Pennsylvania	\N	\N
168	Geisinger Health System 	Danville	Pennsylvania	\N	\N
169	\N	Doylestown	Pennsylvania	\N	\N
170	Gumm Family Practice	Greensburg	Pennsylvania	\N	\N
171	Penn State Hershey Neurology	Hershey	Pennsylvania	\N	\N
172	\N	Jeannette	Pennsylvania	\N	\N
173	Meadowbrook Neurology Group	Meadowbrook	Pennsylvania	\N	\N
174	\N	Philadelphia	Pennsylvania	\N	\N
175	Jefferson Headache Center	Philadelphia	Pennsylvania	\N	\N
176	UPMC Headache Center	Pittsburgh	Pennsylvania	\N	\N
177	Associates in Neurology of Pittsburgh	Pittsburgh	Pennsylvania	\N	\N
178	Swarthmore Neurology Associates	Ridley Park 	Pennsylvania	\N	\N
179	South Hampton Family Practice	Columbia	South Carolina	\N	\N
180	Neurological Medicine	Clarksville	Tennessee	\N	\N
181	\N	Germantown	Tennessee	\N	\N
182	Semmes-Murphey Neurologic & Spine Institute	Memphis	Tennessee	\N	\N
183	Nashville Neuroscience Group	Nashville	Tennessee	\N	\N
184	Erlanger Ooltewah FamilyMedicine	Ooltewah	Tennessee	\N	\N
185	\N	Abilene	Texas	\N	\N
186	Associated Neurological Specialties 	Austin	Texas	\N	\N
187	Austin Pain Associates 	Austin	Texas	\N	\N
188	Headache & Pain Center	Austin	Texas	\N	\N
189	Austin Headache Clinic 	Austin	Texas	\N	\N
190	\N	Austin	Texas	\N	\N
191	\N	Conroe	Texas	\N	\N
192	Sadler Clinic	Conroe	Texas	\N	\N
193	Dallas Headache Clinic	Dallas	Texas	\N	\N
194	Texas Neurology 	Dallas	Texas	\N	\N
195	Anodyne Headache and PainCare	Dallas	Texas	\N	\N
196	\N	Fort Worth	Texas	\N	\N
197	Hugman-Kent Clinic	Gladewater	Texas	\N	\N
198	Methodist Neurological Institute	Houston	Texas	\N	\N
199	Memorial Neurological Association 	Houston	Texas	\N	\N
200	Houston Neurology Associates	Houston	Texas	\N	\N
201	Houston Headache Clinic	Houston	Texas	\N	\N
202	Diagnostic Clinic of Longview	Longview	Texas	\N	\N
203	Houston Neurological Institute - Pasadena	Pasadena	Texas	\N	\N
204	Dallas Neurological Associates	Richardson	Texas	\N	\N
205	East Texas Neurology 	Tyler	Texas	\N	\N
206	Beaver/Milford/Parowan Medical Clinics	Beaver	Utah	\N	\N
207	Rocky Mountain Neurological Associates	Murray	Utah	\N	\N
208	University Health Neurology	Salt Lake City	Utah	\N	\N
209	John A. Moran Eye Center	Salt Lake City	Utah	\N	\N
210	Lifetree Clinical Research and Pain Clinic	Salt Lake City	Utah	\N	\N
211	Canyon View Medical Group	Spanish Fork	Utah	\N	\N
212	University of Vermont Medical Group at Fletcher Allen	Burlington	Vermont	\N	\N
213	\N	Rutland	Vermont	\N	\N
214	Neurology & Headache Treatment Center 	Alexandria	Virginia	\N	\N
215	University of Virginia Health System	Charlottesville	Virginia	\N	\N
216	Neurology Services of Southwest VA	Blacksburg	Virginia	\N	\N
217	Neurological Associates Inc	Richmond	Virginia	\N	\N
218	Holland Road Family Medicine	Virginia Beach	Virginia	\N	\N
219	Prince William Neurology Inc 	Woodbridge	Virginia	\N	\N
220	\N	Issaquah	Washington	\N	\N
221	Neurology Headache and Multiple Sclerosis Clinic at UWMC	Seattle	Washington	\N	\N
222	Krischner Gordon and Erlich Mds	Seattle	Washington	\N	\N
223	UW Neurology Clinic	Madison	Wisconsin	\N	\N
224	Aurora Health Center	Manitowoc	Wisconsin	\N	\N
225	Columbia St. Mary's	Milwaukee	Wisconsin	\N	\N
226	\N	Stevens Point	Wisconsin	\N	\N
227	Klasinski Clinic 	Stevens Point	Wisconsin	\N	\N
228	\N	Calgary	Alberta	\N	\N
229	\N	Calgary	Alberta	\N	\N
230	\N	Edmonton	Alberta	\N	\N
231	\N	Vancouver	British Columbia	\N	\N
232	\N	Winnipeg	Manitoba	\N	\N
233	\N	Huntsville	Ontario	\N	\N
234	\N	Ottawa	Ontario	\N	\N
235	\N	Ottawa	Ontario	\N	\N
236	\N	Toronto	Ontario	\N	\N
237	Montreal Migraine Clinic 	Montreal	Quebec	\N	\N
238	\N	Trois-Rivières	Quebec	\N	\N
239	\N	Saskatoon	Saskatchewan	\N	\N
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

