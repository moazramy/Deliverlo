/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `add_ons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_promotional_banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_special_criterias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewer_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `module_id` bigint unsigned NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `default_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_module_id_foreign` (`module_id`),
  CONSTRAINT `banners_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `business_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `campaign_store` (
  `campaign_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `campaign_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_module_id_foreign` (`module_id`),
  CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_module_id_foreign` (`module_id`),
  CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint NOT NULL DEFAULT '0',
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reply` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `sender_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `receiver_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_message_id` bigint unsigned DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_message_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '["all"]',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`),
  KEY `coupons_module_id_foreign` (`module_id`),
  CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `d_m_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `d_m_vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_coverage_area` double(16,2) NOT NULL,
  `maximum_coverage_area` double(16,2) NOT NULL,
  `extra_charges` double(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `data_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `delivery_man_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `delivery_men` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `assigned_order_count` int unsigned NOT NULL DEFAULT '0',
  `vehicle_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_men_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `background_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `refund` tinyint(1) NOT NULL DEFAULT '0',
  `cancelation` tinyint(1) NOT NULL DEFAULT '0',
  `contact` tinyint(1) NOT NULL DEFAULT '0',
  `facebook` tinyint(1) NOT NULL DEFAULT '0',
  `instagram` tinyint(1) NOT NULL DEFAULT '0',
  `twitter` tinyint(1) NOT NULL DEFAULT '0',
  `linkedin` tinyint(1) NOT NULL DEFAULT '0',
  `pinterest` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `email_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `employee_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `store_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `flutter_special_criterias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `stock` int DEFAULT '0',
  `unit_id` bigint unsigned DEFAULT NULL,
  `food_variations` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_campaigns_module_id_foreign` (`module_id`),
  CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `store_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `stock` int DEFAULT '0',
  `unit_id` bigint unsigned DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `food_variations` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `organic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_module_id_foreign` (`module_id`),
  CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint unsigned DEFAULT NULL,
  `sender_id` bigint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `module_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `module_zone` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `minimum_shipping_charge` double(23,2) DEFAULT NULL,
  `maximum_cod_order_amount` double(23,2) DEFAULT NULL,
  `maximum_shipping_charge` double(23,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `stores_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletters_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notification_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_cancel_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `item_details` text COLLATE utf8mb4_unicode_ci,
  `variation` text COLLATE utf8mb4_unicode_ci,
  `add_ons` text COLLATE utf8mb4_unicode_ci,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `parcel_catgory_id` bigint unsigned DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT '0.00',
  `admin_expense` decimal(23,3) DEFAULT '0.000',
  `store_expense` double(23,3) DEFAULT '0.000',
  `discount_amount_by_store` double(23,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `order_transactions_zone_id_index` (`zone_id`),
  KEY `order_transactions_module_id_foreign` (`module_id`),
  CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `module_id` bigint unsigned NOT NULL,
  `order_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_category_id` bigint unsigned DEFAULT NULL,
  `receiver_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `charge_payer` enum('sender','receiver') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT '0.000',
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `free_delivery_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `prescription_order` tinyint(1) NOT NULL DEFAULT '0',
  `tax_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dm_vehicle_id` bigint unsigned DEFAULT NULL,
  `cancellation_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canceled_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_product_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `processing_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unavailable_item_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_instruction` text COLLATE utf8mb4_unicode_ci,
  `tax_percentage` double(24,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zone_id` (`zone_id`),
  KEY `orders_module_id_foreign` (`module_id`),
  CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `parcel_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `orders_count` int NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parcel_per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `parcel_minimum_shipping_charge` double(23,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parcel_categories_name_unique` (`name`),
  KEY `parcel_categories_module_id_foreign` (`module_id`),
  CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `phone_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_verifications_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `react_testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewer_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `refund_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `refunds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci,
  `admin_note` text COLLATE utf8mb4_unicode_ci,
  `refund_amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `refund_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `module_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_module_id_foreign` (`module_id`),
  CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `soft_credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `store_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `day` int NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `store_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `item_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `total_order` int unsigned NOT NULL DEFAULT '0',
  `module_id` bigint unsigned NOT NULL,
  `order_place_to_schedule_interval` int DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `per_km_shipping_charge` double(16,3) unsigned NOT NULL DEFAULT '0.000',
  `prescription_order` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_phone_unique` (`phone`),
  KEY `stores_module_id_foreign` (`module_id`),
  CONSTRAINT `stores_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `track_deliverymen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `deliveryman_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int NOT NULL DEFAULT '0',
  `login_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT '0.000',
  `ref_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_language_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `ref_by` bigint unsigned DEFAULT NULL,
  `temp_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  KEY `users_zone_id_index` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vendor_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_employees_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_phone_unique` (`phone`),
  UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `withdraw_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `digital_payment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zones_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;









INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master admin', NULL, 1, NULL, NULL);








INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`, `is_logged_in`) VALUES
(1, 'Moaz Ramy Elhusseni', 'Zeineldin', '01092431233', 'maozramy@gmail.com', NULL, '$2y$10$vHJaBuiFxZgwV4XxQOk4r.h.BEE4ChSrRUpnRUjmwBqv7ScnDGEpi', NULL, '2023-08-02 11:07:35', '2023-08-02 11:07:35', 1, NULL, 1);






INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-07-01 18:51:17', '2021-07-01 18:51:17');
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 06:57:02', '2022-03-23 06:22:00');
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(4, 'mail_config', '{\"name\":\"6am Mart\",\"host\":\"mail.6amtech.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"info@6amtech.com\",\"email_id\":\"info@6amtech.com\",\"encryption\":\"tls\",\"password\":\"password\"}', NULL, '2022-03-23 06:24:52');
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(5, 'fcm_project_id', 'e-food-9e6e3', NULL, NULL),
(6, 'push_notification_key', NULL, NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is successfully placed\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order is confirmed\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order is started for cooking\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your food is ready for delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order is delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"Your order has been assigned to a delivery man\"}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Your order is picked up by delivery man\"}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order delivered successfully\"}', NULL, NULL),
(15, 'terms_and_conditions', '<p>This is a test Teams &amp; Conditions<br />\r\n<br />\r\nThese terms of use (the &quot;Terms of Use&quot;) govern your use of our website www.evaly.com.bd (the &quot;Website&quot;) and our &quot;StackFood&quot; application for mobile and handheld devices (the &quot;App&quot;). The Website and the App are jointly referred to as the &quot;Platform&quot;. Please read these Terms of Use carefully before you use the services. If you do not agree to these Terms of Use, you may not use the services on the Platform, and we request you to uninstall the App. By installing, downloading and/or even merely using the Platform, you shall be contracting with StackFood and you provide your acceptance to the Terms of Use and other StackFood policies (including but not limited to the Cancellation &amp; Refund Policy, Privacy Policy etc.) as posted on the Platform from time to time, which takes effect on the date on which you download, install or use the Services, and create a legally binding arrangement to abide by the same. The Platforms will be used by (i) natural persons who have reached 18 years of age and (ii) corporate legal entities, e.g companies. Where applicable, these Terms shall be subject to country-specific provisions as set out herein.</p>\r\n\r\n<h3>USE OF PLATFORM AND SERVICES</h3>\r\n\r\n<p>All commercial/contractual terms are offered by and agreed to between Buyers and Merchants alone. The commercial/contractual terms include without limitation to price, taxes, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. StackFood does not have any kind of control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the Buyers and Merchants. StackFood may, however, offer support services to Merchants in respect to order fulfilment, payment collection, call centre, and other services, pursuant to independent contracts executed by it with the Merchants. eFood is not responsible for any non-performance or breach of any contract entered into between Buyers and Merchants on the Platform. eFood cannot and does not guarantee that the concerned Buyers and/or Merchants shall perform any transaction concluded on the Platform. eFood is not responsible for unsatisfactory services or non-performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.</p>\r\n\r\n<p>StackFood&nbsp;is operating an e-commerce platform and assumes and operates the role of facilitator, and does not at any point of time during any transaction between Buyer and Merchant on the Platform come into or take possession of any of the products or services offered by Merchant. At no time shall StackFood hold any right, title or interest over the products nor shall StackFood have any obligations or liabilities in respect of such contract entered into between Buyer and Merchant. You agree and acknowledge that we shall not be responsible for:</p>\r\n\r\n<ul>\r\n	<li>The goods provided by the shops or restaurants including, but not limited, serving of food orders suiting your requirements and needs;</li>\r\n	<li>The Merchant&quot;s goods not being up to your expectations or leading to any loss, harm or damage to you;</li>\r\n	<li>The availability or unavailability of certain items on the menu;</li>\r\n	<li>The Merchant serving the incorrect orders.</li>\r\n</ul>\r\n\r\n<p>The details of the menu and price list available on the Platform are based on the information provided by the Merchants and we shall not be responsible for any change or cancellation or unavailability. All Menu &amp; Food Images used on our platforms are only representative and shall/might not match with the actual Menu/Food Ordered, StackFood shall not be responsible or Liable for any discrepancies or variations on this aspect.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<p>You understand that delivery periods quoted to you at the time of confirming the order is an approximate estimate and may vary. We shall not be responsible for any delay in the delivery of your order due to the delay at seller/merchant end for order processing or any other unavoidable circumstances.</p>\r\n\r\n<p>Your order shall be only delivered to the address designated by you at the time of placing the order on the Platform. We reserve the right to cancel the order, in our sole discretion, in the event of any change to the place of delivery and you shall not be entitled to any refund for the same. Delivery in the event of change of the delivery location shall be at our sole discretion and reserve the right to charge with additional delivery fee if required.</p>\r\n\r\n<p>You shall undertake to provide adequate directions, information and authorizations to accept delivery. In the event of any failure to accept delivery, failure to deliver within the estimated time due to your failure to provide appropriate instructions, or authorizations, then such goods shall be deemed to have been delivered to you and all risk and responsibility in relation to such goods shall pass to you and you shall not be entitled to any refund for the same. Our decision in relation to this shall be final and binding. You understand that our liability ends once your order has been delivered to you.</p>\r\n\r\n<p>You might be required to provide your credit or debit card details to the approved payment gateways while making the payment. In this regard, you agree to provide correct and accurate credit/ debit card details to the approved payment gateways for availing the Services. You shall not use the credit/ debit card which is not lawfully owned by you, i.e. in any transaction, you must use your own credit/ debit card. The information provided by you shall not be utilized or shared with any third party unless required in relation to fraud verifications or by law, regulation or court order. You shall be solely responsible for the security and confidentiality of your credit/ debit card details. We expressly disclaim all liabilities that may arise as a consequence of any unauthorized use of your credit/ debit card. You agree that the Services shall be provided by us only during the working hours of the relevant Merchants.</p>\r\n\r\n<h3>ACTIVITIES PROHIBITED ON THE PLATFORM</h3>\r\n\r\n<p>The following is a partial list of the kinds of conduct that are illegal or prohibited on the Websites. StackFood reserves the right to investigate and take appropriate legal action/s against anyone who, in StackFood sole discretion, engages in any of the prohibited activities. Prohibited activities include &mdash; but are not limited to &mdash; the following:</p>\r\n\r\n<ul>\r\n	<li>Using the Websites for any purpose in violation of laws or regulations;</li>\r\n	<li>Posting Content that infringes the intellectual property rights, privacy rights, publicity rights, trade secret rights, or any other rights of any party;</li>\r\n	<li>Posting Content that is unlawful, obscene, defamatory, threatening, harassing, abusive, slanderous, hateful, or embarrassing to any other person or entity as determined by StackFood in its sole discretion or pursuant to local community standards;</li>\r\n	<li>Posting Content that constitutes cyber-bullying, as determined by StackFood in its sole discretion;</li>\r\n	<li>Posting Content that depicts any dangerous, life-threatening, or otherwise risky behavior;</li>\r\n	<li>Posting telephone numbers, street addresses, or last names of any person;</li>\r\n	<li>Posting URLs to external websites or any form of HTML or programming code;</li>\r\n	<li>Posting anything that may be &quot;spam,&quot; as determined by StackFood in its sole discretion;</li>\r\n	<li>Impersonating another person when posting Content;</li>\r\n	<li>Harvesting or otherwise collecting information about others, including email addresses, without their consent;</li>\r\n	<li>Allowing any other person or entity to use your identification for posting or viewing comments;</li>\r\n	<li>Harassing, threatening, stalking, or abusing any person;</li>\r\n	<li>Engaging in any other conduct that restricts or inhibits any other person from using or enjoying the Websites, or which, in the sole discretion of StackFood , exposes eFood or any of its customers, suppliers, or any other parties to any liability or detriment of any type; or</li>\r\n	<li>Encouraging other people to engage in any prohibited activities as described herein.</li>\r\n</ul>\r\n\r\n<p>StackFood&nbsp;reserves the right but is not obligated to do any or all of the following:</p>\r\n\r\n<ul>\r\n	<li>Investigate an allegation that any Content posted on the Websites does not conform to these Terms of Use and determine in its sole discretion to remove or request the removal of the Content;</li>\r\n	<li>Remove Content which is abusive, illegal, or disruptive, or that otherwise fails to conform with these Terms of Use;</li>\r\n	<li>Terminate a user&#39;s access to the Websites upon any breach of these Terms of Use;</li>\r\n	<li>Monitor, edit, or disclose any Content on the Websites; and</li>\r\n	<li>Edit or delete any Content posted on the Websites, regardless of whether such Content violates these standards.</li>\r\n</ul>\r\n\r\n<h3>AMENDMENTS</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to change or modify these Terms (including our policies which are incorporated into these Terms) at any time by posting changes on the Platform. You are strongly recommended to read these Terms regularly. You will be deemed to have agreed to the amended Terms by your continued use of the Platforms following the date on which the amended Terms are posted.</p>\r\n\r\n<h3>PAYMENT</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to offer additional payment methods and/or remove existing payment methods at any time in its sole discretion. If you choose to pay using an online payment method, the payment shall be processed by our third party payment service provider(s). With your consent, your credit card / payment information will be stored with our third party payment service provider(s) for future orders. StackFood does not store your credit card or payment information. You must ensure that you have sufficient funds on your credit and debit card to fulfil payment of an Order. Insofar as required, StackFood takes responsibility for payments made on our Platforms including refunds, chargebacks, cancellations and dispute resolution, provided if reasonable and justifiable and in accordance with these Terms.</p>\r\n\r\n<h3>CANCELLATION</h3>\r\n\r\n<p>StackFood&nbsp;can cancel any order anytime due to the foods/products unavailability, out of coverage area and any other unavoidable circumstances.</p>', NULL, '2021-08-22 04:48:01'),
(16, 'business_name', 'Deliverlo', NULL, NULL),
(17, 'currency', 'USD', NULL, NULL),
(18, 'logo', '2022-02-28-621ca50ae6b65.png', NULL, NULL),
(19, 'phone', '+880123456789', NULL, NULL),
(20, 'email_address', 'admin@gmail.com', NULL, NULL),
(21, 'address', NULL, NULL, NULL),
(22, 'footer_text', 'Demo footer text @ 2021', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', NULL, NULL, NULL),
(25, 'about_us', '<p>Lorem <strong>ipsum </strong>dolor sit amet, <em><strong>consectetur </strong></em>adipiscing elit. <em>Cras </em>dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, <a href=\"http://google.com\">suscipit </a>metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>', NULL, '2021-07-28 10:09:19'),
(26, 'privacy_policy', '<h2>This is a Demo Privacy Policy</h2>\r\n\r\n<p>This policy explains how StackFood&nbsp;website and related applications (the &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo;) collects, uses, shares and protects the personal information that we collect through this site or different channels. StackFood has established the site to link up the users who need foods or grocery items to be shipped or delivered by the riders from the affiliated restaurants or shops to the desired location. This policy also applies to any mobile applications that we develop for use with our services on the Site, and references to this &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo; is intended to also include these mobile applications. Please read below to learn more about our information policies. By using this Site, you agree to these policies.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Information provided by web browser</h3>\r\n\r\n<p>You have to provide us with personal information like your name, contact no, mailing address and email id, our app will also fetch your location information in order to give you the best service. Like many other websites, we may record information that your web browser routinely shares, such as your browser type, browser language, software and hardware attributes, the date and time of your visit, the web page from which you came, your Internet Protocol address and the geographic location associated with that address, the pages on this Site that you visit and the time you spent on those pages. This will generally be anonymous data that we collect on an aggregate basis.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<h3>Payment Information</h3>\r\n\r\n<p>To make the payment online for availing our services, you have to provide the bank account, mobile financial service (MFS), debit card, credit card information to the StackFood platform.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Session and Persistent Cookies</h3>\r\n\r\n<p>Cookies are small text files that are placed on your computer by websites that you visit. They are widely used in order to make websites work, or work more efficiently, as well as to provide information to the owners of the site. As is commonly done on websites, we may use cookies and similar technology to keep track of our users and the services they have elected. We use both &ldquo;session&rdquo; and &ldquo;persistent&rdquo; cookies. Session cookies are deleted after you leave our website and when you close your browser. We use data collected with session cookies to enable certain features on our Site, to help us understand how users interact with our Site, and to monitor at an aggregate level Site usage and web traffic routing. We may allow business partners who provide services to our Site to place cookies on your computer that assist us in analyzing usage data. We do not allow these business partners to collect your personal information from our website except as may be necessary for the services that they provide.</p>\r\n\r\n<h3>Web Beacons</h3>\r\n\r\n<p>We may also use web beacons or similar technology to help us track the effectiveness of our communications.</p>\r\n\r\n<h3>Advertising Cookies</h3>\r\n\r\n<p>We may use third parties, such as Google, to serve ads about our website over the internet. These third parties may use cookies to identify ads that may be relevant to your interest (for example, based on your recent visit to our website), to limit the number of times that you see an ad, and to measure the effectiveness of the ads.</p>\r\n\r\n<h3>Google Analytics</h3>\r\n\r\n<p>We may also use Google Analytics or a similar service to gather statistical information about the visitors to this Site and how they use the Site. This, also, is done on an anonymous basis. We will not try to associate anonymous data with your personally identifiable data. If you would like to learn more about Google Analytics, please click here.</p>', NULL, '2021-08-22 04:49:58'),
(27, 'minimum_shipping_charge', '10', NULL, NULL),
(28, 'per_km_shipping_charge', '2', NULL, NULL),
(29, 'digital_payment', '{\"status\":\"1\"}', '2021-07-01 17:27:38', '2021-08-22 03:47:42'),
(30, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 18:41:24', '2022-03-23 06:21:28'),
(31, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 18:41:28', '2022-03-23 06:21:38'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 18:41:34', '2022-03-23 06:21:49'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 18:41:42', '2022-03-23 06:22:15'),
(34, 'senang_pay', '{\"status\":\"1\",\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 18:41:48', '2022-03-23 06:22:25'),
(35, 'order_handover_message', '{\"status\":1,\"message\":\"Delivery man is on the way\"}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Order is canceled by your request\"}', NULL, NULL),
(37, 'timezone', 'US/Central', NULL, NULL),
(38, 'order_delivery_verification', '0', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '10', NULL, NULL),
(44, 'country', 'US', NULL, NULL),
(45, 'app_url', 'https://www.google.com', NULL, NULL),
(46, 'default_location', '{\"lat\":\"0\",\"lng\":\"0\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 17:16:08', '2022-03-23 17:16:08'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 17:16:18', '2022-03-23 17:16:18'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":null}', '2022-03-23 17:16:26', '2022-03-23 17:16:26'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2022-03-23 17:16:33', '2022-03-23 17:16:33'),
(51, 'free_delivery_over', '1000', NULL, NULL),
(52, 'maintenance_mode', '0', '2021-09-08 18:44:28', '2021-09-08 18:44:28'),
(53, 'app_minimum_version_ios', NULL, '2021-09-22 01:54:10', '2021-09-22 01:54:10'),
(54, 'app_minimum_version_android', NULL, '2021-09-22 01:54:10', '2021-09-22 01:54:10'),
(55, 'app_url_ios', NULL, '2021-09-22 01:54:10', '2021-09-22 01:54:10'),
(56, 'app_url_android', NULL, '2021-09-22 01:54:10', '2021-09-22 01:54:10'),
(57, 'flutterwave', '{\"status\":1,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '2021-09-22 01:54:10', '2021-09-22 01:54:10'),
(58, 'dm_maximum_orders', '2', '2021-09-24 20:46:13', '2021-09-24 20:46:13'),
(59, 'order_confirmation_model', 'deliveryman', '2021-10-17 03:05:08', '2021-10-17 03:05:08'),
(60, 'popular_food', '1', '2021-10-17 03:05:08', '2021-10-17 03:05:08'),
(61, 'popular_restaurant', '1', '2021-10-17 03:05:08', '2021-10-17 03:05:08'),
(62, 'new_restaurant', '1', '2021-10-17 03:05:08', '2021-10-17 03:05:08'),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', '2021-10-17 03:05:08', '2021-10-17 03:05:08'),
(64, 'map_api_key_server', NULL, NULL, NULL),
(66, 'most_reviewed_foods', '1', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(67, 'landing_page_text', '{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(68, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(69, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(70, 'testimonial', '[{\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(71, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(72, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2021-11-15 17:55:37', '2021-11-15 17:55:37'),
(73, 'admin_order_notification', '0', NULL, NULL),
(74, 'swish_payment', '{\"status\":\"1\"}', NULL, '2021-12-28 14:02:40'),
(76, 'service_charge', '12', NULL, NULL),
(77, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"}]', NULL, '2022-01-04 15:09:23'),
(78, 'language', '[\"en\",\"ar\"]', NULL, NULL),
(79, 'timeformat', '24', NULL, NULL),
(80, 'canceled_by_restaurant', '0', NULL, NULL),
(81, 'canceled_by_deliveryman', '0', NULL, NULL),
(82, 'show_dm_earning', '0', NULL, NULL),
(83, 'recaptcha', '{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}', '2022-03-23 17:17:39', '2022-03-23 17:17:39'),
(84, 'toggle_veg_non_veg', '1', NULL, NULL),
(85, 'toggle_dm_registration', '1', NULL, NULL),
(86, 'toggle_restaurant_registration', '1', NULL, NULL),
(87, 'order_refunded_message', '{\"status\":1,\"message\":\"Order is refunded successfully\"}', NULL, NULL),
(88, 'liqpay', '{\"status\":\"1\",\"public_key\":null,\"private_key\":null}', NULL, '2022-02-27 07:15:40'),
(89, 'klarna', '{\"status\":\"1\",\"region\":\"america\",\"username\":\"PN06804_1a368db08f6d\",\"password\":\"6ljrP6BDJNKT6F2y\"}', NULL, '2022-01-26 10:30:51'),
(90, 'fatoorah', '{\"status\":\"1\",\"api_key\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\"}', NULL, '2022-02-20 13:05:26'),
(91, 'bkash', '{\"status\":\"1\",\"api_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"api_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', NULL, '2022-02-27 06:37:26'),
(92, 'paytabs', '{\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}', NULL, '2022-02-27 08:06:19'),
(93, 'paytm', '{\"status\":\"1\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}', NULL, '2022-02-27 08:06:37'),
(94, 'schedule_order_slot_duration', '0', NULL, NULL),
(95, 'digit_after_decimal_point', '0', NULL, NULL),
(96, 'icon', '2022-02-28-621ca59d1c816.png', NULL, NULL),
(97, 'toggle_store_registration', '1', NULL, NULL),
(98, 'canceled_by_store', '0', NULL, NULL),
(99, 'parcel_per_km_shipping_charge', '0', NULL, NULL),
(100, 'parcel_minimum_shipping_charge', '0', NULL, NULL),
(101, 'parcel_commission_dm', '0', NULL, NULL),
(102, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', NULL, NULL),
(103, 'wallet_status', '0', '2022-07-05 06:26:19', '2022-07-05 06:26:19'),
(104, 'loyalty_point_status', '0', '2022-07-05 06:26:19', '2022-07-05 06:26:19'),
(105, 'ref_earning_status', '0', '2022-07-05 06:26:19', '2022-07-05 06:26:19'),
(106, 'wallet_add_refund', '0', '2022-07-05 06:26:19', '2022-07-05 06:26:19'),
(107, 'loyalty_point_exchange_rate', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(108, 'ref_earning_exchange_rate', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(109, 'loyalty_point_item_purchase_point', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(110, 'loyalty_point_minimum_point', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(111, 'refund_active_status', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(112, 'dm_tips_status', '0', '2022-07-05 06:26:20', '2022-07-05 06:26:20'),
(113, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]', '2023-08-02 11:07:35', '2023-08-02 11:07:35');













INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL);
INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL);
INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL);
INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);







INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'admin_login_url', 'admin', 'login_admin', '2023-06-11 17:34:59', '2023-06-11 17:34:59');
INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(2, 'admin_employee_login_url', 'admin-employee', 'login_admin_employee', '2023-06-11 17:34:59', '2023-06-11 17:34:59');
INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(3, 'store_login_url', 'store', 'login_store', '2023-06-11 17:34:59', '2023-06-11 17:34:59');
INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(4, 'store_employee_login_url', 'store-employee', 'login_store_employee', '2023-06-11 17:34:59', '2023-06-11 17:34:59'),
(5, 'fixed_header_title', 'Manage Your  Daily Life in one platform', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(6, 'fixed_header_sub_title', 'More than just a reliable  eCommerce platform', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(7, 'fixed_module_title', 'Your eCommerce venture starts here !', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(8, 'fixed_module_sub_title', 'Enjoy all services in one platform', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(9, 'fixed_referal_title', 'Earn point by', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(10, 'fixed_referal_sub_title', 'Refer Your Friend', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(11, 'fixed_newsletter_title', 'Sign Up to Our Newsletter', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(12, 'fixed_newsletter_sub_title', 'Receive Latest News, Updates and Many Other News Every Week', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(13, 'fixed_footer_article_title', '6amMart is a complete package!  It\'s time to empower your multivendor online business with  powerful features!', 'admin_landing_page', '2023-06-11 18:06:27', '2023-06-11 18:06:27'),
(14, 'feature_title', 'Remarkable Features that You Can Count!', 'admin_landing_page', '2023-06-11 18:14:25', '2023-06-11 18:14:25'),
(15, 'feature_short_description', 'Jam-packed with outstanding features to elevate your online ordering and delivery easier, and smarter than ever before. It\'s time to empower your multivendor online business with 6amMart\'s powerful features!', 'admin_landing_page', '2023-06-11 18:14:25', '2023-06-11 18:14:25'),
(16, 'earning_title', 'Earn Money', 'admin_landing_page', '2023-06-11 18:26:01', '2023-06-11 18:26:01'),
(17, 'earning_sub_title', 'Earn money  by using different platform', 'admin_landing_page', '2023-06-11 18:26:01', '2023-06-11 18:26:01'),
(18, 'earning_seller_image', '2023-06-11-648593813b6c1.png', 'admin_landing_page', '2023-06-11 18:27:29', '2023-06-11 18:27:29'),
(19, 'seller_app_earning_links', '{\"playstore_url_status\":null,\"playstore_url\":null,\"apple_store_url_status\":null,\"apple_store_url\":null}', 'admin_landing_page', NULL, NULL),
(20, 'earning_delivery_image', '2023-06-11-648593d069147.png', 'admin_landing_page', '2023-06-11 18:28:48', '2023-06-11 18:28:48'),
(21, 'dm_app_earning_links', '{\"playstore_url_status\":null,\"playstore_url\":null,\"apple_store_url_status\":null,\"apple_store_url\":null}', 'admin_landing_page', NULL, NULL),
(22, 'why_choose_title', 'What so Special About 6amMart ?', 'admin_landing_page', '2023-06-11 18:30:30', '2023-06-11 18:32:08'),
(23, 'counter_section', '{\"app_download_count_numbers\":\"300\",\"seller_count_numbers\":\"85\",\"deliveryman_count_numbers\":\"150\",\"customer_count_numbers\":\"10000\",\"status\":\"1\"}', 'admin_landing_page', NULL, NULL),
(24, 'download_user_app_title', 'Let’s  Manage', 'admin_landing_page', '2023-06-11 18:38:17', '2023-06-11 18:38:17'),
(25, 'download_user_app_sub_title', 'Your business  Smartly or Earn.', 'admin_landing_page', '2023-06-11 18:38:17', '2023-06-11 18:38:17'),
(26, 'download_user_app_image', '2023-06-11-648596096d79e.png', 'admin_landing_page', '2023-06-11 18:38:17', '2023-06-11 18:38:17'),
(27, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.sixamtech.sixam_mart_store_app\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\"}', 'admin_landing_page', NULL, NULL),
(28, 'testimonial_title', 'People Who Shared Love with us?', 'admin_landing_page', '2023-06-11 18:42:04', '2023-06-11 18:42:04'),
(29, 'contact_us_title', 'Contact Us', 'admin_landing_page', '2023-06-11 18:53:22', '2023-06-11 18:53:22'),
(30, 'contact_us_sub_title', 'Any question or remarks? Just write us a message!', 'admin_landing_page', '2023-06-11 18:53:22', '2023-06-11 18:53:22'),
(31, 'contact_us_image', '2023-06-11-6485999308039.png', 'admin_landing_page', '2023-06-11 18:53:23', '2023-06-11 18:53:23'),
(32, 'refund_policy_status', '1', 'admin_landing_page', '2023-06-11 23:10:58', '2023-06-11 23:10:58'),
(33, 'refund_policy', NULL, 'admin_landing_page', '2023-06-11 23:10:59', '2023-06-11 23:10:59'),
(34, 'header_title', '$Your e-Commerce!$', 'react_landing_page', '2023-06-12 19:30:53', '2023-06-12 22:41:19'),
(35, 'header_sub_title', 'Venture Starts Here', 'react_landing_page', '2023-06-12 19:30:53', '2023-06-12 20:55:14'),
(36, 'header_tag_line', 'More than just a reliable $eCommerce$ platform', 'react_landing_page', '2023-06-12 19:30:53', '2023-06-12 20:45:24'),
(37, 'header_icon', '2023-06-12-648721d3028d4.png', 'react_landing_page', '2023-06-12 19:30:53', '2023-06-12 22:46:59'),
(38, 'header_banner', '2023-06-12-648721d30552a.png', 'react_landing_page', '2023-06-12 19:30:53', '2023-06-12 22:46:59'),
(39, 'company_title', '$6amMart$', 'react_landing_page', '2023-06-12 19:35:07', '2023-06-12 20:46:19'),
(40, 'company_sub_title', 'is Best Delivery Service Near You', 'react_landing_page', '2023-06-12 19:35:07', '2023-06-12 19:35:07'),
(41, 'company_description', '6amMart is a one-stop shop for all your daily necessities. You can shop for groceries, and pharmacy items, order food, and send important parcels from one place to another from the comfort of your home.', 'react_landing_page', '2023-06-12 19:35:07', '2023-06-12 19:35:07'),
(42, 'company_button_name', 'Order Now', 'react_landing_page', '2023-06-12 19:35:07', '2023-06-12 20:46:52'),
(43, 'company_button_url', 'https://6ammart-react.6amtech.com/', 'react_landing_page', '2023-06-12 19:35:07', '2023-06-12 19:35:07'),
(44, 'download_user_app_title', 'Complete Multipurpose eBusiness Solution', 'react_landing_page', '2023-06-12 19:40:30', '2023-06-12 19:40:30'),
(45, 'download_user_app_sub_title', '6amMart is a Laravel and Flutter Framework-based multi-vendor food, grocery, eCommerce, parcel, and pharmacy delivery system. It has six modules to cover all your business function', 'react_landing_page', '2023-06-12 19:40:30', '2023-06-12 19:40:30'),
(46, 'download_user_app_image', NULL, 'react_landing_page', '2023-06-12 19:40:30', '2023-06-12 19:40:30'),
(47, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'react_landing_page', NULL, NULL),
(48, 'earning_title', 'Let’s Start Earning with $6amMart$', 'react_landing_page', '2023-06-12 19:43:22', '2023-06-12 19:43:22'),
(49, 'earning_sub_title', 'Join our online marketplace revolution and boost your income.', 'react_landing_page', '2023-06-12 19:43:22', '2023-06-12 19:43:22'),
(50, 'earning_seller_title', 'Become a Seller', 'react_landing_page', '2023-06-12 19:45:07', '2023-06-12 19:45:07'),
(51, 'earning_seller_sub_title', 'Register as seller & open shop in 6amMart to start your business', 'react_landing_page', '2023-06-12 19:45:07', '2023-06-12 19:45:07'),
(52, 'earning_seller_button_name', 'Register', 'react_landing_page', '2023-06-12 19:45:07', '2023-06-12 19:45:07'),
(53, 'earning_seller_button_url', 'https://6ammart-admin.6amtech.com/store/apply', 'react_landing_page', '2023-06-12 19:45:07', '2023-06-12 19:45:07'),
(54, 'earning_dm_title', 'Become a $Delivery Man$', 'react_landing_page', '2023-06-12 19:45:55', '2023-06-12 20:53:01'),
(55, 'earning_dm_sub_title', 'Register as delivery man and earn money', 'react_landing_page', '2023-06-12 19:45:55', '2023-06-12 19:45:55'),
(56, 'earning_dm_button_name', 'Register', 'react_landing_page', '2023-06-12 19:45:55', '2023-06-12 19:45:55'),
(57, 'earning_dm_button_url', 'https://6ammart-admin.6amtech.com/deliveryman/apply', 'react_landing_page', '2023-06-12 19:45:55', '2023-06-12 19:45:55'),
(58, 'promotion_banner', '[{\"img\":\"2023-06-12-6486f7ebe6ad7.png\"},{\"img\":\"2023-06-12-6486f7f6e2f47.png\"},{\"img\":\"2023-06-12-6486f80048105.png\"}]', 'react_landing_page', NULL, NULL),
(59, 'business_title', '$Let’s$', 'react_landing_page', '2023-06-12 19:52:29', '2023-06-12 19:52:29'),
(60, 'business_sub_title', 'Manage your business  Smartly', 'react_landing_page', '2023-06-12 19:52:29', '2023-06-12 20:54:18'),
(61, 'business_image', '2023-06-12-6486f8edb1350.png', 'react_landing_page', '2023-06-12 19:52:29', '2023-06-12 19:52:29'),
(62, 'download_business_app_links', '{\"seller_playstore_url_status\":\"1\",\"seller_playstore_url\":\"https:\\/\\/play.google.com\\/store\",\"seller_appstore_url_status\":\"1\",\"seller_appstore_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\",\"dm_playstore_url_status\":\"1\",\"dm_playstore_url\":\"https:\\/\\/play.google.com\\/store\",\"dm_appstore_url_status\":\"1\",\"dm_appstore_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'react_landing_page', NULL, NULL),
(63, 'testimonial_title', 'We $satisfied$ some Customer & Restaurant Owners', 'react_landing_page', '2023-06-12 19:53:04', '2023-06-12 19:53:04'),
(64, 'fixed_promotional_banner', '2023-06-12-6486ff0017c7a.png', 'react_landing_page', '2023-06-12 20:18:24', '2023-06-12 20:18:24'),
(65, 'fixed_footer_description', 'Connect with our social media and other sites to keep up to date', 'react_landing_page', '2023-06-12 20:21:12', '2023-06-12 20:21:12'),
(66, 'fixed_newsletter_title', 'Join Us!', 'react_landing_page', '2023-06-12 20:23:45', '2023-06-12 20:23:45'),
(67, 'fixed_newsletter_sub_title', 'Subscribe to our weekly newsletter and be a part of our journey to self discovery and love.', 'react_landing_page', '2023-06-12 20:23:45', '2023-06-12 20:23:45'),
(68, 'fixed_header_title', '6amMart', 'flutter_landing_page', '2023-06-12 20:31:35', '2023-06-12 20:31:35'),
(69, 'fixed_header_sub_title', 'More than just reliable eCommerce platform', 'flutter_landing_page', '2023-06-12 20:31:35', '2023-06-12 20:32:30'),
(70, 'fixed_header_image', '2023-06-12-64870217337d6.png', 'flutter_landing_page', '2023-06-12 20:31:35', '2023-06-12 20:31:35'),
(71, 'fixed_location_title', 'Choose your location', 'flutter_landing_page', '2023-06-12 20:35:02', '2023-06-12 20:35:02'),
(72, 'fixed_module_title', 'Your eCommerce venture starts here !', 'flutter_landing_page', '2023-06-12 20:37:29', '2023-06-12 20:37:29'),
(73, 'fixed_module_sub_title', 'Enjoy all services in one platform', 'flutter_landing_page', '2023-06-12 20:37:29', '2023-06-12 20:37:29'),
(74, 'join_seller_title', 'Become a Seller', 'flutter_landing_page', '2023-06-12 21:12:56', '2023-06-12 21:12:56'),
(75, 'join_seller_sub_title', 'Registered as a seller and open shop for start your business', 'flutter_landing_page', '2023-06-12 21:12:56', '2023-06-12 21:12:56'),
(76, 'join_seller_button_name', 'Register', 'flutter_landing_page', '2023-06-12 21:12:56', '2023-06-12 21:12:56'),
(77, 'join_seller_button_url', 'https://6ammart-admin.6amtech.com/store/apply', 'flutter_landing_page', '2023-06-12 21:12:56', '2023-06-12 21:12:56'),
(78, 'join_delivery_man_title', 'Join as  Deliveryman', 'flutter_landing_page', '2023-06-12 21:16:03', '2023-06-12 21:16:03'),
(79, 'join_delivery_man_sub_title', 'Registered as a deliveryman and earn money', 'flutter_landing_page', '2023-06-12 21:16:03', '2023-06-12 21:16:03'),
(80, 'join_delivery_man_button_name', 'Register', 'flutter_landing_page', '2023-06-12 21:16:03', '2023-06-12 21:16:03'),
(81, 'join_delivery_man_button_url', 'https://6ammart-admin.6amtech.com/deliveryman/apply', 'flutter_landing_page', '2023-06-12 21:16:03', '2023-06-12 21:16:03'),
(82, 'download_user_app_title', 'Download app and enjoy more!', 'flutter_landing_page', '2023-06-12 21:17:56', '2023-06-12 21:17:56'),
(83, 'download_user_app_sub_title', 'Download app from', 'flutter_landing_page', '2023-06-12 21:17:56', '2023-06-12 21:17:56'),
(84, 'download_user_app_image', '2023-06-12-64870cf49cc3b.png', 'flutter_landing_page', '2023-06-12 21:17:56', '2023-06-12 21:17:56'),
(85, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'flutter_landing_page', NULL, NULL);









INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Change Password Request', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL, NULL, '2023-06-12-6486f303174e0.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'forget_password', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 19:26:24', '2023-06-12 22:40:28');
INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(2, 'New Store Registration Request', '<p>Please find below the details of the new Store registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Store Name: {storeName}</strong></p>\r\n\r\n<p>To review the store from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Module Section</strong><strong>&rarr;Store Management&rarr;New Stores</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the store here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f4420b5c1.png', '2023-06-12-6486f4420d61d.png', NULL, 'Review Request', 'https://www.facebook.com/', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'store_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 19:32:34', '2023-06-12 22:59:26');
INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(3, 'New Deliveryman Registration Request', '<p>Please find below the details of the new Deliveryman registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Name: {deliveryManName}</strong></p>\r\n\r\n<p>To review the store from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Users</strong><strong>&rarr;Deliveryman Management&rarr;New Deliveryman</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f4fe20b2c.png', '2023-06-12-6486f528877fe.png', NULL, 'Review Request', 'https://www.facebook.com/', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'dm_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 19:35:42', '2023-06-12 23:04:49');
INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(4, 'New Withdraw Request', '<p>Please find below the details of the new Withdraw Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Store Name: {storeName}</strong></p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Transactions &amp; Reports</strong><strong>&rarr;Withdraw Requests</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-6486f5b6a24a4.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'withdraw_request', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 19:38:46', '2023-06-12 23:04:17'),
(5, '“BUY ONE GET ONE” Campaign Join Request', '<p>Please find below the details of the new Campaign Join Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Store Name: {storeName}</strong></p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Module Section</strong><strong>&rarr;Choose Module&rarr;Promotion Management&rarr;Campaigns&rarr;Basic Campaigns&rarr;Buy One Get One</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f611cfb9b.png', '2023-06-12-6486f611cfdf0.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 19:40:17', '2023-06-12 23:06:04'),
(6, 'You Have A Refund Request.', '<p>Please find below the details of the new Refund Request:</p>\r\n\r\n<p><strong>Customer Name: {userName}</strong></p>\r\n\r\n<p><strong>Order ID: {orderId}</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-12-6486fb27a6a00.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'refund_request', '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:01:59', '2023-06-12 23:14:43'),
(7, 'Mart Morning [ID 1234] Just Signed In', '<p>Mart Morning [ID 1234] just signed in from the Store Panel.&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Login Time:</strong> 12.00pm</p>', NULL, NULL, '2023-06-12-6486fbdeb92d6.png', NULL, 'Check Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'login', '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:05:02', '2023-06-12 20:05:02'),
(8, 'Your Registration is Submitted Successfully!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Store Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your store registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-6487024230762.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:32:18', '2023-06-12 20:32:18'),
(9, 'Congratulations! Your Registration is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>First</strong>, you need to log in to your store panel.&nbsp;</p>\r\n\r\n<p><strong>After that,</strong> please set up your store and start selling!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> &rarr; </strong><a href=\"https://6ammart-admin.6amtech.com/store-panel/business-settings/store-setup\">https://6ammart-admin.6amtech.com/store-panel/business-settings/store-setup</a></p>', NULL, NULL, NULL, '2023-06-12-648702fb014dd.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:35:23', '2023-06-12 23:01:31'),
(10, 'Your Registration is Rejected', '<p>Dear User,&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your store registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648706ce4d5fb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:47:03', '2023-06-12 20:51:42'),
(11, 'Congratulations! Your Withdrawal is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is approved by the Admin and transferred to you bank account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870788562d9.png', 'See details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'withdraw_approve', '6', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2023-06-12 20:54:48', '2023-06-12 20:54:48'),
(12, 'Your Withdraw Request was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is rejected by the Admin.</p>\r\n\r\n<p>Reason: Insufficient Balance.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648708244930a.png', 'See Details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'withdraw_deny', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:57:24', '2023-06-12 20:57:24'),
(13, 'Your Request is Completed!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Campaign Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your request is approved or rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-648708d132665.png', '2023-06-12-6487088da18cb.png', NULL, 'See Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 20:59:09', '2023-06-12 21:00:17'),
(14, 'Congratulations! Your Campaign Request is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join campaign is approved by the Admin.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6487091d3ee5a.png', '2023-06-12-6487091d3f0b3.png', NULL, 'View Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_approve', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:01:33', '2023-06-12 23:04:45'),
(15, 'Your Campaign Join Request Was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>Your request to join the&nbsp;campaign was rejected by the admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-648709ce3e893.png', '2023-06-12-648709ce3ead2.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_deny', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:04:30', '2023-06-12 23:06:55'),
(16, 'Your Registration is Completed!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Deliveryman Registration Request.</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Deliveryman registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870c80bb7bb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2023-06-12 21:16:00', '2023-06-12 21:16:00'),
(17, 'Congratulations! Your Registration is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Here&rsquo;s what to do next:&nbsp;</strong></p>\r\n\r\n<ol>\r\n	<li>Download the Deliveryman app</li>\r\n	<li>Login with below credentials.</li>\r\n</ol>\r\n\r\n<p><strong>After that,</strong> please set up your account and start delivery!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> to download the app&rarr; </strong><a href=\"https://play.google.com/store/apps/details?id=com.sixamtech.sixam_mart_delivery_app&amp;pli=1\">https://play.google.com/store/apps/details?id=com.sixamtech.sixam_mart_delivery_app&amp;pli=1</a></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870cebc5fc6.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:17:47', '2023-06-12 23:09:23'),
(18, 'Your Registration is Rejected', '<p>Dear User,&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Deliveryman registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870da0bf819.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:20:48', '2023-06-12 21:20:48'),
(19, 'Your Account is Suspended.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your Deliveryman account has been suspended by the Admin/Store.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please contact related person to know more.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-64870e1ba4908.png', '2023-06-12-64870e1ba4cd1.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'suspend', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:22:51', '2023-06-12 21:22:51'),
(20, 'Cash Collected.', '<p>Dear User,</p>\r\n\r\n<p>The Admin has collected cash from you.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870ecf8ef10.png', 'See Details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'cash_collect', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:25:51', '2023-06-12 23:11:22'),
(21, 'Reset Your Password', '<p>Please use this OTP to reset your Password&nbsp;&rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870f8dcfcc5.png', '', '', 'Please contact us for any queries; we’re always happy to help.', 'Copyright 2023 6amMart. All right reserved.', 'dm', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:29:01', '2023-06-12 23:12:27'),
(22, 'Your Registration is Successful!', '<p>Congratulations!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You&rsquo;ve successfully registered.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64871218e4c0e.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:39:52', '2023-06-12 21:39:52'),
(23, 'Please Register with The OTP', '<p>ONE MORE STEP:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please copy the following OTP &amp; paste in on your sign-up page to complete your registration.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648712f6a5196.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'registration_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:43:34', '2023-06-12 23:13:03'),
(24, 'Confirm Your Login.', '<p>Please copy the following OTP &amp; paste in on your Log in page to confirm your account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648713d7b9612.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'login_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:46:46', '2023-06-12 23:13:41'),
(25, 'Please Verify Your Delivery.', '<p>Please give the following OTP to your Deliveryman to ensure your order.</p>\r\n\r\n<p><strong>7 5 8 9 4 3 </strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648714cf7f15a.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'order_verification', '4', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2023-06-12 21:51:27', '2023-06-12 21:51:27'),
(26, 'Your Order is Successful', '<p>Hi <strong>{userName}</strong>,</p>\r\n\r\n<p>Your order is successful. Please find your invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'Track Order', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'new_order', '3', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:52:36', '2023-06-12 23:16:37'),
(27, 'Refund Order', '<p>Hi <strong>{userName}</strong>,</p>\r\n\r\n<p>We&rsquo;ve refunded your requested amount. Please find your refund invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'refund_order', '9', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:53:40', '2023-06-12 23:18:12'),
(28, 'Reset Your Password', '<p>Please copy the following OTP &amp; paste in on your Log in page to&nbsp;reset your Password.</p>', NULL, NULL, NULL, '2023-06-12-64872af38ecfb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved..', 'user', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:54:59', '2023-06-12 23:25:55'),
(29, 'Your Refund Request was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you request for a refund was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To know more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-12-648716141b3fd.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'refund_request_deny', '8', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:56:52', '2023-06-12 21:56:52'),
(30, 'Fund Added to your Wallet.', '<p>Dear <strong>{userName}</strong>,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Admin has sent fund to your Wallet. Please check your wallet.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64871653198e0.png', 'Check Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'add_fund', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 21:57:55', '2023-06-12 23:23:47');























INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 30);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 30);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2016_06_01_000004_create_oauth_clients_table', 30),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(8, '2021_06_17_054551_create_soft_credentials_table', 31),
(9, '2022_04_10_030533_create_newsletters_table', 32),
(10, '2022_04_12_015827_create_social_media_table', 32),
(11, '2022_04_12_215009_create_jobs_table', 32),
(12, '2022_04_21_145207_add_column_to_modules_table', 32),
(13, '2022_05_12_170027_add_column_to_customer_addresses_table', 33),
(14, '2022_05_14_155444_add_all_zones_column_to_modules_table', 33),
(15, '2022_05_26_120821_change_data_column_to_user_notifiations_table', 33),
(16, '2022_03_31_103418_create_wallet_transactions_table', 34),
(17, '2022_03_31_103827_create_loyalty_point_transactions_table', 34),
(18, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 34),
(19, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 34),
(20, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 34),
(21, '2022_05_17_153333_add_ref_code_to_users_table', 34),
(22, '2022_07_31_103626_add_free_delivery_by_column_to_orders_table', 35),
(23, '2022_09_10_112137_create_user_infos_table', 36),
(24, '2022_09_10_112203_create_conversations_table', 36),
(25, '2022_09_10_112220_create_messages_table', 36),
(26, '2022_10_18_092639_create_refunds_table', 37),
(27, '2022_10_18_093323_add_refund_request_cancel_column_to_orders_table', 37),
(28, '2022_10_18_093529_create_refund_reasons_table', 37),
(29, '2022_10_19_150319_add_delivery_column_to_parcel_categories_table', 37),
(30, '2022_10_19_165501_add_default_link_column_to_banners_table', 37),
(31, '2022_10_20_105050_module_zone', 37),
(32, '2022_10_22_115553_add_is_logged_column_to_admins_table', 37),
(33, '2022_10_22_122336_add_is_logged_column_to_vendor_employees_table', 37),
(34, '2022_10_25_153214_add_payment_method_columns_to_zones_table', 37),
(35, '2022_10_31_165427_add_rename_delivery_charge_column_to_stores_table', 37),
(36, '2022_11_05_094404_add_delivery_fee_comission_to_order_transactions_table', 37),
(37, '2022_11_13_130054_create_contacts_table', 37),
(38, '2022_11_15_111925_create_expenses_table', 37),
(39, '2022_11_15_112413_add_expense_column_to_order_transactions_table', 37),
(40, '2022_12_20_104455_add_food_variations_column_to_items_table', 38),
(41, '2022_12_21_154227_alter_table_order_details_change_variation', 38),
(42, '2022_12_29_103803_add_order_id_column_to_expenses_table', 38),
(43, '2022_12_29_105321_add_maximum_cod_order_amount_column_to_module_zone_table', 38),
(44, '2022_12_29_114005_add_prescription_order_column_to_orders_table', 38),
(45, '2022_12_31_111437_create_notification_messages_table', 38),
(46, '2023_01_02_112948_create_tags_table', 38),
(47, '2023_01_02_113235_item_tag', 38),
(48, '2023_01_03_093510_add_current_language_key_column_to_users_table', 38),
(49, '2023_01_07_115354_add_prescription_order_to_stores_table', 38),
(50, '2023_01_07_180000_add_description_to_expenses_table', 38),
(51, '2023_01_10_124723_add_food_variations_column_to_item_campaigns_table', 38),
(52, '2023_01_10_145928_change_refund_amount_column_type', 38),
(53, '2023_01_10_150108_change_amount_column_type', 38),
(54, '2023_01_23_144828_add_tax_status_column_to_orders_table', 39),
(55, '2023_01_30_114113_change_delivery_charge_column_type_to_admin_wallets_table', 39),
(56, '2023_01_23_103943_add_slug_to_items_table', 40),
(57, '2023_01_23_144001_add_slug_to_categories_table', 40),
(58, '2023_01_23_144119_add_slug_to_item_campaigns_table', 40),
(59, '2023_01_23_144232_add_slug_to_stores_table', 40),
(60, '2023_02_25_133200_create_d_m_vehicles_table', 40),
(61, '2023_02_25_133302_add_vehicle_id_column_to_delivery_men_table', 40),
(62, '2023_02_25_133409_add_vehicle_id_column_to_orders_table', 40),
(63, '2023_02_25_163329_add_maximum_delivery_charge_column_to_module_zone_table', 40),
(64, '2023_02_25_175825_add_otp_hit_count_cols_in_phone_verifications_table', 40),
(65, '2023_02_25_175912_add_hit_count_at_col_in_password_resets_table', 40),
(66, '2023_02_26_144503_add_campaign_status_to_campaign_store_table', 40),
(67, '2023_02_26_162224_add_recommened_to_items_table', 40),
(68, '2023_02_27_102931_add_ref_by_col_to_users_table', 40),
(69, '2023_02_27_111635_create_order_cancel_reasons_table', 40),
(70, '2023_02_27_111937_add_cancellation_reason_col_to_orders_table', 40),
(71, '2023_02_27_161418_add_created_by_columns_to_coupons_table', 40),
(72, '2023_02_27_161533_add_created_by_columns_to_expenses_table', 40),
(73, '2023_02_27_162252_add_store_expense_columns_to_order_transactions_table', 40),
(74, '2023_02_27_162357_add_coupon_created_by_columns_to_orders_table', 40),
(75, '2023_03_01_154319_add_maximum_delivery_charge_column_to_stores_table', 40),
(76, '2023_03_02_103114_add_discount_on_product_by_column_to_orders_table', 40),
(77, '2023_03_02_143919_change_amount_column_to_expenses_table', 40),
(78, '2023_03_02_144258_add_discount_amount_by_store_col_to_order_transactions_table', 40),
(79, '2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table', 41),
(80, '2023_03_11_121000_add_temp_block_time_col_to_password_resets_table', 41),
(81, '2023_03_13_181502_add_temp_token_column_to_users_table', 41),
(82, '2023_04_05_112916_add_created_by_col_to_password_resets_table', 42),
(83, '2023_05_04_100012_create_data_settings_table', 42),
(84, '2023_05_04_100930_create_admin_promotional_banners_table', 42),
(85, '2023_05_04_101825_create_admin_features_table', 42),
(86, '2023_05_04_102015_create_admin_special_criterias_table', 42),
(87, '2023_05_07_152523_create_admin_testimonials_table', 42),
(88, '2023_05_07_173609_create_flutter_special_criterias_table', 42),
(89, '2023_05_08_125811_create_react_testimonials_table', 42),
(90, '2023_05_09_170006_create_email_templates_table', 42),
(91, '2023_05_16_104129_add_cutlery_processing_time_unavailable_product_note_col_to_orders_table', 42),
(92, '2023_05_18_093438_add_featured_col_to_categories_table', 42),
(93, '2023_05_18_143530_add_delivery_instruction_col_to_orders_table', 42),
(94, '2023_05_18_163841_add_organic_col_to_items_table', 42),
(95, '2023_05_28_153920_add_tax_percentage_col_to_orders_table', 42),
(96, '2023_06_11_172741_add_cutlery_col_to_stores_table', 42);









INSERT INTO `notification_messages` (`id`, `module_type`, `key`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'grocery', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40');
INSERT INTO `notification_messages` (`id`, `module_type`, `key`, `message`, `status`, `created_at`, `updated_at`) VALUES
(2, 'grocery', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40');
INSERT INTO `notification_messages` (`id`, `module_type`, `key`, `message`, `status`, `created_at`, `updated_at`) VALUES
(3, 'grocery', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40');
INSERT INTO `notification_messages` (`id`, `module_type`, `key`, `message`, `status`, `created_at`, `updated_at`) VALUES
(4, 'grocery', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40'),
(5, 'grocery', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40'),
(6, 'grocery', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:40'),
(7, 'grocery', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:41'),
(8, 'grocery', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:41'),
(9, 'grocery', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:41'),
(10, 'grocery', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:41'),
(11, 'grocery', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 18:53:45', '2023-06-12 21:33:41'),
(12, 'food', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(13, 'food', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(14, 'food', 'order_processing_message', '{userName}, Your food is started for cooking by {storeName}', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(15, 'food', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(16, 'food', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(17, 'food', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(18, 'food', 'out_for_delivery_message', '{userName}, Your order {orderId}  is ready for delivery', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:14'),
(19, 'food', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:15'),
(20, 'food', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:15'),
(21, 'food', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:15'),
(22, 'food', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 18:56:00', '2023-06-12 22:19:15'),
(23, 'pharmacy', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(24, 'pharmacy', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(25, 'pharmacy', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(26, 'pharmacy', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(27, 'pharmacy', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(28, 'pharmacy', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(29, 'pharmacy', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(30, 'pharmacy', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(31, 'pharmacy', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(32, 'pharmacy', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(33, 'pharmacy', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 18:57:46', '2023-06-12 22:22:20'),
(34, 'ecommerce', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(35, 'ecommerce', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(36, 'ecommerce', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(37, 'ecommerce', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(38, 'ecommerce', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(39, 'ecommerce', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(40, 'ecommerce', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(41, 'ecommerce', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(42, 'ecommerce', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(43, 'ecommerce', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(44, 'ecommerce', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 18:59:24', '2023-06-12 22:25:02'),
(45, 'parcel', 'order_pending_message', '{userName}, Your parcel order is successfully placed', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(46, 'parcel', 'order_confirmation_msg', 'Your order {orderId} is confirmed', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(47, 'parcel', 'out_for_delivery_message', 'Your parcel order  {orderId}  is ready for delivery', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(48, 'parcel', 'order_delivered_message', 'Your parcel id  {orderId}  is delivered', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(49, 'parcel', 'delivery_boy_assign_message', 'Your order {orderId}  has been assigned to a delivery man', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(50, 'parcel', 'delivery_boy_delivered_message', 'parcel id  {orderId}  delivered successfully', 1, '2023-01-17 19:01:02', '2023-06-12 22:29:42'),
(51, 'parcel', 'order_cancled_message', 'Order is canceled by your request', 1, '2023-01-17 19:01:02', '2023-01-17 19:01:02');







INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 23:44:50', '2021-08-19 23:44:50');
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 23:44:50', '2021-08-19 23:44:50');
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(3, NULL, 'stackfood Personal Access Client', 'iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk', NULL, 'http://localhost', 1, 0, 0, '2022-01-05 12:22:36', '2022-01-05 12:22:36');
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(4, NULL, 'stackfood Password Grant Client', 'FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC', 'users', 'http://localhost', 0, 1, 0, '2022-01-05 12:22:36', '2022-01-05 12:22:36');

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 23:44:50', '2021-08-19 23:44:50');
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(2, 3, '2022-01-05 12:22:36', '2022-01-05 12:22:36');



































































/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;