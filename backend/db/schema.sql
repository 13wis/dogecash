DROP DATABASE IF EXISTS dogecash;
CREATE DATABASE dogecash CHARACTER SET 'utf8mb4' COLLATE utf8mb4_bin;
USE dogecash;

CREATE TABLE IF NOT EXISTS doges
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  dob TEXT,
  dogetag TEXT(255),
  email TEXT(255) NOT NULL,
  first_name TEXT,
  last_name TEXT,
  profile_pic_url VARCHAR(2048),
  external_account_linked BOOLEAN NOT NULL DEFAULT false,
  stripe_account_created BOOLEAN NOT NULL DEFAULT false,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FULLTEXT INDEX (dogetag, email),
  CONSTRAINT UniqueDoge UNIQUE (id, email(255), dogetag(255))
);

CREATE TABLE IF NOT EXISTS hidden_doges
(
  account_id TEXT,
  customer_id TEXT,
  doge_id INT NOT NULL,
  password_hash TEXT NOT NULL,
  verification_hash TEXT,
  hash_expiration INT,
  ich_id TEXT,
  card_id TEXT,
  FOREIGN KEY (doge_id) REFERENCES doges(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS my_doges
(
  dogee INT NOT NULL,
  doger INT NOT NULL,
  interaction_type ENUM('recent', 'suggested') NOT NULL DEFAULT 'recent',
  last_interaction DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dogee) REFERENCES doges(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (doger) REFERENCES doges(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS blocks
(
  blockee INT NOT NULL,
  blocker INT NOT NULL,
  FOREIGN KEY (blockee) REFERENCES doges(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (blocker) REFERENCES doges(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS activities
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  activity_type ENUM('add_cash', 'cash_out', 'pay', 'request') NOT NULL,
  amount INT NOT NULL,
  arrival_date INT,
  bank_name TEXT,
  brand TEXT,
  created INT NOT NULL,
  last4 TEXT,
  note TEXT,
  refunded BOOLEAN NOT NULL DEFAULT false,
  /* Payment method details has too many types to effectively type check
    this column */
  external_account_type TEXT,
  source_id INT NOT NULL,
  to_id INT
);