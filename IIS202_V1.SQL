CREATE DATABASE Students_DB
ON PRIMARY (
  NAME = N'Students_DB_Data',
  FILENAME = N'C:\Hani_Group_IIS202\Students_DB.mdf',
  SIZE = 10MB
),
FILEGROUP FG2 (
  NAME = N'Students_DB_Data2',
  FILENAME = N'C:\Hani_Group_IIS202\Students_DB_1.ndf',
  SIZE = 20MB
)
LOG ON (
  NAME = N'IIS202_Log',
  FILENAME = N'C:\Hani_Group_IIS202\Students_DB_log.ldf',
  SIZE = 5MB
);
GO
USE Students_DB ;
GO


CREATE TABLE Departments (
  DeptID   INT PRIMARY KEY IDENTITY(1,1),
  DeptName NVARCHAR(50) NOT NULL,
  DeptDescription NVARCHAR(255) ,
  EstablishedDate DATE 
);




CREATE TABLE Terms (
  TermID     INT PRIMARY KEY IDENTITY(1,1),
  AcademicYear     NVARCHAR(20) NOT NULL, 
  AcademicSemester        NVARCHAR(10) NOT NULL  
);





CREATE TABLE Subjects (
  SubjectID   INT PRIMARY KEY IDENTITY(1,1),
  SubjectName NVARCHAR(150) NOT NULL,
  DeptID  INT NOT NULL FOREIGN KEY REFERENCES Departments(DeptID)    
);




CREATE TABLE Learners (
  LearnerID  NVARCHAR(10) PRIMARY KEY,
  GivenName NVARCHAR(25) NOT NULL,
  FamilyName NVARCHAR(25) NOT NULL,
  City NVARCHAR(100) NULL,
  EnrollmentDate DATE NULL,
  DeptID  INT NOT NULL FOREIGN KEY REFERENCES Departments(DeptID)    
);


CREATE TABLE Enrollments (
  EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
  LearnerID  NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Learners(LearnerID),
  SubjectID   INT NOT NULL FOREIGN KEY REFERENCES Subjects(SubjectID),
  TermID INT NOT NULL FOREIGN KEY REFERENCES Terms(TermID),
);



CREATE TABLE Grades (
  GradeID INT PRIMARY KEY IDENTITY(1,1),
  LearnerID  NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Learners(LearnerID),
  SubjectID   INT NOT NULL FOREIGN KEY REFERENCES Subjects(SubjectID),
  TermID INT NOT NULL FOREIGN KEY REFERENCES Terms(TermID),
  Score DECIMAL(5,2) NOT NULL CHECK (Score >= 0 AND Score <= 100),
);



CREATE INDEX Index_St_Fa ON Students(FacultyID);
CREATE INDEX Index_Co_Fa ON Courses(FacultyID);
CREATE INDEX Index_Se ON Semester(SEM_ID);
CREATE INDEX Index_Marks ON StudentsMarks(StudentID, CourseID);
GO




INSERT INTO Faculty (FacultyName, FacultyDescription, OpeningDate)
VALUES
('BAIT','Bachelor in Information Technology','2000-01-01'),
('TIC','Technology Institute for Computer','2000-01-01');




INSERT INTO Semester (AcadmicYear, AcadmicSemster)
Values
 ('2024_2025','F24'),
 ('2024_2025','S24');





INSERT INTO Courses (CourseName, FacultyID) 
VALUES
 ('Programming 1', 1),
 ('Programming 2', 1),
 ('Programming 3', 1),
 ('Dtabase 1', 1),
 ('Dtabase 2', 1),
 ('Dtabase 3', 1),
 ('Web 1', 1),
 ('Web 2', 1);




INSERT INTO Courses (CourseName, FacultyID)
VALUES 
('Programming 1', 2),
('Programming 1', 2),
('Math 1', 2),
('Math 2', 2),
('NetWorsk 1', 2),
('NetWorks 2', 2),
('Linux 1', 2),
('Linux 1', 2);




INSERT INTO Students (StudentID, FirstName, LastName, City, RegisterDate, FacultyID)
VALUES 
 ('112233','Maya' , 'Haider','Damascus','2024-09-02',1),
 ('116533','Lana' , 'Al Halbi','Damascus','2024-09-02',1),
 ('178933','Rola' , 'Sukar','Aleppo','2024-09-02',1),
 ('114533','Hiba' , 'Fustok','Homs','2024-09-02',1),
 ('115633','Samer', 'Al Masri','Daraa','2024-09-02',1);




-- Abd Alaziz	150948
-- Al_Ward	152904
-- Muhammed Ammer	215429
-- Yazan	241783


