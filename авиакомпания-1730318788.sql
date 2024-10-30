CREATE TABLE IF NOT EXISTS `Авиакомпании` (
	`название` varchar(255) DEFAULT '255',
	`id` int NOT NULL,
	`код` varchar(255) DEFAULT '10',
	`страна` varchar(255) DEFAULT '100',
	`год_основания` int,
	`сайт` varchar(255) DEFAULT '255',
	`телефон` varchar(255) DEFAULT '15',
	`email` varchar(255) DEFAULT '100',
	`логотип` varchar(255) DEFAULT '255',
	`описание` text,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Самолеты` (
	`модель` varchar(255) DEFAULT '100',
	`id` int NOT NULL,
	`производитель` varchar(255) DEFAULT '100',
	`год_выпуска` int,
	`количество_мест` int,
	`номер_регистрации` varchar(255) DEFAULT '20',
	`состояние` varchar(255) DEFAULT '50',
	`авиакомпания_id` int,
	`дата_последнего_обслуживания` date,
	`описание` text,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Рейсы` (
	`номер_рейса` varchar(255) DEFAULT '10',
	`id` int NOT NULL,
	`дата_вылета` datetime,
	`дата_прилета` datetime,
	`откуда` varchar(255) DEFAULT '100',
	`куда` varchar(255) DEFAULT '100',
	`самолет_id` int,
	`авиакомпания_id` int,
	`статус` varchar(255) DEFAULT '50',
	`цена` decimal(10,0),
	`описание` text,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Пассажиры` (
	`id` int NOT NULL,
	`имя` varchar(255) DEFAULT '100',
	`фамилия` varchar(255) DEFAULT '100',
	`дата_рождения` date,
	`пол` varchar(255) DEFAULT '10',
	`email` varchar(255) DEFAULT '100',
	`телефон` varchar(255) DEFAULT '15',
	`паспорт_номер` varchar(255) DEFAULT '20',
	`национальность` varchar(255) DEFAULT '50',
	`описание` text,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Бронирования` (
	`id` int NOT NULL,
	`пассажир_id` int,
	`дата_бронирования` datetime,
	`статус` varchar(255) DEFAULT '50',
	`количество_мест` int,
	`общая_стоимость` decimal(10,0),
	`оплата_метод` varchar(255) DEFAULT '50',
	`описание` text,
	`рейс_id` int,
	`дата_отмены` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Сотрудники` (
	`id` int NOT NULL,
	`имя` varchar(255) DEFAULT '100',
	`фамилия` varchar(255) DEFAULT '100',
	`должность` varchar(255) DEFAULT '100',
	`дата_приема` date,
	`телефон` varchar(255) DEFAULT '15',
	`email` varchar(255) DEFAULT '100',
	`авиакомпания_id` int,
	`описание` text,
	`зарплата` decimal(10,0),
	PRIMARY KEY (`id`)
);


ALTER TABLE `Самолеты` ADD CONSTRAINT `Самолеты_fk7` FOREIGN KEY (`авиакомпания_id`) REFERENCES `Авиакомпании`(`id`);
ALTER TABLE `Рейсы` ADD CONSTRAINT `Рейсы_fk6` FOREIGN KEY (`самолет_id`) REFERENCES `Самолеты`(`id`);

ALTER TABLE `Рейсы` ADD CONSTRAINT `Рейсы_fk7` FOREIGN KEY (`авиакомпания_id`) REFERENCES `Авиакомпании`(`id`);

ALTER TABLE `Бронирования` ADD CONSTRAINT `Бронирования_fk1` FOREIGN KEY (`пассажир_id`) REFERENCES `Пассажиры`(`id`);

ALTER TABLE `Бронирования` ADD CONSTRAINT `Бронирования_fk8` FOREIGN KEY (`рейс_id`) REFERENCES `Рейсы`(`id`);
ALTER TABLE `Сотрудники` ADD CONSTRAINT `Сотрудники_fk7` FOREIGN KEY (`авиакомпания_id`) REFERENCES `Авиакомпании`(`id`);