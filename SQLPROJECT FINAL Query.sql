create database SQL_Project2
use SQL_Project2



create table UserLogins
(UserLoginID smallint primary key,
UserLogin char(15),
UserPassword varchar(20))

create table UserSecurityQuestions
(UserSecurityQuestionID tinyint primary key,
UserSecurityQuestion varchar(50))

create table SavingsInterestRates
(InterestSavingsRateID tinyint primary key,
InterestRateValue numeric(9,9),
InterestRateDescription varchar(20))

create table AccountType
(AccountTypeID tinyint primary key,
AccountTypeDescription varchar(30))

create table Employee
(EmployeeID int primary key,
EmployeeFirstName varchar(25),
EmployeeMiddleInitial char(1),
EmployeeLastName varchar (25),
EmployeeIsManager bit)

create table TransactionType
(TransactionTypeID tinyint primary key,
TransactionTypeName char(10),
TransactionTypeDescription varchar(50),
TransactionFeeAmmount smallmoney)

create table AccountStatusType
(AccountStatusTypeID tinyint primary key,
AccountStatusDescription varchar(50))


create table LoginErrorLog
(ErrorLoginID int primary key,
ErrorTime datetime,
FailedTransactionXML xml)

create table FailedTransactionErrorType
(FailedTransactionErrorTypeID tinyint primary key,
FailedTransactionDescription varchar(50))

create table Login_Account
(UserLoginID smallint,
AccountID int)

create table UserSecurityAnswers
(UserLoginID smallint,
UserSecurityAnswer varchar(25),
UserSecurityQuestionID tinyint)

create table Customer_Account
(AccountID int,
CustomerID int)

create table Account
(AccountID int primary key,
CurrentBalance int,
AccountTypeID tinyint,
AccountstatusTypeID tinyint,
InterestSavingRatesID tinyint)

create table OverDraftLog
(AccountID int primary key,
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXML xml)

create table FailedTransactionLog
(FailedTransactionID int primary key,
FailedTransactionErrorTypeID tinyint,
FailedTransactionErrorTime datetime,
FailedTransactionXML xml)

create table Customer
(CustomerID int primary key,
CustomerAddress1 varchar(30),
CustomerAddress2 varchar(30),
CustomerFirstName varchar(30),
CustomerMiddleInitial char(1),
CustomerLastName varchar(30),
City varchar(20),
State char(2),
ZipCode char(10),
EmailAddress varchar(40),
HomePhone char(10),
CellPhone char(10),
WorkPhone char(10),
SSN char(9),
UserLoginID smallint)

create table TransactionLog
(TransactionID int primary key,
TransactionDate datetime,
TransactionTypeID tinyint,
TransactionAmount money,
NewBalance money,
AccountID int,
CustomerID int,
EmployeeID int,
UserLoginID smallint)

-- Insert data into UserLogins table
INSERT INTO UserLogins (UserLoginID, UserLogin, UserPassword)
VALUES
(1, 'john_doe', 'password123'),
(2, 'jane_smith', 'securePwd'),
(3, 'bob_jones', 'pass123');

-- Insert data into UserSecurityQuestions table
INSERT INTO UserSecurityQuestions (UserSecurityQuestionID, UserSecurityQuestion)
VALUES
(1, 'What is your favorite color?'),
(2, 'In which city were you born?'),
(3, 'What is the name of your first pet?');

-- Insert data into SavingsInterestRates table
INSERT INTO SavingsInterestRates (InterestSavingsRateID, InterestRateValue, InterestRateDescription)
VALUES
(1, 0.025, 'Low Interest'),
(2, 0.05, 'Medium Interest'),
(3, 0.1, 'High Interest');

-- Insert data into AccountType table
INSERT INTO AccountType (AccountTypeID, AccountTypeDescription)
VALUES
(1, 'Savings Account'),
(2, 'Checking Account'),
(3, 'Fixed Deposit');

