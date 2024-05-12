SHOW DATABASES;

CREATE DATABASE sistem_penjualan;
USE sistem_penjualan;

CREATE TABLE user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM("OWNER", "ADMIN", "KASIR") NOT NULL,
    nik CHAR(16) NULL,
    telp VARCHAR(20) NULL,
    alamat VARCHAR(255) NULL,
	is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	UNIQUE KEY username_unique (username),
    UNIQUE KEY email_unique (email),
    INDEX fullname_index (full_name),
    INDEX nik_index (nik),
    INDEX telp_index (telp),
    INDEX alamat_index (alamat)
     );
     
INSERT INTO user (username, full_name, email, password, role, nik, telp, alamat) VALUES
	('rayyreall', 'Muhammad Rizki Firdaus', 'rizkifirdaus2902@gmail.com', 'iki251429', 'OWNER', '1234567891234567', '081349923422', 'Martapura'),
    ('admin', 'admin', 'admin@admin.com', 'admin', 'ADMIN', '1234567891234567', '081349923422', 'Martapura');

SHOW TABLES;
SHOW VARIABLES LIKE 'port';
SHOW CREATE TABLE user;

GRANT ALL PRIVILEGES ON sistem_penjualan.* TO 'root'@'localhost' IDENTIFIED BY 'iki251429';
FLUSH PRIVILEGES;