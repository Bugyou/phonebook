create database if not exists db_note;

USE db_note;

CREATE TABLE link(
  `no` int NOT NULL auto_increment,
  `name` varchar(40) NOT null,
  `phoneNo` varchar(40) NOT null,

   PRIMARY KEY   (`no`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 
 
 
 
 
 
