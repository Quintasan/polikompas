SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

-- Name: vote_type; Type: TYPE

CREATE TYPE public.vote_type AS ENUM (
    'upvote',
    'downvote'
);

SET default_tablespace = '';

SET default_with_oids = false;

-- Name: ar_internal_metadata; Type: TABLE

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

-- Name: comments; Type: TABLE

CREATE TABLE public.comments (
    id BIGSERIAL PRIMARY KEY,
    body text NOT NULL,
    commentable_type character varying,
    commentable_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

-- Name: law_proposals; Type: TABLE

CREATE TABLE public.law_proposals (
    id BIGSERIAL PRIMARY KEY,
    name character varying,
    description character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tags character varying[] DEFAULT '{}'::character varying[],
    important_points character varying DEFAULT ''::character varying NOT NULL
);

-- Name: schema_migrations; Type: TABLE

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);

-- Name: users; Type: TABLE

CREATE TABLE public.users (
    id BIGSERIAL PRIMARY KEY,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

-- Name: votes; Type: TABLE

CREATE TABLE public.votes (
    id BIGSERIAL PRIMARY KEY,
    votable_type character varying,
    votable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type public.vote_type,
    user_id bigint
);

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);

-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON public.comments USING btree (commentable_type, commentable_id);

-- Name: index_comments_on_user_id; Type: INDEX

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);

-- Name: index_law_proposals_on_tags; Type: INDEX

CREATE INDEX index_law_proposals_on_tags ON public.law_proposals USING gin (tags);

-- Name: index_users_on_email; Type: INDEX

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);

-- Name: index_votes_on_type; Type: INDEX

CREATE INDEX index_votes_on_type ON public.votes USING btree (type);

-- Name: index_votes_on_user_id; Type: INDEX

CREATE INDEX index_votes_on_user_id ON public.votes USING btree (user_id);

-- Name: index_votes_on_votable_type_and_votable_id; Type: INDEX

CREATE INDEX index_votes_on_votable_type_and_votable_id ON public.votes USING btree (votable_type, votable_id);

-- Name: votes fk_rails_c9b3bef597; Type: FK CONSTRAINT

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fk_rails_c9b3bef597 FOREIGN KEY (user_id) REFERENCES public.users(id);

-- PostgreSQL database dump complete

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190402111002'),
('20190404113933'),
('20190420152616'),
('20190511111755'),
('20190530080904'),
('20190906150411'),
('20190906162215');

