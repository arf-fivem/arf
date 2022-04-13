/*
Roles & Permission database

User <-> Role = m:m
User <-> Permission = m:m
Role <-> Permission = m:m
*/

CREATE TABLE IF NOT EXISTS arf_role(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(256) NOT NULL,
    display_name VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS arf_role_permissions(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    role_id INT NOT NULL,
    permission VARCHAR(1024) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES arf_role(id)
);

CREATE TABLE IF NOT EXISTS arf_user_roles(
    id INT PRIMARY KEY NOT NULL,
    user_identifier VARCHAR(1024) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY user_identifier REFERENCES user(identifier),
    FOREIGN KEY role_id REFERENCES arf_role(id)
);

CREATE TABLE IF NOT EXISTS arf_user_permissions(
    user_identifier VARCHAR(1024) NOT NULL,
    permission VARCHAR(1024) NOT NULL,
    FOREIGN KEY (user_identifier) REFERENCES arf_user(identifier)
);