--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment (
    id integer,
    doctor_id integer,
    patient_id integer,
    date_time timestamp without time zone
);


ALTER TABLE public.appointment OWNER TO postgres;

--
-- Name: billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing (
    id integer,
    appointment_id integer,
    amount bigint,
    payment_type character varying(55)
);


ALTER TABLE public.billing OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    id integer,
    dept_name character varying(60)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    id integer,
    name character varying(55),
    address character varying(60),
    gender character varying(55),
    dob date,
    salary integer,
    phone_no bigint,
    department_id integer
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    id integer,
    name character varying(55),
    address character varying(80),
    gender character varying(55),
    age integer,
    dob date,
    phone_no bigint
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_room (
    id integer,
    patient_id integer,
    room_id integer,
    admitted_on date,
    discharge_on date
);


ALTER TABLE public.patient_room OWNER TO postgres;

--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id integer,
    room_type character varying(50),
    price bigint
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment (id, doctor_id, patient_id, date_time) FROM stdin;
201	106	1	1998-07-01 13:42:12
202	105	2	1999-02-10 08:20:26
203	104	4	2000-12-23 10:38:30
204	103	3	1994-11-30 06:15:10
205	101	6	2012-02-28 14:06:45
206	102	5	2014-08-14 18:41:00
207	106	1	1998-07-01 13:42:12
208	104	3	2012-02-28 14:10:34
\.


--
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing (id, appointment_id, amount, payment_type) FROM stdin;
11	201	25000	Cash
12	204	30000	Cash
13	202	38000	GPay
14	203	40000	GPay
15	205	48000	PhonePay
16	206	50000	PhonePay
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (id, dept_name) FROM stdin;
1	General Surgery
4	Neurology
2	Orthopedics
3	Outpatient department
4	Radiology department
5	Rehabilitation department
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (id, name, address, gender, dob, salary, phone_no, department_id) FROM stdin;
101	Rishabh Sharma	Block-A,Faridabad	Male	1995-08-01	400000	9891594798	1
102	Aman Gulati	South-ex,Delhi	Male	1996-09-10	420000	9891784798	2
103	Khushi Katuria	Kalkaji,Delhi	Female	1999-11-11	500000	8891784798	3
104	Mamta Singh	Ajronda,Faridabad	Female	2000-12-11	540000	8881784798	4
105	Dr AK Mehta	Bata,Faridabad	Male	2001-06-04	50000	7681784798	4
106	Geeta Dua	Kailash Colony,Delhi	Female	1994-08-07	70000	9181784798	5
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, name, address, gender, age, dob, phone_no) FROM stdin;
1	Ram Jain	Bptp,Faridabad	Male	30	1999-02-07	9872341788
2	Hariom Vashist	Block-A,Faridabad	Male	19	2000-08-09	7872341788
3	Neelam Kumari	Govindpuri,Delhi	Female	27	1996-12-12	8882341788
4	Ruchi Garg	Khanpur,Delhi	Female	21	2002-04-05	9889341788
5	Keshav Jain	Sonipat	Male	2	2020-03-07	9893409123
6	Neha Bhati	Murthal	Female	4	2018-03-03	9893059123
\.


--
-- Data for Name: patient_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient_room (id, patient_id, room_id, admitted_on, discharge_on) FROM stdin;
121	3	23	2014-08-11	2014-08-21
122	2	22	2015-06-20	2015-06-25
123	1	21	2015-07-01	2015-07-06
124	6	26	2016-06-01	2016-06-15
125	5	25	2014-09-26	2014-10-02
126	4	24	2018-01-07	2018-01-15
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id, room_type, price) FROM stdin;
21	Single-bed	1500
22	Shared	1000
23	Private Deluxe	5000
24	General Ward	1800
25	Rehab Room	3500
26	Semi Private Sharing	800
\.


--
-- PostgreSQL database dump complete
--

