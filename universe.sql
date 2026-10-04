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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_type character varying(30),
    color character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,1),
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: supernova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernova (
    name character varying(20) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    color character varying(20),
    supernova_id integer NOT NULL
);


ALTER TABLE public.supernova OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supernova_supernova_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supernova_supernova_id_seq OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supernova_supernova_id_seq OWNED BY public.supernova.supernova_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: supernova supernova_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova ALTER COLUMN supernova_id SET DEFAULT nextval('public.supernova_supernova_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'b', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'c', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'd', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'e', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'f', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'ma', 14, 1, NULL);
INSERT INTO public.moon VALUES (2, 'mb', 14, 2, NULL);
INSERT INTO public.moon VALUES (3, 'mc', 14, 3, NULL);
INSERT INTO public.moon VALUES (4, 'md', 14, 4, NULL);
INSERT INTO public.moon VALUES (5, 'me', 14, 5, NULL);
INSERT INTO public.moon VALUES (6, 'mf', 14, 6, NULL);
INSERT INTO public.moon VALUES (7, 'mg', 14, 7, NULL);
INSERT INTO public.moon VALUES (8, 'mh', 14, 8, NULL);
INSERT INTO public.moon VALUES (9, 'mi', 14, 9, NULL);
INSERT INTO public.moon VALUES (10, 'mj', 14, 10, NULL);
INSERT INTO public.moon VALUES (11, 'mk', 14, 11, NULL);
INSERT INTO public.moon VALUES (12, 'mm', 14, 12, NULL);
INSERT INTO public.moon VALUES (13, 'mn', 14, 13, NULL);
INSERT INTO public.moon VALUES (14, 'mo', 14, 14, NULL);
INSERT INTO public.moon VALUES (15, 'mp', 14, 16, NULL);
INSERT INTO public.moon VALUES (16, 'mq', 14, 17, NULL);
INSERT INTO public.moon VALUES (17, 'mr', 14, 18, NULL);
INSERT INTO public.moon VALUES (18, 'ms', 14, 19, NULL);
INSERT INTO public.moon VALUES (19, 'mt', 14, 20, NULL);
INSERT INTO public.moon VALUES (20, 'mu', 14, 21, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (14, 'pa', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (15, 'pb', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (16, 'pc', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (17, 'pd', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (18, 'pe', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (19, 'pf', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (20, 'pj', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (21, 'pi', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (22, 'pj', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (23, 'pi', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (24, 'ph', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (25, 'pg', NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'ga', NULL, 1, 1);
INSERT INTO public.star VALUES (3, 'gb', NULL, 1, 2);
INSERT INTO public.star VALUES (4, 'gc', NULL, 1, 3);
INSERT INTO public.star VALUES (5, 'gd', NULL, 1, 4);
INSERT INTO public.star VALUES (6, 'ge', NULL, 1, 5);
INSERT INTO public.star VALUES (7, 'gf', NULL, 1, 6);


--
-- Data for Name: supernova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernova VALUES ('a', 'descr1', NULL, NULL, NULL, 1);
INSERT INTO public.supernova VALUES ('b', 'descr2', NULL, NULL, NULL, 2);
INSERT INTO public.supernova VALUES ('c', 'descr3', NULL, NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supernova_supernova_id_seq', 3, true);


--
-- Name: galaxy galaxy_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_color_key UNIQUE (color);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: planet has_life; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT has_life UNIQUE (has_life);


--
-- Name: moon moon_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: supernova supernova_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_color_key UNIQUE (color);


--
-- Name: supernova supernova_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_name_key UNIQUE (name);


--
-- Name: supernova supernova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_pkey PRIMARY KEY (supernova_id);


--
-- Name: star galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

