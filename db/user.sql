CREATE TABLE IF NOT EXISTS arf_user(
    identifier VARCHAR(1024) PRIMARY KEY NOT NULL,
    name_titles VARCHAR(256) NOT NULL,
    first_name VARCHAR(256) NOT NULL,
    last_name VARCHAR(256) NOT NULl,
);