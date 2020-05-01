--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: character; Type: TABLE; Schema: public; Owner: vdi_tester
--

CREATE TABLE public."character" (
    id integer NOT NULL,
    name text
);


ALTER TABLE public."character" OWNER TO vdi_tester;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: vdi_tester
--

CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_id_seq OWNER TO vdi_tester;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vdi_tester
--

ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;


--
-- Name: vdi; Type: TABLE; Schema: public; Owner: vdi_tester
--

CREATE TABLE public.vdi (
    id integer NOT NULL,
    name text,
    "character" integer NOT NULL
);


ALTER TABLE public.vdi OWNER TO vdi_tester;

--
-- Name: vdi_id_seq; Type: SEQUENCE; Schema: public; Owner: vdi_tester
--

CREATE SEQUENCE public.vdi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vdi_id_seq OWNER TO vdi_tester;

--
-- Name: vdi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vdi_tester
--

ALTER SEQUENCE public.vdi_id_seq OWNED BY public.vdi.id;


--
-- Name: character id; Type: DEFAULT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);


--
-- Name: vdi id; Type: DEFAULT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public.vdi ALTER COLUMN id SET DEFAULT nextval('public.vdi_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: vdi_tester
--

COPY public."character" (id, name) FROM stdin;
\.


--
-- Data for Name: vdi; Type: TABLE DATA; Schema: public; Owner: vdi_tester
--

COPY public.vdi (id, name, "character") FROM stdin;
\.


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vdi_tester
--

SELECT pg_catalog.setval('public.character_id_seq', 2, true);


--
-- Name: vdi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vdi_tester
--

SELECT pg_catalog.setval('public.vdi_id_seq', 1, true);


--
-- Name: character character_name_key; Type: CONSTRAINT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_name_key UNIQUE (name);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: vdi vdi_pkey; Type: CONSTRAINT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public.vdi
    ADD CONSTRAINT vdi_pkey PRIMARY KEY (id, "character");


--
-- Name: vdi vdi_character_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vdi_tester
--

ALTER TABLE ONLY public.vdi
    ADD CONSTRAINT vdi_character_fkey FOREIGN KEY ("character") REFERENCES public."character"(id);


--
-- PostgreSQL database dump complete
--

