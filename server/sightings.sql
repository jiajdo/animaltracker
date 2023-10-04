--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 14.2

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
-- Name:sightings
; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sightings (
    id integer NOT NULL,
    dateandtime text,
    individual text,
    sighting_location text,
    is_healthy BOOLEAN,
    email_address text,
    sightings_timestamp timestamp
);


--
-- Name:sightings
_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sightings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sightings_id_seq OWNED BY public.sightings_id_seq.id;


--
-- Name:sightings
 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sightings_id_seq ALTER COLUMN id SET DEFAULT nextval('public.sightings_id_seq'::regclass);


--
-- Data for Name:sightings
; Type: TABLE DATA; Schema: public; Owner: -
--


-- 
COPY public.sightings_id_seq (id, dateandtime, individual, sighting_location, is_healthy, email_address, sightings_timestamp) FROM stdin;
1	2023-04-01 13:00	Chrono	San Francisco, California true chrono@waymo 2023-04-21 
2	2023-08-21 12:00	Simba	Yellowstone false jtt@disney.com 2023-04-21 
3	2023-01-03 00:00	Mufasa  Yosemite true jamesearljones@gmail.com 2023-04-21 
4	2023-06-16 03:34	Rover	Zion true woof@gmail.com 2023-04-21 
5	2022-12-25 08:45	Spot	Boston true bark@gmail.com 2023-04-21 
\.


--
-- Name:sightings
_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sightings_id_seq', 5, true);

--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sightings_id_seq
    ADD CONSTRAINT sightings_id_seq_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

