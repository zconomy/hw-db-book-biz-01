/* 7.1. Books per author.  */
USE `ps3`;
SELECT `author`.`author_uid`,`firstName`, `lastName`, COUNT(DISTINCT(`book_isbn`))
FROM    `author`
        JOIN `junction_author_book` ON `author`.`author_uid` = `junction_author_book`.`author_uid`
GROUP BY `author_uid`;

/* 7.2. Authors per book.  */
USE `ps3`;
SELECT `book`.`book_isbn`,`title`, COUNT(DISTINCT(`author_uid`))
FROM    `book`
        JOIN `junction_author_book` ON `book`.`book_isbn` = `junction_author_book`.`book_isbn`
GROUP BY `book_isbn`;

/* 7.3. Author royalties on a book.  */
USE `ps3`;
SELECT `book`.`book_isbn`,`title`, SUM(`royalty`)
FROM    `book`
        JOIN `contract` ON `book`.`book_isbn` = `contract`.`book_isbn`
GROUP BY `book_isbn`;

/* 7.4. Book royalties per author.  */
USE `ps3`;
SELECT `author`.`author_uid`,`firstName`, `lastName`, SUM(`royalty`)
FROM    `author`
        JOIN `contract` ON `author`.`author_uid` = `contract`.`author_uid`
GROUP BY `author_uid`;

/* 7.5. Books in a genre.  */
USE `ps3`;
SELECT `genre`, COUNT(`genre`)
FROM `book`
GROUP BY `genre`;

/* 7.6. Books published by a publisher.  */
USE `ps3`;
SELECT `publisher`.`publisher_uid`,`name`, COUNT(DISTINCT(`book_isbn`))
FROM    `publisher`
        JOIN `book` ON `book`.`publisher_uid` = `publisher`.`publisher_uid`
GROUP BY `publisher`.`publisher_uid`;

/* 7.7. Editors per book.  */
USE `ps3`;
SELECT `book`.`book_isbn`,`title`, COUNT(DISTINCT(`editor_uid`))
FROM    `book`
        JOIN `junction_editor_book` ON `book`.`book_isbn` = `junction_editor_book`.`book_isbn`
GROUP BY `book_isbn`;

/* 7.8. Books per editor.  */
USE `ps3`;
SELECT `editor`.`editor_uid`,`firstName`, `lastName`, COUNT(DISTINCT(`book_isbn`))
FROM    `editor`
        JOIN `junction_editor_book` ON `editor`.`editor_uid` = `junction_editor_book`.`editor_uid`
GROUP BY `editor`.`editor_uid`;

/* 7.9. Books in an order.  */
USE `ps3`;
SELECT `order`.`order_uid`,`date`, COUNT(DISTINCT(`book_isbn`))
FROM    `order`
        JOIN `junction_order_book` ON `order`.`order_uid` = `junction_order_book`.`order_uid`
GROUP BY `order`.`order_uid`;

/* 7.10. Orders for a book.  */
USE `ps3`;
SELECT `book`.`book_isbn`,`title`, COUNT(DISTINCT(`order_uid`))
FROM    `book`
        JOIN `junction_order_book` ON `book`.`book_isbn` = `junction_order_book`.`book_isbn`
GROUP BY `book`.`book_isbn`;

/* 7.11. Customer orders.  */
USE `ps3`;
SELECT *
FROM    `order`
        JOIN `customer` ON `order`.`customer_uid` = `customer`.`customer_uid`
GROUP BY `order`.`order_uid`;

/* 7.12. Orders per customer. */
USE `ps3`;
SELECT `customer`.`customer_uid`,`firstName`,`lastName`, COUNT(DISTINCT(`order_uid`))
FROM    `customer`
        JOIN `order` ON `customer`.`customer_uid` = `order`.`customer_uid`
GROUP BY `customer`.`customer_uid`;

/* end of file */