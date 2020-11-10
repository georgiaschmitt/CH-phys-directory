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
    coordinates numeric(20,15)
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

COPY public.locations (location_id, institution, city, state, coordinates) FROM stdin;
1	Anniston Neurology & Headache Management Center	Anniston	Alabama	34.953030000000000
2	Crown  Comprehensive Headache Center Inc	Huntsville	Alabama	34.953030000000000
3	null	Anchorage	Alaska	34.953030000000000
4	null	Mesa	Arizona	34.953030000000000
5	Southwest Pain Management Associates	Phoenix	Arizona	34.953030000000000
6	Barrow Neurological Institute	Phoenix	Arizona	34.953030000000000
7	null	Phoenix	Arizona	34.953030000000000
8	Four Peaks Neurology	Scottsdale	Arizona	34.953030000000000
9	null	Scottsdale	Arizona	34.953030000000000
10	null	Tempe	Arizona	34.953030000000000
11	FirstCare Fayetteville North	Fayetteville	Arkansas	34.953030000000000
12	Southwest Neurological Institute	Fort Smith	Arkansas	34.953030000000000
13	Sparks Neurology Center	Fort Smith	Arkansas	34.953030000000000
14	Summit Medical Center - Cornerstone Clinic	Van Buren	Arkansas	34.953030000000000
15	Fullerton Neurology and Headache	Fullerton	California	34.953030000000000
16	null	La Mesa	California	34.953030000000000
17	null	La Mesa	California	34.953030000000000
18	UCLA Medical System	Los Angeles	California	34.953030000000000
19	Cedars-Sinai	Los Angeles	California	34.953030000000000
20	null	Los Angeles	California	34.953030000000000
21	David Geffen School of Medicine at UCLA	Los Angeles	California	34.953030000000000
22	Northern California Headache Clinic	Mountain View 	California	34.953030000000000
23	Newport Beach Neurologists	Newport Beach	California	34.953030000000000
24	null	Sacramento	California	34.953030000000000
25	Kaiser Permanente	Sacramento	California	34.953030000000000
26	Lassen Medical Center	Red Bluff	California	34.953030000000000
27	null	Redding	California	34.953030000000000
28	University of California, San Francisco - Headache Center	San Francisco	California	34.953030000000000
29	San Francisco Headache Clinic 	San Francisco	California	34.953030000000000
30	UUCSFMC Neurology Clinic	San Francisco	California	34.953030000000000
31	null	San Ramon	California	34.953030000000000
32	null	San Ramon	California	34.953030000000000
33	null	Santa Ana	California	34.953030000000000
34	null	Santa Monica	California	34.953030000000000
35	Stanford School of Medicine, Headache Clinic	Stanford	California	34.953030000000000
36	Alpine Neurology	Centennial	Colorado	34.953030000000000
37	Blue Sky Neurology	Denver	Colorado	34.953030000000000
38	Summit Headache and Neurologic Institute	Englewood	Colorado	34.953030000000000
39	null	Loveland	Colorado	34.953030000000000
40	Neurologic Associates	Bristol	Connecticut	34.953030000000000
41	The Hartford Headache Center	East Hartford	Connecticut	34.953030000000000
42	Neurological Specialists	Shelton	Connecticut	34.953030000000000
43	Neurosurgical Associates	Newark	Delaware	34.953030000000000
44	null	Altamonte Springs	Florida	34.953030000000000
45	null	Davie	Florida	34.953030000000000
46	null	Jacksonville	Florida	34.953030000000000
47	Neurologic Center of South Florida	Miami	Florida	34.953030000000000
48	Ryan Wheeler Headache Treatment Center	Miami	Florida	34.953030000000000
49	null	Pensacola	Florida	34.953030000000000
50	Sunrise Medical Group	Pompano Beach	Florida	34.953030000000000
51	Family Practice of Saint Cloud	Saint Cloud	Florida	34.953030000000000
52	Espat and Rose	Sebastian	Florida	34.953030000000000
53	null	Venice	Florida	34.953030000000000
54	Peachtree Neurological Clinic	Atlanta	Georgia	34.953030000000000
55	null	Decatur	Georgia	34.953030000000000
56	Southern Crescent Neurological Clinic	Fayetteville	Georgia	34.953030000000000
57	North Georgia Neurological Clinic	Lawrenceville	Georgia	34.953030000000000
58	Northwest Neurology	Marietta	Georgia	34.953030000000000
59	Dreyer Medical Clinic 	Aurora	Illinois	34.953030000000000
60	Diamond Headache Clinic	Chicago	Illinois	34.953030000000000
61	University Neurologists	Chicago	Illinois	34.953030000000000
62	null	Chicago	Illinois	34.953030000000000
63	NorthShore - Glenbrook Hospital	Glenview	Illinois	34.953030000000000
64	North Suburban Wellness 	Highland Park	Illinois	34.953030000000000
65	Robbins Headache Clinic	Northbrook	Illinois	34.953030000000000
66	SwedishAmerican Neuro and Headache Center	Rockford	Illinois	34.953030000000000
67	Indiana Clinic Neurology	Indianapolis	Indiana	34.953030000000000
68	null	Indianapolis	Indiana	34.953030000000000
69	Northern Indiana Neurological	Merrillville	Indiana	34.953030000000000
70	null	New Albany	Indiana	34.953030000000000
71	Mercy Johnston Medical Clinic	Johnston	Iowa	34.953030000000000
72	null	Pella	Iowa	34.953030000000000
73	null	Leawood	Kansas	34.953030000000000
74	null	Olathe	Kansas	34.953030000000000
75	Quivira Internal Medicine	Overland Park	Kansas	34.953030000000000
76	Wichita Clinic	Wichita	Kansas	34.953030000000000
77	Neurology Consultants Of Kansas 	Wichita	Kansas	34.953030000000000
78	Neuroscience Associates of Northern Kentucky	Crestview Hills	Kentucky	34.953030000000000
79	MultiCare	Madisonville	Kentucky	34.953030000000000
80	null	Baton Rouge	Louisiana	34.953030000000000
81	null	Covington	Louisiana	34.953030000000000
82	null	Lafayette	Louisiana	34.953030000000000
83	null	Metairie	Louisiana	34.953030000000000
84	null	New Iberia	Louisiana	34.953030000000000
85	Pediatric Associates of Lewiston	Lewiston	Maine	34.953030000000000
86	Mid Maryland Neurology	Frederick	Maryland	34.953030000000000
87	Mid-Atlantic Headache Institute 	Pikesville	Maryland	34.953030000000000
88	null	Towson	Maryland	34.953030000000000
89	Brigham and Women's/Faulkner Neurology 	Boston	Massachusetts	34.953030000000000
90	Massachusetts General Hospital 	Boston	Massachusetts	34.953030000000000
91	New England Neurological Associates	Lawrence	Massachusetts	34.953030000000000
92	Beth Israel Deaconess Healthcare- Medical Care Center 	Lexington	Massachusetts	34.953030000000000
93	null	North Easton	Massachusetts	34.953030000000000
94	null	Norwood	Massachusetts	34.953030000000000
95	null	Weymouth	Massachusetts	34.953030000000000
96	Michigan Headache & Neurological Institute	Ann Arbor	Michigan	34.953030000000000
97	Greater Ann Arbor Neurology	Ann Arbor	Michigan	34.953030000000000
98	University of Michigan Health System	Ann Arbor	Michigan	34.953030000000000
99	South Kent Family Care	Kentwood	Michigan	34.953030000000000
100	null	Lansing	Michigan	34.953030000000000
101	Promed Family Practice	Portage	Michigan	34.953030000000000
102	St. Joseph Mercy Oakland 	Pontiac	Michigan	34.953030000000000
103	CCambridge Medical Center	Cambridge	Minnesota	34.953030000000000
104	Park Nicollet Clinic—Eagan 	Eagan	Minnesota	34.953030000000000
105	Noran Neurological Clinic	Maplewood	Minnesota	34.953030000000000
106	null	Ballwin	Missouri	34.953030000000000
107	Hannibal Clinic	Hannibal	Missouri	34.953030000000000
108	Neurological Consultants of Kansas City	Kansas City	Missouri	34.953030000000000
109	null	Kennett	Missouri	34.953030000000000
110	null	St. Louis	Missouri	34.953030000000000
111	Ryan Headache Center	St. Louis	Missouri	34.953030000000000
112	Family Medical Specialties	Holdrege	Nebraska	34.953030000000000
113	East Lincoln Internal Medicine	Lincoln	Nebraska	34.953030000000000
114	Renown Health	Reno	Nevada	34.953030000000000
115	Northern Nevada Medical Center	Sparks	Nevada	34.953030000000000
116	null	Concord	New Hampshire	34.953030000000000
117	Laconia Clinic	Laconia	New Hampshire	34.953030000000000
118	null	Bloomfield	New Jersey	34.953030000000000
119	Edison Neurologic Associates	Edison	New Jersey	34.953030000000000
120	null	Emerson	New Jersey	34.953030000000000
121	null	Kearny	New Jersey	34.953030000000000
122	Coastal Physicians & Surgeons	Somers Point	New Jersey	34.953030000000000
123	UMDNJ - University Headache Center 	Stafford	New Jersey	34.953030000000000
124	Vigman & Pollock	Summit	New Jersey	34.953030000000000
125	Neurology & Neurophysiology Associates of NJ	Turnersville	New Jersey	34.953030000000000
126	White Mountain Neurology	Alamogordo	New Mexico	34.953030000000000
127	University of New Mexico - Clinic Neuroscience Center	Albuquerque	New Mexico	34.953030000000000
128	Presbyterian Medical Group - Northside 	Albuquerque	New Mexico	34.953030000000000
129	null	Capitan	New Mexico	34.953030000000000
130	South Shore Neurologic Associates	Bay Shore	New York	34.953030000000000
131	Regional Neurological Associates	Bronx	New York	34.953030000000000
132	Montefiore Medical Center 	Bronx	New York	34.953030000000000
133	null	Bronx	New York	34.953030000000000
134	FamilyCare Medical Group – Neurological Division 	Camillus	New York	34.953030000000000
135	Ontario Neurology Associates	Canandaigua	New York	34.953030000000000
136	Five Towns Neurology	Cedarhurst	New York	34.953030000000000
137	Mount Sinai Center for Headache and Pain Medicine 	New York	New York	34.953030000000000
138	New York Headache Center	New York	New York	34.953030000000000
139	The Headache Institute St. Luke's Hospital	New York	New York	34.953030000000000
140	null	Owego	New York	34.953030000000000
141	Pain Symptom Management Center	Rochester	New York	34.953030000000000
142	Greater Rochester Neurological	Rochester	New York	34.953030000000000
143	Schenectady Neurological Consultants and the Headache Center of Northeastern NY	Schenectady	New York	34.953030000000000
144	null	Stony Brook	New York	34.953030000000000
145	Neurologic Consultants of Westchester	White Plains	New York	34.953030000000000
146	Kinkel Neurologic Center	Williamsville	New York	34.953030000000000
147	Blue Ridge Headache Center	Asheville	North Carolina	34.953030000000000
148	Carolina Headache Institute	Chapel Hill	North Carolina	34.953030000000000
149	Mountain Medical Associates	Clyde	North Carolina	34.953030000000000
150	Duke Health Center at Morreene Road	Durham	North Carolina	34.953030000000000
151	Carolinas Headache Clinic	Matthews	North Carolina	34.953030000000000
152	Raleigh Neurology 	Raleigh	North Carolina	34.953030000000000
153	Boice-Willis Clinic	Rocky Mount	North Carolina	34.953030000000000
154	Triad Neurological Associates	Winston-Salem	North Carolina	34.953030000000000
155	University of Cincinnati Physicians	Cincinnati	Ohio	34.953030000000000
156	Cleveland Clinic - Neurological Center for Pain	Cleveland	Ohio	34.953030000000000
157	Cleveland Neurological Center	Cleveland	Ohio	34.953030000000000
158	OrthoNeuro	Columbus	Ohio	34.953030000000000
159	Grove City Family Health	Grove City	Ohio	34.953030000000000
160	ExpressMed	Hilliard	Ohio	34.953030000000000
161	OSU Family Medicine at CarePoint Lewis Center Primary Care	Lewis Center	Ohio	34.953030000000000
162	null	Westlake	Oklahoma	34.953030000000000
163	Tulsa Neurology Clinic	Tulsa	Oklahoma	34.953030000000000
164	OMNI Medical Group	Tulsa	Oklahoma	34.953030000000000
165	The Corvallis Clinic at Waverly Drive	Albany	Oregon	34.953030000000000
166	Samaritan Pacific Internal Medicine 	Newport	Oregon	34.953030000000000
167	Headache and Neurologic Center of Philadelphia	Bala Cynwyd	Pennsylvania	34.953030000000000
168	Geisinger Health System 	Danville	Pennsylvania	34.953030000000000
169	null	Doylestown	Pennsylvania	34.953030000000000
170	Gumm Family Practice	Greensburg	Pennsylvania	34.953030000000000
171	Penn State Hershey Neurology	Hershey	Pennsylvania	34.953030000000000
172	null	Jeannette	Pennsylvania	34.953030000000000
173	Meadowbrook Neurology Group	Meadowbrook	Pennsylvania	34.953030000000000
174	null	Philadelphia	Pennsylvania	34.953030000000000
175	Jefferson Headache Center	Philadelphia	Pennsylvania	34.953030000000000
176	UPMC Headache Center	Pittsburgh	Pennsylvania	34.953030000000000
177	Associates in Neurology of Pittsburgh	Pittsburgh	Pennsylvania	34.953030000000000
178	Swarthmore Neurology Associates	Ridley Park 	Pennsylvania	34.953030000000000
179	South Hampton Family Practice	Columbia	South Carolina	34.953030000000000
180	Neurological Medicine	Clarksville	Tennessee	34.953030000000000
181	null	Germantown	Tennessee	34.953030000000000
182	Semmes-Murphey Neurologic & Spine Institute	Memphis	Tennessee	34.953030000000000
183	Nashville Neuroscience Group	Nashville	Tennessee	34.953030000000000
184	Erlanger Ooltewah FamilyMedicine	Ooltewah	Tennessee	34.953030000000000
185	null	Abilene	Texas	34.953030000000000
186	Associated Neurological Specialties 	Austin	Texas	34.953030000000000
187	Austin Pain Associates 	Austin	Texas	34.953030000000000
188	Headache & Pain Center	Austin	Texas	34.953030000000000
189	Austin Headache Clinic 	Austin	Texas	34.953030000000000
190	null	Austin	Texas	34.953030000000000
191	null	Conroe	Texas	34.953030000000000
192	Sadler Clinic	Conroe	Texas	34.953030000000000
193	Dallas Headache Clinic	Dallas	Texas	34.953030000000000
194	Texas Neurology 	Dallas	Texas	34.953030000000000
195	Anodyne Headache and PainCare	Dallas	Texas	34.953030000000000
196	null	Fort Worth	Texas	34.953030000000000
197	Hugman-Kent Clinic	Gladewater	Texas	34.953030000000000
198	Methodist Neurological Institute	Houston	Texas	34.953030000000000
199	Memorial Neurological Association 	Houston	Texas	34.953030000000000
200	Houston Neurology Associates	Houston	Texas	34.953030000000000
201	Houston Headache Clinic	Houston	Texas	34.953030000000000
202	Diagnostic Clinic of Longview	Longview	Texas	34.953030000000000
203	Houston Neurological Institute - Pasadena	Pasadena	Texas	34.953030000000000
204	Dallas Neurological Associates	Richardson	Texas	34.953030000000000
205	East Texas Neurology 	Tyler	Texas	34.953030000000000
206	Beaver/Milford/Parowan Medical Clinics	Beaver	Utah	34.953030000000000
207	Rocky Mountain Neurological Associates	Murray	Utah	34.953030000000000
208	University Health Neurology	Salt Lake City	Utah	34.953030000000000
209	John A. Moran Eye Center	Salt Lake City	Utah	34.953030000000000
210	Lifetree Clinical Research and Pain Clinic	Salt Lake City	Utah	34.953030000000000
211	Canyon View Medical Group	Spanish Fork	Utah	34.953030000000000
212	University of Vermont Medical Group at Fletcher Allen	Burlington	Vermont	34.953030000000000
213	null	Rutland	Vermont	34.953030000000000
214	Neurology & Headache Treatment Center 	Alexandria	Virginia	34.953030000000000
215	University of Virginia Health System	Charlottesville	Virginia	34.953030000000000
216	Neurology Services of Southwest VA	Blacksburg	Virginia	34.953030000000000
217	Neurological Associates Inc	Richmond	Virginia	34.953030000000000
218	Holland Road Family Medicine	Virginia Beach	Virginia	34.953030000000000
219	Prince William Neurology Inc 	Woodbridge	Virginia	34.953030000000000
220	null	Issaquah	Washington	34.953030000000000
221	Neurology Headache and Multiple Sclerosis Clinic at UWMC	Seattle	Washington	34.953030000000000
222	Krischner Gordon and Erlich Mds	Seattle	Washington	34.953030000000000
223	UW Neurology Clinic	Madison	Wisconsin	34.953030000000000
224	Aurora Health Center	Manitowoc	Wisconsin	34.953030000000000
225	Columbia St. Mary's	Milwaukee	Wisconsin	34.953030000000000
226	null	Stevens Point	Wisconsin	34.953030000000000
227	Klasinski Clinic 	Stevens Point	Wisconsin	34.953030000000000
228	null	Calgary	Alberta	34.953030000000000
229	null	Calgary	Alberta	34.953030000000000
230	null	Edmonton	Alberta	34.953030000000000
231	null	Vancouver	British Columbia	34.953030000000000
232	null	Winnipeg	Manitoba	34.953030000000000
233	null	Huntsville	Ontario	34.953030000000000
234	null	Ottawa	Ontario	34.953030000000000
235	null	Ottawa	Ontario	34.953030000000000
236	null	Toronto	Ontario	34.953030000000000
237	Montreal Migraine Clinic 	Montreal	Quebec	34.953030000000000
238	null	Trois-Rivières	Quebec	34.953030000000000
239	null	Saskatoon	Saskatchewan	34.953030000000000
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

