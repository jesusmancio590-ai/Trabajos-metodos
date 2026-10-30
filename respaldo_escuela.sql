--
-- PostgreSQL database dump
--

\restrict zI6bXXD9E9n2GXGnKt1kATqclFhGDlG1yFNsr97YoWyOzVuFVV8THi4JwtQt5IV

-- Dumped from database version 17.11 (Debian 17.11-0+deb13u1)
-- Dumped by pg_dump version 17.11 (Debian 17.11-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    numero_control character varying(20) NOT NULL
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- Name: alumnos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumnos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alumnos_id_seq OWNER TO postgres;

--
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_id_seq OWNED BY public.alumnos.id;


--
-- Name: calificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    alumno_id integer,
    materia_id integer,
    calificacion numeric(5,2),
    CONSTRAINT calificaciones_calificacion_check CHECK (((calificacion >= (0)::numeric) AND (calificacion <= (100)::numeric)))
);


ALTER TABLE public.calificaciones OWNER TO postgres;

--
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calificaciones_id_seq OWNER TO postgres;

--
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;


--
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    id integer NOT NULL,
    nombre_materia character varying(100) NOT NULL,
    semestre integer NOT NULL
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- Name: materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materias_id_seq OWNER TO postgres;

--
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_id_seq OWNED BY public.materias.id;


--
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumnos_id_seq'::regclass);


--
-- Name: calificaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);


--
-- Name: materias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias ALTER COLUMN id SET DEFAULT nextval('public.materias_id_seq'::regclass);


