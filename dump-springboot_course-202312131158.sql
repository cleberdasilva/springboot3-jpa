--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2023-12-13 11:58:53

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: tb_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tb_category OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: tb_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_category_id_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_category_id_seq OWNED BY public.tb_category.id;


--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: tb_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_order (
    id bigint NOT NULL,
    moment timestamp(6) with time zone,
    order_status integer,
    client_id bigint
);


ALTER TABLE public.tb_order OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: tb_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_order_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_order_id_seq OWNED BY public.tb_order.id;


--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: tb_order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_order_item (
    price double precision,
    quantity integer,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.tb_order_item OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: tb_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_payment (
    moment timestamp(6) with time zone,
    order_id bigint NOT NULL
);


ALTER TABLE public.tb_payment OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16423)
-- Name: tb_prodcut_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_prodcut_category (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.tb_prodcut_category OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: tb_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_product (
    id bigint NOT NULL,
    description character varying(255),
    img_url character varying(255),
    name character varying(255),
    price double precision
);


ALTER TABLE public.tb_product OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16428)
-- Name: tb_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_product_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_product_id_seq OWNED BY public.tb_product.id;


--
-- TOC entry 225 (class 1259 OID 16438)
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255)
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16437)
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_user_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_id_seq OWNED BY public.tb_user.id;


--
-- TOC entry 4715 (class 2604 OID 16403)
-- Name: tb_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_category ALTER COLUMN id SET DEFAULT nextval('public.tb_category_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 16410)
-- Name: tb_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order ALTER COLUMN id SET DEFAULT nextval('public.tb_order_id_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 16432)
-- Name: tb_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_product ALTER COLUMN id SET DEFAULT nextval('public.tb_product_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16441)
-- Name: tb_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id SET DEFAULT nextval('public.tb_user_id_seq'::regclass);


--
-- TOC entry 4883 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: tb_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_category (id, name) FROM stdin;
\.


--
-- TOC entry 4885 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: tb_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_order (id, moment, order_status, client_id) FROM stdin;
\.


--
-- TOC entry 4886 (class 0 OID 16413)
-- Dependencies: 219
-- Data for Name: tb_order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_order_item (price, quantity, product_id, order_id) FROM stdin;
\.


--
-- TOC entry 4887 (class 0 OID 16418)
-- Dependencies: 220
-- Data for Name: tb_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_payment (moment, order_id) FROM stdin;
\.


--
-- TOC entry 4888 (class 0 OID 16423)
-- Dependencies: 221
-- Data for Name: tb_prodcut_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_prodcut_category (product_id, category_id) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 16429)
-- Dependencies: 223
-- Data for Name: tb_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_product (id, description, img_url, name, price) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 16438)
-- Dependencies: 225
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (id, email, name, password, phone) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_category_id_seq', 1, false);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_order_id_seq', 1, false);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_product_id_seq', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_id_seq', 1, false);


--
-- TOC entry 4720 (class 2606 OID 16405)
-- Name: tb_category tb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_category
    ADD CONSTRAINT tb_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 16417)
-- Name: tb_order_item tb_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT tb_order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- TOC entry 4722 (class 2606 OID 16412)
-- Name: tb_order tb_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT tb_order_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 16422)
-- Name: tb_payment tb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT tb_payment_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4728 (class 2606 OID 16427)
-- Name: tb_prodcut_category tb_prodcut_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_prodcut_category
    ADD CONSTRAINT tb_prodcut_category_pkey PRIMARY KEY (product_id, category_id);


--
-- TOC entry 4730 (class 2606 OID 16436)
-- Name: tb_product tb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16445)
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16451)
-- Name: tb_order_item fk4h5xid5qehset7qwe5l9c997x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fk4h5xid5qehset7qwe5l9c997x FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- TOC entry 4737 (class 2606 OID 16466)
-- Name: tb_prodcut_category fk9ukvrjw5tu1n2l6kb3g2vqsbj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_prodcut_category
    ADD CONSTRAINT fk9ukvrjw5tu1n2l6kb3g2vqsbj FOREIGN KEY (category_id) REFERENCES public.tb_category(id);


--
-- TOC entry 4735 (class 2606 OID 16456)
-- Name: tb_order_item fkgeobgl2xu916he8vhljktwxnx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fkgeobgl2xu916he8vhljktwxnx FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


--
-- TOC entry 4733 (class 2606 OID 16446)
-- Name: tb_order fki0x0rv7d65vsceuy33km9567n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT fki0x0rv7d65vsceuy33km9567n FOREIGN KEY (client_id) REFERENCES public.tb_user(id);


--
-- TOC entry 4738 (class 2606 OID 16471)
-- Name: tb_prodcut_category fkj5u9q96tp3xw77um1ud1fbj7q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_prodcut_category
    ADD CONSTRAINT fkj5u9q96tp3xw77um1ud1fbj7q FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- TOC entry 4736 (class 2606 OID 16461)
-- Name: tb_payment fkokaf4il2cwit4h780c25dv04r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT fkokaf4il2cwit4h780c25dv04r FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


-- Completed on 2023-12-13 11:58:54

--
-- PostgreSQL database dump complete
--

