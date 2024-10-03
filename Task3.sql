use HMBank

select * from Customers;
go
select * from Account;
go
select * from Transactions;
go
--1 
select avg(balance) as 'avrage balance' from Account;

-- 2
select top 10 * from Account order by  balance desc;

--3
select sum(amount) as 'deposit sum' from Transactions where transaction_type='deposit' AND CAST(transaction_date AS DATE) = '2024-09-29';

--4 
-- Finding the Oldest Customer
SELECT 
    customer_id,
    first_name,
    last_name,
    DOB
FROM 
    Customers
WHERE 
    DOB = (SELECT MIN(DOB) FROM Customers);

-- Finding the Newest Customer
SELECT 
    customer_id,
    first_name,
    last_name,
    DOB
FROM 
    Customers
WHERE 
    DOB = (SELECT MAX(DOB) FROM Customers);


--5 
select t.transaction_id ,t.account_id 'account',a.account_id,a.account_type,t.amount,t.transaction_date from Transactions t join Account a on t.account_id=a.account_id;

--6
select * from Account join Customers on Account.customer_id = Customers.customer_id;

select c.customer_id ,c.first_name, c.last_name, a.account_id, a.account_type,a.balance from
Account a join Customers c on a.customer_id = c.customer_id;

select c.customer_id ,c.first_name, c.last_name, a.account_id, a.account_type,a.balance from
Account a join Customers c on a.customer_id = c.customer_id order by customer_id;

--7
select * from Transactions where account_id=1;

--8
SELECT c.customer_id, c.first_name, c.last_name, COUNT(a.account_id) AS account_count
FROM Customers c
JOIN Account a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1;

--9
select SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) as deposit from Transactions;
select SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) as deposit from Transactions;

--select sum(amount) from Transactions;

select * from Transactions;

select sum(case when transaction_type='deposit' then amount else 0 end)- sum(case when transaction_type='withdrawal' then amount else 0 end)
as diff
from Transactions ;

--11  Calculate the total balance for each account type.
select sum(balance) from Account;

select sum(case when account_type='saving' then balance else 0 end) as SavingSum,
       sum(case when account_type='current' then balance else 0 end) as CurrentSum,
	   sum(case when account_type='zero_balance' then balance else 0 end) as ZeroBalanceSum
	   from Account;

select * from account;

--12. Identify accounts with the highest number of transactions order by descending order. 

select a.account_id,a.account_type,count(t.account_id) as TransactionCount from Account a join Transactions t on a.account_id=t.account_id
group by a.account_id,a.account_type order by TransactionCount desc;

select * from Transactions;

-- 13  List customers with high aggregate account balances, along with their account types. 
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_type,
    SUM(a.balance) AS total_balance
FROM 
    Customers c
JOIN 
    Account a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name, a.account_type
ORDER BY 
    total_balance DESC;

--14
SELECT 
    account_id,
    transaction_type,
    amount,
   
    COUNT(*) AS transaction_count
FROM 
    Transactions
GROUP BY 
    account_id,
    transaction_type,
    amount
HAVING 
    COUNT(*) > 1;

select * from transactions;

