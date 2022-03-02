DROP DATABASE IF EXISTS `ps3`;
CREATE DATABASE IF NOT EXISTS `ps3`;
USE `ps3`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

CREATE TABLE `customer` (
    `customer_uid` int NOT NULL AUTO_INCREMENT,
    `firstName` varchar(20) NOT NULL,
    `lastName` varchar(20) NOT NULL,
    PRIMARY KEY (`customer_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
    `order_uid` int NOT NULL AUTO_INCREMENT,
    `customer_uid` int NOT NULL,
    `date` varchar(20) NOT NULL,
    PRIMARY KEY (`order_uid`),
    FOREIGN KEY (`customer_uid`) REFERENCES `customer`(`customer_uid`),
    INDEX (`customer_uid`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `author` (
    `author_uid` int NOT NULL AUTO_INCREMENT,
    `firstName` varchar(20) NOT NULL,
    `lastName` varchar(20) NOT NULL,
    PRIMARY KEY (`author_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `publisher` (
    `publisher_uid` int NOT NULL AUTO_INCREMENT,
    `name` varchar(20) NOT NULL,
    PRIMARY KEY (`publisher_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book` (
    `book_isbn` int NOT NULL,
    `publisher_uid` int NOT NULL,
    `title` varchar(20) NOT NULL,
    `genre` varchar(20) NOT NULL,
    PRIMARY KEY (`book_isbn`),
    FOREIGN KEY (`publisher_uid`) REFERENCES `publisher`(`publisher_uid`),
    INDEX (`publisher_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editor` (
    `editor_uid` int NOT NULL AUTO_INCREMENT,
    `publisher_uid` int NOT NULL,
    `firstName` varchar(20) NOT NULL,
    `lastName` varchar(20) NOT NULL,
    PRIMARY KEY (`editor_uid`),
    FOREIGN KEY (`publisher_uid`) REFERENCES `publisher`(`publisher_uid`),
    INDEX (`publisher_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contract` (
    `contract_uid` int NOT NULL AUTO_INCREMENT,
    `book_isbn` int NOT NULL,
    `author_uid` int NOT NULL,
    `publisher_uid` int NOT NULL,
    `royalty` int NULL,
    PRIMARY KEY (`contract_uid`),
    FOREIGN KEY (`book_isbn`) REFERENCES `book`(`book_isbn`),
    FOREIGN KEY (`author_uid`) REFERENCES `author`(`author_uid`),
    FOREIGN KEY (`publisher_uid`) REFERENCES `publisher`(`publisher_uid`),
    INDEX (`book_isbn`, `author_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_author_book` (
    `author_uid` int NOT NULL,
    `book_isbn` int NOT NULL,
    PRIMARY KEY (`author_uid`, `book_isbn`),
    FOREIGN KEY (`book_isbn`) REFERENCES `book`(`book_isbn`),
    FOREIGN KEY (`author_uid`) REFERENCES `author`(`author_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_order_book` (
    `order_uid` int NOT NULL,
    `book_isbn` int NOT NULL,
    PRIMARY KEY (`order_uid`, `book_isbn`),
    FOREIGN KEY (`order_uid`) REFERENCES `order`(`order_uid`),
    FOREIGN KEY (`book_isbn`) REFERENCES `book`(`book_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_editor_book` (
    `editor_uid` int NOT NULL,
    `book_isbn` int NOT NULL,
    PRIMARY KEY (`editor_uid`, `book_isbn`),
    FOREIGN KEY (`editor_uid`) REFERENCES `editor`(`editor_uid`),
    FOREIGN KEY (`book_isbn`) REFERENCES `book`(`book_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

