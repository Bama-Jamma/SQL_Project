--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-21 17:06:15

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
-- TOC entry 215 (class 1259 OID 17056)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_key integer NOT NULL,
    dept_no character varying,
    dept_name character varying
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17055)
-- Name: departments_dept_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_dept_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_dept_key_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: departments_dept_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_dept_key_seq OWNED BY public.departments.dept_key;


--
-- TOC entry 219 (class 1259 OID 17084)
-- Name: dept_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_employees (
    emp_key integer NOT NULL,
    emp_no character varying NOT NULL,
    dept_no character varying NOT NULL
);


ALTER TABLE public.dept_employees OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17083)
-- Name: dept_employees_emp_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dept_employees_emp_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dept_employees_emp_key_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 218
-- Name: dept_employees_emp_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dept_employees_emp_key_seq OWNED BY public.dept_employees.emp_key;


--
-- TOC entry 220 (class 1259 OID 17093)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no character varying NOT NULL,
    emp_title character varying NOT NULL,
    birth_date character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying,
    sex character varying,
    hire_date character varying
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17074)
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    manager_key integer NOT NULL,
    emp_no character varying NOT NULL,
    dept_no character varying NOT NULL
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17073)
-- Name: managers_manager_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.managers_manager_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.managers_manager_key_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 216
-- Name: managers_manager_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.managers_manager_key_seq OWNED BY public.managers.manager_key;


--
-- TOC entry 222 (class 1259 OID 17143)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    salary_key integer NOT NULL,
    emp_no character varying NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17142)
-- Name: salaries_salary_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salaries_salary_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salaries_salary_key_seq OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 221
-- Name: salaries_salary_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salaries_salary_key_seq OWNED BY public.salaries.salary_key;


--
-- TOC entry 223 (class 1259 OID 17151)
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title (
    title_id character varying NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.title OWNER TO postgres;

--
-- TOC entry 3196 (class 2604 OID 17059)
-- Name: departments dept_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN dept_key SET DEFAULT nextval('public.departments_dept_key_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 17087)
-- Name: dept_employees emp_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_employees ALTER COLUMN emp_key SET DEFAULT nextval('public.dept_employees_emp_key_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 17077)
-- Name: managers manager_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers ALTER COLUMN manager_key SET DEFAULT nextval('public.managers_manager_key_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 17146)
-- Name: salaries salary_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries ALTER COLUMN salary_key SET DEFAULT nextval('public.salaries_salary_key_seq'::regclass);


--
-- TOC entry 3201 (class 2606 OID 17063)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_key);


--
-- TOC entry 3205 (class 2606 OID 17091)
-- Name: dept_employees dept_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_employees
    ADD CONSTRAINT dept_employees_pkey PRIMARY KEY (emp_key);


--
-- TOC entry 3207 (class 2606 OID 17099)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 3203 (class 2606 OID 17081)
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (manager_key);


--
-- TOC entry 3209 (class 2606 OID 17150)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (salary_key);


--
-- TOC entry 3211 (class 2606 OID 17157)
-- Name: title title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);


-- Completed on 2023-06-21 17:06:15

--
-- PostgreSQL database dump complete
--

