--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-13 20:50:26

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 219 (class 1255 OID 16503)
-- Name: codigolarnu(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.codigolarnu(numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
	declare
		cod numeric;
		id numeric ;
		res numeric; 
	BEGIN
		cod := $1;
		id := $2;
		res := cod + id;
		return res;
	END;
$_$;


ALTER FUNCTION public.codigolarnu(numeric, numeric) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 16502)
-- Name: estudiante(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.estudiante(numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
	declare
		a numeric;
		b numeric ;
		res numeric; 
	BEGIN
		a := $1;
		b := $2;
		res := a + b;
		return res;
	END;
$_$;


ALTER FUNCTION public.estudiante(numeric, numeric) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 16501)
-- Name: ffinal(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ffinal(numeric, numeric) RETURNS date
    LANGUAGE plpgsql
    AS $_$
declare 
 a numeric;
 b numeric;
 res numeric;
begin 
 a := $1;
 b := $2;
 res := a + b;
return res;
end;
$_$;


ALTER FUNCTION public.ffinal(numeric, numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16459)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_final date,
    id_profesor integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16458)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 213
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 210 (class 1259 OID 16444)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    apellido character varying(60),
    fecha_matricula date
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16443)
-- Name: estudiante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiante_id_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 209
-- Name: estudiante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_id_seq OWNED BY public.estudiante.id;


--
-- TOC entry 215 (class 1259 OID 16479)
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    id_estudiante integer NOT NULL,
    id_curso integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16492)
-- Name: matricula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matricula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matricula_id_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 216
-- Name: matricula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matricula_id_seq OWNED BY public.matricula.id;


--
-- TOC entry 212 (class 1259 OID 16452)
-- Name: profesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesor (
    id bigint NOT NULL,
    nombre character varying(60),
    apellido character varying(60),
    correo character varying(150)
);


ALTER TABLE public.profesor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16451)
-- Name: profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesor_id_seq OWNER TO postgres;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 211
-- Name: profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
-- TOC entry 3184 (class 2604 OID 16462)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 16447)
-- Name: estudiante id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante ALTER COLUMN id SET DEFAULT nextval('public.estudiante_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 16493)
-- Name: matricula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula ALTER COLUMN id SET DEFAULT nextval('public.matricula_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16455)
-- Name: profesor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
-- TOC entry 3341 (class 0 OID 16459)
-- Dependencies: 214
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (id, nombre, fecha_inicio, fecha_final, id_profesor) FROM stdin;
2	Segunda Generacion	2022-07-11	2022-11-11	2
3	Tercera Generacion	2022-08-22	2022-12-22	1
1	Primera Generacion	2022-06-13	2022-10-13	1
\.


--
-- TOC entry 3337 (class 0 OID 16444)
-- Dependencies: 210
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (id, nombre, apellido, fecha_matricula) FROM stdin;
1	Robert	Velasco	2022-06-13
2	isa	Valenzuela	2022-06-13
3	antony	Ure	2022-06-13
4	Estebanh	Hurtado	2022-06-13
5	Cesar	Agusto	2022-06-13
6	ellis	Velandia	2022-06-13
7	Andres	Cuellar	2022-06-13
8	sefhiroth	perez	2022-06-13
9	Hugo	Hernandez	2022-07-11
10	cristian	carhuas	2022-07-11
11	Estuardo	Chancusig	2022-07-11
12	Peter	Neville	2022-07-11
13	jhen	nunez	2022-07-11
14	carlos	martinez	2022-08-22
15	catalina	castillo	2022-08-22
16	christoper	calvachi	2022-08-22
17	elena	mazo	2022-08-22
18	jose	peralta	2022-08-22
19	camilo	perez	2022-08-22
20	helena	muñoz	2022-08-22
\.


--
-- TOC entry 3342 (class 0 OID 16479)
-- Dependencies: 215
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matricula (id_estudiante, id_curso, id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	3	14
15	3	15
16	3	16
17	3	17
18	3	18
\.


--
-- TOC entry 3339 (class 0 OID 16452)
-- Dependencies: 212
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesor (id, nombre, apellido, correo) FROM stdin;
1	josse	zuñiga	josse.z@larnu.com
2	emiliano	rotta	emiliano.r@larnu.com
3	javier	sanchez	javier.s@larnu.com
\.


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 213
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 3, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 209
-- Name: estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_id_seq', 20, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 216
-- Name: matricula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matricula_id_seq', 18, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 211
-- Name: profesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesor_id_seq', 3, true);


--
-- TOC entry 3191 (class 2606 OID 16464)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 16449)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16498)
-- Name: matricula matricula_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pk PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 16457)
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 16465)
-- Name: curso fk_profesor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk_profesor FOREIGN KEY (id_profesor) REFERENCES public.profesor(id) ON DELETE CASCADE;


--
-- TOC entry 3196 (class 2606 OID 16487)
-- Name: matricula matricula_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id) ON DELETE CASCADE;


--
-- TOC entry 3195 (class 2606 OID 16482)
-- Name: matricula matricula_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiante(id);


-- Completed on 2022-09-13 20:50:31

--
-- PostgreSQL database dump complete
--

