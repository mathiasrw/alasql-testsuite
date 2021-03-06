-- MODULE   XTS719

-- SQL Test Suite, V6.0, Interactive SQL, xts719.sql
-- 59-byte ID
-- TEd Version #

-- AUTHORIZATION CTS4              

   SELECT USER FROM HU.ECCO;
-- RERUN if USER value does not match preceding AUTHORIZATION comment
   ROLLBACK WORK;

-- date_time print

-- TEST:7019 Access to KEY_COLUMN_USAGE view!

   SELECT COUNT(*) 
         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
         WHERE CONSTRAINT_SCHEMA = 'CTS4';
-- PASS:7019 If COUNT = 0?

   COMMIT WORK;

   CREATE TABLE TAB719a 
         (COLNUM1 NUMERIC(5) PRIMARY KEY,
          COLNUM2 NUMERIC(7) UNIQUE,
          COLSTR1 CHAR(10),
          COLSTR2 CHAR(5));
-- PASS:7019 If table created successfully?

   COMMIT WORK;

   SELECT COUNT(COLUMN_NAME) 
         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
         WHERE TABLE_SCHEMA = 'CTS4' AND TABLE_NAME = 'TAB719A';
-- PASS:7019 If COUNT = 2?

   COMMIT WORK;

   CREATE TABLE TAB719b
         (CNUM1 NUMERIC(5),
          CNUM2 NUMERIC(7), 
          CSTR1 CHAR(10) UNIQUE NOT NULL,
          CSTR2 CHAR(5),
         FOREIGN KEY (CNUM1) REFERENCES TAB719a(COLNUM1));
-- PASS:7019 If table created successfully?

   COMMIT WORK;

   SELECT COUNT(*) 
         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
         WHERE TABLE_SCHEMA = 'CTS4';
-- PASS:7019 If COUNT = 4?

   SELECT COUNT(*) 
         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
         WHERE TABLE_SCHEMA = 'CTS4'
         AND TABLE_NAME = 'TAB719A'
         AND COLUMN_NAME = 'COLNUM1';
-- PASS:7019 If COUNT = 1?

   SELECT COUNT(*) 
         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
         WHERE TABLE_SCHEMA = 'CTS4'
         AND TABLE_NAME = 'TAB719B'
         AND COLUMN_NAME = 'CNUM1';
-- PASS:7019 If COUNT = 1?

   COMMIT WORK;

   DROP TABLE TAB719a CASCADE;
-- PASS:7019 If table dropped successfully?

   COMMIT WORK;

   SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
     WHERE TABLE_SCHEMA = 'CTS4';
-- PASS:7019 If COUNT = 1?

   ROLLBACK WORK;

   DROP TABLE TAB719b CASCADE;
-- PASS:7019 If table dropped successfully?

   COMMIT WORK;

-- END TEST >>> 7019 <<< END TEST
-- *********************************************
-- *************************************************////END-OF-MODULE
