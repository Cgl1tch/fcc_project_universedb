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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    notes text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation character varying(30),
    origin_of_name text,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_gid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    orbital_period integer NOT NULL,
    planet_id integer,
    rocky_or_icy character varying(20) NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    signs_of_life boolean,
    no_of_moons integer,
    star_id integer,
    rings boolean
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    distance_from_sun_in_light_years numeric,
    galaxy_id integer,
    visual_magnitude numeric
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gid_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Phoenix A', 'Estimated using a caloriemetric model on the adiabatic behavior of core regrowth and an assumed core-Sersic model of n=4. It is consistent with evolutionary modelling of gas accretion and the dynamics and density profiles of the galaxy. Mass has not been measured directly.');
INSERT INTO public.black_hole VALUES (2, 'TON 618', 'Estimated from quasar C IV line correlation. An older estimate gives a mass of 6.6 x 10^10 M based on the quasar HB emission line correlation.');
INSERT INTO public.black_hole VALUES (3, 'IC 1101', 'Estimated from properties of the host galaxy(Faber-Jackson relation); mass has not been measured directly');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Cigar galaxy', 3, 'Ursa Major', 'Appears similar in shape to a cigar', NULL);
INSERT INTO public.galaxy VALUES ('Eye of Sauron', 4, 'Canes venatici', 'Due to its resemblance to the Eye of Sauron from Lord of the Rings', NULL);
INSERT INTO public.galaxy VALUES ('Peekaboo galaxy', 5, 'Hydra', 'Was hidden behind a relatively fast moving star and became observable when the star moved aside', NULL);
INSERT INTO public.galaxy VALUES ('Whirlpool galaxy', 6, 'Canes venatici', 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits', NULL);
INSERT INTO public.galaxy VALUES ('Andromeda galaxy', 2, 'Andromeda', 'From the area of the sky in which it appears, the constellation of Andromeda', 'Closest big galaxy to the Milky Way galaxy');
INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Sagittarius', 'Appearance from earth of the galaxy- a band of light', 'The galaxy containing the Sun and its Solar System and therefore Earth.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 27, 3, 'rocky');
INSERT INTO public.moon VALUES ('Io', 2, 2, 5, 'rocky');
INSERT INTO public.moon VALUES ('Europa', 3, 3, 5, 'rocky');
INSERT INTO public.moon VALUES ('Ganymede', 4, 7, 5, 'icy');
INSERT INTO public.moon VALUES ('Callisto', 5, 17, 5, 'icy');
INSERT INTO public.moon VALUES ('Mimas', 6, 1, 6, 'icy');
INSERT INTO public.moon VALUES ('Enceladus', 7, 1, 6, 'icy');
INSERT INTO public.moon VALUES ('Tethys', 8, 2, 6, 'icy');
INSERT INTO public.moon VALUES ('Dione', 9, 3, 6, 'icy');
INSERT INTO public.moon VALUES ('Rhea', 10, 4, 6, 'icy');
INSERT INTO public.moon VALUES ('Titan', 11, 16, 6, 'icy');
INSERT INTO public.moon VALUES ('Iapetus', 12, 79, 6, 'icy');
INSERT INTO public.moon VALUES ('Miranda', 13, 1, 7, 'icy');
INSERT INTO public.moon VALUES ('Ariel', 14, 2, 7, 'icy');
INSERT INTO public.moon VALUES ('Umbriel', 15, 4, 7, 'icy');
INSERT INTO public.moon VALUES ('Titania', 16, 9, 7, 'icy');
INSERT INTO public.moon VALUES ('Oberon', 17, 13, 7, 'icy');
INSERT INTO public.moon VALUES ('Triton', 18, 6, 8, 'icy');
INSERT INTO public.moon VALUES ('Charon', 19, 6, 10, 'icy');
INSERT INTO public.moon VALUES ('Dysnomia', 20, 16, 12, 'icy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, false, 0, 1, false);
INSERT INTO public.planet VALUES ('Venus', 2, false, 0, 1, false);
INSERT INTO public.planet VALUES ('Earth', 3, true, 1, 1, false);
INSERT INTO public.planet VALUES ('Mars', 4, false, 2, 1, false);
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 95, 1, true);
INSERT INTO public.planet VALUES ('Saturn', 6, false, 146, 1, true);
INSERT INTO public.planet VALUES ('Uranus', 7, false, 27, 1, true);
INSERT INTO public.planet VALUES ('Neptune', 8, false, 14, 1, true);
INSERT INTO public.planet VALUES ('Ceres', 9, false, 0, 1, false);
INSERT INTO public.planet VALUES ('Pluto', 10, false, 5, 1, false);
INSERT INTO public.planet VALUES ('Haumea', 11, false, 2, 1, true);
INSERT INTO public.planet VALUES ('Eris', 12, false, 1, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 0, 1, -26.74);
INSERT INTO public.star VALUES ('Alpheratz', 2, 97, 2, 2.06);
INSERT INTO public.star VALUES ('Cor Caroli', 3, 106.5, 4, 2.84);
INSERT INTO public.star VALUES ('Alioth', 4, 81, 3, 1.77);
INSERT INTO public.star VALUES ('Alphard', 5, 177, 5, 2);
INSERT INTO public.star VALUES ('Chara', 6, 27.6, 4, 4.25);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gid_seq', 6, true);


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
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: galaxy uniquectm_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniquectm_const UNIQUE (name);


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

