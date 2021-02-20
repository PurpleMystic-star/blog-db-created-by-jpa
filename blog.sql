--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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
-- Name: t_comment; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_comment (
    id integer NOT NULL,
    agent character varying(255),
    created timestamp without time zone,
    ip character varying(255),
    mail character varying(255),
    status character varying(255),
    text character varying(255),
    type character varying(255),
    url character varying(255),
    comment_author_id integer,
    content_id integer,
    parent_comment_id integer
);


ALTER TABLE public.t_comment OWNER TO blog;

--
-- Name: t_content; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_content (
    id integer NOT NULL,
    comments_num integer NOT NULL,
    created timestamp without time zone,
    is_allowed_comment boolean NOT NULL,
    is_allowed_feed boolean NOT NULL,
    is_allowed_ping boolean NOT NULL,
    modified timestamp without time zone,
    order_num integer NOT NULL,
    password character varying(255),
    slug character varying(255),
    status character varying(255),
    template character varying(255),
    text character varying(255),
    title character varying(255),
    type character varying(255),
    author_id integer
);


ALTER TABLE public.t_content OWNER TO blog;

--
-- Name: t_meta; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_meta (
    id integer NOT NULL,
    count integer NOT NULL,
    description character varying(255),
    name character varying(255),
    order_num integer NOT NULL,
    slug character varying(255),
    type character varying(255)
);


ALTER TABLE public.t_meta OWNER TO blog;

--
-- Name: t_option; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_option (
    id integer NOT NULL,
    name character varying(255),
    value character varying(255),
    user_id integer
);


ALTER TABLE public.t_option OWNER TO blog;

--
-- Name: t_relationship; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_relationship (
    content_id integer NOT NULL,
    metadata_id integer NOT NULL
);


ALTER TABLE public.t_relationship OWNER TO blog;

--
-- Name: t_user; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.t_user (
    id integer NOT NULL,
    activated timestamp without time zone,
    auth_code character varying(255),
    created timestamp without time zone,
    group_name character varying(255),
    logged timestamp without time zone,
    mail character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255),
    screen_name character varying(255),
    url character varying(255)
);


ALTER TABLE public.t_user OWNER TO blog;

--
-- Data for Name: t_comment; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_comment (id, agent, created, ip, mail, status, text, type, url, comment_author_id, content_id, parent_comment_id) FROM stdin;
\.


--
-- Data for Name: t_content; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_content (id, comments_num, created, is_allowed_comment, is_allowed_feed, is_allowed_ping, modified, order_num, password, slug, status, template, text, title, type, author_id) FROM stdin;
\.


--
-- Data for Name: t_meta; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_meta (id, count, description, name, order_num, slug, type) FROM stdin;
\.


--
-- Data for Name: t_option; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_option (id, name, value, user_id) FROM stdin;
\.


--
-- Data for Name: t_relationship; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_relationship (content_id, metadata_id) FROM stdin;
\.


--
-- Data for Name: t_user; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.t_user (id, activated, auth_code, created, group_name, logged, mail, name, password, screen_name, url) FROM stdin;
\.


--
-- Name: t_comment t_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT t_comment_pkey PRIMARY KEY (id);


--
-- Name: t_content t_content_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_content
    ADD CONSTRAINT t_content_pkey PRIMARY KEY (id);


--
-- Name: t_meta t_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_meta
    ADD CONSTRAINT t_meta_pkey PRIMARY KEY (id);


--
-- Name: t_option t_option_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_option
    ADD CONSTRAINT t_option_pkey PRIMARY KEY (id);


--
-- Name: t_relationship t_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_relationship
    ADD CONSTRAINT t_relationship_pkey PRIMARY KEY (content_id, metadata_id);


--
-- Name: t_user t_user_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);


--
-- Name: t_user uk_28ky8wn6p9tvfx9cryjxcyd26; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT uk_28ky8wn6p9tvfx9cryjxcyd26 UNIQUE (mail);


--
-- Name: t_user uk_g8gqk4e142wekcb1t6d3v2mwx; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT uk_g8gqk4e142wekcb1t6d3v2mwx UNIQUE (name);


--
-- Name: t_comment fk4jj284r3pb7japogvo6h72q95; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT fk4jj284r3pb7japogvo6h72q95 FOREIGN KEY (parent_comment_id) REFERENCES public.t_comment(id);


--
-- Name: t_relationship fk6uyhta67vlhyfmo94gi9secv6; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_relationship
    ADD CONSTRAINT fk6uyhta67vlhyfmo94gi9secv6 FOREIGN KEY (content_id) REFERENCES public.t_content(id);


--
-- Name: t_comment fkdrtmynk43ovogqin4mhqn1kdr; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT fkdrtmynk43ovogqin4mhqn1kdr FOREIGN KEY (comment_author_id) REFERENCES public.t_user(id);


--
-- Name: t_comment fkpwuhqaynaldk24kg5j6w0ais7; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT fkpwuhqaynaldk24kg5j6w0ais7 FOREIGN KEY (content_id) REFERENCES public.t_content(id);


--
-- Name: t_relationship fks26ig5diaufkh11h84fjh1bkf; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_relationship
    ADD CONSTRAINT fks26ig5diaufkh11h84fjh1bkf FOREIGN KEY (metadata_id) REFERENCES public.t_meta(id);


--
-- Name: t_option fkstdcwmpg443j6esgdbul34346; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_option
    ADD CONSTRAINT fkstdcwmpg443j6esgdbul34346 FOREIGN KEY (user_id) REFERENCES public.t_user(id);


--
-- Name: t_content fkt7ns8v20kiu114u40w96dxek8; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.t_content
    ADD CONSTRAINT fkt7ns8v20kiu114u40w96dxek8 FOREIGN KEY (author_id) REFERENCES public.t_user(id);


--
-- PostgreSQL database dump complete
--

