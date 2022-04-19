/*
Account tables

User <-> Account = m:m
*/

CREATE TABLE IF NOT EXISTS arf_account(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    `name` VARCHAR(128) NOT NULL,
    `value` DECIMAL(9, 2) NOT NULL,
    FOREIGN KEY (player_id) REFERENCES arf_player(id)
);