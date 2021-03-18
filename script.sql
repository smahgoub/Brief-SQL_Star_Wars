create table if not exists planets
(
	id serial not null
		constraint planets_pk
			primary key,
	name varchar,
	rotation_period integer,
	orbital_period integer,
	diameter integer,
	climate varchar,
	gravity varchar,
	terrain varchar,
	surface_water double precision,
	population bigint
);

alter table planets owner to postgres;

create table if not exists color
(
	id serial not null
		constraint color_pk
			primary key,
	color varchar
);

alter table color owner to postgres;

create table if not exists species
(
	id serial not null
		constraint species_pk
			primary key,
	name varchar,
	classification varchar,
	designation varchar,
	average_height integer,
	skin_color_idx integer
		constraint skin_color_fk
			references color,
	hair_color_idx integer
		constraint hair_color_fk
			references color,
	eye_color_idx integer
		constraint eye_color_fk
			references color,
	average_lifespan integer,
	language varchar,
	homeworld_idx integer
		constraint homeworld_fk
			references planets
);

alter table species owner to postgres;

create table if not exists characters
(
	id serial not null
		constraint characters_pk
			primary key,
	name varchar,
	height integer,
	mass integer,
	hair_color_idx integer
		constraint hair_color_fk
			references color,
	skin_color_idx integer
		constraint skin_color_fk
			references color,
	eye_color_idx integer
		constraint eye_color_fk
			references color,
	birth_year varchar,
	gender varchar,
	homeworld_idx integer
		constraint homeworld_fk
			references planets,
	species_idx integer
		constraint species_fk
			references species
);

alter table characters owner to postgres;

create table if not exists manufacturer
(
	id serial not null
		constraint manufacturer_pk
			primary key,
	name varchar
);

alter table manufacturer owner to postgres;

create table if not exists vehicles_class
(
	id serial not null
		constraint vehicles_class_pk
			primary key,
	name varchar
);

alter table vehicles_class owner to postgres;

create table if not exists vehicles
(
	id serial not null
		constraint vehicles_pk
			primary key,
	name varchar,
	model varchar,
	manufacturer_idx integer
		constraint manufacturer_fk
			references manufacturer,
	cost_in_credits integer,
	length double precision,
	max_atmosphering_speed integer,
	crew integer,
	passengers integer,
	cargo_capacity integer,
	consumables integer,
	vehicle_class_idx integer
		constraint vehicles_class_fk
			references vehicles_class,
	hyperdrive_rating double precision,
	mglt integer
);

alter table vehicles owner to postgres;

