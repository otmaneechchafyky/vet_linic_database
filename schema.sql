CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOL,
    weight_kg DECIMAL(5,2) NOT NULL
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id BIGINT REFERENCES species (id);

ALTER TABLE animals
ADD CONSTRAINT species_constraint UNIQUE (species_id);

ALTER TABLE animals
ADD COLUMN owner_id BIGINT REFERENCES owners (id);

ALTER TABLE animals
ADD CONSTRAINT animal_owners_id UNIQUE (owner_id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE
);

--JOIN vets & species
CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  vet_id INT,
  species_id INT,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

--JOIN vets & animals
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  vet_id INT,
  animal_id INT,
  visit_date DATE,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (animal_id) REFERENCES animals(id)
);

ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;
