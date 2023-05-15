CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `sale_shipping` float(10,2) DEFAULT NULL
);

INSERT INTO `sales` (`sale_id`, `contact_id`, `sale_shipping`) VALUES
(1, 1, 10.00),
(2, 2, 20.00),
(3, 3, 30.00),
(4, 3, 40.00);

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `contact_selesrep` int(11) DEFAULT NULL
);

INSERT INTO `contacts` (`contact_id`, `contact_selesrep`) VALUES
(1, 5),
(2, 4),
(3, 3),
(4, 1),
(5, 1);

CREATE TABLE `contactsadditionalreps` (
  `contactsadditionalreps_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL
);

INSERT INTO `contactsadditionalreps` (`contactsadditionalreps_id`, `contact_id`) VALUES
(1, 3),
(4, 1),
(5, 5),
(6, 5),
(7, 5);

CREATE TABLE `salespayments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL DEFAULT 0,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
);

INSERT INTO `salespayments` (`payment_id`, `sale_id`, `payment_type`) VALUES
(1, 1, 'Cash'),
(2, 2, 'Cash'),
(3, 4, 'Cash'),
(4, 2, 'Refund'),
(5, 1, 'Cash'),
(6, 1, 'Cash'),
(7, 6, 'Refund');

--statement1
SELECT SUM(DISTINCT `sales`.`sale_shipping`) as `total_shipping`, sales.sale_id
FROM `sales` 
LEFT JOIN `contacts` ON `sales`.`contact_id` = `contacts`.`contact_id` 
LEFT JOIN `salespayments` ON `salespayments`.`sale_id` = `sales`.`sale_id` 
LEFT JOIN `contactsadditionalreps` ON `contacts`.`contact_id` = `contactsadditionalreps`.`contact_id` 
WHERE `salespayments`.`payment_type`!='Refund' 
GROUP BY `sales`.`sale_id`, `sales`.`sale_shipping`;

--statement2: 합산 옳게끔.
SELECT SUM(DISTINCT `sales`.`sale_shipping`) as `total_shipping`
FROM `sales` 
LEFT JOIN `contacts` ON `sales`.`contact_id` = `contacts`.`contact_id` 
LEFT JOIN `salespayments` ON `salespayments`.`sale_id` = `sales`.`sale_id` 
LEFT JOIN `contactsadditionalreps` ON `contacts`.`contact_id` = `contactsadditionalreps`.`contact_id` 
WHERE `salespayments`.`payment_type`!='Refund';

https://dba.stackexchange.com/questions/310950/mysql-sum-returns-multiple-rows-when-used-with-joins-and-grouping

//group by 먼저 실행되고 sum이 실행됨에 유의한다.