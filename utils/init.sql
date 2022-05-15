-- Recreate the database with the correct encoding
CREATE DATABASE tmp;
\connect tmp
DROP DATABASE synapse;
CREATE DATABASE synapse ENCODING 'UTF-8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
DROP tmp;