-- Insert data into Employee table
INSERT INTO Employee (EmployeeID, EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeIsManager)
VALUES
(1, 'John', 'A', 'Smith', 1),
(2, 'Jane', 'B', 'Doe', 0),
(3, 'Bob', 'C', 'Johnson', 1);

-- Insert data into TransactionType table
INSERT INTO TransactionType (TransactionTypeID, TransactionTypeName, TransactionTypeDescription, TransactionFeeAmmount )
VALUES
(1, 'Deposit', 'Money Deposit', 0.50),
(2, 'Withdrawal', 'Money Withdrawal', 1.00),
(3, 'Transfer', 'Account Transfer', 2.00);

-- Insert data into AccountStatusType table
INSERT INTO AccountStatusType (AccountStatusTypeID, AccountStatusDescription)
VALUES
(1, 'Active'),
(2, 'Closed'),
(3, 'Suspended');

-- Insert data into LoginErrorLog table
INSERT INTO LoginErrorLog (ErrorLoginID, ErrorTime, FailedTransactionXML)
VALUES
(1, '2024-02-09 12:00:00', '<xml>Error details 1</xml>'),
(2, '2024-02-10 14:30:00', '<xml>Error details 2</xml>'),
(3, '2024-02-11 08:45:00', '<xml>Error details 3</xml>');

-- Insert data into FailedTransactionErrorType table
INSERT INTO FailedTransactionErrorType (FailedTransactionErrorTypeID, FailedTransactionDescription)
VALUES
(1, 'Insufficient Funds'),
(2, 'Invalid Account'),
(3, 'Network Timeout');

-- Insert data into Login_Account table
INSERT INTO Login_Account (UserLoginID, AccountID)
VALUES
(1, 101),
(2, 102),
(3, 103);

-- Insert data into UserSecurityAnswers table
INSERT INTO UserSecurityAnswers (UserLoginID, UserSecurityAnswer, UserSecurityQuestionID)
VALUES
(1, 'Blue', 1),
(2, 'New York', 2),
(3, 'Fluffy', 3);

-- Insert data into Customer_Account table
INSERT INTO Customer_Account (AccountID, CustomerID)
VALUES
(101, 201),
(102, 202),
(103, 203);

-- Insert data into Account table
INSERT INTO Account (AccountID, CurrentBalance, AccountTypeID, AccountstatusTypeID, InterestSavingRatesID)
VALUES
(101, 5000, 1, 1, 1),
(102, 10000, 2, 1, 2),
(103, 15000, 3, 2, 3);

-- Insert data into OverDraftLog table
INSERT INTO OverDraftLog (AccountID, OverDraftDate, OverDraftAmount, OverDraftTransactionXML)
VALUES
(101, '2024-02-09 15:00:00', 50.00, '<xml>Overdraft details 1</xml>'),
(102, '2024-02-10 16:30:00', 75.50, '<xml>Overdraft details 2</xml>'),
(103, '2024-02-11 10:45:00', 100.00, '<xml>Overdraft details 3</xml>');

-- Insert data into FailedTransactionLog table
INSERT INTO FailedTransactionLog (FailedTransactionID, FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionXML)
VALUES
(1, 1, '2024-02-09 14:00:00', '<xml>Failed Transaction details 1</xml>'),
(2, 2, '2024-02-10 12:45:00', '<xml>Failed Transaction details 2</xml>'),
(3, 3, '2024-02-11 09:30:00', '<xml>Failed Transaction details 3</xml>');

-- Insert data into Customer table
INSERT INTO Customer (CustomerID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID)
VALUES
(201, '123 Main St', 'Apt 45', 'John', 'M', 'Doe', 'Anytown', 'NY', '10001', 'john@example.com', '1234567890', '9876543210', '5555555555', '123456789', 1),
(202, '456 Oak St', 'Suite 12', 'Jane', 'A', 'Smith', 'Smallville', 'CA', '90210', 'jane@example.com', '1112223333', '9998887777', '4444444444', '987654321', 2),
(203, '789 Pine St', 'Apt 78', 'Bob', 'C', 'Johnson', 'Wonderland', 'TX', '75001', 'bob@example.com', '5556667777', '3334445555', '6666666666', '234567890', 3);

