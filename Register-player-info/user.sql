CREATE DATABASE IF NOT EXISTS `framework`;
USE `framework`;

CREATE TABLE `users` (
    `identifier` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`identifier`)
);