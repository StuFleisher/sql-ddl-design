CREATE TABLE stars(
    name VARCHAR(100) PRIMARY KEY,
    temp_kelvin INT NOT NULL);

INSERT INTO stars(name, temp_kelvin)
    VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);


CREATE TABLE planets(
    name VARCHAR(100) PRIMARY KEY,
    orbital_period FLOAT NOT NULL,
    star VARCHAR(100) REFERENCES stars);

INSERT INTO planets
    (name, orbital_period, star)
    VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars',1.882, 'The Sun'),
    ('Venus',0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');


CREATE TABLE moons(
    name VARCHAR(100) PRIMARY KEY,
    planet VARCHAR(100) REFERENCES planets);

INSERT INTO moons(name, planet)
    VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos','Mars');

SELECT * --planets.name, star, COUNT(*) as moon_count
    FROM planets
        LEFT JOIN moons
           -- SELECT COUNT(*)
             --   FROM moons
               -- GROUP BY planet
            ON planets.name=moons.planet
    GROUP BY planets.name
    --HAVING moons.name is not null;
--add a group then count



STARS
*name > varchar > Primary key
temperature > int > not null


stars_planets (has many)
id > SERIAL > Primary key
star_name > foreign key
planet_name > foreign key

PLANETS
*name > primary key
orbital_period > float > not null
star > references


planets_moons (has many)
id SERIAL > Primary key
planet_name > foreign key
moon_name > foreign key


MOONS
*name > Primary Key
