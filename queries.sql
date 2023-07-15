SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Update the species column to 'unspecified'
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


--UPDATE SPECIES COLUMN

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = '';
SELECT * FROM animals;

COMMIT;
SELECT * FROM animals;

-- Delete all records in the animals table

BEGIN;
DELETE FROM animals;
ROLLBACK;


--DELETE 2022 BORN
BEGIN;

DELETE FROM animals
WHERE date_of_birth  > '2022-01-01';

SAVEPOINT first_save;

UPDATE animals
SET weight_kg  = weight_kg  * -1;

ROLLBACK TO SAVEPOINT first_save;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;
SELECT * FROM animals;

--RESPOND QUESTS
SELECT COUNT(*) name FROM animals;

SELECT COUNT(*) name FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) name FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered;

SELECT neutered, MIN(weight_kg ), MAX(weight_kg)
FROM animals
GROUP BY neutered;

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

UPDATE animals SET species_id 