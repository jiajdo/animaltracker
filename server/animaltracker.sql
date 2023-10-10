--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: individuals; Type: TABLE; Schema: public; Owner: jia
--

CREATE TABLE public.individuals (
    id integer NOT NULL,
    nickname text,
    species_id integer,
    individuals_timestamp timestamp without time zone
);


ALTER TABLE public.individuals OWNER TO jia;

--
-- Name: individuals_id_seq; Type: SEQUENCE; Schema: public; Owner: jia
--

CREATE SEQUENCE public.individuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuals_id_seq OWNER TO jia;

--
-- Name: individuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jia
--

ALTER SEQUENCE public.individuals_id_seq OWNED BY public.individuals.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: jia
--

CREATE TABLE public.sightings (
    id integer NOT NULL,
    dateandtime text,
    individual text,
    sighting_location text,
    is_healthy boolean,
    email_address text,
    sightings_timestamp timestamp without time zone
);


ALTER TABLE public.sightings OWNER TO jia;

--
-- Name: sightings_id_seq; Type: SEQUENCE; Schema: public; Owner: jia
--

CREATE SEQUENCE public.sightings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sightings_id_seq OWNER TO jia;

--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jia
--

ALTER SEQUENCE public.sightings_id_seq OWNED BY public.sightings.id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: jia
--

CREATE TABLE public.species (
    id integer NOT NULL,
    common_name text,
    scientific_name text,
    population integer,
    conservation_status_code text,
    record_creation_timestamp timestamp without time zone
);


ALTER TABLE public.species OWNER TO jia;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: jia
--

CREATE SEQUENCE public.species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO jia;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jia
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.id;


--
-- Name: individuals id; Type: DEFAULT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.individuals ALTER COLUMN id SET DEFAULT nextval('public.individuals_id_seq'::regclass);


--
-- Name: sightings id; Type: DEFAULT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.sightings ALTER COLUMN id SET DEFAULT nextval('public.sightings_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Data for Name: individuals; Type: TABLE DATA; Schema: public; Owner: jia
--

COPY public.individuals (id, nickname, species_id, individuals_timestamp) FROM stdin;
6	Simba	1	2022-03-01 00:00:00
7	Chrono	5	2022-01-08 00:00:00
8	Pinky	2	2022-08-21 00:00:00
9	Slinky	3	2022-01-05 00:00:00
10	Ninja	4	2022-06-16 00:00:00
\.


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: jia
--

COPY public.sightings (id, dateandtime, individual, sighting_location, is_healthy, email_address, sightings_timestamp) FROM stdin;
1	2022-01-01 00:00:00	Rover	Alabama	t	norman@example.com	2022-01-01 00:00:00
2	2022-01-01 00:00:00	Chrono	New York	f	lobato@example.com	2022-01-01 00:00:00
3	2022-01-01 00:00:00	Pinky	Wisconsin	t	perez@example.com	2022-01-01 00:00:00
4	2022-01-01 00:00:00	Slinky	Trujillo	f	chang@example.com	2022-01-01 00:00:00
5	2022-01-01 00:00:00	Ninja	Morelia	t	gerwig@example.com	2022-01-01 00:00:00
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: jia
--

COPY public.species (id, common_name, scientific_name, population, conservation_status_code, record_creation_timestamp) FROM stdin;
6	Bottlenose Dolphin	Tursiops truncatus	75000000	LC	2023-09-19 13:00:00
1	Lion	Panthera Leo	10	EN	2023-04-21 00:00:00
2	Elephant	Loxodonta Africana	30	CR	2023-04-21 00:00:00
3	Giraffe	Giraffa Camelopardalis	40	LC	2023-04-21 00:00:00
4	Tiger	Panthera Tigris	2	CR	2023-04-21 00:00:00
5	Lion	Panthera Leo	4	EN	2023-04-21 00:00:00
\.


--
-- Name: individuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jia
--

SELECT pg_catalog.setval('public.individuals_id_seq', 10, true);


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jia
--

SELECT pg_catalog.setval('public.sightings_id_seq', 5, true);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jia
--

SELECT pg_catalog.setval('public.species_id_seq', 6, true);


--
-- Name: individuals individuals_pkey; Type: CONSTRAINT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_pkey PRIMARY KEY (id);


--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: individuals fk_species_id; Type: FK CONSTRAINT; Schema: public; Owner: jia
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- PostgreSQL database dump complete
--

