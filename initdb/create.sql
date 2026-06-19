CREATE DATABASE db_paymybuddy;
USE db_paymybuddy;

CREATE TABLE user (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0.0
);
