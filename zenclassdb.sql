SHOW DATABASES;

CREATE DATABASE zenClass;

USE zenclass;

SELECT DATABASE();

SHOW TABLES;

CREATE TABLE students(
student_id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name varchar(255) NOT NULL, 
email varchar(255) NOT NULL, 
phone int NOT NULL, 
course_id int, 
batch_id int
);

CREATE TABLE courses(
course_id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
course_name varchar(255) NOT NULL, 
about_course text NOT NULL
);

CREATE TABLE batches(
batch_id int PRIMARY KEY NOT NULL,
course_id int,
coordinator_id int
);

CREATE TABLE coordinators(
coordinator_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(255) NOT NULL,
email varchar(255) NOT NULL,
phone int NOT NULL
);

CREATE TABLE classes(
class_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
batch_id int,
mentor_id int,
topic text NOT NULL,
task_id int,
class_at timestamp
);

CREATE TABLE mentors(
mentor_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(255) NOT NULL,
email varchar(255) NOT NULL,
phone int NOT NULL
);

CREATE TABLE tasks(
task_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
task_name varchar(255) NOT NULL,
task_description text NOT NULL,
submission_at timestamp
);

ALTER TABLE students ADD FOREIGN KEY (course_id) REFERENCES courses(course_id);
ALTER TABLE students ADD FOREIGN KEY (batch_id) REFERENCES batches(batch_id);
ALTER TABLE batches ADD FOREIGN KEY (course_id) REFERENCES courses(course_id);
ALTER TABLE batches ADD FOREIGN KEY (coordinator_id) REFERENCES coordinators(coordinator_id);
ALTER TABLE classes ADD FOREIGN KEY (batch_id) REFERENCES batches(batch_id);
ALTER TABLE classes ADD FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id);
ALTER TABLE classes ADD FOREIGN KEY (task_id) REFERENCES tasks(task_id);



