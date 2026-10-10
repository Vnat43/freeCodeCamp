--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    best_game integer,
    games_played integer NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 2);
INSERT INTO public.games VALUES (2, 1, 2);
INSERT INTO public.games VALUES (3, 2, 2);
INSERT INTO public.games VALUES (4, 5, 2);
INSERT INTO public.games VALUES (5, 357, 4);
INSERT INTO public.games VALUES (6, 439, 4);
INSERT INTO public.games VALUES (7, 404, 5);
INSERT INTO public.games VALUES (8, 483, 5);
INSERT INTO public.games VALUES (9, 367, 4);
INSERT INTO public.games VALUES (10, 4, 4);
INSERT INTO public.games VALUES (11, 155, 4);
INSERT INTO public.games VALUES (12, 589, 6);
INSERT INTO public.games VALUES (13, 17, 6);
INSERT INTO public.games VALUES (14, 900, 7);
INSERT INTO public.games VALUES (15, 986, 7);
INSERT INTO public.games VALUES (16, 489, 6);
INSERT INTO public.games VALUES (17, 358, 6);
INSERT INTO public.games VALUES (18, 222, 6);
INSERT INTO public.games VALUES (19, 2, 2);
INSERT INTO public.games VALUES (20, 22, 8);
INSERT INTO public.games VALUES (21, 500, 8);
INSERT INTO public.games VALUES (22, 29, 9);
INSERT INTO public.games VALUES (23, 689, 9);
INSERT INTO public.games VALUES (24, 951, 8);
INSERT INTO public.games VALUES (25, 313, 8);
INSERT INTO public.games VALUES (26, 144, 8);
INSERT INTO public.games VALUES (27, 18, 10);
INSERT INTO public.games VALUES (28, 244, 10);
INSERT INTO public.games VALUES (29, 488, 11);
INSERT INTO public.games VALUES (30, 132, 11);
INSERT INTO public.games VALUES (31, 689, 10);
INSERT INTO public.games VALUES (32, 264, 10);
INSERT INTO public.games VALUES (33, 301, 10);
INSERT INTO public.games VALUES (34, 763, 12);
INSERT INTO public.games VALUES (35, 732, 12);
INSERT INTO public.games VALUES (36, 617, 13);
INSERT INTO public.games VALUES (37, 398, 13);
INSERT INTO public.games VALUES (38, 601, 12);
INSERT INTO public.games VALUES (39, 619, 12);
INSERT INTO public.games VALUES (40, 957, 12);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'vigs', NULL, 0);
INSERT INTO public.users VALUES (5, 'user_1791642115429', 404, 2);
INSERT INTO public.users VALUES (4, 'user_1791642115430', 4, 5);
INSERT INTO public.users VALUES (7, 'user_1791642218149', 900, 2);
INSERT INTO public.users VALUES (6, 'user_1791642218150', 17, 5);
INSERT INTO public.users VALUES (2, 'nathan', 1, 3);
INSERT INTO public.users VALUES (9, 'user_1791642257051', 29, 2);
INSERT INTO public.users VALUES (8, 'user_1791642257052', 22, 5);
INSERT INTO public.users VALUES (11, 'user_1791642382251', 132, 2);
INSERT INTO public.users VALUES (10, 'user_1791642382252', 18, 5);
INSERT INTO public.users VALUES (13, 'user_1791642431978', 398, 2);
INSERT INTO public.users VALUES (12, 'user_1791642431979', 601, 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 40, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