INSERT INTO Students (StudentID, FirstName, LastName, City, RegisterDate, FacultyID)
VALUES 
 ('150948','Abd Alaziz', 'Aldrobi','Damascus','2022-01-01',2),
 ('152904','Al_Ward', 'Shahin','Damascus','2020-01-01',2),
 ('215429','Muhammed Ammer', 'Arafa','Aleppo','2024-01-01',2),
 ('241783','Asmaa', 'Al Imamm','Homs','2024-01-01',2),
 ('222222','Yazan', 'ragheed','Daraa','2025-01-01',2);



INSERT INTO Registrations (StudentID, CourseID, SemesterID) 
VALUES
('112233',2,1),
('112233',3,1),
('112233',4,1),
('112233',5,2),
('112233',6,2),
('112233',7,2),
('112233',8,2),
('116533',1,1),
('116533',2,1),
('116533',3,1),
('116533',4,1),
('116533',5,2),
('116533',6,2),
('116533',7,2),
('116533',8,2),
('178933',1,1),
('178933',2,1),
('178933',3,1),
('178933',4,1),
('178933',5,2),
('178933',6,2),
('178933',7,2),
('178933',8,2),
('114533',1,1),
('114533',2,1),
('114533',3,1),
('114533',4,1),
('114533',5,2),
('114533',6,2),
('114533',7,2),
('114533',8,2),
('114533',9,1),
('114533',10,1),
('114533',11,1),
('114533',12,1),
('114533',13,2),
('114533',14,2),
('114533',15,2),
('114533',16,2),
('234293',9,1),
('234293',10,1),
('234293',11,1),
('234293',12,1),
('234293',13,2),
('234293',14,2),
('234293',15,2),
('234293',16,2),
('309407',9,1),
('309407',10,1),
('309407',11,1),
('309407',12,1),
('309407',13,2),
('309407',14,2),
('309407',15,2),
('309407',16,2),
('194190',9,1),
('194190',10,1),
('194190',11,1),
('194190',12,1),
('194190',13,2),
('194190',14,2),
('194190',15,2),
('194190',16,2),
('257025',9,1),
('257025',10,1),
('257025',11,1),
('257025',12,1),
('257025',13,2),
('257025',14,2),
('257025',15,2),
('257025',16,2),
('153710',9,1),
('153710',10,1),
('153710',11,1),
('153710',12,1),
('153710',13,2),
('153710',14,2),
('153710',15,2),
('153710',16,2);








INSERT INTO StudentsMarks (StudentID, CourseID, SemesterID, Stud_mark)
VALUES

('112233',1,1,74.52),
('112233',2,1,68.41),
('112233',3,1,40.11),  
('112233',4,1,85.22),
('112233',5,2,60.12),
('112233',6,2,50.15),
('112233',7,2,30.16),  
('112233',8,2,78.87),
('116533',1,1,15.54),
('116533',2,1,78.54),
('116533',3,1,40.78),  
('116533',4,1,55.56),
('116533',5,2,99.00),
('116533',6,2,60.00),
('116533',7,2,30.00),  
('116533',8,2,68.56),
('115633',1,1,95.65),
('115633',2,1,99.00),
('115633',3,1,90.41), 
('115633',4,1,99.00),
('115633',5,2,70.45),
('115633',6,2,80.45),
('115633',7,2,80.66),  
('115633',8,2,58.48),

('114533',1,1,70.26),
('114533',2,1,32.00),
('114533',3,1,55.66),  
('114533',4,1,89.15),
('114533',5,2,70.00),
('114533',6,2,55.00),
('114533',7,2,34.00),  
('114533',8,2,84.65),

('178933',9,1,75.45),
('178933',10,1,75.55),
('178933',11,1,75.44),  
('178933',12,1,61.66),
('178933',13,2,46.66),
('178933',14,2,21.45),
('178933',15,2,60.64),  
('178933',16,2,49.48),

('234293',1,1,44.66),
('234293',2,1,66.66),
('234293',3,1,77.48),  
('234293',4,1,88.88),
('234293',5,2,90.66),
('234293',6,2,90.00),
('234293',7,2,99.00),  
('234293',8,2,30.00),

('309407',9,1,30.00),
('309407',10,1,30.00),
('309407',11,1,40.00),  
('309407',12,1,55.00),
('309407',13,2,40.56),
('309407',14,2,70.45),
('309407',15,2,30.66),  
('309407',16,2,35.45),

('194190',9,1,75.65),
('194190',10,1,75.48),
('194190',11,1,70.00),  
('194190',12,1,65.00),
('194190',13,2,99.00),
('194190',14,2,66.00),
('194190',15,2,89.00),  
('194190',16,2,51.00),

('257025',6,1,99.00),
('257025',10,1,99.00),
('257025',11,1,85.00),  
('257025',12,1,70.45),
('257025',13,2,60.45),
('257025',14,2,48.15),
('257025',15,2,92.00), 
('257025',16,2,94.00),

('153710',9,1,44.00),
('153710',10,1,55.00),
('153710',11,1,66.00),  
('153710',12,1,77.45),
('153710',13,2,88.45),
('153710',14,2,99.66),
('153710',15,2,44.45),  
('153710',16,2,56.66);






