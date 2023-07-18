--INSERT animals data
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Angemon', '2005-01-12', 1, TRUE, -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Boarmon', '2005-01-07', 7, TRUE, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Ditto', '2022-05-14', 4, TRUE, 22);

--INSERT owners data
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob',45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

--INSERT species data
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

--UPDATE aspecies_id col from animals table using species table
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id is null;

--UPDATE owners_id col from animals table using owners table
UPDATE animals SET owner_id=1 WHERE name = 'Agumon';
UPDATE animals SET owner_id=2 WHERE name IN ('Pikachu', 'Gabumon');
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');

--INSERT data into vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-01-08');

--INSERT into specializations table
INSERT INTO specializations (vet_id, species_id) 
VALUES (
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM species WHERE name = 'Pokemon')
);
INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Pokemon')
);
INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Digimon')
);
INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM species WHERE name = 'Digimon')
);

--INSERT into visits table
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM animals WHERE name = 'Agumon'),
    '2020-05-24'
);

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM animals WHERE name = 'Agumon'),
    '2020-01-22'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM animals WHERE name = 'Gabumon'),
    '2021-02-02'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    '2020-01-05'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    '2020-03-08'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    '2020-05-14'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM animals WHERE name = 'Devimon'),
    '2021-05-04'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM animals WHERE name = 'Charmander'),
    '2021-02-24'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    '2019-12-21'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    '2020-08-10'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    '2021-04-07'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM animals WHERE name = 'Squirtle'),
    '2019-09-29'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM animals WHERE name = 'Angemon'),
    '2020-10-03'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM animals WHERE name = 'Angemon'),
    '2020-11-04'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    '2019-01-24'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    '2019-05-15'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    '2020-02-27'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    '2020-08-03'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM animals WHERE name = 'Blossom'),
    '2020-05-24'
);
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    '2021-01-11'
);