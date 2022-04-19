/*
Roles & Permission tables

User <-> Role = m:m
User <-> Permission = m:m
Role <-> Permission = m:m
*/

CREATE TABLE IF NOT EXISTS arf_role(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(256) NOT NULL,
    display_name VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS arf_role_inheritance(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    base_role_id INT NOT NULL,
    parent_role_id INT NOT NULL,
    FOREIGN KEY (base_role_id) REFERENCES arf_role(id),
    FOREIGN KEY (parent_role_id) REFERENCES arf_role(id)
);

delimiter //
CREATE TRIGGER arf_role_inheritance_validator
    BEFORE INSERT
    ON arf_role_inheritance
    FOR EACH ROW
BEGIN
    IF NEW.base_role_id = NEW.parent_role_id THEN
        SIGNAL SQLSTATE VALUE '45000'
        SET MESSAGE_TEXT = 'Role Inheritance - Role cannot inherit from itself';
    END IF;
END;
//

CREATE TABLE IF NOT EXISTS arf_role_permissions(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    role_id INT NOT NULL,
    permission VARCHAR(1024) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES arf_role(id)
);

CREATE TABLE IF NOT EXISTS arf_player_roles(
    id INT PRIMARY KEY NOT NULL,
    player_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES arf_player(id),
    FOREIGN KEY (role_id) REFERENCES arf_role(id)
);

CREATE TABLE IF NOT EXISTS arf_player_permissions(
    player_id INT NOT NULL,
    permission VARCHAR(1024) NOT NULL,
    FOREIGN KEY (player_id) REFERENCES arf_player(id)
);