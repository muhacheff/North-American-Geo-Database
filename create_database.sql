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

DROP DATABASE IF EXISTS DATABASE_NA;
CREATE DATABASE DATABASE_NA WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE DATABASE_NA OWNER TO postgres;

\connect DATABASE_NA

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


CREATE TABLE public.bigcities (
    id_city integer NOT NULL,
    city_name character varying(100) NOT NULL,
    population integer NOT NULL,
    year_found integer NOT NULL,
    phone_code character varying(100) NOT NULL,
    id_country integer,
    CONSTRAINT bigcities_city_name_check CHECK (((city_name)::text <> ''::text)),
    CONSTRAINT bigcities_population_check CHECK ((population >= 0))
);


ALTER TABLE public.bigcities OWNER TO postgres;

CREATE SEQUENCE public.bigcities_id_city_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bigcities_id_city_seq OWNER TO postgres;


ALTER SEQUENCE public.bigcities_id_city_seq OWNED BY public.bigcities.id_city;



CREATE TABLE public.countries (
    id_country integer NOT NULL,
    country_name character varying(100),
    population integer NOT NULL,
    area integer NOT NULL,
    year_found integer NOT NULL,
    CONSTRAINT countries_area_check CHECK ((area >= 0)),
    CONSTRAINT countries_population_check CHECK ((population >= 0))
);


ALTER TABLE public.countries OWNER TO postgres;


CREATE SEQUENCE public.countries_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_country_seq OWNER TO postgres;



ALTER SEQUENCE public.countries_id_country_seq OWNED BY public.countries.id_country;



CREATE TABLE public.country_languages (
    id_cl integer NOT NULL,
    id_country integer,
    id_language integer,
    number_speakers integer NOT NULL,
    CONSTRAINT country_languages_number_speakers_check CHECK ((number_speakers >= 0))
);


ALTER TABLE public.country_languages OWNER TO postgres;


CREATE SEQUENCE public.country_languages_id_cl_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_languages_id_cl_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 222
-- Name: country_languages_id_cl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_languages_id_cl_seq OWNED BY public.country_languages.id_cl;


--
-- TOC entry 221 (class 1259 OID 16627)
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id_language integer NOT NULL,
    name_language character varying(50) NOT NULL,
    CONSTRAINT languages_name_language_check CHECK (((name_language)::text <> ''::text))
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16626)
-- Name: languages_id_language_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_language_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.languages_id_language_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 220
-- Name: languages_id_language_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_language_seq OWNED BY public.languages.id_language;


--
-- TOC entry 219 (class 1259 OID 16584)
-- Name: popularattractions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.popularattractions (
    id_attraction integer NOT NULL,
    name_attraction character varying(100) NOT NULL,
    in_whs boolean NOT NULL,
    id_city integer
);


ALTER TABLE public.popularattractions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16583)
-- Name: popularattractions_id_attraction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.popularattractions_id_attraction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.popularattractions_id_attraction_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 218
-- Name: popularattractions_id_attraction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.popularattractions_id_attraction_seq OWNED BY public.popularattractions.id_attraction;


