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
    name character varying NOT NULL,
    region_id integer
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
-- Name: institutions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.institutions (
    institution_id integer NOT NULL,
    name character varying,
    region_id integer,
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
    region_id integer,
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
-- Name: regions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.regions OWNER TO vagrant;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_region_id_seq OWNER TO vagrant;

--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- Name: physicians physician_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians ALTER COLUMN physician_id SET DEFAULT nextval('public.physicians_physician_id_seq'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.cities (city_id, name, region_id) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.institutions (institution_id, name, region_id, city_id) FROM stdin;
\.


--
-- Data for Name: physicians; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.physicians (physician_id, name, institution_id, region_id, city_id) FROM stdin;
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.regions (region_id, name) FROM stdin;
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 1, false);


--
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 1, false);


--
-- Name: physicians_physician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.physicians_physician_id_seq', 1, false);


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


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
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- Name: cities cities_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


--
-- Name: institutions institutions_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: institutions institutions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


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
-- Name: physicians physicians_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.physicians
    ADD CONSTRAINT physicians_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


--
-- PostgreSQL database dump complete
--

