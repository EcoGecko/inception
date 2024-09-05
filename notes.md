# Interact with mariadb

Show databases: `SHOW DATABASES;`<br>
Use specific database: `USE new_database;`<br>
Show tables inside database: `SHOW TABLES;`<br>
View all info from speficic field: `SELECT * FROM wp_users;`<br>
Insert new user to that specific table: `INSERT INTO wp_users (user_login, user_pass, user_email)
VALUES ('new_user', MD5('password'), 'newuser@example.com');`<br>

