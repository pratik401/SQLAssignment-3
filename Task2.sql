use HMBank

insert into Customers(first_name,last_name,DOB,email,phone_number,address)
values('Ritesh','Khade','2003-01-08','ritesh@gmail.com','1122334455','beed');

--select * from Customers;

insert into Customers(first_name,last_name,DOB,email,phone_number,address)
values('Aarav', 'Sharma', '1998-05-22', 'aarav.sharma@example.com', '9876543210', 'Mumbai'),
('Sanya', 'Kapoor', '1995-11-15', 'sanya.kapoor@example.com', '9988776655', 'Delhi'),
('Rajesh', 'Gupta', '1988-03-19', 'rajesh.gupta@example.com', '9123456789', 'Bengaluru'),
('Nisha', 'Patil', '1993-07-09', 'nisha.patil@example.com', '9871234560', 'Pune'),
('Rohit', 'Verma', '1990-12-25', 'rohit.verma@example.com', '9812345678', 'Hyderabad'),
('Sneha', 'Rao', '2001-04-14', 'sneha.rao@example.com', '9998887776', 'Chennai'),
('Vikram', 'Singh', '1985-08-08', 'vikram.singh@example.com', '9876123450', 'Jaipur'),
('Priya', 'Nair', '1996-09-12', 'priya.nair@example.com', '9876567890', 'Kochi'),
('Amit', 'Jain', '1992-01-30', 'amit.jain@example.com', '9765432101', 'Ahmedabad'),
('Meera', 'Deshmukh', '1999-06-23', 'meera.deshmukh@example.com', '9955112233', 'Nagpur'),
('Kabir', 'Joshi', '1997-11-05', 'kabir.joshi@example.com', '8899001122', 'Surat'),
('Pooja', 'Kumar', '2000-03-17', 'pooja.kumar@example.com', '9988774466', 'Lucknow'),
('Ankit', 'Mehta', '1994-02-28', 'ankit.mehta@example.com', '9765456789', 'Indore'),
('Swati', 'Kulkarni', '1991-08-13', 'swati.kulkarni@example.com', '9944332211', 'Nashik'),
('Aditya', 'Reddy', '1989-10-21', 'aditya.reddy@example.com', '9876547891', 'Visakhapatnam'),
('Kavya', 'Shukla', '2002-07-02', 'kavya.shukla@example.com', '9988773322', 'Bhopal'),
('Harsh', 'Thakur', '1993-12-18', 'harsh.thakur@example.com', '9876457890', 'Chandigarh'),
('Neha', 'Pillai', '1995-06-29', 'neha.pillai@example.com', '9876543120', 'Thiruvananthapuram'),
('Manish', 'Chauhan', '1998-09-24', 'manish.chauhan@example.com', '9966554433', 'Ranchi'),
('Radhika', 'Bhatia', '2001-05-11', 'radhika.bhatia@example.com', '9812345690', 'Vadodara');

select * from Customers;

--sp_help 'dbo.account';

insert into Account(customer_id,account_type,balance)
values(2,'current',2000.00);

select * from Account;

insert into Account(customer_id,account_type,balance)
values
(1, 'saving', 5000.00),
(1, 'current', 1500.00),
(2, 'current', 2000.00),
(2, 'saving', 8000.00),
(3, 'zero_balance', 100.00),
(3, 'saving', 3500.00),
(4, 'saving', 7000.00),
(4, 'current', 2500.00),
(5, 'current', 3500.00),
(5, 'zero_balance', 200.00),
(6, 'saving', 1500.00),
(6, 'current', 3200.00),
(7, 'current', 4000.00),
(7, 'saving', 4000.00),
(8, 'zero_balance', 50.00),
(8, 'saving', 3000.00),
(9, 'saving', 8000.00),
(9, 'current', 2700.00),
(10, 'current', 2200.00),
(10, 'zero_balance', 90.00),
(11, 'saving', 6000.00),
(12, 'current', 2500.00),
(13, 'zero_balance', 75.00),
(14, 'saving', 10000.00),
(15, 'current', 3200.00),
(16, 'saving', 4500.00),
(17, 'current', 2800.00),
(18, 'zero_balance', 90.00),
(19, 'saving', 6500.00),
(20, 'current', 1700.00),
(21, 'saving', 5000.00),
(21, 'current', 2100.00);

select * from Account;

sp_help 'dbo.transactions';

insert into Transactions(account_id,transaction_type,amount)
values(1,'withdrawal',20);

select * from Transactions;

insert into Transactions(account_id, transaction_type, amount)
values
(1, 'withdrawal', 20.00),
(3, 'deposit', 500.00),
(4, 'withdrawal', 100.00),
(5, 'deposit', 1000.00),
(6, 'withdrawal', 200.00),
(7, 'deposit', 1500.00),
(8, 'withdrawal', 50.00),
(9, 'deposit', 800.00),
(10, 'withdrawal', 120.00),
(11, 'deposit', 400.00),
(12, 'withdrawal', 60.00),
(13, 'deposit', 300.00),
(14, 'withdrawal', 75.00),
(15, 'deposit', 1000.00),
(16, 'withdrawal', 500.00),
(17, 'deposit', 700.00),
(18, 'withdrawal', 80.00),
(19, 'deposit', 600.00),
(20, 'withdrawal', 200.00),
(21, 'deposit', 1500.00),
(22, 'withdrawal', 90.00),
(23, 'deposit', 400.00),
(24, 'withdrawal', 120.00),
(25, 'deposit', 1000.00),
(26, 'withdrawal', 150.00),
(27, 'deposit', 900.00),
(28, 'withdrawal', 200.00),
(29, 'deposit', 750.00),
(30, 'withdrawal', 300.00);

select * from Transactions;

--1
select c.customer_id,a.customer_id acc,a.account_type,c.email from  Customers c join Account a on c.customer_id=a.customer_id;

--2
SELECT c.first_name, c.last_name, c.email, t.transaction_type, t.amount, t.account_id
FROM Transactions t
JOIN Account a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id;

--3 Write a SQL query to increase the balance of a specific account by a certain amount.
  select * from account;
  update Account set balance = balance +100 where account_id = 1;

--4 
select CONCAT(first_name,' ',last_name) from Customers;

--5 Write a SQL query to remove accounts with a balance of zero where the account type is savings. 
    select * from Account;

	insert into account(customer_id,account_type,balance)
	values(20,'saving',1);

	delete from account where balance=1 and account_type='saving';



--6 
select * from Customers where address='Mumbai';

--7
select * from Account where account_type='saving';

--8
select * from Account where account_type='current' and balance>1000


--9
select * from  Transactions where account_id=1;

--10 Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate. 

SELECT 
    account_id,
    customer_id,
    balance,
    balance * 0.2 AS interest_accrued
FROM 
    Account
WHERE 
    account_type = 'saving';
--11 
select * from account where balance<2000;

--12 
select * from Customers where address!='Mumbai';

