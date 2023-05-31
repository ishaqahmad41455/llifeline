-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2023 at 11:50 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifeline`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add user', 4, 'add_customuser'),
(14, 'Can change user', 4, 'change_customuser'),
(15, 'Can delete user', 4, 'delete_customuser'),
(16, 'Can view user', 4, 'view_customuser'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add contact', 7, 'add_contact'),
(26, 'Can change contact', 7, 'change_contact'),
(27, 'Can delete contact', 7, 'delete_contact'),
(28, 'Can view contact', 7, 'view_contact'),
(29, 'Can add inquiries', 8, 'add_inquiries'),
(30, 'Can change inquiries', 8, 'change_inquiries'),
(31, 'Can delete inquiries', 8, 'delete_inquiries'),
(32, 'Can view inquiries', 8, 'view_inquiries'),
(33, 'Can add treatments', 9, 'add_treatments'),
(34, 'Can change treatments', 9, 'change_treatments'),
(35, 'Can delete treatments', 9, 'delete_treatments'),
(36, 'Can view treatments', 9, 'view_treatments'),
(37, 'Can add referrals', 10, 'add_referrals'),
(38, 'Can change referrals', 10, 'change_referrals'),
(39, 'Can delete referrals', 10, 'delete_referrals'),
(40, 'Can view referrals', 10, 'view_referrals');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-28 07:42:24.691225', '2', 'Noor', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\", \"Age\"]}}]', 4, 1),
(2, '2023-05-28 07:42:43.574592', '1', 'ishaq', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Age\"]}}]', 4, 1),
(3, '2023-05-28 07:44:16.378970', '2', 'Noor', 2, '[]', 4, 1),
(4, '2023-05-28 07:48:48.289535', '3', 'ali', 3, '', 4, 1),
(5, '2023-05-28 07:48:48.293692', '2', 'Noor', 3, '', 4, 1),
(6, '2023-05-29 05:46:12.526996', '1', 'ishaq', 2, '[{\"changed\": {\"fields\": [\"Address\", \"Phone\", \"Dob\", \"Gender\"]}}]', 4, 1),
(7, '2023-05-29 10:04:09.169386', '5', 'hammad', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Age\", \"Address\", \"Phone\", \"Dob\", \"Gender\"]}}]', 4, 1),
(8, '2023-05-29 20:04:42.699556', '12', 'fawad', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(9, '2023-05-29 20:05:06.678535', '2', 'Referrals object (2)', 2, '[{\"changed\": {\"fields\": [\"Is attended\"]}}]', 10, 1),
(10, '2023-05-29 20:24:14.479576', '3', 'Referrals object (3)', 2, '[{\"changed\": {\"fields\": [\"Is attended\"]}}]', 10, 1),
(11, '2023-05-30 18:25:12.510950', '12', 'fawad', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Dob\"]}}]', 4, 1),
(12, '2023-05-30 18:25:47.637593', '12', 'fawad', 2, '[{\"changed\": {\"fields\": [\"Age\"]}}]', 4, 1),
(13, '2023-05-30 18:40:13.393498', '12', 'fawad', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'auth', 'permission'),
(2, 'auth', 'group'),
(3, 'contenttypes', 'contenttype'),
(4, 'users', 'customuser'),
(5, 'admin', 'logentry'),
(6, 'sessions', 'session'),
(7, 'home', 'contact'),
(8, 'home', 'inquiries'),
(9, 'home', 'treatments'),
(10, 'home', 'referrals');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-26 19:27:54.282003'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-05-26 19:27:54.349826'),
(3, 'auth', '0001_initial', '2023-05-26 19:27:54.770162'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-05-26 19:27:54.872145'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-05-26 19:27:54.897345'),
(6, 'auth', '0004_alter_user_username_opts', '2023-05-26 19:27:54.971213'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-05-26 19:27:54.996291'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-05-26 19:27:55.007522'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-05-26 19:27:55.039364'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-05-26 19:27:55.065047'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-05-26 19:27:55.093594'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-05-26 19:27:55.137994'),
(13, 'auth', '0011_update_proxy_permissions', '2023-05-26 19:27:55.147524'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-05-26 19:27:55.155347'),
(15, 'users', '0001_initial', '2023-05-26 19:27:55.561315'),
(16, 'admin', '0001_initial', '2023-05-26 19:28:08.584616'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-05-26 19:28:08.643933'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-26 19:28:08.667624'),
(19, 'sessions', '0001_initial', '2023-05-26 19:28:08.735663'),
(20, 'home', '0001_initial', '2023-05-28 06:28:16.495919'),
(21, 'home', '0002_alter_contact_date_alter_contact_phone', '2023-05-28 06:30:04.429231'),
(22, 'home', '0003_inquiries', '2023-05-28 07:35:12.938037'),
(23, 'users', '0002_customuser_address_customuser_dob_customuser_gender_and_more', '2023-05-28 17:46:43.100107'),
(24, 'home', '0004_inquiries_symptoms_alter_inquiries_dob_and_more', '2023-05-29 04:45:31.608222'),
(25, 'home', '0005_inquiries_age', '2023-05-29 04:58:41.995399'),
(26, 'users', '0003_customuser_is_doctor_customuser_is_ngo_and_more', '2023-05-29 05:21:20.823216'),
(27, 'home', '0006_inquiries_is_attended', '2023-05-29 06:22:12.210967'),
(28, 'home', '0007_treatments', '2023-05-29 06:56:56.565133'),
(29, 'home', '0008_treatments_inquiry_alter_treatments_id', '2023-05-29 11:09:35.221557'),
(30, 'home', '0009_referrals', '2023-05-29 18:44:45.332902'),
(31, 'home', '0010_remove_referrals_ngo_referrals_ngo', '2023-05-29 19:35:13.634341'),
(32, 'home', '0011_rename_ngo_referrals_ngos', '2023-05-29 19:37:26.562078'),
(33, 'home', '0012_referrals_is_attended', '2023-05-29 20:01:24.106097'),
(34, 'home', '0013_alter_contact_phone_alter_inquiries_phone', '2023-05-31 08:03:46.745897');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9g25kgjf2uqdestnswnzxvxivl85e83i', 'e30:1q2dpZ:4PONsW8f1RfAu9Szvpe7C8s2wiI11y_ulcWbE0F_oFI', '2023-06-09 20:14:33.000686'),
('xhnpg3pr434snf8mzwz7ak2fm8bw2gmv', '.eJxVjs0OwiAQhN-FsyFAW7p49O4zkF12K1UDSX9OxndXkh70Ot83k3mpiPuW477KEmdWZ2WdOv2GhOkhpRG-Y7lVnWrZlpl0U_RBV32tLM_L4f4NZFxzaxMEFEjGswU39KE3EzOPfZCRYAKABFaIO-MCofHgOwmDRfIiAN9X7w8T9zgl:1q3bMl:IUnM_Rnw1tah45307kBxX99pvTMyqvTFFI0kTih5jac', '2023-06-12 11:48:47.593870'),
('5wj78z9f85oz7vnpgjy477itwri1k59e', '.eJxVjDkOwjAUBe_iGln-8aZQ0nMG62_GAZRIWSrE3SFSCmjfzLyXKbitrWyLzmUQczZgTr8bIT903IHccbxNlqdxnQeyu2IPutjrJPq8HO7fQcOlfesKKEGjp0QS1fkeueZeAH3yfdDsAJBJuhAjRO-r64gVcnbOJVYS8_4A84w4EA:1q3Vg2:_V_6TDSoDcoRwU8yjZzwZrQ12HEMET43BdBVQigdsVw', '2023-06-12 05:44:18.106751'),
('3h7ngoalv55dt8fr5s8iozoq6sxsnoz6', '.eJxVjE0OwiAYBe_C2hAoBfxcuvcM5PEnVQNJaVfGu9smXeh2Zt57M4d1KW7taXZTZBcmiZ1-oUd4prqb-EC9Nx5aXebJ8z3hh-381mJ6XY_276Cgl23tsyUTSEitJSgqQGXlrYBQZ8BmMnK0wiSthoCsR5ActDCUbI4bj-zzBQBwN6o:1q4IME:F-UM7z_VH7VH-cCCxVfBjo2jVJG959e2sOIirn-pMcw', '2023-06-14 09:43:06.844265');

-- --------------------------------------------------------

--
-- Table structure for table `home_contact`
--

DROP TABLE IF EXISTS `home_contact`;
CREATE TABLE IF NOT EXISTS `home_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(122) NOT NULL,
  `email` varchar(122) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_contact`
--

INSERT INTO `home_contact` (`id`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, 'jasldfkjkwerj', 'naveed@gmail.com', '234223423', 'this is a goood option', '2023-05-28'),
(2, 'ishaq', 'isha@gmail.com', '234234', 'welcome to pakistan', '2023-05-28'),
(3, 'jhon wick', 'johnwick@gmail.com', '23428742389', 'welcome to pakistan', '2023-05-28'),
(4, 'noor ul islam', 'noor@gmail.com', '2342432', 'welcome to lifeline', '2023-05-28'),
(5, 'shahdab', 'shahdab@gmail.com', '2342342', 'welcome to pakistan', '2023-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `home_inquiries`
--

DROP TABLE IF EXISTS `home_inquiries`;
CREATE TABLE IF NOT EXISTS `home_inquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(122) NOT NULL,
  `email` varchar(122) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` longtext,
  `dob` date DEFAULT NULL,
  `gender` varchar(122) NOT NULL,
  `address` varchar(122) NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `symptoms` longtext,
  `age` int DEFAULT NULL,
  `is_attended` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_inquiries_user_id_ba2d1778` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_inquiries`
--

INSERT INTO `home_inquiries` (`id`, `name`, `email`, `phone`, `message`, `dob`, `gender`, `address`, `date`, `user_id`, `symptoms`, `age`, `is_attended`) VALUES
(1, 'hammad', 'hammad@gmail.com', '234892347', 'save me', '2023-05-28', 'male', 'kiyarkarimabad@gm.com', '2023-05-28', 5, NULL, NULL, 1),
(2, 'naeem', 'naeem@gmail.com', '23498234897', 'dont want to live in this world', '1999-07-13', 'Male', 'yarkhoon pakistan', '2023-05-29', 10, 'anxiety, depression, ', NULL, 1),
(3, 'Shams', 'shams@hmc.edu.pk', '12343242', 'i want a healty life, i am suffering \r\n', '1992-02-13', 'Male', 'peshawar Pakistan', '2023-05-29', 11, 'anxiety', NULL, 0),
(4, 'ishaq', 'ishaqahmad41455@gmail.com', '234242234', 'sometimes i think of jumping off the clip, i want some help', '2020-12-09', 'male', 'yarkhoon chitral pakistan', '2023-05-29', 1, 'i an motivated to die', NULL, 1),
(5, 'newuser', 'newuser@gmail.com', '232342', 'Please help me i want to go tot mars', '2000-07-05', 'Female', 'planet earth', '2023-05-30', 15, 'Dizzyness, Willing to jump of a cliff, urge to run into traffic', NULL, 1),
(6, 'hamd', 'hamdfarooq@gmail.com', '23489427889', 'i think i am very bad in the process of life, i need some help before i do something wrong to myself', '1995-10-18', 'Male', 'mallam jabba swat', '2023-05-30', 16, 'anxiety, willingness to die, watching horror movies, getting away from friends, ', NULL, 1),
(7, 'ishaq', 'ishaqahmad41455@gmail.com', '234242234', 'i hate my life', '2020-12-09', 'male', 'yarkhoon chitral pakistan', '2023-05-30', 1, 'nausia', NULL, 1),
(8, 'ishaq', 'ishaqahmad41455@gmail.com', '234242234', 'this is bad ', '2020-12-09', 'male', 'yarkhoon chitral pakistan', '2023-05-30', 1, 'sickness inside me', NULL, 1),
(9, 'faisal', 'faislam@gmail.com', '2839472384978', 'please help me.', '1998-06-24', 'Male', 'peshawar pakistan', '2023-05-31', 18, 'hating life, anxiety, fed up of everything', NULL, 1),
(10, 'hamdanii', 'hamdfarooq5@gmail.com', '03171343284', 'please help me with this.', '1976-06-28', 'Male', 'Imsciences Peshawar hostel3', '2023-05-31', 19, 'i have feelings to sucide from a high tall buliding like a burj khalifa. i m fed up from this life. my lover left me and there is no one in my life ri', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `home_referrals`
--

DROP TABLE IF EXISTS `home_referrals`;
CREATE TABLE IF NOT EXISTS `home_referrals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `inquiry_id` int DEFAULT NULL,
  `patient_id` bigint DEFAULT NULL,
  `is_attended` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_referrals_doctor_id_105821cd` (`doctor_id`),
  KEY `home_referrals_inquiry_id_d3ea5523` (`inquiry_id`),
  KEY `home_referrals_patient_id_ea601b3a` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_referrals`