--
-- TOC entry 3194 (class 2604 OID 16573)
-- Name: bigcities id_city; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bigcities ALTER COLUMN id_city SET DEFAULT nextval('public.bigcities_id_city_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16562)
-- Name: countries id_country; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id_country SET DEFAULT nextval('public.countries_id_country_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16750)
-- Name: country_languages id_cl; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages ALTER COLUMN id_cl SET DEFAULT nextval('public.country_languages_id_cl_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16630)
-- Name: languages id_language; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id_language SET DEFAULT nextval('public.languages_id_language_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16587)
-- Name: popularattractions id_attraction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popularattractions ALTER COLUMN id_attraction SET DEFAULT nextval('public.popularattractions_id_attraction_seq'::regclass);


--
-- TOC entry 3373 (class 0 OID 16570)
-- Dependencies: 217
-- Data for Name: bigcities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bigcities VALUES (1, 'Washington, D.C.', 689545, 1790, '+1-202', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (2, 'New York City', 8419000, 1624, '+1-212', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (3, 'Mexico City', 9209944, 1325, '+52-55', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (4, 'Cancun', 888797, 1970, '+52-998', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (5, 'Ottawa', 1011000, 1826, '+1-613', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (6, 'Toronto', 2930000, 1834, '+1-416', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (7, 'Havana', 2141652, 1519, '+53-7', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (8, 'Varadero', 27622, 1887, '+53-45', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (9, 'Guatemala City', 994938, 1776, '+502', 5) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (10, 'Antigua Guatemala', 46428, 1543, '+502', 5) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (11, 'Managua', 1028808, 1819, '+505-2', 6) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (12, 'Granada', 123697, 1524, '+505', 6) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (13, 'San Jose', 334345, 1739, '+506', 7) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (14, 'Liberia', 63112, 1836, '+506', 7) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (15, 'Panama City', 1705341, 1519, '+507', 8) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (16, 'Santo Domingo', 965040, 1496, '+1-809', 9) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (17, 'Punta Cana', 100023, 1969, '+1-809', 9) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (18, 'Port-au-Prince', 987310, 1749, '+509', 10) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (19, 'Kingston', 670022, 1692, '+1-876', 11) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (20, 'Nassau', 274400, 1670, '+1-242', 12) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (21, 'Bridgetown', 110000, 1628, '+1-246', 13) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (22, 'Saint Johns', 22319, 1632, '+1-268', 14) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (23, 'St.Georges', 37519, 1650, '+1-473', 15) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (24, 'Roseau', 16582, 1674, '+1-767', 16) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (25, 'Castries', 20000, 1650, '+1-758', 17) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (26, 'Kingstown', 16849, 1839, '+1-784', 18) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (27, 'Port of Spain', 367000, 1560, '+1-868', 19) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (28, 'Belmopan', 17300, 1970, '+501', 20) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (29, 'San Pedro', 17555, 1848, '+501', 20) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (30, 'San Salvador', 2382446, 1525, '+503', 21) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (31, 'Tegucigalpa', 1165000, 1578, '+504', 22) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (32, 'San Juan', 318441, 1521, '+1-787', 23) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (33, 'Ponce', 155038, 1692, '+1-787', 23) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (35, 'Chicago', 2706000, 1833, '+1-312', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (36, 'Seattle', 737015, 1851, '+1-206', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (37, 'Vancouver', 2475247, 1886, '+1-604', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (38, 'Quebec City', 542298, 1608, '+1-418', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (39, 'Cozumel', 100000, 1847, '+52-987', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (40, 'Montego Bay', 110115, 1906, '+1-876', 11) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (41, 'Bocas Town', 7600, 1826, '+507', 8) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (42, 'La Romana', 214276, 1897, '+1-809', 9) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (43, 'Eagle Beach', 10000, 1800, '+297', 16) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (44, 'Ocho Rios', 96691, 1948, '+1-876', 11) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (45, 'San Jose del Cabo', 93521, 1730, '+52-624', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (46, 'Ensenada', 52299, 1542, '+52-646', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (47, 'Gran Bahia Principe', 65959, 2000, '+52-984', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (48, 'Curepe', 9093, 1984, '+1-868', 19) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (49, 'Chaguanas', 83489, 1970, '+1-868', 19) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (50, 'Parika', 4999, 1833, '+592', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bigcities VALUES (34, 'San Francisco', 3979576, 1781, '+1-213', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3371 (class 0 OID 16559)
-- Dependencies: 215
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries VALUES (1, 'United States', 332403650, 9833517, 1776) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (2, 'Mexico', 128932488, 1964375, 1821) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (3, 'Canada', 38005238, 9984670, 1867) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (4, 'Cuba', 11326616, 109884, 1959) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (5, 'Guatemala', 17247843, 108889, 1821) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (6, 'Nicaragua', 6621584, 130370, 1838) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (7, 'Costa Rica', 5094118, 51100, 1821) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (8, 'Panama', 4314768, 75517, 1903) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (9, 'Dominican Republic', 10847904, 48671, 1844) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (10, 'Haiti', 11402533, 27750, 1804) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (11, 'Jamaica', 2961167, 10991, 1962) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (12, 'Bahamas', 393248, 13943, 1973) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (13, 'Barbados', 287375, 430, 1966) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (14, 'Antigua and Barbuda', 97118, 442, 1981) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (15, 'Grenada', 112523, 344, 1974) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (16, 'Dominica', 72169, 751, 1978) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (17, 'Saint Lucia', 183629, 616, 1979) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (18, 'Saint Vincent and the Grenadines', 110940, 389, 1979) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (19, 'Trinidad and Tobago', 1399491, 5128, 1962) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (20, 'Belize', 408487, 22966, 1981) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (21, 'El Salvador', 6704864, 21041, 1821) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (22, 'Honduras', 9904608, 112492, 1821) ON CONFLICT DO NOTHING;
INSERT INTO public.countries VALUES (23, 'Puerto Rico', 3261742, 9104, 1898) ON CONFLICT DO NOTHING;


--
-- TOC entry 3379 (class 0 OID 16747)
-- Dependencies: 223
-- Data for Name: country_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.country_languages VALUES (1, 1, 1, 279219066) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (2, 1, 2, 64818712) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (3, 1, 3, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (4, 1, 4, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (5, 1, 5, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (6, 1, 6, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (7, 1, 7, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (8, 1, 8, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (9, 1, 9, 3324037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (10, 2, 1, 6446624) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (11, 2, 2, 117973227) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (12, 2, 3, 644662) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (13, 2, 4, 128932) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (14, 2, 5, 257865) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (15, 2, 6, 386797) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (16, 2, 7, 515730) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (17, 2, 8, 644662) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (18, 2, 9, 773595) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (19, 3, 1, 25083457) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (20, 3, 2, 380052) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (21, 3, 3, 8361152) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (22, 3, 4, 266037) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (23, 3, 5, 304042) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (24, 3, 6, 342047) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (25, 3, 7, 380052) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (26, 3, 8, 418058) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (27, 3, 9, 456063) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (28, 4, 1, 113266) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (29, 4, 2, 11326616) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (30, 4, 3, 56633) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (31, 4, 4, 22653) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (32, 4, 5, 33980) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (33, 4, 6, 45306) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (34, 4, 7, 56633) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (35, 4, 8, 67960) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (36, 4, 9, 79286) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (37, 5, 1, 1379827) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (38, 5, 2, 12073490) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (39, 5, 3, 258718) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (40, 5, 4, 172478) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (41, 5, 5, 344957) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (42, 5, 6, 517435) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (43, 5, 7, 689914) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (44, 5, 8, 862392) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (45, 5, 9, 1034871) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (46, 6, 1, 66216) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (47, 6, 2, 6091857) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (48, 6, 3, 33108) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (49, 6, 4, 13243) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (50, 6, 5, 19865) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (51, 6, 6, 26486) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (52, 6, 7, 33108) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (53, 6, 8, 39730) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (54, 6, 9, 46351) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (55, 7, 1, 101882) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (56, 7, 2, 4890353) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (57, 7, 3, 25471) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (58, 7, 4, 10188) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (59, 7, 5, 15282) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (60, 7, 6, 20376) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (61, 7, 7, 25471) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (62, 7, 8, 30565) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (63, 7, 9, 35659) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (64, 8, 1, 43148) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (65, 8, 2, 3710700) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (66, 8, 3, 21574) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (67, 8, 4, 8630) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (68, 8, 5, 12944) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (69, 8, 6, 17259) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (70, 8, 7, 21574) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (71, 8, 8, 25889) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (72, 8, 9, 30203) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (73, 9, 1, 108479) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (74, 9, 2, 10630946) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (75, 9, 3, 54240) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (76, 9, 4, 216958) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (77, 9, 5, 32544) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (78, 9, 6, 43392) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (79, 9, 7, 54240) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (80, 9, 8, 65087) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (81, 9, 9, 75935) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (82, 10, 1, 114025) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (83, 10, 2, 228051) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (84, 10, 3, 798177) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (85, 10, 4, 10832406) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (86, 10, 5, 34208) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (87, 10, 6, 45610) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (88, 10, 7, 57013) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (89, 10, 8, 68415) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (90, 10, 9, 79818) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (91, 11, 1, 2961167) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (92, 11, 2, 266505) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (93, 11, 3, 14806) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (94, 11, 4, 5922) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (95, 11, 5, 8884) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (96, 11, 6, 11845) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (97, 11, 7, 14806) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (98, 11, 8, 17767) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (99, 11, 9, 20728) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (100, 12, 1, 393248) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (101, 12, 2, 35392) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (102, 12, 3, 1966) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (103, 12, 4, 786) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (104, 12, 5, 1180) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (105, 12, 6, 1573) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (106, 12, 7, 1966) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (107, 12, 8, 2359) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (108, 12, 9, 2753) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (109, 13, 1, 287375) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (110, 13, 2, 25864) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (111, 13, 3, 1437) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (112, 13, 4, 575) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (113, 13, 5, 862) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (114, 13, 6, 1150) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (115, 13, 7, 1437) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (116, 13, 8, 1724) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (117, 13, 9, 2012) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (118, 14, 1, 97118) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (119, 14, 2, 8741) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (120, 14, 3, 486) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (121, 14, 4, 194) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (122, 14, 5, 291) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (123, 14, 6, 388) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (124, 14, 7, 486) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (125, 14, 8, 583) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (126, 14, 9, 680) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (127, 15, 1, 96770) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (128, 15, 2, 10127) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (129, 15, 3, 11252) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (130, 15, 4, 7877) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (131, 15, 5, 3376) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (132, 15, 6, 450) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (133, 15, 7, 563) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (134, 15, 8, 675) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (135, 15, 9, 788) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (136, 15, 1, 64952) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (137, 15, 2, 4330) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (138, 15, 3, 361) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (139, 15, 4, 144) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (140, 15, 5, 217) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (141, 15, 6, 289) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (142, 15, 7, 361) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (143, 15, 8, 433) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (144, 15, 9, 505) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (145, 17, 1, 17445) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (146, 17, 2, 1836) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (147, 17, 3, 918) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (148, 17, 4, 367) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (149, 17, 5, 551) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (150, 17, 6, 735) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (151, 17, 7, 918) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (152, 17, 8, 1102) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (153, 17, 9, 1285) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (154, 18, 1, 9430) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (155, 18, 2, 1109) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (156, 18, 3, 555) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (157, 18, 4, 222) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (158, 18, 5, 333) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (159, 18, 6, 444) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (160, 18, 7, 555) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (161, 18, 8, 666) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (162, 18, 9, 777) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (163, 19, 1, 137150) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (164, 19, 2, 13995) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (165, 19, 3, 6997) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (166, 19, 4, 2799) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (167, 19, 5, 4198) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (168, 19, 6, 5598) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (169, 19, 7, 6997) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (170, 19, 8, 8397) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (171, 19, 9, 9796) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (172, 20, 1, 269601) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (173, 20, 2, 53103) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (174, 20, 3, 4085) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (175, 20, 4, 817) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (176, 20, 5, 1225) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (177, 20, 6, 1634) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (178, 20, 7, 2042) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (179, 20, 8, 2451) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (180, 20, 9, 2859) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (181, 21, 1, 67049) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (182, 21, 2, 6369621) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (183, 21, 3, 67049) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (184, 21, 4, 13410) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (185, 21, 5, 20115) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (186, 21, 6, 26819) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (187, 21, 7, 33524) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (188, 21, 8, 40229) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (189, 21, 9, 46934) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (190, 22, 1, 49523) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (191, 22, 2, 9656993) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (192, 22, 3, 49523) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (193, 22, 4, 19809) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (194, 22, 5, 29714) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (195, 22, 6, 39618) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (196, 22, 7, 49523) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (197, 22, 8, 59428) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (198, 22, 9, 69332) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (199, 23, 2, 2870333) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (200, 23, 1, 195705) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (201, 23, 3, 16309) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (202, 23, 4, 6523) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (203, 23, 5, 9785) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (204, 23, 6, 13047) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (205, 23, 7, 16309) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (206, 23, 8, 19570) ON CONFLICT DO NOTHING;
INSERT INTO public.country_languages VALUES (207, 23, 9, 22832) ON CONFLICT DO NOTHING;


--
-- TOC entry 3377 (class 0 OID 16627)
-- Dependencies: 221
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.languages VALUES (1, 'English') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (2, 'Spanish') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (3, 'French') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (4, 'Haitian Creole') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (5, 'American Sign Language') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (6, 'Chinese') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (7, 'Tagalog') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (8, 'Vietnamese') ON CONFLICT DO NOTHING;
INSERT INTO public.languages VALUES (9, 'German') ON CONFLICT DO NOTHING;


--
-- TOC entry 3375 (class 0 OID 16584)
-- Dependencies: 219
-- Data for Name: popularattractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.popularattractions VALUES (1, 'Lincoln Memorial', false, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (2, 'Statue of Liberty', true, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (3, 'National Mall', false, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (4, 'Times Square', false, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (5, 'Zocalo', false, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (6, 'Chichen Itza', true, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (7, 'Parliament Hill', false, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (8, 'CN Tower', false, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (9, 'Old Havana', true, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (10, 'Varadero Beach', false, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (11, 'National Palace of Culture', false, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (12, 'Antigua Guatemala Ruins', true, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (13, 'Cathedral of Managua', false, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (14, 'Granada Cathedral', false, 12) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (15, 'National Theatre of Costa Rica', false, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (16, 'Africa Mia Safari Park', false, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (17, 'Panama Canal', false, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (18, 'Alcazar de Colon', true, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (19, 'Boca Chica Beach', false, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (20, 'Sans-Souci Palace', true, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (21, 'Devon House', false, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (22, 'Atlantis Paradise Island', false, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (23, 'Bridgetown Harbour', false, 21) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (24, 'St. John Cathedral', false, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (25, 'Fort George', false, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (26, 'Morne Trois Pitons National Park', true, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (27, 'Pigeon Island National Landmark', false, 25) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (28, 'Botanical Gardens', false, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (29, 'Queen Park Savannah', false, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (30, 'Belize Zoo', false, 28) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (31, 'Hol Chan Marine Reserve', false, 29) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (32, 'Metropolitan Cathedral', false, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (33, 'Honduras Maya Archaeological Site', true, 31) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (34, 'El Yunque National Forest', false, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (35, 'Castillo Serralles', false, 33) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (36, 'Golden Gate Bridge', false, 34) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (37, 'Millennium Park', false, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (38, 'Space Needle', false, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (39, 'Stanley Park', false, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (40, 'Citadelle of Quebec', true, 38) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (41, 'Palancar Reef', false, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (42, 'Doctor Cave Beach Club', false, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (43, 'Red Frog Beach', false, 41) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (44, 'Altos de ChavГіn', false, 42) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (45, 'Aruba Aloe Museum & Factory', false, 43) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (46, 'Dunn River Falls', false, 44) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (47, 'Todos Santos Plaza', false, 45) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (48, 'La Bufadora', false, 46) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (49, 'Xcaret Park', false, 47) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (50, 'Caroni Bird Sanctuary', false, 48) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (51, 'Waterloo', false, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (52, 'Jambay', false, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (53, 'Cloud Gate', false, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.popularattractions VALUES (54, 'Empire State Building', false, 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: bigcities_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bigcities_id_city_seq', 1, false);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 214
-- Name: countries_id_country_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_country_seq', 1, false);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 222
-- Name: country_languages_id_cl_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_languages_id_cl_seq', 207, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 220
-- Name: languages_id_language_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_language_seq', 9, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 218
-- Name: popularattractions_id_attraction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.popularattractions_id_attraction_seq', 1, false);


--
-- TOC entry 3210 (class 2606 OID 16577)
-- Name: bigcities bigcities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bigcities
    ADD CONSTRAINT bigcities_pkey PRIMARY KEY (id_city);


--
-- TOC entry 3205 (class 2606 OID 16568)
-- Name: countries countries_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_name_key UNIQUE (country_name);


--
-- TOC entry 3207 (class 2606 OID 16566)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3222 (class 2606 OID 16753)
-- Name: country_languages country_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT country_languages_pkey PRIMARY KEY (id_cl);


--
-- TOC entry 3218 (class 2606 OID 16636)
-- Name: languages languages_name_language_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_language_key UNIQUE (name_language);


--
-- TOC entry 3220 (class 2606 OID 16634)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id_language);


--
-- TOC entry 3214 (class 2606 OID 16591)
-- Name: popularattractions popularattractions_name_attraction_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popularattractions
    ADD CONSTRAINT popularattractions_name_attraction_key UNIQUE (name_attraction);


--
-- TOC entry 3216 (class 2606 OID 16589)
-- Name: popularattractions popularattractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popularattractions
    ADD CONSTRAINT popularattractions_pkey PRIMARY KEY (id_attraction);


--
-- TOC entry 3211 (class 1259 OID 16999)
-- Name: idx_bigcities_population; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bigcities_population ON public.bigcities USING btree (population);


--
-- TOC entry 3208 (class 1259 OID 17000)
-- Name: idx_countries_year_found; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_countries_year_found ON public.countries USING btree (year_found);


--
-- TOC entry 3223 (class 1259 OID 17001)
-- Name: idx_country_languages_id_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_country_languages_id_language ON public.country_languages USING btree (id_language);


--
-- TOC entry 3212 (class 1259 OID 17002)
-- Name: idx_popularattractions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_popularattractions ON public.popularattractions USING btree (in_whs);


--
-- TOC entry 3224 (class 2606 OID 16578)
-- Name: bigcities bigcities_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bigcities
    ADD CONSTRAINT bigcities_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.countries(id_country);


--
-- TOC entry 3226 (class 2606 OID 16754)
-- Name: country_languages country_languages_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT country_languages_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.countries(id_country);


--
-- TOC entry 3227 (class 2606 OID 16759)
-- Name: country_languages country_languages_id_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT country_languages_id_language_fkey FOREIGN KEY (id_language) REFERENCES public.languages(id_language);


--
-- TOC entry 3225 (class 2606 OID 16592)
-- Name: popularattractions popularattractions_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popularattractions
    ADD CONSTRAINT popularattractions_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.bigcities(id_city);


--
-- PostgreSQL database dump complete
--

