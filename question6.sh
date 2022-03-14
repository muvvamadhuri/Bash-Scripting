!/bin/bash

echo "Enter your first name"
read first_name

echo "Enter your last name"
read last_name

echo "Enter your Birth Date"
read BirthDate

output=`sudo mysql -u root -p -e "
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
CREATE TABLE details (
    first_name VARCHAR(100), 
        last_name VARCHAR(100), 
	    BirthDate DATE
	    );
	    INSERT INTO details(first_name, last_name, BirthDate) VALUES (\"$first_name\", \"$last_name\", \"$BirthDate\");
	    SELECT * FROM details;
	    "`
	    echo $output
