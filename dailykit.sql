CREATE TABLE `dailykit_pumba` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `dailykit_pumba`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `dailykit_pumba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

