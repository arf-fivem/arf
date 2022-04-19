/*
Item tables

User <-> Item = m:m
User <-> Weapon = m:m
*/

CREATE TABLE IF NOT EXISTS arf_item(
    id INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(128) NOT NULL,
    display_name VARCHAR(128) NOT NULL,
    `weight` INT NOT NULL,
    removable TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS arf_player_inventory_items(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    item_id INT NOT NULL,
    `count` INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES arf_player(id),
    FOREIGN KEY (item_id) REFERENCES arf_item(id)
);

CREATE TABLE IF NOT EXISTS arf_player_inventory_weapons(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    weapon_name VARCHAR(128) NOT NULL,
    weapon_data LONGTEXT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES arf_player(id),
);