USE [db_hw_academy]
GO

-- Query 1: Display all possible pairs of lines of teachers and groups
SELECT Teachers.Name AS TeacherName, Groups.Name AS GroupName
FROM Teachers
CROSS JOIN Groups;

-- Query 2: Display the names of faculties, funding departments which exceeds the funding fund of the faculty
SELECT F.Name AS FacultyName, D.Name AS DepartmentName
FROM Faculties F
JOIN Departments D ON F.Id = D.FacultyId
WHERE D.Financing > F.Financing;

-- Query 3: Display the names of the curators of the groups and the names of the groups they supervise
SELECT C.Name AS CuratorName, G.Name AS GroupName
FROM Curators C
JOIN Groups_and_Curators GC ON C.Id = GC.CuratorId
JOIN Groups G ON GC.GroupId = G.Id;

-- Query 4: Display the names of teachers who give lectures in group "P107"
SELECT DISTINCT T.Name AS TeacherName
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Groups_and_Lectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE G.Name = 'P107';

-- Query 5: Display the names of teachers and the names of the faculties on which they give lectures
SELECT DISTINCT T.Name AS TeacherName, F.Name AS FacultyName
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Disciplines D ON L.DisciplineId = D.Id
JOIN Departments DP ON D.Id = DP.Id
JOIN Faculties F ON DP.FacultyId = F.Id;

-- Query 6: Display the names of departments and the names of groups that belong to them
SELECT D.Name AS DepartmentName, G.Name AS GroupName
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId;

-- Query 7: Derive the names of the disciplines that the teacher reads "Samantha Adams"
SELECT DISTINCT D.Name AS DisciplineName
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Disciplines D ON L.DisciplineId = D.Id
WHERE T.Name = 'Samantha Adams';

-- Query 8: Display the names of the departments where the discipline is read "Database Theory"
SELECT DISTINCT D.Name AS DepartmentName
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId
JOIN Groups_and_Lectures GL ON G.Id = GL.GroupId
JOIN Lectures L ON GL.LectureId = L.Id
JOIN Disciplines DS ON L.DisciplineId = DS.Id
WHERE DS.Name = 'Database Theory';

-- Query 9: Display group names related to Computer Science faculty
SELECT G.Name AS GroupName
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.Name = 'Computer Science';

-- Query 10: Display the names of the groups of the 5th year, as well as the name of the faculties, to which they belong
SELECT G.Name AS GroupName, F.Name AS FacultyName
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
WHERE G.Year = 5;

-- Query 11: Display the full names of teachers and lectures that they read 
SELECT T.Name AS TeacherName, L.Audience AS LectureRoom, DS.Name AS DisciplineName, G.Name AS GroupName
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Disciplines DS ON L.DisciplineId = DS.Id
JOIN Groups_and_Lectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE L.Audience = 'B103';