SELECT 
    s.StudentID AS ID,
    s.FirstName AS [First Name],
    s.LastName AS [Last Name],
    c.CourseName AS Course,
    m.Stud_mark AS Mark,
    sem.AcadmicSemster AS Semster,
    sem.AcadmicYear AS Year
FROM StudentsMarks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Courses c ON m.CourseID = c.CourseID
JOIN Semester sem ON m.SemesterID = sem.SEM_ID
ORDER BY c.CourseName, s.FirstName, s.LastName;





SELECT 
    s.StudentID AS ID,
    s.FirstName AS [First Name],
    s.LastName AS [Last Name],
    c.CourseName AS Course,
    m.Stud_mark AS Mark
FROM StudentsMarks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Courses c ON m.CourseID = c.CourseID
WHERE m.CourseID = 4 AND m.Stud_mark >= 40;



SELECT TOP 1 WITH TIES
    f.FacultyName, c.CourseName, sem.AcadmicSemster,
    COUNT(CASE WHEN m.Stud_mark >= 40 THEN 1 END) * 100.0 / COUNT(*) AS PassPercent
FROM StudentsMarks m
JOIN Courses c ON m.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
JOIN Semester sem ON m.SemesterID = sem.SEM_ID
GROUP BY f.FacultyName, c.CourseName, sem.AcadmicSemster
ORDER BY sem.AcadmicSemster, PassPercent DESC;








SELECT TOP 1 WITH TIES
    f.FacultyName,
    c.CourseName,
    sem.AcadmicSemster,
    COUNT(CASE WHEN m.Stud_mark < 40 THEN 1 END) * 100.0 / COUNT(*) AS Fail
FROM StudentsMarks m
JOIN Courses c   ON m.CourseID   = c.CourseID
JOIN Faculty f   ON c.FacultyID  = f.FacultyID
JOIN Semester sem ON m.SemesterID = sem.SEM_ID
GROUP BY f.FacultyName, c.CourseName, sem.AcadmicSemster
ORDER BY sem.AcadmicSemster, Fail DESC;



SELECT TOP 2 
       s.FirstName AS [First Name], 
       s.LastName AS [Last Name], 
       CAST(ROUND(AVG(m.Stud_mark), 1) AS DECIMAL(4,1)) AS MarkAVG
FROM StudentsMarks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Semester sem ON m.SemesterID = sem.SEM_ID
WHERE sem.AcadmicSemster = 'F24'
GROUP BY s.FirstName, s.LastName
ORDER BY MarkAVG DESC;





SELECT f.FacultyName, c.CourseName, s.FirstName, m.Stud_mark
FROM StudentsMarks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Courses c ON m.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE m.Stud_mark = (
  SELECT MIN(Stud_mark) FROM StudentsMarks m2 WHERE m2.CourseID = m.CourseID
)
ORDER BY c.CourseName ,Stud_mark;






SELECT DISTINCT 
       f.FacultyName AS [Program],
       c.CourseName  AS [Course],
       s.StudentID   AS [ID], 
       s.FirstName   AS [First Name],
       s.LastName    AS [Last Name],
       m.Stud_mark   AS [Mark]
FROM StudentsMarks m
JOIN Courses c  ON m.CourseID = c.CourseID
JOIN Students s ON m.StudentID = s.StudentID
JOIN Faculty f ON s.FacultyID = f.FacultyID
WHERE m.Stud_mark < 40
ORDER BY m.Stud_mark DESC



CREATE TABLE Outcomes (
  ID INT PRIMARY KEY IDENTITY(1,1),
  Student_FirstName NVARCHAR(50),
  Student_LastName NVARCHAR(50),
  DeptName NVARCHAR(150),
  Result NVARCHAR(25) 
);







CREATE PROCEDURE EvaluateStudents
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO FinalResults (Student_FirstName, Student_LastName, FacultyName, Result)
  SELECT
    s.FirstName, 
    s.LastName,
    f.FacultyName,
    CASE
      WHEN COUNT(*) = SUM(CASE WHEN sm.Stud_mark >= 40 THEN 1 ELSE 0 END)
        THEN N'Passed'
      WHEN COUNT(*) >= 8 AND SUM(CASE WHEN sm.Stud_mark >= 40 THEN 1 ELSE 0 END) >= 6
        THEN N'Transferred'
      ELSE N'Failed'
    END
  FROM Students s
  LEFT JOIN StudentsMarks sm ON s.StudentID = sm.StudentID
  INNER JOIN Faculty f ON s.FacultyID = f.FacultyID
  GROUP BY s.StudentID, s.FirstName, s.LastName, f.FacultyName;

  SELECT N'Student evaluation completed successfully' AS StatusMessage;
END;
GO





EXECUTE EvaluateStudents;

Select * From FinalResults
