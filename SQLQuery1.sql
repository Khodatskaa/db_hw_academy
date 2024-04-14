USE [db_hw_academy]
GO
INSERT INTO Curators (Name, Surname) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Michael', 'Johnson');

INSERT INTO Departments (Financing, Name, FacultyId) VALUES
(50000, 'Computer Science', 1),
(60000, 'Mathematics', 2),
(55000, 'Physics', 3);

INSERT INTO Faculties (Financing, Name) VALUES
(100000, 'Engineering'),
(80000, 'Science'),
(90000, 'Arts');

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('G101', 1, 1),
('G201', 2, 2),
('G301', 3, 3);

INSERT INTO Groups_and_Curators (CuratorId, GroupId) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Lectures (Audience, DisciplineId, TeacherId) VALUES
('Room A101', 1, 1),
('Room B202', 2, 2),
('Room C303', 3, 3);

INSERT INTO Disciplines (Name) VALUES
('Database Theory'),
('Linear Algebra'),
('Quantum Mechanics');

INSERT INTO Teachers (Name, Rate, Surname) VALUES
('Samantha', 5000, 'Adams'),
('Robert', 6000, 'Brown'),
('Emily', 5500, 'Clark');
