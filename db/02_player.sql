/*
Player tables

Player <-> Sex = m:1
*/

CREATE TABLE IF NOT EXISTS arf_sex(
    id INT NOT NULL AUTO_INCREMENT,
    display_name VARCHAR(16) NOT NULL,
    abbreviation VARCHAR(8) NOT NULL
);

CREATE TABLE IF NOT EXISTS arf_player(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    identifier VARCHAR(1024) UNIQUE NOT NULL,
    name_titles VARCHAR(256) NOT NULL,
    first_name VARCHAR(256) NOT NULL,
    last_name VARCHAR(256) NOT NULl,
    birth_date DATE NOT NULL,
    sex_id INT NOT NULL,
    skin_data LONGTEXT NOT NULL,
    last_position VARCHAR(128) NOT NULL,
    FOREIGN KEY (sex_id) REFERENCES arf_sex(id)
);