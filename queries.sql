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

--ANSWER QUESTS PART 1
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

--ANSWER QUESTS PART2
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';
SELECT animals.* FROM animals
LEFT JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name AS owner_name , animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id; 

SELECT species.name, COUNT(*) FROM animals
INNER JOIN species ON animals.species_id = species.id
INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY species.name;

SELECT * FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT * FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(*) FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name;

--ANSWER QUESTS PART3
SELECT a.name AS animal_name
FROM animals AS a
JOIN visits AS v ON a.id = v.animal_id
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animal_id) AS animal_count
FROM visits AS v
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT vets.name AS vet_name, species.name AS specialty
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vet_name;

SELECT animals.name AS animal_name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
  AND visits.visit_date >= '2020-04-01'
  AND visits.visit_date <= '2020-08-30';

SELECT animals.name AS animal_name, COUNT(visits.id) AS visit_count
FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.id
ORDER BY visit_count DESC
LIMIT 1;

SELECT animals.name AS animal_name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date
LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, visits.visit_date
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS mismatched_specialties_count
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS vet ON vet.id = v.vet_id
LEFT JOIN specializations AS s ON vet.id = s.vet_id AND a.species_id = s.species_id
WHERE s.id IS NULL;

SELECT sp.name AS specialty, COUNT(*) AS visit_count
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS vet ON vet.id = v.vet_id
JOIN specializations AS s ON vet.id = s.vet_id
JOIN species AS sp ON sp.id = s.species_id
WHERE vet.name = 'Maisy Smith'
GROUP BY sp.id
ORDER BY visit_count DESC
LIMIT 1;
