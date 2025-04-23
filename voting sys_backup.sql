CREATE DATABASE voting_sys;

USE voting_sys;

CREATE TABLE `election` (
  `election_id` int NOT NULL AUTO_INCREMENT,
  `election_name` varchar(255) NOT NULL,
  `election_date` date NOT NULL,
  `election_status` varchar(50) NOT NULL,
  PRIMARY KEY (`election_id`)
);

CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `election_id` int NOT NULL,
  `position_name` varchar(100) NOT NULL,
  KEY `election_id` (`election_id`),
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`) ON DELETE CASCADE
);


CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `vote_status` varchar(1) DEFAULT NULL,
);

CREATE TABLE `candidate` (
  `candidate_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `student_id` int NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`candidate_id`),
  KEY `position_id` (`position_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
);

CREATE TABLE `ballot` (
  `ballot_id` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `student_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`ballot_id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `ballot_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE,
  CONSTRAINT `ballot_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
);


CREATE TABLE `election_results` (
  `result_no` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `student_id` int NOT NULL,
  `position_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`result_no`),
  KEY `fk_election` (`election_id`),
  KEY `fk_student` (`student_id`),
  KEY `fk_candidate` (`candidate_id`),
  KEY `fk_position` (`position_id`),
  CONSTRAINT `fk_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_election` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
);

DESC result_table;

INSERT INTO election (election_name, election_date, election_status)
VALUES
  ('2025 Guild Elections',      '2025-03-10', 'Open'),
  ('2024 Parliamentary Elections', '2024-01-15', 'Closed'),
  ('2023 Parliamentary Elections', '2024-01-15', 'Closed'),
  ('2022 Parliamentary Elections', '2024-01-15', 'Closed'),
  ('2021 Parliamentary Elections', '2024-01-15', 'Closed'),
  ('2020 Guild  Elections', '2024-01-15', 'Closed');

ALTER TABLE election MODIFY election_id INT NOT NULL AUTO_INCREMENT;

DESCRIBE position;

ALTER TABLE position
ADD CONSTRAINT fk_position_election
FOREIGN KEY (election_id) REFERENCES election (election_id) ON DELETE CASCADE;


INSERT INTO position (election_id, position_name)
VALUES
  (1, 'Guild President'),
  (1, 'Lady Vice President'),
  (1, 'Sports Minister'),
  (2, 'ICT Minister'),
  (2, 'Finance Minister'),
  (3, 'Dhwa Minister'),
  (3, 'Information Minister'),
  (4, 'Disaster Minister'),
  (4, 'Public Relations Minister'),
  (5, 'Presidency Minister'),
  (5, 'Education Minister');

DESCRIBE candidate;

INSERT INTO student (first_name, last_name) 
VALUES 
  ('John', 'Okello'),
  ('Sarah', 'Namukwaya'),
  ('David', 'Obote'),
  ('Alice', 'Kanyomozi'),
  ('Joel', 'Kanyomozi');


INSERT INTO candidate (first_name, last_name, student_id, position_id)
VALUES
  ('John', 'Okello', 1, 12),  
  ('Sarah', 'Namukwaya', 2, 13), 
  ('David', 'Obote', 3, 14), 
  ('Alice', 'Kanyomozi',4, 15),
  ('Joel', 'Kanyomozi',5, 16);  
  
INSERT INTO ballot (election_id, student_id,candidate_id)
VALUES
  (1, 1,51),
  (1, 2,51),
  (1, 3,52),
  (2, 2,53),
  (2, 4,52),
  (3, 3,51),
  (3, 1,53),
  (3, 2,52),
  (4, 2,51),
  (4, 1,53),
  (4, 3,52),
  (5, 2,51),
  (5, 1,51),
  (5, 3,51);
INSERT INTO election_results (election_id, student_id,position_id, candidate_id)
VALUES
  (1, 1,12,51),  
  (1, 2,13,52), 
  (2, 2,13,54),  
  (2, 4,13,54),
  (3, 2,12,54),
  (3, 2,12,51),
  (4, 1,12,52),
  (4, 2,12,51),
  (5, 1,13,51),
  (5, 5,20,54);

SELECT * FROM student;
SELECT * FROM candidate;
SELECT * FROM position;
SELECT * FROM election;
SELECT * FROM ballot;


# assignment 2

ALTER TABLE student
ADD course VARCHAR(50),
ADD gender VARCHAR(10),
ADD contact VARCHAR (10),
ADD email VARCHAR(255);

# adding data to new columns

UPDATE student
SET course = 'BCS',
    gender = 'Male',
    contact = '0701234567',
    email = 'john.okello@gmail.com'
WHERE student_id = 1;

UPDATE student
SET course = 'BIT',
    gender = 'Female',
    contact = '0707654321',
    email = 'sarah.namukwaya@gmail.com'
WHERE student_id = 2;

UPDATE student
SET course = 'BIT',
    gender = 'Male',
    contact = '0709876543',
    email = 'david.obote@gmail.com'
WHERE student_id = 3;

UPDATE student
SET course = 'BIT',
    gender = 'Female',
    contact = '0704567890',
    email = 'alice.kanyomozi@gmail.com'
WHERE student_id = 4;

UPDATE student
SET course = 'BCS',
    gender = 'Male',
    contact = '0701122334',
    email = 'joel.kanyomozi@gmail.com'
