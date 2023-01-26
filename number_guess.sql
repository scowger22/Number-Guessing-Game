--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (87, 'Max', 1, 8);
INSERT INTO public.users VALUES (89, 'user_1674710534036', 2, 290);
INSERT INTO public.users VALUES (88, 'user_1674710534037', 5, 299);
INSERT INTO public.users VALUES (80, 'user_1674710084098', 2, 360);
INSERT INTO public.users VALUES (79, 'user_1674710084099', 5, 11);
INSERT INTO public.users VALUES (82, 'user_1674710117171', 2, 327);
INSERT INTO public.users VALUES (91, 'user_1674710573399', 2, 148);
INSERT INTO public.users VALUES (81, 'user_1674710117172', 5, 203);
INSERT INTO public.users VALUES (78, 'Sarah', 6, 3);
INSERT INTO public.users VALUES (90, 'user_1674710573400', 5, 184);
INSERT INTO public.users VALUES (84, 'user_1674710186079', 2, 216);
INSERT INTO public.users VALUES (83, 'user_1674710186080', 5, 675);
INSERT INTO public.users VALUES (93, 'user_1674710594147', 2, 137);
INSERT INTO public.users VALUES (92, 'user_1674710594148', 5, 407);
INSERT INTO public.users VALUES (86, 'user_1674710284113', 2, 185);
INSERT INTO public.users VALUES (94, 'Cal', 1, 8);
INSERT INTO public.users VALUES (85, 'user_1674710284114', 5, 123);
INSERT INTO public.users VALUES (96, 'user_1674710683537', 2, 309);
INSERT INTO public.users VALUES (95, 'user_1674710683538', 5, 585);
INSERT INTO public.users VALUES (98, 'user_1674710697369', 2, 215);
INSERT INTO public.users VALUES (97, 'user_1674710697370', 5, 26);
INSERT INTO public.users VALUES (100, 'user_1674710709939', 2, 254);
INSERT INTO public.users VALUES (99, 'user_1674710709940', 5, 321);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 100, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

