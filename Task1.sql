create  database HMBank;
use HMBank;

create table Customers(
customer_id int IDENTITY(1,1)  primary key ,
first_name varchar(20) not null,
last_name varchar(20) not null,
DOB date not null,
email varchar(50) not null unique,
phone_number varchar(10) not null
);

alter table Customers add address varchar(200) not null;

create table Account(
account_id int IDENTITY(1,1) primary key,
customer_id int not null,
account_type varchar(20) not null check(account_type in('saving','current','zero_balance')),
balance decimal(15,2) not null default 0.00,

foreign key(customer_id) references Customers(customer_id)
 on delete cascade
 on update cascade
);


create table Transactions(
transaction_id int identity(1,1) primary key,
account_id int not null,
transaction_type varchar(20) not null check(transaction_type in('deposit', 'withdrawal', 'transfer')),
amount decimal(15,2) not null check(amount>0),
transaction_date datetime not null default current_timestamp,
foreign key (account_id) references Account(account_id)
 on delete cascade
 on update cascade
);

drop table Transactions;
sp_help 'dbo.Transactions';