-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Erstellungszeit: 10. Mrz 2025 um 19:18
-- Server-Version: 9.1.0
-- PHP-Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `main`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
                            `account_id` int UNSIGNED NOT NULL,
                            `user_id` int UNSIGNED DEFAULT NULL,
                            `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                            `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `accounts`
--

INSERT INTO `accounts` (`account_id`, `user_id`, `admin_note`, `created_at`) VALUES
                                                                                 (1, 1, 'Owner', '2024-12-05 09:16:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account_invitation_tokens`
--

CREATE TABLE `account_invitation_tokens` (
                                             `owner_id` int UNSIGNED NOT NULL COMMENT 'PK = ACCOUNT_ID',
                                             `invited_id` int UNSIGNED DEFAULT NULL COMMENT 'PK = ACCOUNT_ID',
                                             `token` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '????-????-????-????-????',
                                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                             `used_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `account_invitation_tokens`
--

INSERT INTO `account_invitation_tokens` (`owner_id`, `invited_id`, `token`, `created_at`, `used_at`) VALUES
                                                                                                         (1, null, '2356-1345-7231-2389-3330', '2024-11-26 22:09:04', null),
                                                                                                         (1, null, '6847-5780-7257-1059-5235', '2024-11-07 08:09:36', null);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referrals`
--

CREATE TABLE `referrals` (
                             `referral_id` int UNSIGNED NOT NULL,
                             `owner_id` int UNSIGNED NOT NULL COMMENT 'FK = user_id',
                             `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                             `disabled` bit(1) NOT NULL DEFAULT b'0',
                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `referrals`
--

INSERT INTO `referrals` (`referral_id`, `owner_id`, `code`, `url`, `name`, `disabled`, `created_at`, `updated_at`) VALUES
                                                                                                                       (15, 1, 'wZxfE3Ch', 'https://api.nebalus.dev', 'API', b'0', '2025-03-09 02:33:19', '2025-03-09 02:45:42'),
                                                                                                                       (16, 1, 'yHLaYU2m', 'https://www.youtube.com/watch?v=xvFZjo5PgG0', 'Rick Roll', b'0', '2025-03-09 14:41:01', '2025-03-09 17:36:05');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referral_click_metric`
--

CREATE TABLE `referral_click_metric` (
                                         `click_id` int UNSIGNED NOT NULL,
                                         `referral_id` int UNSIGNED NOT NULL,
                                         `ip_address` tinyblob,
                                         `clicked_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `referral_click_metric`
--

INSERT INTO `referral_click_metric` (`click_id`, `referral_id`, `ip_address`, `clicked_at`) VALUES
                                                                                                (361, 15, null, '2025-03-09 02:33:23'),
                                                                                                (362, 15, null, '2025-03-09 02:45:48'),
                                                                                                (363, 15, null, '2025-03-09 02:54:40'),
                                                                                                (364, 15, null, '2025-03-09 13:52:30'),
                                                                                                (465, 16, null, '2025-03-09 14:41:07'),
                                                                                                (466, 16, null, '2025-03-09 15:23:10'),
                                                                                                (467, 15, null, '2025-03-09 20:22:46'),
                                                                                                (468, 15, null, '2025-03-09 20:23:04'),
                                                                                                (469, 16, null, '2025-03-10 12:18:07');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
                         `user_id` int UNSIGNED NOT NULL,
                         `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `totp_secret_key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `disabled` bit(1) NOT NULL DEFAULT b'0',
                         `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `totp_secret_key`, `disabled`, `created_at`, `updated_at`) VALUES
                                                                                                                                (1, 'nebalus', 'contact@nebalus.dev', '$2y$10$9xaR/88aZteW49ExqqveWe6O./RkNfrAj3tSNGPCc/keJsT95EcEu', 'S61WXXWZU5J6QT0H4CX4B02X2HET0LYW', b'0', '2024-02-28 21:28:40', '2024-08-03 23:07:10');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
    ADD PRIMARY KEY (`account_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `account_invitation_tokens`
--
ALTER TABLE `account_invitation_tokens`
    ADD PRIMARY KEY (`token`),
  ADD UNIQUE KEY `invited_user_id` (`invited_id`),
  ADD KEY `owner_user_id` (`owner_id`);

--
-- Indizes für die Tabelle `referrals`
--
ALTER TABLE `referrals`
    ADD PRIMARY KEY (`referral_id`),
  ADD UNIQUE KEY `refcode` (`code`) USING BTREE,
  ADD KEY `user_id` (`owner_id`);

--
-- Indizes für die Tabelle `referral_click_metric`
--
ALTER TABLE `referral_click_metric`
    ADD PRIMARY KEY (`click_id`),
  ADD KEY `referral_id` (`referral_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accounts`
--
ALTER TABLE `accounts`
    MODIFY `account_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `referrals`
--
ALTER TABLE `referrals`
    MODIFY `referral_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `referral_click_metric`
--
ALTER TABLE `referral_click_metric`
    MODIFY `click_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
    MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `accounts`
--
ALTER TABLE `accounts`
    ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `account_invitation_tokens`
--
ALTER TABLE `account_invitation_tokens`
    ADD CONSTRAINT `account_invitation_tokens_ibfk_2` FOREIGN KEY (`invited_id`) REFERENCES `accounts` (`account_id`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `account_invitation_tokens_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `referrals`
--
ALTER TABLE `referrals`
    ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `referral_click_metric`
--
ALTER TABLE `referral_click_metric`
    ADD CONSTRAINT `referral_click_metric_ibfk_1` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`referral_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;