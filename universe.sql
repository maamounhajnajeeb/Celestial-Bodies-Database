--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: feature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.feature (
    feature_id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    planet_id integer
);


ALTER TABLE public.feature OWNER TO freecodecamp;

--
-- Name: feature_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.feature_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_feature_id_seq OWNER TO freecodecamp;

--
-- Name: feature_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.feature_feature_id_seq OWNED BY public.feature.feature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    type character varying(32) NOT NULL,
    description text,
    constellation_name character varying(32) NOT NULL
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
    name character varying(32) NOT NULL,
    image_path character varying(64),
    description text,
    planet_id integer
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
    name character varying(16) NOT NULL,
    number_of_moons integer,
    description text NOT NULL,
    type character varying(32),
    radius character varying(8),
    has_life boolean DEFAULT false NOT NULL,
    star_id integer,
    distance_from_sun_in_million_km integer
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
    name character varying(32) NOT NULL,
    magnitude numeric(3,2),
    spectral_class character varying(16) NOT NULL,
    galaxy_id integer,
    seen_by_naked_eye boolean DEFAULT false
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
-- Name: feature feature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature ALTER COLUMN feature_id SET DEFAULT nextval('public.feature_feature_id_seq'::regclass);


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
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.feature VALUES (1, 'Amazon River', 'South America', NULL);
INSERT INTO public.feature VALUES (2, 'Chernobyl cooling pond', 'Ukraine', NULL);
INSERT INTO public.feature VALUES (3, 'Ganges River', 'india', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'spiral galaxy', 'Messier 31 (NGC 224), also known as the Andromeda Galaxy, is a spiral galaxy located in the constellation Andromeda in the Local Group of galaxies. M31 is 2500000 light years away from Earth', 'Andromeda');
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy (Messier 33)', 'spiral galaxy', 'Messier 33 (NGC 598), also known as the Triangulum Galaxy, is a spiral galaxy located in the constellation Triangulum in the Local Group of galaxies. M33 is 3200000 light years away from Earth', 'Triangulum');
INSERT INTO public.galaxy VALUES (3, 'Bodes Galaxy (Messier 81)', 'spiral galaxy', 'Messier 81 (NGC 3031), also known as the Bodes Galaxy, is a spiral galaxy located in the constellation Ursa Major in the M81 Group of galaxies. M81 is 11800000 light years away from Earth.', 'Ursa Major');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy (Messier 82)', 'irregular galaxy', 'Messier 82 (NGC 3034), also known as the Cigar Galaxy, is an irregular galaxy located in the constellation Ursa Major in the M81 Group of galaxies. M82 is 12000000 light years away from Earth', 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy (Messier 104)', 'spiral galaxy', 'Messier 104 (NGC 4594), also known as the Sombrero Galaxy, is a spiral galaxy located in the constellation Virgo in the M104 Group of galaxies. M104 is 31000000 light years away from Earth', 'Vigro');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'dwarf spiral galaxy', 'M22 is best viewed during late summer, is magnitude 5.1, and can be viewed with naked eye (barely). M22 is 32 in apparent size. For reference, the full moon is 30''', 'dorado');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Deimos', './images/Deimos.png', 'Deimos (pronounced DIE-moss) is one of two moons of the planet Mars. Diemos is the smaller outermost moon, and as its orbit is slowly expanding, is expected to eventually escape Mars gravity. Both Deimos and Phobos may be asteroids captured by Mars in the distant pas', 4);
INSERT INTO public.moon VALUES (2, 'Phobos', './images/Phobos.png', 'Phobos (pronounced FOH-buhs) is one of two moons of the planet Mars. Phobos is the larger innermost moon, and is thought to be a rubble pile held together by a dark thin crust. In 30 to 50 million years, it will either collide with Mars or break apart and become a ring system. Both Phobos and Deimos may be asteroids captured by Mars in the distant past', 4);
INSERT INTO public.moon VALUES (1, 'Luna', './Luna.png', 'Luna is the moon of planet Earth and was formed as a result of a collision of a Mars-sized body with Earth. For a listing of other moons, see Moons of the Planets.', 3);
INSERT INTO public.moon VALUES (4, 'Ganymde', './images/Ganymed.png', 'Ganymed  is the largest moon, and one of the four Galilean moons of planet Jupiter. Ganymede is larger than Mercury and Pluto, and 2/3 the size of Mars. It would be considered a planet if it were orbiting the Sun instead of Jupiter.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', './moons/callist.png', 'Callisto is one of the four Galilean moons of planet Jupiter. It is comprised of equal parts rock and ice and is geologically dead, with it''s surface covered with the oldest craters in the solar system. Callisto has a very thin atmosphere carbon dioxide and oxygen. It is almost as large as Mercury.', 5);
INSERT INTO public.moon VALUES (6, 'Europa', './moons/europa.png', 'Europa is the smallest of the 4 large Galilean moons of planet Jupiter. Europa is the ice moon of jupiter, possessing a subsurface water ocean and cryogeysers. It has the smoothest surface of any body in the solar system and has a thin oxygen atmosphere. Europa, along with Callisto, Ganymede, and Io, were discovered by the Italian astronomer Galileo Galilei in 1610', 5);
INSERT INTO public.moon VALUES (7, 'Amathea', './moon/Amalthea.png', 'Amalthea is a small, very red, irregular-shaped moon of the planet Jupiter. Dust ejected from it''s surface formed the Amalthea Gossamer Ring around Jupiter.', 5);
INSERT INTO public.moon VALUES (8, 'Himalia', './moon/Himalia.png', 'Himalia is the 6th largest moon of the planet Jupiter, and is believed to be one chunk of a C-class or D-class asteroid that broke apart in a collision during capture by Jupiter''s gravity. The other chunks of this asteroid became the moons Elara, Leda, and Lysithea. These four similar moons are named the Himalia group.', 5);
INSERT INTO public.moon VALUES (9, 'Thebe', './moon/Thebe.png', 'Thebe is a small, red, irregular-shaped moon of the planet Jupiter. Dust ejected from it''s surface formed the Thebe Gossamer Ring around Jupiter. These characteristics make it similar to the moon Elara. Its surface has giant craters and high mountains that are comparable in size to the moon itself', 5);
INSERT INTO public.moon VALUES (10, 'Elara', './moon/Elara.png', 'Elara is the 8th largest moon of the planet Jupiter, and is believed to be one chunk of a C-class or D-class asteroid that broke apart in a collision during capture by Jupiter''s gravity. The other chunks of this asteroid became the moons Himalia, Leda, and Lysithea. These four similar moons are named the Himalia group', 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', './moon/pasiphae.png', 'Pasiphae is a gray retrograde moon of the planet Jupiter, and is believed to be a chunk of a C-class asteroid that broke apart in a collision during capture by Jupiter''s gravity', 5);
INSERT INTO public.moon VALUES (12, 'Metis', './moon/metis.png', 'Metis is the innermost moon of the planet Jupiter, and is also the fastest-moving. Dust ejected from it''s surface help form the main ring around Jupiter', 5);
INSERT INTO public.moon VALUES (13, 'Carme', './moon/carme.jpg', 'Carme is a small irregular-shaped moon of the planet Jupiter. Not much is known about it', 5);
INSERT INTO public.moon VALUES (14, 'Sinope', './moon/sinope.jpg', 'Sinope is a small, red, irregular-shaped moon of the planet Jupiter.', 5);
INSERT INTO public.moon VALUES (15, 'Adrastea', './moon/adrastea.jpg', 'Adrastea is a small moon of the planet Jupiter that orbits the planet in less time than it rotates on its axis. It is thought to be the primary contributor of material for Jupiter''s rings', 5);
INSERT INTO public.moon VALUES (16, 'Titan', './moon/titan.jpg', 'Titan is the largest moon of the planet Saturn. It is the only moon known in the solar system to have a dense atmosphere and bodies of liquid on its surface. The atmosphere of Titan is mostly nitrogen and its surface is composed of water ice, rocks, and rivers, lakes, and seas of liquid methane and ethane. It is believed to have a subsurface liquid water ocean as well.', 6);
INSERT INTO public.moon VALUES (17, 'Rhea', './moon/rhea.jpg', 'Rhea is the 2nd largest moon of planet Saturn. It is composed of 75% water ice and 25% rocky material, and has a thin oxygen atmosphere. It''s surface has ice cliffs and dark areas made of complex organic compounds', 6);
INSERT INTO public.moon VALUES (18, 'Lapetus', './moon/lapetus.jpg', 'Iapetus is the 3rd largest moon of planet Saturn, and has a massive equatorial ridge running three-quarters of the way around the moon, giving it the appearance of a walnut. Iapetus also has a striking two-tone coloration, with one hemisphere showing a bright water ice surface and the other hemisphere showing a dark color, possibly due to sublimation effects', 6);
INSERT INTO public.moon VALUES (19, 'Dione', './moon/dione.jpg', 'Dione is one of the moons of the planet Saturn. Its surface is heavily cratered, has ice cliffs and a subsurface liquid ocean.', 6);
INSERT INTO public.moon VALUES (20, 'Tethys', './moon/tethys.jpg', 'Tethys is one of the moons of the planet Saturn. It is composed almost entirely of pure ice. It has a very high albedo and is one of the most reflective object in the solar system', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 0, 'Mercury is the first of eight planets in our solar system and orbits closest to the Sun. It is composed of a solid 85% iron core with a thin cratered crust. Planet Mercury moves from the morning sky to the evening sky several times a year. It never deviates far from the horizon so can be hard to locate. It is the smallet and most cratered planet in the solar system.', 'Inner terrestrial planet', '2.44', false, 1, 57910000);
INSERT INTO public.planet VALUES (2, 'venus', 0, 'Venus is the second of eight planets in our solar system and is almost the same size as the Earth. Venus, also called the morning star or evening star, is brighter than any other star or planet in the sky', 'Inner terrestrial planet', '6052', false, 1, 108200000);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Earth is the third planet of our solar system. It has one natural moon, 5 natural quasi-satellites, two space stations, a couple dozen space telescopes, and ~5,000 operational satellites (Starlink, OneWeb, Iridium, GPS, etc.) that orbit around it. Earth is the densest planet (and object) in the solar system', 'Inner terrestrial planet', '6378', false, 2, 147);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Mars is the fourth of eight planets in our solar system and is almost the same size as the Earth. It is composed of a surface deeply covered by fine rust dust.', 'Inner terrestrial planet', '3389', false, 2, 208);
INSERT INTO public.planet VALUES (5, 'Jupiter', 92, 'Jupiter is the fifth of nine planets in our solar system and is is one of the outer "gas giant" planets. Jupiter is the largest planet in our solar system and only Venus (and the Moon) are brighter in the night sky. Jupiter has 92 known moons (maybe up to 600). It is not believed to have a solid surface.', 'outer gas giant', '71492', false, 3, 778);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 'Saturn is the sixth of nine planets in our solar system and is one of the outer "gas giant" planets. It is not believed to have a solid surface.', 'outer gas giant', '60268', false, 3, 143000000);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'Uranus is the seventh of nine planets in our solar system and is one of the outer "ice giant" planets. Uranus spins sideways and "rolls" in its orbit around the sun. Uranus is best viewed in summer and is in the constellation Aries currently', 'outer ice giant', '25559', false, 4, 287000000);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'Neptune is the last of eight planets in our solar system (Pluto was demoted). Neptune is one of the outer "ice giant" planets and has five faint rings', 'outer ice giant', '24746', false, 5, 45000000);
INSERT INTO public.planet VALUES (9, 'Ceres', NULL, 'Ceres and Hygiea are dwarf planets in the asteroid (main) belt between Mars and Jupiter', 'dwarf planet', '470', false, 4, 413900000);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, 'Orcus is a trans-Neptunian plutino dwarf planet located in the Kuiper belt with a large moon, Vanth. It is similar to Pluto in several respects and is seen as the "anti-Pluto" as it is also in an orbital resonance with Neptune, just in opposite phase from Pluto. It is not officially recognized as a dwarf planet yet but meets all the requirements of one', 'Dwarf planet - 1 moon', '8000', false, 5, 65000000);
INSERT INTO public.planet VALUES (11, 'Pluto', 5, 'Originally the ninth planet from the Sun, Pluto was recategorized as a dwarf planet as it was discovered that it is one of numerous large bodies within the Kuiper Belt. Pluto is not visible without the aid of a larg telescope and some patience may be needed to locate it over several nights', 'Dwarf planet - 5 moons', '1137', false, 6, 591352000);
INSERT INTO public.planet VALUES (12, 'Ixion', 1, '2001 KX76 is a plutino dwarf planet located in the Kuiper belt. It is not officially recognized as a dwarf planet...yet.', 'Dwarf planet - 1 moon', '650', false, 6, 59390350);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae (Alpheratz)', 2.07, 'B9p', 1, false);
INSERT INTO public.star VALUES (2, 'Beta Andromedae (Mirach)', 2.07, 'M0IIIvar', 2, false);
INSERT INTO public.star VALUES (3, 'Gamma Andromedae (Almach)', 2.10, 'K3IIb', 3, false);
INSERT INTO public.star VALUES (4, 'Delta Andromedae (Sadiradra)', 3.27, 'K3II', 4, true);
INSERT INTO public.star VALUES (5, 'Omicron Andromedae', 3.62, 'B6pv SB', 6, true);
INSERT INTO public.star VALUES (6, '51 Andromedae (Nembus)', 3.59, 'K3III', 5, false);


--
-- Name: feature_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.feature_feature_id_seq', 3, true);


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
-- Name: feature feature_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_name_key UNIQUE (name);


--
-- Name: feature feature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (feature_id);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: feature planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