-- Insert data into TransactionLog table
INSERT INTO TransactionLog (TransactionID, TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID)
VALUES
(1, '2024-02-09 14:30:00', 1, 100.00, 5100.00, 101, 201, 1, 1),
(2, '2024-02-10 16:00:00', 2, 50.00, 9950.00, 102, 202, 2, 2),
(3, '2024-02-11 10:00:00', 3, 25.00, 14975.00, 103, 203, 3, 3);


select * from UserLogins
select * from UserSecurityQuestions
select * from AccountType
select * from SavingsInterestRates
select * from Employee
select * from TransactionType
select * from AccountStatusType
select * from LoginErrorLog
select * from FailedTransactionErrorType
select * from Login_Account
select * from UserSecurityAnswers
select * from Customer_Account
select * from Account
select * from OverDraftLog
select * from FailedTransactionLog
select * from Customer
SELECT*FROM TransactionLog 

/*Lets say despite using the above query we want to see all the table names in one go 
Using SQL Query: You can query system catalog views such as sys.
tables to retrieve the list of tables. Here's a simple SQL query:
sql
*/
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';



Alter table Login_Account
add constraint FK1_UserLoginID_Login_Account foreign key (UserLoginID) references UserLogins(UserLoginID)
Alter table Login_Account
add constraint FK2_AccountID_Login_Account foreign key (AccountID) references Account(AccountID)

alter table Customer_Account
add constraint FK1_AccountID_Customer_Account foreign key (AccountID) references Account(AccountID)
alter table Customer_Account 
add constraint FK2_CustomerID_Customer_Account foreign key (CustomerID) references Customer (CustomerID)

alter table UserSecurityAnswers
add constraint FK2_UserLoginID_UserSecurityAnswers foreign key (UserLoginID) references UserLogins(UserLoginID)
alter table UserSecurityAnswers
add constraint FK4_UserSecurityQuestionID_UserSecurityAnswers foreign key (UserSecurityQuestionID) references UserSecurityQuestions(UserSecurityQuestionID)

alter table Account
add constraint FK4_AccountTypeID_Account foreign key (AccountTypeID) references AccountType(AccountTypeID)
alter table Account
add constraint FK5_AccountStatusTypeID_Account foreign key (AccountStatusTypeID) references AccountStatusType (AccountStatusTypeID)
alter table Account
add constraint FK7_InterestSavingRateId_Account foreign key (InterestSavingRatesID) references SavingsInterestRates (InterestSavingsRateID)


alter table OverDraftLog
add constraint FK1_AccountID_OverDraftLog foreign key (AccountID) references Account(AccountID)

alter table FailedTransactionLog
add constraint FK1_FailedTransactionErrorTypeID_FailedTransactionLog foreign key (FailedTransactionErrorTypeID) references FailedTransactionErrorType(FailedTransactionErrorTypeID)

alter table TransactionLog
add constraint FK7_TransactionTypeID_TransactionLog foreign key (TransactionTypeID) references TransactionType (TransactionTypeID)
alter table TransactionLog
add constraint FK6_AccountID_TransactionLog foreign key (AccountID) references Account(AccountID)
alter table TransactionLog
add constraint FK3_CustomerID_TransactionLog foreign key (CustomerID) references Customer(CustomerID)
alter table TransactionLog
add constraint FK4_EmployeeID_TransactionLog foreign key (EmployeeID) references Employee(EmployeeID)
alter table TransactionLog
add constraint FK5_UserLoginID_TransactionLog foreign key (UserLoginID) references UserLogins(UserLoginID)

alter table Customer
add constraint FK2_UserLoginID_Customer foreign key (UserLoginID) references UserLogins(UserLoginID)

/*Question1 Create a view to get all customers with checking accounts
from ON province. [Moderate]*/


