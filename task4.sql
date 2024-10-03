use HMBank;

sp_help 'dbo.Account'

select * from account;
select * from customers;
select * from Transactions;
go

--1 Retrieve the customer(s) with the highest account balance. 

select c.customer_id,c.first_name,a.account_id,a.account_type,a.balance from Customers c join Account a 
on a.customer_id=c.customer_id  where a.balance = (select MAX(balance) from Account);

--2 Calculate the average account balance for customers who have more than one account
select c.customer_id,c.first_name,COUNT(a.customer_id) as cnt , AVG(a.balance) as av from Customers c join Account a on c.customer_id = a.customer_id
 group by c.customer_id,c.first_name having count(a.customer_id) >1;

--3 Retrieve accounts with transactions whose amounts exceed the average transaction amount
select AVG(amount) from Transactions;

select * from Account a join Transactions t on t.account_id = a.account_id where t.amount >(select AVG(amount) from Transactions);

-- 4 Identify customers who have no recorded transactions
select * from Customers c left join Account a on c.customer_id=a.customer_id left join Transactions t on t.account_id=a.account_id
where t.transaction_id is null;

select * from Customers ;
select * from Transactions;
select * from Account;
go

--5 Calculate the total balance of accounts with no recorded transactions. 
select * from Account a left join Transactions t on a.account_id = t.account_id where t.transaction_id is null;

select sum(a.balance) from Account a left join Transactions t on a.account_id=t.account_id where t.transaction_id is null;
go

-- 6 Retrieve transactions for accounts with the lowest balance. 
select * from Account where balance=(select min(balance) from account);
select * from Transactions where account_id=17;
select * from Transactions where account_id = (select account_id from Account where balance = (select min(balance) from Account));


--7 Identify customers who have accounts of multiple types. 

select customer_id ,count(customer_id),COUNT(DISTINCT account_type) AS account_type_count from account group by customer_id having count(distinct(account_type)) >1;

--8 Calculate the percentage of each account type out of the total number of accounts. 

select * from Account;
select COUNT(account_id) from Account where account_type ='current';
select COUNT(account_id) from Account where account_type ='saving';
select COUNT(account_id) from Account where account_type ='zero_balance';
select count(account_id) from Account;
go

select account_type, count(account_type) as 'count', (select count(*) from account) as total ,
(count(account_type)*100/(select count(*) from Account)) as 'percentage' from account group by account_type;

--9 etrieve all transactions for a customer with a given customer_id. 

select * from Customers where customer_id=1;

select c.customer_id,c.first_name,t.* from Customers c join Account a on c.customer_id=a.customer_id
join Transactions t on t.account_id = a.account_id where c.customer_id = 1 order by t.transaction_id;

--10  Calculate the total balance for each account type, including a subquery within the SELECT clause. 

select account_type , count(account_type) , sum(balance) from account group by account_type;

SELECT 
    DISTINCT account_type,
    (SELECT SUM(balance) 
     FROM Account AS a2 
     WHERE a2.account_type = a1.account_type) AS total_balance
FROM 
    Account AS a1;

	

