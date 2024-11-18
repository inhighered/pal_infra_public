
-- this will either run as a first time setup script or
-- re-apply/skip all the things that already exist

CREATE EXTENSION IF NOT EXISTS dblink;

-- the pal database should already exist
-- CREATE DATABASE pal;
-- \connect pal;
CREATE SCHEMA app;

GRANT ALL PRIVILEGES ON DATABASE pal TO admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO admin;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO admin;

create table if not exists app.users (
    session_id varchar primary key,
    user_ip varchar not null,
    timestamp timestamptz not null
);

create table if not exists app.chats (
    chat_id serial primary key,
    session_id varchar not null,
    chat_session varchar not null,
    chat_session_state int not null,
    message_type varchar not null,
    message text not null,
    timestamp timestamptz not null,
    doc_group_id int not null
);

create table if not exists app.docs (
    doc_id serial primary key,
    doc_group_id int not null,
    doc_name text not null,
    doc_location text,
    doc_content text,
    doc_active int, 
    doc_hash varchar
);