WHERE student_id = 5;

#i
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM Student
WHERE gender = 'Female' AND course = 'BIT'
ORDER BY full_name DESC;

#ii
SELECT course, gender, COUNT(*) AS number_of_students
FROM Student
GROUP BY course, gender;

#iii
CREATE TABLE voters_register(
voter_id INT NOT NULL AUTO_INCREMENT,
election_id INT NOT NULL,
student_id INT NOT NULL,
vote_status BOOLEAN DEFAULT FALSE,
PRIMARY KEY (voter_id),
FOREIGN KEY (election_id) REFERENCES election(election_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

SELECT * FROM voters_register;

INSERT INTO voters_register (election_id, student_id, vote_status)
VALUES
(1, 1, FALSE),  
(1, 2, FALSE),  
(1, 3, FALSE),  
(1, 4, FALSE),  
(1, 5, FALSE);

ALTER TABLE student
DROP COLUMN vote_status;


SELECT vote_status, COUNT(*) AS number_of_voters
FROM Voters_register
WHERE election_id = 1
GROUP BY vote_status;


#iv
UPDATE election
SET election_date = '2021-03-15'  
WHERE election_id = 5;

UPDATE election
SET election_date = '2022-03-15'  
WHERE election_id = 4;

UPDATE election
SET election_date = '2023-03-15'  
WHERE election_id = 3;

UPDATE election
SET election_date = '2024-03-15' 
WHERE election_id = 2;

UPDATE Election
SET election_date = '2025-03-15'   
WHERE election_id = 1;

UPDATE Election
SET election_date = '2020-03-15'
WHERE election_id = 6;


SELECT * FROM election
WHERE election_date BETWEEN '2020-01-01' AND '2025-12-31'
ORDER BY election_date ASC; *****

#V

UPDATE student
SET email = 'kanyomozi@gmail.com'
WHERE student_id = 5;

UPDATE student
SET email = 'kanyomozi@gmail.com'
WHERE student_id = 4;

SELECT * FROM student 
where COUNT(email) > 1;



# SQL JOINS
#i
SELECT * FROM `position`;

SELECT Position.position_name, COUNT(Candidate.candidate_id) AS number_of_candidates
FROM Position
JOIN Candidate ON Position.position_id = Candidate.position_id
GROUP BY Position.position_name;

#ii
SELECT * FROM candidate;

SELECT 
  Candidate.first_name AS candidate_first_name,
  Candidate.last_name AS candidate_last_name,
  Student.gender,
  Student.course,
  Position.position_name AS position
FROM Candidate
JOIN Student ON Candidate.student_id = Student.student_id
JOIN Position ON Candidate.position_id = Position.position_id;

#iii
SELECT * FROM ballot;

SELECT 
  Candidate.candidate_id,
  Candidate.first_name,
  Candidate.last_name,
  COUNT(Ballot.ballot_id) AS number_of_votes
FROM Ballot
JOIN Candidate ON Ballot.candidate_id = Candidate.candidate_id
JOIN Position ON Candidate.position_id = Position.position_id
JOIN Election ON Position.election_id = Election.election_id
WHERE Position.position_name = 'Guild President' 
AND Election.election_id = 1
GROUP BY Candidate.candidate_id, Candidate.first_name, Candidate.last_name
ORDER BY number_of_votes DESC;

#iv
SELECT * FROM student;
SELECT * FROM voters_register;

SELECT 
  Student.course,
  COUNT(DISTINCT voters_register.voter_id) AS number_of_voters
FROM Voters_register
JOIN Student ON Voters_register.student_id = Student.student_id
GROUP BY Student.course;


# SQL Sub queries

#i
SELECT
  Ballot.*,
  Student.course,
  Student.first_name,
  Student.last_name
FROM Ballot
JOIN Student ON Ballot.student_id = Student.student_id
WHERE Student.course = 'BIT';*******

#ii
SELECT 
  CONCAT(Candidate.first_name, ' ', Candidate.last_name) AS candidate_name,
  COUNT(*) AS number_of_votes
FROM Ballot
JOIN Candidate ON Ballot.candidate_id = Candidate.candidate_id
WHERE CONCAT(Candidate.first_name, ' ', Candidate.last_name) = 'John Okello'
GROUP BY Candidate.first_name, Candidate.last_name;

#iii
SELECT * 
FROM Student
WHERE student_id NOT IN (
  SELECT DISTINCT Ballot.student_id
  FROM Ballot
  JOIN Candidate ON Ballot.candidate_id = Candidate.candidate_id
  JOIN Position ON Candidate.position_id = Position.position_id
  WHERE Position.election_id = 1
);

#iv
SELECT 
  Candidate.candidate_id,
  CONCAT(Candidate.first_name, ' ', Candidate.last_name) AS full_name,
  COUNT(*) AS number_of_votes
FROM Ballot
JOIN Candidate ON Ballot.candidate_id = Candidate.candidate_id
JOIN Position ON Candidate.position_id = Position.position_id
WHERE Position.position_name = 'Guild President'
  AND Position.election_id = 1
GROUP BY Candidate.candidate_id, Candidate.first_name, Candidate.last_name
ORDER BY number_of_votes DESC
LIMIT 1;





	









