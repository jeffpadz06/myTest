

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `tbl_users` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(1, 'john@test.com', 'John\r\n', '$$92u394ssfES', '2021-12-21 06:00:09'),
(2, 'jane@test.com', 'Jane', 'W$29#sdsDWW', '2021-12-01 17:07:33');


CREATE TABLE `tbl_users_images` (
  `id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `url_path` varchar(100) NOT NULL,
  `created_by` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `tbl_users_images` (`id`, `user_id`, `url_path`, `created_by`) VALUES
(1, 1, 'www.test.com/img/sample1.png', '2021-12-01 06:00:09'),
(2, 1, 'www.test.com/img/sample2.png', '2021-12-01 06:00:09'),
(3, 1, 'www.test.com/img/sample3.png', '2021-12-01 06:00:09'),
(4, 2, 'www.test.com/img/sample4.png', '2021-12-01 17:07:33'),
(5, 2, 'www.test.com/img/sample5.png', '2021-12-01 17:07:33'),
(6, 2, 'www.test.com/img/sample6.png', '2021-12-01 17:07:33');


CREATE TABLE `tbl_users_meta` (
  `id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `tbl_users_meta` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`) VALUES
(1, 1, 'ip_address', '127.0.0.1', '2021-12-01 06:00:09'),
(2, 1, 'referrer', 'google.com', '2021-12-01 06:00:09'),
(3, 1, 'user_agent', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.3', '2021-12-01 06:00:09'),
(4, 2, 'ip_address', '192.168.1.1', '2021-12-01 17:07:33'),
(5, 2, 'referrer', 'bing.com', '2021-12-01 17:07:33'),
(6, 2, 'user_agent', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '2021-12-01 17:07:33');


ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tbl_users_images`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tbl_users_meta`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `tbl_users_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `tbl_users_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;


/* retrieve these data */

SELECT tbl_users.email, tbl_users.name, MAX(CASE WHEN tbl_users_meta.meta_key='ip_address' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS ip_address, MAX(CASE WHEN tbl_users_meta.meta_key='referrer' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS referrer, MAX(CASE WHEN tbl_users_meta.meta_key='user_agent' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS user_agent, GROUP_CONCAT(DISTINCT(tbl_users_images.url_path) SEPARATOR '\n') as path FROM tbl_users_meta LEFT JOIN tbl_users ON tbl_users_meta.user_id = tbl_users.id LEFT JOIN tbl_users_images ON tbl_users.id = tbl_users_images.user_id GROUP BY tbl_users.id;

