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