/* ANSWER1

The syntax of the CREATE VIEW command in SQL is as follows

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

CREATE VIEW Customers_With_Checking_ON AS SELECT
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    C.CustomerAddress1,
    C.CustomerAddress2,
    C.City,
    C.State,
    C.ZipCode,
    C.EmailAddress,
    C.HomePhone,
    C.CellPhone,
    C.WorkPhone,
    C.SSN,
    C.UserLoginID
FROM
 Customer C JOIN Customer_Account CA ON C.CustomerID = CA.CustomerID
/*This line joins the Customer table with the Customer_Account table 
	using the CustomerID column.*/

JOIN
    Account A ON CA.AccountID = A.AccountID
/*This line further joins the result of the previous join
with the Account table using the AccountID column*/

JOIN
    AccountType AT ON A.AccountTypeID = AT.AccountTypeID
/*This line further joins the result of the previous joins 
with the AccountType table using the AccountTypeID column.*/
WHERE
    AT.AccountTypeDescription = 'Checking Account'
    AND C.State = 'ON';

SELECT * FROM Customers_With_Checking_ON;





/*Question2

Create a view to get all customers with a total account balance 
(including interest rate) greater than 5000. [Advanced]*/

--ANSWER--

/* In this query:

We join the Customer, Customer_Account, Account,
and SavingsInterestRates tables to gather relevant information.
We calculate the total account balance, 
including interest rate, using 

SUM(A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue).

The GROUP BY clause is used to group the results by customer details.
The HAVING clause filters the results to include only
those with a total balance greater than 5000*/

CREATE VIEW Customers_With_TotalBalance_GT_5000 AS SELECT
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    C.City,
    C.State,
    C.ZipCode,
    SUM(A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue) AS TotalBalance
/*A.CurrentBalance: This refers to the current balance of each account (A is an alias for the Account table). 
It represents the amount of money currently held in each account.

SIR.InterestRateValue: This refers to the interest rate value associated with 
each account's savings interest rate. SIR is an alias for the SavingsInterestRates table.

A.CurrentBalance * SIR.InterestRateValue: This calculates the amount of interest earned on each account. 
It multiplies the current balance of the account by the interest rate value to find the interest earned.

A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue: This calculates the total balance of each account,
including the principal balance and the interest earned.

SUM(A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue): 
This sums up the total balance (principal balance + interest earned) for each customer. It aggregates the total balance across all accounts belonging to each customer.

So, the formula SUM(A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue)
calculates the total balance (including interest) across all accounts for each customer. 

The HAVING clause filters out customers whose total balance exceeds $5000.*/
FROM
    Customer C
JOIN
    Customer_Account CA ON C.CustomerID = CA.CustomerID
JOIN
    Account A ON CA.AccountID = A.AccountID
JOIN
    SavingsInterestRates SIR ON A.InterestSavingRatesID = SIR.InterestSavingsRateID
GROUP BY
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    C.City,
    C.State,
    C.ZipCode
HAVING
    SUM(A.CurrentBalance + A.CurrentBalance * SIR.InterestRateValue) > 5000;

	

SELECT * FROM Customers_With_TotalBalance_GT_5000;

/*QUESTION 3 

Create a view to get counts of checking and savings accounts by customer.*/
--ANSWER--

/* In this query:

We create a view named AccountCountsByCustomer.
We join the Customer, Customer_Account, Account, and AccountType tables.
We use the COUNT function with conditional aggregation to 
count the number of checking and savings accounts for each customer.
The result is grouped by customer details.


Extra Notes -

The COUNT function is applied to a conditional expression using a CASE statement.
The CASE statement checks a condition for each row in the result set.
If the condition is true, it returns 1 (or any non-null value).
If the condition is false, it returns NULL.
The COUNT function then counts the number of non-null 
values returned by the CASE statement for each customer,
effectively tallying the number of checking and savings accounts.
So, the syntax used here combines the COUNT function
with a CASE statement to conditionally count rows based on certain criteria.*/