--
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido, numero_control) FROM stdin;
1	Jorge	Rodríguez	CTRL-0001
2	Diana	Torres	CTRL-0002
3	Jorge	González	CTRL-0003
4	Sofía	Jiménez	CTRL-0004
5	Valeria	Hernández	CTRL-0005
6	Carlos	Reyes	CTRL-0006
7	Carlos	Pérez	CTRL-0007
8	Ana	Rodríguez	CTRL-0008
9	Carlos	Ruiz	CTRL-0009
10	Carlos	Reyes	CTRL-0010
11	Carlos	González	CTRL-0011
12	Gabriela	Ruiz	CTRL-0012
13	Diana	López	CTRL-0013
14	Diana	Hernández	CTRL-0014
15	José	Flores	CTRL-0015
16	Ricardo	Rodríguez	CTRL-0016
17	Diana	Martínez	CTRL-0017
18	María	Morales	CTRL-0018
19	José	López	CTRL-0019
20	José	Ramírez	CTRL-0020
21	Daniel	Jiménez	CTRL-0021
22	Luis	Rodríguez	CTRL-0022
23	Alejandro	Gómez	CTRL-0023
24	Daniel	Torres	CTRL-0024
25	Jorge	Martínez	CTRL-0025
26	Gabriela	Jiménez	CTRL-0026
27	María	Martínez	CTRL-0027
28	Ricardo	Reyes	CTRL-0028
29	Sofía	Reyes	CTRL-0029
30	Ricardo	Ramírez	CTRL-0030
31	Luis	Gómez	CTRL-0031
32	Jorge	Gómez	CTRL-0032
33	José	Ruiz	CTRL-0033
34	María	Morales	CTRL-0034
35	José	Gómez	CTRL-0035
36	Sofía	Torres	CTRL-0036
37	Sofía	Ruiz	CTRL-0037
38	José	Reyes	CTRL-0038
39	Luis	Morales	CTRL-0039
40	Valeria	Pérez	CTRL-0040
41	Sofía	Jiménez	CTRL-0041
42	Daniel	Morales	CTRL-0042
43	Diana	Morales	CTRL-0043
44	Alejandro	Hernández	CTRL-0044
45	Diana	Torres	CTRL-0045
46	Gabriela	Jiménez	CTRL-0046
47	Carmen	Rodríguez	CTRL-0047
48	Ricardo	Jiménez	CTRL-0048
49	Valeria	Torres	CTRL-0049
50	Luis	Pérez	CTRL-0050
51	Jorge	Martínez	CTRL-0051
52	Carmen	Martínez	CTRL-0052
53	María	González	CTRL-0053
54	Daniel	Morales	CTRL-0054
55	Diana	Ramírez	CTRL-0055
56	María	Torres	CTRL-0056
57	Fernando	Ramírez	CTRL-0057
58	José	Cruz	CTRL-0058
59	Gabriela	González	CTRL-0059
60	José	Rodríguez	CTRL-0060
61	Carmen	Morales	CTRL-0061
62	Ana	Morales	CTRL-0062
63	Daniel	Martínez	CTRL-0063
64	Carmen	Rodríguez	CTRL-0064
65	Alejandro	González	CTRL-0065
66	Gabriela	Cruz	CTRL-0066
67	Jorge	Ramírez	CTRL-0067
68	Carlos	Rodríguez	CTRL-0068
69	Ana	Jiménez	CTRL-0069
70	Fernando	Rodríguez	CTRL-0070
71	Fernando	Rodríguez	CTRL-0071
72	Gabriela	Hernández	CTRL-0072
73	Sofía	Flores	CTRL-0073
74	Valeria	Torres	CTRL-0074
75	Ricardo	Ruiz	CTRL-0075
76	José	Morales	CTRL-0076
77	Ricardo	Jiménez	CTRL-0077
78	Ricardo	Reyes	CTRL-0078
79	Carlos	Hernández	CTRL-0079
80	Valeria	Rodríguez	CTRL-0080
81	Carmen	González	CTRL-0081
82	Luis	Jiménez	CTRL-0082
83	María	Ruiz	CTRL-0083
84	Alejandro	López	CTRL-0084
85	Diana	Pérez	CTRL-0085
86	Carlos	Pérez	CTRL-0086
87	Luis	Rodríguez	CTRL-0087
88	Luis	Gómez	CTRL-0088
89	Diana	Rodríguez	CTRL-0089
90	Jorge	Torres	CTRL-0090
91	Valeria	López	CTRL-0091
92	Luis	Reyes	CTRL-0092
93	Carmen	Hernández	CTRL-0093
94	Sofía	Rodríguez	CTRL-0094
95	Sofía	Reyes	CTRL-0095
96	Luis	Hernández	CTRL-0096
97	Diana	Torres	CTRL-0097
98	Jorge	López	CTRL-0098
99	Ricardo	Hernández	CTRL-0099
100	Carlos	Hernández	CTRL-0100
\.


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, alumno_id, materia_id, calificacion) FROM stdin;
1	1	1	69.07
2	2	1	98.68
3	3	1	92.25
4	4	1	60.62
5	5	1	84.95
6	6	1	83.56
7	7	1	98.47
8	8	1	69.11
9	9	1	86.61
10	10	1	85.62
11	11	1	76.75
12	12	1	85.22
13	13	1	98.81
14	14	1	75.71
15	15	1	74.27
16	16	1	72.02
17	17	1	65.28
18	18	1	95.75
19	19	1	73.33
20	20	1	93.63
21	21	1	72.29
22	22	1	69.48
23	23	1	84.49
24	24	1	66.56
25	25	1	84.15
26	26	1	91.20
27	27	1	96.10
28	28	1	71.11
29	29	1	64.51
30	30	1	82.30
31	31	1	76.16
32	32	1	87.82
33	33	1	77.68
34	34	1	93.62
35	35	1	65.13
36	36	1	80.34
37	37	1	82.37
38	38	1	76.35
39	39	1	64.03
40	40	1	81.65
41	41	1	77.07
42	42	1	94.13
43	43	1	90.82
44	44	1	60.70
45	45	1	89.25
46	46	1	60.25
47	47	1	73.81
48	48	1	93.35
49	49	1	62.70
50	50	1	83.95
51	51	1	60.58
52	52	1	68.10
53	53	1	96.76
54	54	1	92.83
55	55	1	94.58
56	56	1	82.03
57	57	1	78.63
58	58	1	97.24
59	59	1	89.39
60	60	1	74.06
61	61	1	80.77
62	62	1	78.22
63	63	1	89.98
64	64	1	69.35
65	65	1	96.57
66	66	1	75.09
67	67	1	74.71
68	68	1	76.77
69	69	1	62.87
70	70	1	75.71
71	71	1	74.18
72	72	1	90.38
73	73	1	99.71
74	74	1	91.43
75	75	1	65.59
76	76	1	96.17
77	77	1	97.57
78	78	1	62.46
79	79	1	84.91
80	80	1	76.33
81	81	1	65.02
82	82	1	92.68
83	83	1	91.60
84	84	1	87.75
85	85	1	74.22
86	86	1	66.64
87	87	1	92.68
88	88	1	79.82
89	89	1	64.00
90	90	1	70.80
91	91	1	72.55
92	92	1	69.54
93	93	1	67.31
94	94	1	90.17
95	95	1	75.47
96	96	1	83.49
97	97	1	83.24
98	98	1	90.95
99	99	1	75.28
100	100	1	65.01
101	1	2	62.06
102	2	2	70.19
103	3	2	98.22
104	4	2	64.00
105	5	2	75.54
106	6	2	60.35
107	7	2	92.16
108	8	2	68.94
109	9	2	94.12
110	10	2	69.93
111	11	2	82.26
112	12	2	75.14
113	13	2	88.56
114	14	2	95.66
115	15	2	78.39
116	16	2	81.81
117	17	2	87.84
118	18	2	84.54
119	19	2	64.65
120	20	2	79.59
121	21	2	67.00
122	22	2	89.19
123	23	2	97.09
124	24	2	80.12
125	25	2	61.30
126	26	2	74.82
127	27	2	66.49
128	28	2	85.57
129	29	2	87.49
130	30	2	68.80
131	31	2	64.34
132	32	2	99.88
133	33	2	70.31
134	34	2	98.07
135	35	2	63.64
136	36	2	70.18
137	37	2	90.80
138	38	2	64.86
139	39	2	99.70
140	40	2	60.65
141	41	2	88.42
142	42	2	80.17
143	43	2	78.02
144	44	2	61.40
145	45	2	84.62
146	46	2	82.78
147	47	2	65.73
148	48	2	63.25
149	49	2	60.92
150	50	2	96.74
151	51	2	91.93
152	52	2	72.43
153	53	2	79.50
154	54	2	90.43
155	55	2	89.11
156	56	2	97.07
157	57	2	99.20
158	58	2	66.74
159	59	2	72.60
160	60	2	70.57
161	61	2	94.10
162	62	2	90.97
163	63	2	70.36
164	64	2	85.00
165	65	2	94.01
166	66	2	65.29
167	67	2	83.39
168	68	2	82.06
169	69	2	66.13
170	70	2	62.35
171	71	2	85.82
172	72	2	86.23
173	73	2	78.68
174	74	2	61.53
175	75	2	96.57
176	76	2	97.55
177	77	2	63.70
178	78	2	91.16
179	79	2	61.01
180	80	2	60.01
181	81	2	93.73
182	82	2	88.20
183	83	2	62.58
184	84	2	88.72
185	85	2	66.12
186	86	2	77.74
187	87	2	77.28
188	88	2	70.35
189	89	2	91.99
190	90	2	99.60
191	91	2	99.66
192	92	2	75.37
193	93	2	84.43
194	94	2	76.95
195	95	2	81.85
196	96	2	77.87
197	97	2	72.74
198	98	2	96.15
199	99	2	81.10
200	100	2	90.04
201	1	3	72.94
202	2	3	66.08
203	3	3	84.04
204	4	3	74.81
205	5	3	84.53
206	6	3	76.28
207	7	3	95.66
208	8	3	63.28
209	9	3	69.42
210	10	3	84.95
211	11	3	74.02
212	12	3	87.14
213	13	3	90.09
214	14	3	97.19
215	15	3	84.45
216	16	3	65.76
217	17	3	70.17
218	18	3	68.02
219	19	3	77.95
220	20	3	82.99
221	21	3	93.98
222	22	3	73.93
223	23	3	79.52
224	24	3	92.03
225	25	3	65.70
226	26	3	62.34
227	27	3	60.70
228	28	3	94.34
229	29	3	95.98
230	30	3	92.34
231	31	3	92.54
232	32	3	68.36
233	33	3	73.88
234	34	3	62.46
235	35	3	86.26
236	36	3	85.11
237	37	3	67.02
238	38	3	84.47
239	39	3	67.28
240	40	3	91.65
241	41	3	64.93
242	42	3	95.04
243	43	3	68.38
244	44	3	95.77
245	45	3	63.58
246	46	3	73.42
247	47	3	78.62
248	48	3	87.13
249	49	3	61.33
250	50	3	96.86
251	51	3	81.16
252	52	3	71.94
253	53	3	76.85
254	54	3	68.42
255	55	3	90.14
256	56	3	83.01
257	57	3	83.05
258	58	3	82.07
259	59	3	67.39
260	60	3	87.74
261	61	3	65.78
262	62	3	94.28
263	63	3	69.70
264	64	3	97.33
265	65	3	78.76
266	66	3	81.54
267	67	3	87.61
268	68	3	77.52
269	69	3	75.36
270	70	3	90.65
271	71	3	96.52
272	72	3	68.82
273	73	3	98.38
274	74	3	74.62
275	75	3	97.58
276	76	3	66.78
277	77	3	98.39
278	78	3	87.22
279	79	3	71.60
280	80	3	63.56
281	81	3	74.38
282	82	3	64.63
283	83	3	66.90
284	84	3	87.36
285	85	3	93.26
286	86	3	83.24
287	87	3	71.35
288	88	3	69.75
289	89	3	90.66
290	90	3	89.78
291	91	3	99.71
292	92	3	90.11
293	93	3	94.79
294	94	3	76.62
295	95	3	99.45
296	96	3	85.89
297	97	3	93.79
298	98	3	84.34
299	99	3	79.82
300	100	3	81.25
301	1	4	76.28
302	2	4	91.60
303	3	4	88.04
304	4	4	83.84
305	5	4	85.15
306	6	4	87.20
307	7	4	69.46
308	8	4	78.95
309	9	4	97.70
310	10	4	93.34
311	11	4	66.75
312	12	4	80.15
313	13	4	67.49
314	14	4	62.13
315	15	4	87.47
316	16	4	86.16
317	17	4	81.68
318	18	4	92.33
319	19	4	76.96
320	20	4	75.96
321	21	4	64.40
322	22	4	76.25
323	23	4	62.30
324	24	4	65.70
325	25	4	67.09
326	26	4	79.27
327	27	4	68.52
328	28	4	96.77
329	29	4	61.90
330	30	4	67.82
331	31	4	67.19
332	32	4	77.09
333	33	4	72.20
334	34	4	99.65
335	35	4	78.66
336	36	4	92.94
337	37	4	81.96
338	38	4	60.41
339	39	4	66.59
340	40	4	87.04
341	41	4	80.27
342	42	4	70.01
343	43	4	97.90
344	44	4	76.79
345	45	4	89.14
346	46	4	62.39
347	47	4	86.44
348	48	4	81.42
349	49	4	87.97
350	50	4	91.24
351	51	4	67.40
352	52	4	65.01
353	53	4	91.64
354	54	4	71.89
355	55	4	81.95
356	56	4	70.39
357	57	4	97.30
358	58	4	65.72
359	59	4	93.75
360	60	4	73.25
361	61	4	61.35
362	62	4	87.48
363	63	4	76.79
364	64	4	97.06
365	65	4	74.14
366	66	4	67.96
367	67	4	80.81
368	68	4	76.55
369	69	4	60.46
370	70	4	94.31
371	71	4	66.49
372	72	4	87.61
373	73	4	89.49
374	74	4	92.57
375	75	4	81.10
376	76	4	86.31
377	77	4	92.35
378	78	4	67.89
379	79	4	79.98
380	80	4	89.55
381	81	4	65.90
382	82	4	91.80
383	83	4	61.00
384	84	4	73.74
385	85	4	80.97
386	86	4	66.66
387	87	4	61.04
388	88	4	85.45
389	89	4	84.31
390	90	4	80.37
391	91	4	86.42
392	92	4	79.57
393	93	4	75.72
394	94	4	74.48
395	95	4	85.96
396	96	4	94.68
397	97	4	99.95
398	98	4	71.37
399	99	4	86.42
400	100	4	85.67
401	1	5	63.70
402	2	5	77.79
403	3	5	76.90
404	4	5	76.84
405	5	5	79.68
406	6	5	78.86
407	7	5	70.76
408	8	5	87.56
409	9	5	85.47
410	10	5	77.29
411	11	5	71.10
412	12	5	66.43
413	13	5	61.23
414	14	5	95.66
415	15	5	61.32
416	16	5	79.17
417	17	5	96.55
418	18	5	95.43
419	19	5	94.81
420	20	5	92.73
421	21	5	92.68
422	22	5	84.56
423	23	5	95.87
424	24	5	83.70
425	25	5	89.53
426	26	5	95.80
427	27	5	80.13
428	28	5	82.44
429	29	5	63.48
430	30	5	71.19
431	31	5	72.39
432	32	5	80.52
433	33	5	96.27
434	34	5	94.61
435	35	5	72.25
436	36	5	66.95
437	37	5	85.80
438	38	5	72.54
439	39	5	92.83
440	40	5	61.84
441	41	5	63.01
442	42	5	71.05
443	43	5	69.36
444	44	5	86.38
445	45	5	67.76
446	46	5	91.80
447	47	5	87.00
448	48	5	88.68
449	49	5	99.63
450	50	5	92.14
451	51	5	97.47
452	52	5	97.63
453	53	5	62.24
454	54	5	92.32
455	55	5	95.28
456	56	5	72.91
457	57	5	85.63
458	58	5	65.45
459	59	5	74.35
460	60	5	63.76
461	61	5	88.65
462	62	5	61.87
463	63	5	99.91
464	64	5	75.56
465	65	5	94.88
466	66	5	63.00
467	67	5	75.30
468	68	5	71.04
469	69	5	67.08
470	70	5	75.71
471	71	5	84.66
472	72	5	92.62
473	73	5	77.92
474	74	5	70.12
475	75	5	83.97
476	76	5	61.65
477	77	5	87.05
478	78	5	94.92
479	79	5	96.13
480	80	5	98.23
481	81	5	64.05
482	82	5	97.63
483	83	5	60.76
484	84	5	79.34
485	85	5	94.39
486	86	5	80.86
487	87	5	75.70
488	88	5	78.30
489	89	5	73.09
490	90	5	83.58
491	91	5	95.80
492	92	5	91.37
493	93	5	64.45
494	94	5	91.88
495	95	5	82.63
496	96	5	64.96
497	97	5	86.09
498	98	5	87.92
499	99	5	83.46
500	100	5	79.54
\.


--
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias (id, nombre_materia, semestre) FROM stdin;
1	Sistemas Operativos	4
2	Seguridad Informática	6
3	Programación Web	5
4	Bases de Datos	3
5	Inteligencia Artificial	7
\.


--
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_id_seq', 100, true);


--
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 500, true);


--
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_id_seq', 5, true);


--
-- Name: alumnos alumnos_numero_control_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_numero_control_key UNIQUE (numero_control);


--
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- Name: calificaciones un_alumno_materia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT un_alumno_materia UNIQUE (alumno_id, materia_id);


--
-- Name: calificaciones calificaciones_alumno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_alumno_id_fkey FOREIGN KEY (alumno_id) REFERENCES public.alumnos(id) ON DELETE CASCADE;


--
-- Name: calificaciones calificaciones_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materias(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict zI6bXXD9E9n2GXGnKt1kATqclFhGDlG1yFNsr97YoWyOzVuFVV8THi4JwtQt5IV

