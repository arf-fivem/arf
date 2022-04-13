/*
Job tables

User <-> Job = m:m
*/

CREATE TABLE IF NOT EXISTS arf_job(
    id INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(128) NOT NULL,
    display_name VARCHAR(128) NOT NULL,
    official_name VARCHAR(128) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS arf_job_grade(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    job_id INT NOT NULL,
    display_name VARCHAR(128) NOT NULL,
    FOREIGN KEY (job_id) REFERENCES arf_job(id)
);

CREATE TABLE IF NOT EXISTS user_jobs(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    job_grade_id INT NOT NULL,
    FOREIGN KEY (job_grade_id) REFERENCES arf_job_grade(id)
);