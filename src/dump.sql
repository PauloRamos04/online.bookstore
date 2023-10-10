git --
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: administradores; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.administradores (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.administradores OWNER TO bookstore;

--
-- Name: administradores_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.administradores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administradores_id_seq OWNER TO bookstore;

--
-- Name: administradores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.administradores_id_seq OWNED BY public.administradores.id;


--
-- Name: autores; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.autores (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    biografia text
);


ALTER TABLE public.autores OWNER TO bookstore;

--
-- Name: autores_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_id_seq OWNER TO bookstore;

--
-- Name: autores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;


--
-- Name: editoras; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.editoras (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text
);


ALTER TABLE public.editoras OWNER TO bookstore;

--
-- Name: editoras_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.editoras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.editoras_id_seq OWNER TO bookstore;

--
-- Name: editoras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.editoras_id_seq OWNED BY public.editoras.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO bookstore;

--
-- Name: livros; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.livros (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descricao text,
    ano_publicacao integer,
    autor_id integer,
    editora_id integer,
    status character varying(255) DEFAULT 'Aguardando Aprova├º├úo'::character varying
);


ALTER TABLE public.livros OWNER TO bookstore;

--
-- Name: livros_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.livros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livros_id_seq OWNER TO bookstore;

--
-- Name: livros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.livros_id_seq OWNED BY public.livros.id;


--
-- Name: moderacao; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.moderacao (
    id integer NOT NULL,
    livro_id integer,
    usuario_id integer,
    data timestamp without time zone,
    status_anterior character varying(255),
    status_novo character varying(255),
    comentario text
);


ALTER TABLE public.moderacao OWNER TO bookstore;

--
-- Name: moderacao_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.moderacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moderacao_id_seq OWNER TO bookstore;

--
-- Name: moderacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.moderacao_id_seq OWNED BY public.moderacao.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: bookstore
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO bookstore;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO bookstore;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: administradores id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.administradores ALTER COLUMN id SET DEFAULT nextval('public.administradores_id_seq'::regclass);


--
-- Name: autores id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);


--
-- Name: editoras id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.editoras ALTER COLUMN id SET DEFAULT nextval('public.editoras_id_seq'::regclass);


--
-- Name: livros id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.livros ALTER COLUMN id SET DEFAULT nextval('public.livros_id_seq'::regclass);


--
-- Name: moderacao id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.moderacao ALTER COLUMN id SET DEFAULT nextval('public.moderacao_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.administradores (id, nome, email, senha) FROM stdin;
1	Breno Laperuta	breno@email.com	senha2
2	Paulo Ramos	paulo@email.com	senha1
\.


--
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.autores (id, nome, biografia) FROM stdin;
1	Autor 1	Biografia do Autor 1
2	Autor 2	Biografia do Autor 2
3	Autor 3	Biografia do Autor 3
4	Autor 4	Biografia do Autor 4
5	Autor 5	Biografia do Autor 5
6	Autor 6	Biografia do Autor 6
\.


--
-- Data for Name: editoras; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.editoras (id, nome, descricao) FROM stdin;
1	Editora 1	Descri├º├úo da Editora 1
2	Editora 2	Descri├º├úo da Editora 2
3	Editora 3	Descri├º├úo da Editora 3
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
\.


--
-- Data for Name: livros; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.livros (id, titulo, descricao, ano_publicacao, autor_id, editora_id, status) FROM stdin;
7	Livro 1	Descri├º├úo do Livro 1	2021	1	1	Aprovado
8	Livro 2	Descri├º├úo do Livro 2	2022	2	2	Aguardando Aprova├º├úo
9	Livro 3	Descri├º├úo do Livro 3	2020	3	3	Rejeitado
11	Livro 8	Descri├º├úo do Livro 8	2028	1	1	\N
\.


--
-- Data for Name: moderacao; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.moderacao (id, livro_id, usuario_id, data, status_anterior, status_novo, comentario) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: bookstore
--

COPY public.usuarios (id, nome, email, senha) FROM stdin;
22	User	user@gmail.com	$2a$10$4iMfiqEM7pG32AofGg1AKOLhA7MG59.q56.uoYn4mGz.ZcO9UPk8K
1	Paulo	ana.souza@voll.med	$2a$10$Y50UaMFOxteibQEYLrwuHeehHYfcoafCopUazP12.rqB41bsolF5.
24	Breno	breno@gmail.com	Breno0123
\.


--
-- Name: administradores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.administradores_id_seq', 5, true);


--
-- Name: autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.autores_id_seq', 6, true);


--
-- Name: editoras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.editoras_id_seq', 3, true);


--
-- Name: livros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.livros_id_seq', 11, true);


--
-- Name: moderacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.moderacao_id_seq', 10, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 24, true);


--
-- Name: administradores administradores_email_key; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_email_key UNIQUE (email);


--
-- Name: administradores administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (id);


--
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);


--
-- Name: editoras editoras_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.editoras
    ADD CONSTRAINT editoras_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: livros livros_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.livros
    ADD CONSTRAINT livros_pkey PRIMARY KEY (id);


--
-- Name: moderacao moderacao_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.moderacao
    ADD CONSTRAINT moderacao_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: bookstore
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: livros livros_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.livros
    ADD CONSTRAINT livros_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(id);


--
-- Name: livros livros_editora_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.livros
    ADD CONSTRAINT livros_editora_id_fkey FOREIGN KEY (editora_id) REFERENCES public.editoras(id);


--
-- Name: moderacao moderacao_livro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.moderacao
    ADD CONSTRAINT moderacao_livro_id_fkey FOREIGN KEY (livro_id) REFERENCES public.livros(id);


--
-- Name: moderacao moderacao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bookstore
--

ALTER TABLE ONLY public.moderacao
    ADD CONSTRAINT moderacao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

