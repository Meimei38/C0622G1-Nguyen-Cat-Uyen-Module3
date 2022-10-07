DROP procedure if exists delete_user;
DELIMITER $$
CREATE PROCEDURE delete_user(IN user_id INT)

BEGIN

    DELETE FROM users

    where id = user_id;

    END$$

DELIMITER ;


DROP DATABASE IF EXISTS  demo1;
CREATE DATABASE demo1;
USE demo1;

drop table if exists users;
create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
DELIMITER $$



DELIMITER $$
CREATE PROCEDURE display(
)
BEGIN
    select * from users;
    END$$
DELIMITER ;
DELIMITER $$

CREATE PROCEDURE edit_user(
in user_id int, 
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50)
)
BEGIN
    update users
    set name = user_name,
    email= user_email,
    country = user_country
    where id = user_id;
    
    END$$ 
DELIMITER ;



