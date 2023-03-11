git--
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
    name character varying NOT NULL,
    region character varying NOT NULL,
    galaxy_id integer NOT NULL,
    main_component character varying,
    nebula character varying
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
    name character varying NOT NULL,
    region character varying NOT NULL,
    solid boolean,
    planet_id integer NOT NULL
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
-- Name: nebulas; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebulas (
    nebulas_id integer NOT NULL,
    name character varying NOT NULL,
    region character varying NOT NULL
);


ALTER TABLE public.nebulas OWNER TO freecodecamp;

--
-- Name: nebulas_nebulas_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulas_nebulas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulas_nebulas_id_seq OWNER TO freecodecamp;

--
-- Name: nebulas_nebulas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulas_nebulas_id_seq OWNED BY public.nebulas.nebulas_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    region character varying NOT NULL,
    satellite boolean,
    amount_of_satellite integer,
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
    name character varying NOT NULL,
    amount_of_planets integer,
    planets text,
    temperature numeric NOT NULL,
    region character varying,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebulas nebulas_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulas ALTER COLUMN nebulas_id SET DEFAULT nextval('public.nebulas_nebulas_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'K-420', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 'N-901', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Cigar', 'V-100', 3, 'Nitrogen', 'Nebula 1');
INSERT INTO public.galaxy VALUES ('Pinwheel', 'B-555', 4, 'Oxygen', 'Nebula 2');
INSERT INTO public.galaxy VALUES ('Sombrero', 'Y-692', 5, 'Boron', 'Nebula 3');
INSERT INTO public.galaxy VALUES ('Tadpole', 'Z-950', 6, 'Selenium', 'Nebula 4');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth System', true, 1);
INSERT INTO public.moon VALUES (2, 'Moon-1', 'Earth-1 System', true, 1);
INSERT INTO public.moon VALUES (3, 'Moon-2', 'Earth-2 System', true, 1);
INSERT INTO public.moon VALUES (4, 'Moon-3', 'Earth-3 System', true, 1);
INSERT INTO public.moon VALUES (5, 'Moon-5', 'Earth-5 System', true, 1);
INSERT INTO public.moon VALUES (6, 'Moon-6', 'Earth-6 System', true, 1);
INSERT INTO public.moon VALUES (7, 'Moon-7', 'Earth-7 System', true, 1);
INSERT INTO public.moon VALUES (8, 'Moon-8', 'Earth-8 System', true, 1);
INSERT INTO public.moon VALUES (9, 'Moon-9', 'Earth-9 System', true, 1);
INSERT INTO public.moon VALUES (10, 'Moon-10', 'Earth-10 System', true, 1);
INSERT INTO public.moon VALUES (11, 'Moon-11', 'Earth-11 System', true, 1);
INSERT INTO public.moon VALUES (12, 'Moon-12', 'Earth-12 System', true, 1);
INSERT INTO public.moon VALUES (13, 'Moon-13', 'Earth-13 System', true, 1);
INSERT INTO public.moon VALUES (14, 'Moon-14', 'Earth-14 System', true, 1);
INSERT INTO public.moon VALUES (15, 'Moon-15', 'Earth-15 System', true, 1);
INSERT INTO public.moon VALUES (16, 'Moon-16', 'Earth-16 System', true, 1);
INSERT INTO public.moon VALUES (17, 'Moon-17', 'Earth-17 System', true, 1);
INSERT INTO public.moon VALUES (18, 'Moon-18', 'Earth-18 System', true, 1);
INSERT INTO public.moon VALUES (19, 'Moon-19', 'Earth-19 System', true, 1);
INSERT INTO public.moon VALUES (20, 'Moon-20', 'Earth-20 System', true, 1);


--
-- Data for Name: nebulas; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebulas VALUES (1, 'A', 'B System');
INSERT INTO public.nebulas VALUES (2, 'B', 'C System');
INSERT INTO public.nebulas VALUES (3, 'C', 'D System');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Solar System', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Gasoline System', true, 2, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 'Gas System', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Hoi System', true, 16, 1);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'Candy System', true, 20, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Hot System', true, 5, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Blue System', true, 9, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Green System', true, 12, 1);
INSERT INTO public.planet VALUES (9, 'Jupyter-1', 'Candy-1 System', true, 20, 1);
INSERT INTO public.planet VALUES (10, 'Venus-1', 'Ho-1t System', true, 5, 1);
INSERT INTO public.planet VALUES (11, 'Uranus-1', 'Blue-1 System', true, 9, 1);
INSERT INTO public.planet VALUES (12, 'Neptune-1', 'Green-1 System', true, 12, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 9, 'Earth', 300.9, 'Milky Way', 1);
INSERT INTO public.star VALUES (3, 'Alpha', 8, 'Centauri', 230.9, 'Coffee Way', 1);
INSERT INTO public.star VALUES (4, 'Gamma', 3, 'Helen', 114.5, 'Tea Way', 1);
INSERT INTO public.star VALUES (5, 'Omega', 6, 'Zeus', 257.1, 'Juice Way', 1);
INSERT INTO public.star VALUES (6, 'Trita', 5, 'Vic', 14.5, 'Water Way', 1);
INSERT INTO public.star VALUES (7, 'Hulna', 5, 'Aphrodite', 407.4, 'Plastic Way', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebulas_nebulas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulas_nebulas_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_main_component_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_main_component_key UNIQUE (main_component);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_region_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_region_key UNIQUE (region);


--
-- Name: nebulas nebulas_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulas
    ADD CONSTRAINT nebulas_pkey PRIMARY KEY (nebulas_id);


--
-- Name: nebulas nebulas_region_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulas
    ADD CONSTRAINT nebulas_region_key UNIQUE (region);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_region_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_region_key UNIQUE (region);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_region_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_region_key UNIQUE (region);


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

