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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    age integer,
    distance numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.comet ALTER COLUMN comet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comet_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean,
    age integer,
    distance numeric,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    is_tidally_locked boolean,
    age integer,
    distance numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean,
    age integer,
    distance numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    is_spherical boolean NOT NULL,
    is_active boolean,
    age integer,
    distance numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (1, 'Halley', true, 4500, 35.0);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (2, 'Hale-Bopp', true, 4500, 250.0);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (3, 'Encke', false, 4500, 4.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', false, true, 13500, 0, 'Our home galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', false, false, 10000, 2.5, 'Nearest major galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', false, false, 12000, 3.0, 'Member of Local Group');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Sombrero', true, false, 13000, 29.0, 'Unbarred spiral galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Whirlpool', false, false, 400, 23.0, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 87', true, false, 13000, 53.5, 'Supergiant elliptical galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 3, true, true, 4500, 0.002);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, false, true, 4500, 0.0006);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, false, true, 4500, 0.0015);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, true, true, 4500, 0.0028);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, true, true, 4500, 0.0045);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, true, true, 4500, 0.0072);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, true, true, 4500, 0.0125);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 6, true, true, 4500, 0.008);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Enceladus', 6, true, true, 4500, 0.001);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Mimas', 6, true, true, 4500, 0.0002);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Moon 1', 1, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Moon 2', 2, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Moon 3', 7, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Moon 4', 8, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Moon 5', 9, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Moon 6', 10, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Moon 7', 11, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Moon 8', 12, false, false, 1000, 0.1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Moon 9', 3, false, false, 1000, 0.2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Moon 10', 5, false, false, 1000, 0.3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, true, false, 4500, 0.39);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, true, true, 4500, 0.72);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, true, true, 4500, 1.00);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, true, true, 4500, 1.52);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, true, true, 4500, 5.20);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, true, true, 4500, 9.58);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Sirius B b', 2, true, false, 200, 10.0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Betelgeuse b', 3, true, false, 5, 100.0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Alpheratz b', 4, true, false, 50, 50.0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Mirach b', 5, true, false, 80, 80.0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Trianguli b', 6, true, false, 150, 120.0);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Extra Planet', 1, true, false, 4000, 15.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, true, true, 4600, 0.0);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 1, true, true, 300, 8.6);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Betelgeuse', 1, true, true, 10, 642.5);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Alpheratz', 2, true, true, 60, 97.0);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Mirach', 2, true, true, 100, 199.0);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Trianguli', 3, true, true, 200, 35.0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
