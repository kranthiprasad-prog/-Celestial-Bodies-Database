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
    name character varying(60) NOT NULL,
    galaxy_type_id integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    typical_star_count integer NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    mass_in_earths numeric NOT NULL,
    orbital_period_days numeric NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    spectral_class character varying(5) NOT NULL
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 0, true, 'Our home galaxy, with the Solar System in one of its spiral arms.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 2537000, false, 'The nearest major spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 2730000, false, 'A small spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 1, 31000000, false, 'A bright galaxy known for its broad dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 2, 53500000, false, 'A giant elliptical galaxy in the Virgo Cluster.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 3, 163000, false, 'An irregular satellite galaxy of the Milky Way.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A rotating disk with arms of stars, gas, and dust.', 1000000000);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A rounded galaxy with an older, smoother stellar population.', 2000000000);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy without a settled spiral or elliptical shape.', 100000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737, true, 'Earth''s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 'A small, irregular moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 'The smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, 'An icy moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, false, 'A small inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 198, true, 'A small icy moon with a prominent crater.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252, true, 'An icy moon that vents water-rich plumes.');
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 531, true, 'A mid-sized icy moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561, true, 'An icy moon with bright cliff-like features.');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 764, true, 'Saturn''s second-largest moon.');
INSERT INTO public.moon VALUES (14, 'Titan', 6, 2575, true, 'A moon with lakes of liquid hydrocarbons.');
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 735, true, 'A two-toned moon orbiting Saturn.');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 236, true, 'A small moon with dramatic surface canyons.');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 579, true, 'A bright icy moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 585, true, 'A dark, heavily cratered moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Titania', 7, 789, true, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353, true, 'A large retrograde moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0.055, 87.97, 'The smallest planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0.815, 224.70, 'A rocky world with a dense carbon dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 1, 365.256, 'The only world currently known to host life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 0.107, 686.98, 'A cold desert planet with ancient river valleys.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 317.8, 4332.59, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 95.16, 10759.22, 'A gas giant surrounded by a broad ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 14.54, 30688.5, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 17.15, 60182, 'A distant ice giant with powerful winds.');
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, false, 1.018, 0.5, 'A compact companion world orbiting Sirius.');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 3, false, 1.27, 11.186, 'A nearby exoplanet in the temperate zone.');
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 4, false, 1.4, 129.9, 'An Earth-sized planet in its star''s habitable zone.');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 5, false, 0.692, 6.1, 'A rocky exoplanet in the TRAPPIST-1 system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, true, 'A1V');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, true, 'M5.5');
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 4000, true, 'M1V');
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 1, 7600, true, 'M8V');
INSERT INTO public.star VALUES (6, 'M31-G1', 2, 6000, true, 'K1III');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

