use exploration;
create table if not exists helpmessage
(
	id INT NOT NULL auto_increment, 
    title VARCHAR(80) NOT NULL,
    body TEXT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY (title)
    
    
);

insert ignore into helpmessage values(0, "Home", "This is the Home page. Please log in to advance.");
insert ignore into helpmessage(id, title, body) values(null, "About", "This is the About page.");
insert ignore into helpmessage(id, title, body) values(null, "Admin", "This is the Admin page visible only to admins.");
insert ignore into helpmessage(id, title, body) values(null, "Profile", "This is the Profile page. Here you can update your information.");
insert ignore into helpmessage(id, title, body) values(null, "Sign In", "Please sign in to advance. You will need to register for an account if you haven't done so.\nForgot your password? Click forgot password and follow instructions.");
insert ignore into helpmessage(id, title, body) values(null, "Sign Out", "This is the Sign out page.");


create table if not exists user
(	
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) DEFAULT "USER",
    is_active INT DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE KEY (username)
);

insert ignore into user(firstname, lastname, username, password) values("tom", "hanks", "testuser", "password");
insert ignore into user(firstname, lastname, username, password) values("ed", "eddy", "edddy", "password");
