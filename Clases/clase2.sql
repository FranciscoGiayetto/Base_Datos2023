drop DATABASE if exists imbd;
CREATE DATABASE imdb;
use imdb;

create table film (
    film_id  int auto_increment primary key,
    title varchar(30) not null,
    descripcion varchar(30),
    release_year year not null
);
create table actor(
    actor_id  int auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null
);
create table film_actor(
    actor_id int not null,
    film_id int not null
);

ALTER TABLE film ADD COLUMN last_update varchar(255) not null;
ALTER TABLE actor ADD COLUMN last_update varchar(255) not null;

alter table film_actor add foreing key ('film_id') references actor('actor_id');
alter table film_actor add foreing key ('film_id') references film('film_id');



INSERT INTO actor (first_name, last_name) VALUES
('Johnny', 'Depp'),
('Meryl', 'Streep'),
('Tom', 'Hanks'),
('Emma', 'Stone');


INSERT INTO film (title, description, release_year) VALUES
('Piratas del Caribe: La maldición del Perla Negra', 'Película de aventuras', 2003),
('El diablo viste a la moda', 'Comedia sobre la moda', 2006),
('Forrest Gump', 'Drama sobre la vida de un hombre con discapacidad intelectual', 1994),
('La La Land', 'Musical romántico', 2016);


INSERT INTO film_actor (actor_id, film_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4);