CREATE DATABASE IF NOT EXISTS `framework`;
USE `framework`;

CREATE TABLE `users` (
	`identifier` VARCHAR(40) NOT NULL,
	`position` VARCHAR(53) NULL DEFAULT '{-269.4,-955.3,31.2}',

	PRIMARY KEY (`identifier`)
);