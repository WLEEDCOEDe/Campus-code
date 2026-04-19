-- ============================================
-- Campus Code - Full Database Initialization
-- Database: my_project
-- ============================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";

-- ============================================
-- Create and select database
-- ============================================
CREATE DATABASE IF NOT EXISTS `my_project`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `my_project`;

-- ============================================
-- Table: tracks
-- ============================================
CREATE TABLE IF NOT EXISTS `tracks` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tracks` (`id`, `name`, `description`) VALUES
(1, 'Programming', 'Learn programming languages and software development fundamentals'),
(2, 'Data Science', 'Master data analysis, machine learning, and AI techniques'),
(3, 'Networking', 'Understand computer networks, cloud infrastructure, and security');

-- ============================================
-- Table: courses
-- ============================================
CREATE TABLE IF NOT EXISTS `courses` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `price` DECIMAL(10,2) DEFAULT 0,
  `image` VARCHAR(255) DEFAULT NULL,
  `track` VARCHAR(255) DEFAULT NULL,
  `track_id` INT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_courses_track` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `courses` (`id`, `title`, `description`, `price`, `image`, `track`, `track_id`) VALUES
(1,  'Python for Beginners',          'A complete introduction to Python programming from scratch.',                          49.99,  'python.png',           'Programming',  1),
(2,  'Advanced Python',               'Deep dive into Python with OOP, decorators, and async programming.',                  89.99,  'python.png',           'Programming',  1),
(3,  'Web Development with PHP',      'Build dynamic websites using PHP and MySQL from the ground up.',                       69.99,  'default.jpg',          'Programming',  1),
(4,  'JavaScript Essentials',         'Learn JavaScript fundamentals and DOM manipulation for interactive web pages.',        59.99,  'default.jpg',          'Programming',  1),
(5,  'Data Structures & Algorithms',  'Master core data structures and algorithm design for technical interviews.',           79.99,  'default.jpg',          'Programming',  1),
(6,  'Data Analysis with Python',     'Use Pandas, NumPy, and Matplotlib to analyse and visualise real-world datasets.',     89.99,  'data ana.jpg',         'Data Science', 2),
(7,  'Machine Learning Fundamentals', 'Understand supervised and unsupervised learning with scikit-learn.',                   99.99,  'machine_learning.png', 'Data Science', 2),
(8,  'Deep Learning & Neural Nets',   'Build and train neural networks using TensorFlow and Keras.',                         119.99,  'machine_learning.png', 'Data Science', 2),
(9,  'Data Science Bootcamp',         'An end-to-end bootcamp covering the full data science workflow.',                     109.99,  'data_science.png',     'Data Science', 2),
(10, 'SQL & Database Design',         'Design relational databases and write advanced SQL queries.',                          59.99,  'default.jpg',          'Data Science', 2),
(11, 'Cloud Computing Essentials',    'Introduction to cloud platforms, services, and deployment models.',                    79.99,  'cloud_computing.png',  'Networking',   3),
(12, 'Networking Fundamentals',       'Learn TCP/IP, subnetting, routing, and switching from the ground up.',                 69.99,  'networking.png',       'Networking',   3),
(13, 'Cybersecurity Basics',          'Understand common threats, vulnerabilities, and how to defend against them.',          89.99,  'default.jpg',          'Networking',   3),
(14, 'AWS Solutions Architect',       'Prepare for the AWS Solutions Architect exam with hands-on labs.',                    129.99,  'cloud_computing.png',  'Networking',   3),
(15, 'Linux Administration',          'Master Linux command line, shell scripting, and system administration.',               74.99,  'default.jpg',          'Networking',   3);

-- ============================================
-- Table: users
-- ============================================
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin User',   'admin@campuscode.com',   '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(2, 'Ahmed Hassan', 'ahmed@example.com',      '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3, 'Sara Ali',     'sara@example.com',       '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4, 'Omar Khaled',  'omar@example.com',       '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

-- ============================================
-- Table: coupons
-- ============================================
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `code` VARCHAR(50) UNIQUE NOT NULL,
  `discount_percent` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `coupons` (`id`, `code`, `discount_percent`) VALUES
(1, 'CAMPUS20',  20);

COMMIT;
