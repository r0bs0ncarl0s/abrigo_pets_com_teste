-- Database: adopet

-- DROP DATABASE IF EXISTS adopet;

CREATE DATABASE adopet
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE SEQUENCE IF NOT EXISTS public.abrigos_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.tutores_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.pets_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.adocoes_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


create table abrigos(
    id bigint NOT NULL DEFAULT nextval('abrigos_id_seq'::regclass),
    nome varchar(100) not null unique,
    telefone varchar(14) not null unique,
    email varchar(100) not null unique,
    primary key(id)
);

create table tutores(
    id bigint NOT NULL DEFAULT nextval('tutores_id_seq'::regclass),
    nome varchar(100) not null,
    telefone varchar(14) not null unique,
    email varchar(100) not null unique,
    primary key(id)
);
	
create table pets(
    id bigint NOT NULL DEFAULT nextval('pets_id_seq'::regclass),
    tipo varchar(100) not null,
    nome varchar(100) not null,
    raca varchar(100) not null,
    idade int not null,
    cor varchar(100) not null,
    peso decimal(4,2) not null,
    abrigo_id bigint not null,
    adotado boolean not null,
    primary key(id),
    constraint fk_pets_abrigo_id foreign key(abrigo_id) references abrigos(id)
);
	
create table adocoes(
    id bigint NOT NULL DEFAULT nextval('adocoes_id_seq'::regclass),
    data TIMESTAMP not null,
    tutor_id bigint not null,
    pet_id bigint not null,
    motivo varchar(255) not null,
    status varchar(100) not null,
    justificativa_status varchar(255),
    primary key(id),
    constraint fk_adocoes_tutor_id foreign key(tutor_id) references tutores(id),
    constraint fk_adocoes_pet_id foreign key(pet_id) references pets(id)
);





	
	
	