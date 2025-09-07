CREATE DATABASE AdventureWorks2019;
GO
USE AdventureWorks2019;
GO
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    GroupName NVARCHAR(50) NOT NULL
);
GO
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    NationalIDNumber NVARCHAR(15) NOT NULL,
    LoginID NVARCHAR(256) NOT NULL,
    JobTitle NVARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    MaritalStatus NCHAR(1) NOT NULL,
    Gender NCHAR(1) NOT NULL,
    HireDate DATE NOT NULL,
    SalariedFlag BIT NOT NULL,
    VacationHours SMALLINT NOT NULL DEFAULT 0,
    SickLeaveHours SMALLINT NOT NULL DEFAULT 0,
    CurrentDepartmentID INT NULL
);
GO

CREATE TABLE EmployeeDepartmentHistory (
    EmployeeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    ShiftID NCHAR(2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    PRIMARY KEY (EmployeeID, DepartmentID, ShiftID, StartDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
GO
CREATE TABLE JobCandidate (
    JobCandidateID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NULL,
    Resume NVARCHAR(MAX) NULL,
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO

INSERT INTO Department (Name, GroupName) VALUES
('Engineering', 'Research and Development'),
('Marketing', 'Sales and Marketing'),
('Human Resources', 'Human Resources');
GO

INSERT INTO Employee (
    NationalIDNumber, LoginID, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, SalariedFlag, VacationHours, SickLeaveHours, CurrentDepartmentID
) VALUES
('123-45-6789', 'adventureworks\ken0', 'Chief Executive Officer', '1963-01-27', 'S', 'M', '1998-08-01', 1, 40, 50, 1),
('987-65-4321', 'adventureworks\terri0', 'Vice President of Engineering', '1971-08-01', 'M', 'F', '1997-03-01', 1, 80, 40, 1);
GO

INSERT INTO EmployeeDepartmentHistory (EmployeeID, DepartmentID, ShiftID, StartDate, EndDate) VALUES
(1, 1, '1', '1998-08-01', NULL),
(2, 1, '1', '1997-03-01', NULL);
GO

-- Check tables
SELECT * FROM sys.tables;

-- View sample data
SELECT * FROM Employee;
SELECT * FROM Department;