CREATE VIEW AccountCountsByCustomer AS SELECT
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    C.City,
    C.State,
    C.ZipCode,
    COUNT(CASE WHEN AT.AccountTypeDescription = 'Checking Account' THEN 1 END) AS CheckingAccountCount,
    COUNT(CASE WHEN AT.AccountTypeDescription = 'Savings Account' THEN 1 END) AS SavingsAccountCount
FROM
    Customer C
JOIN
    Customer_Account CA ON C.CustomerID = CA.CustomerID
JOIN
    Account A ON CA.AccountID = A.AccountID
JOIN
    AccountType AT ON A.AccountTypeID = AT.AccountTypeID
GROUP BY
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    C.City,
    C.State,
    C.ZipCode;

SELECT * FROM AccountCountsByCustomer;


/*QUESTION 4 
Creating a view to retrieve a particular user's login 
and password using AccountId */

/*ANSWER 
/*Login_Account is joined with UserLogins based on the UserLoginID column
	to associate AccountIds with UserLogins.
The view selects the AccountID, UserLogin, and UserPassword columns*/*/
/*UA.AccountID refers
to the AccountID column from the Login_Account table,which is aliased as UA.

UL.UserLogin refers to the UserLogin column from the UserLogins table,
which is aliased as UL.

UL.UserPassword refers
to the UserPassword column from the UserLogins table,
which is also aliased as U*/

CREATE VIEW UserLoginAndPassword AS SELECT
    UA.AccountID,
    UL.UserLogin,
    UL.UserPassword
FROM
    Login_Account UA
JOIN
    UserLogins UL ON UA.UserLoginID = UL.UserLoginID;


SELECT * FROM UserLoginAndPassword
/*---To use this view for a specific AccountId, we can then run a query like this:---

SELECT UserLogin, UserPassword
FROM UserLoginAndPassword
WHERE AccountID = [YourDesiredAccountId];*/
SELECT UserPassword
FROM UserLoginAndPassword
WHERE AccountID = 101;


/*QUESTION 5 
Create a view to get all customers’ overdraft amounts.*/
/*/*

ANSWER5 

This view, named Customers_OverdraftAmounts, selects relevant information from the Customer,
Customer_Account, and OverDraftLog tables. 
It includes the Customer details (ID, name) and 
the corresponding overdraft amounts associated with their accounts.*/*/

CREATE VIEW Customers_OverdraftAmounts AS SELECT
    C.CustomerID,
    C.CustomerFirstName,
    C.CustomerMiddleInitial,
    C.CustomerLastName,
    O.AccountID,
    O.OverDraftAmount
FROM
    Customer C
JOIN
    Customer_Account CA ON C.CustomerID = CA.CustomerID
JOIN
    OverDraftLog O ON CA.AccountID = O.AccountID;


	SELECT * FROM Customers_OverdraftAmounts;

--QUESTION 6 --


/*Create a stored procedure to add “User_” as a prefix to everyone’s login	*/

/*ANSWER 6 */


/*/*This stored procedure is named AddPrefixToUserLogins.
When executed, it updates the UserLogin column in the 
UserLogins table by adding the prefix "User_" to everyone's login.*/*/


/*CREATE PROCEDURE: This statement begins the creation of a stored 
procedure named AddPrefixToUserLogins.
AS BEGIN ... END: This defines the body of the stored procedure, 
containing the SQL statements to 
be executed when the stored procedure is called.UPDATE
UserLogins SET ...: This SQL statement updates the UserLogins table by
adding the prefix "User_" to every login in the UserLogin colu*/

CREATE PROCEDURE AddPrefixToUserLogins
AS
BEGIN
    -- Update the UserLogins table to add "User_" as a prefix to everyone's login
    UPDATE UserLogins
    SET UserLogin = 'User_' + UserLogin;
END;


/*To execute the stored procedure, we can use the following command:*/
EXEC AddPrefixToUserLogins;

SELECT * FROM UserLogins


