--

INSERT INTO `home_referrals` (`id`, `date`, `time`, `doctor_id`, `inquiry_id`, `patient_id`, `is_attended`) VALUES
(1, '2023-05-30', '00:46:30.688974', 12, 2, 10, 1),
(2, '2023-05-30', '00:58:04.770522', 12, 3, 11, 1),
(3, '2023-05-30', '01:22:47.068588', 12, 5, 15, 1),
(4, '2023-05-30', '13:32:13.310829', 17, 5, 15, 0),
(5, '2023-05-30', '13:32:24.841117', 17, 5, 15, 0),
(6, '2023-05-31', '12:58:57.150684', 12, 3, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `home_referrals_ngos`
--

DROP TABLE IF EXISTS `home_referrals_ngos`;
CREATE TABLE IF NOT EXISTS `home_referrals_ngos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `referrals_id` int NOT NULL,
  `customuser_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_referrals_ngo_referrals_id_customuser_id_a9605f5b_uniq` (`referrals_id`,`customuser_id`),
  KEY `home_referrals_ngo_referrals_id_7f26d1bc` (`referrals_id`),
  KEY `home_referrals_ngo_customuser_id_82551ae1` (`customuser_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_referrals_ngos`
--

INSERT INTO `home_referrals_ngos` (`id`, `referrals_id`, `customuser_id`) VALUES
(1, 1, 14),
(2, 2, 14),
(3, 3, 14),
(4, 4, 13),
(5, 5, 14),
(6, 6, 13);

-- --------------------------------------------------------

--
-- Table structure for table `home_treatments`
--

DROP TABLE IF EXISTS `home_treatments`;
CREATE TABLE IF NOT EXISTS `home_treatments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `suggestions` longtext,
  `meds` longtext,
  `doctor_id` bigint DEFAULT NULL,
  `patient_id` bigint DEFAULT NULL,
  `inquiry_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_treatments_doctor_id_1d70674d` (`doctor_id`),
  KEY `home_treatments_patient_id_dd107401` (`patient_id`),
  KEY `home_treatments_inquiry_id_5890447e` (`inquiry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_treatments`
--

INSERT INTO `home_treatments` (`id`, `date`, `time`, `suggestions`, `meds`, `doctor_id`, `patient_id`, `inquiry_id`) VALUES
(1, '2023-05-29', '15:40:31.622083', 'hang out with friends and family and do sports ', 'cocaine, taqila, pine', 12, 5, NULL),
(2, '2023-05-29', '16:53:51.410568', 'eat some local food, and avoid urban lifestyle for sometime', 'voren', 12, 1, NULL),
(3, '2023-05-30', '13:28:41.189568', 'please take some time off your phone and talk to friends and family, also start sporting like football and cricket so you can make new friends and have some good time.', 'taqila', 17, 16, NULL),
(4, '2023-05-30', '16:06:08.359387', 'take some time off bro leave school and start working at a cafe', 'caffine, alcohal', 12, 1, NULL),
(5, '2023-05-30', '16:49:19.415210', 'just chill bro', 'eat grass', 12, 1, 8),
(6, '2023-05-31', '13:06:21.278685', 'i am recommending you some tip to get interest back in life.\r\ngo for treking friends, \r\nplay sports\r\n', 'cocaine', 12, 18, 9),
(7, '2023-05-31', '14:42:51.010608', 'go on there is no other way for you. :)', 'Zahar', 12, 19, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
CREATE TABLE IF NOT EXISTS `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `age` int UNSIGNED DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  `is_ngo` tinyint(1) NOT NULL,
  `is_patient` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ;

--
-- Dumping data for table `users_customuser`
--

INSERT INTO `users_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `age`, `address`, `dob`, `gender`, `phone`, `is_doctor`, `is_ngo`, `is_patient`, `is_verified`) VALUES
(1, 'pbkdf2_sha256$600000$uNO6KfENFZTJHAODw4stnr$QjFNmd36qAWJfea2ObDxXO4j92vFCN/5e14OtekFrl8=', '2023-05-30 10:40:17.507978', 1, 'ishaq', 'ishaq', 'ahmad', 'ishaqahmad41455@gmail.com', 1, 1, '2023-05-26 19:38:19.000000', 23, 'yarkhoon chitral pakistan', '2020-12-09', 'male', '234242234', 0, 0, 0, 0),
(5, 'pbkdf2_sha256$600000$sOpGzX23EpqerSq4zk5KjU$/lH+pUH7x4/OrLNR8k2oW4Ran21ENet5L9NcU4kiU3w=', '2023-05-28 07:52:38.000000', 0, 'hammad', 'hammad', 'khan', 'hammad@gmail.com', 0, 1, '2023-05-28 07:52:25.000000', 23, 'karak pakistan', '2021-06-08', 'male', '13142343', 0, 0, 0, 0),
(4, 'pbkdf2_sha256$600000$T5Wmv3b5SNDljAVQXmaJ4o$jtLU1JQydr8u/Xsb46FeIbeq9OFO4MzWVSlU4Q5s35c=', '2023-05-28 07:48:21.926247', 0, 'ansar', '', '', 'ansar@gmail.com', 0, 1, '2023-05-28 07:48:09.156005', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(6, 'pbkdf2_sha256$600000$Nx96XtJZQFNUkPXNeasVja$wgaVlzL2eWdftGRrbeDGGePuGoEY1vesTk+6D7/M1i4=', '2023-05-28 18:07:07.093988', 0, 'shahadat', '', '', 'shahadat@gmail.com', 0, 1, '2023-05-28 18:07:06.633519', NULL, 'karachi pakistan', '2023-07-19', 'Male', '234782348729', 0, 0, 0, 0),
(7, 'pbkdf2_sha256$600000$VTy5Xlo0nvLtwx95g8a5U2$BktBlalxF8IMDePmVb0gyo5E29UIG6BbggS2f5XwB/c=', '2023-05-28 18:08:31.077766', 0, 'shahida', '', '', 'shahida@gmail.com', 0, 1, '2023-05-28 18:08:30.685042', NULL, 'chitral pakistan', '2022-01-21', 'Female', '2348273489', 0, 0, 0, 0),
(8, 'pbkdf2_sha256$600000$yIkHXALxUqvhJ2STXVsRGM$b4PJcjmweAq5EFkTAHl4cPAAHFJ99R3mPJjckpHdASU=', '2023-05-29 09:56:19.030919', 0, 'noor', '', '', 'noorulislam770@gmail.com', 0, 1, '2023-05-28 19:28:26.090619', NULL, 'susuoom', '2023-05-05', 'Male', '234234', 0, 0, 0, 0),
(9, 'pbkdf2_sha256$600000$Fmtl6zobluKT57xxcWiM4E$OU6SAGFIX6hvH6i3GP3CnmpDUbBDxLifSqw5J8peDlo=', '2023-05-28 19:59:00.214464', 0, 'noorislamabc', '', '', 'noorulislmabc@gmail.com', 0, 1, '2023-05-28 19:58:59.759556', NULL, 'sdkfjaskldfasdf', '2023-05-26', 'Male', '2324234', 0, 0, 0, 0),
(10, 'pbkdf2_sha256$600000$z5JyAnOc1bIK8jQ2il4vSm$hcvs1FXZZQrJXerkNcJaEd6cdbq8nji6zgqdhRTRxiA=', '2023-05-29 04:56:06.298769', 0, 'naeem', '', '', 'naeem@gmail.com', 0, 1, '2023-05-29 04:56:05.600750', 23, 'yarkhoon pakistan', '1999-07-13', 'Male', '23498234897', 0, 0, 0, 0),
(11, 'pbkdf2_sha256$600000$ez4Elib3mBAs6ULGkj8okT$tFMJ6T7zfm2LH+9tMgbLQXBntMPkVf4Dc2hYV4NH+iU=', '2023-05-29 06:08:46.796805', 0, 'Shams', '', '', 'shams@hmc.edu.pk', 0, 1, '2023-05-29 05:35:05.089806', 31, 'peshawar Pakistan', '1992-02-13', 'Male', '12343242', 1, 0, 0, 0),
(12, 'pbkdf2_sha256$600000$396vJhiFoXMiu6WeIH1QvH$aLoEphCotm40Bdg/4vj185I0F2ExUTIJXK1X2gquPpY=', '2023-05-31 09:41:52.622713', 1, 'fawad', 'fawad', 'khan', 'fawad@gmail.com', 1, 1, '2023-05-29 06:09:41.000000', 45, 'peshawar pakistan', '2020-01-07', 'Male', '23984728947', 1, 0, 0, 0),
(13, 'pbkdf2_sha256$600000$S7nMUtYR8nyu6qBMZtO7WB$i1/qNgjwNPbwgbC5VUd8q840+iCFybYNm4IhFjyFI3A=', '2023-05-29 11:46:15.429228', 0, 'shaukatkhanum', '', '', 'mentalhealth@shaukatkhanam.com', 0, 1, '2023-05-29 11:46:14.952601', NULL, 'All over pakistan', NULL, NULL, '92348298492', 0, 1, 0, 0),
(14, 'pbkdf2_sha256$600000$eiDygHKSA9mxY54afpR4n8$r2fSoBXv3zfIV3xTJdR4LPYUwaKih+ZH75NWjiogqnI=', '2023-05-31 09:32:57.736800', 0, 'WHO', '', '', 'info@who.com', 0, 1, '2023-05-29 11:48:41.025739', NULL, 'all over the world', NULL, NULL, '23847929', 0, 1, 0, 0),
(15, 'pbkdf2_sha256$600000$VdBPaS0uB5FvSNJbM0JhbF$DucACAx/T7aYpGrMjaVAhgm6fZo/XCbbceMlOBXBP3U=', '2023-05-29 20:20:48.678548', 0, 'newuser', '', '', 'newuser@gmail.com', 0, 1, '2023-05-29 20:20:48.280202', 22, 'planet earth', '2000-07-05', 'Female', '232342', 0, 0, 0, 0),
(16, 'pbkdf2_sha256$600000$j7WXuuH7qKFs9YVTI2Frvj$p3+nLMx9jHPKEMS8EVof1+siiF4L8Euwiu4WcpSSiyE=', '2023-05-30 08:21:43.674753', 0, 'hamd', 'hamd', 'farooq', 'hamdfarooq@gmail.com', 0, 1, '2023-05-30 08:21:43.193881', 27, 'mallam jabba swat', '1995-10-18', 'Male', '23489427889', 0, 0, 0, 0),
(17, 'pbkdf2_sha256$600000$byOLSsngccYIFDGZTPb4lt$Pd4kRTvBGDuGjW/BWUBvgqL1YgRttUGfvMbDzlIpvBM=', '2023-05-30 08:27:13.781031', 0, 'alia', 'alia', 'khan', 'aliakhan@gmail.com', 0, 1, '2023-05-30 08:27:13.401437', 23, 'Islamabad Pakistan', '1999-06-09', 'Female', '234897234', 1, 0, 0, 0),
(18, 'pbkdf2_sha256$600000$5pRjbn4xkYjMChQiGmKb8A$KEMObOqtiAAHkrZb3W9i4smn4dnclwiLEYaBe3S1kXU=', '2023-05-31 08:09:32.139868', 0, 'faisal', 'faisal', 'khan', 'faislam@gmail.com', 0, 1, '2023-05-31 08:01:26.450109', 24, 'peshawar pakistan', '1998-06-24', 'Male', '2839472384978', 0, 0, 0, 0),
(19, 'pbkdf2_sha256$600000$VjfJfpBsZ3G8ZfV6fPdTYe$x8mh210UpjS9MOYDBBXxe9OB9R/cbmoZ0dv7xubm4y8=', '2023-05-31 09:43:06.842359', 0, 'hamdanii', 'Hamd', 'Farooq', 'hamdfarooq5@gmail.com', 0, 1, '2023-05-31 09:40:16.081088', 46, 'Imsciences Peshawar hostel3', '1976-06-28', 'Male', '03171343284', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
CREATE TABLE IF NOT EXISTS `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_customuser_id_958147bf` (`customuser_id`),
  KEY `users_customuser_groups_group_id_01390b14` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
CREATE TABLE IF NOT EXISTS `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_user_permissions_customuser_id_5771478b` (`customuser_id`),
  KEY `users_customuser_user_permissions_permission_id_baaa2f74` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
