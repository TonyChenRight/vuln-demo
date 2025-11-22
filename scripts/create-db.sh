CREATE DATABASE vulnerability_library CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'vulibrary'@'%' IDENTIFIED BY  'vulibrary123456';
GRANT ALL PRIVILEGES ON vulnerability_library.* TO 'vulibrary'@'%';
FLUSH PRIVILEGES;