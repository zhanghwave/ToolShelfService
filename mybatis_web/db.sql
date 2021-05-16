orders
	create table orders(
		oid varchar(32) primary key,
		odescr varchar(20),
		uid int,
		orderdate datetime default now(),
		foreign key(uid) references users(uid)
	);

details
	create table details(
		did varchar(32) primary key,
		ddesc varchar(20),
		oid varchar(32),
		pid varchar(32),
		foreign key(oid) references orders(oid),
		foreign key(pid) references products(pid)
	);

users
	create table users(
		uid int primary key auto_increment,
		username varchar(20) unique not null,
		password varchar(20) not null,
		tel varchar(11) not null,
		addr varchar(50)
	);

products
	create table products(
		pid varchar(32) primary key,
		pname varchar(20) not null unique,
		pdesc varchar(30),
		tid int,
		foreign key(tid) references types(tid)
	);

types
	create table types(
		tid int primary key auto_increment,
		typename varchar(20) unique not null,
		typedesc varchar(30)
	);
	
	insert into details values(replace(uuid(), '-', ''), 'no1 detail descr', '02d146374acd11e9a8cd001c423a43bc', '3e83be774ac411e9a8cd001c423a43bc');
	
	select u.username, p.pname, p.pdesc, t.typename from users u
		inner join orders o on u.uid = o.uid
		inner join details d on o.oid = d.oid
		inner join products p on d.pid = p.pid
		inner join types t on t.tid = p.tid
		where u.username = 'zhangchengkai';
		
		
	select * from orders o,
		users u,
		details d,
		products p,
		types t
		where o.uid = u.uid
		and o.oid = d.oid
		and d.pid = p.pid
		and p.tid = t.tid
		and o.oid = '02d146374acd11e9a8cd001c423a43bc';
	
	
	
	
	
	
	
	
	
	Microsoft Windows [版本 6.1.7600]
版权所有 (c) 2009 Microsoft Corporation。保留所有权利。

C:\Program Files\MySQL\MySQL Server 5.6\bin>mysql -ujames -p1234
Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.6.10 MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use je1809
Database changed
mysql> create table users(
    ->          uid int primary key auto_increment,
    ->          username varchar(20) unique not null,
    ->          password varchar(20) not null,
    ->          tel varchar(11) not null,
    ->          addr varchar(50)
    ->  );
Query OK, 0 rows affected (0.02 sec)

mysql> create table types(
    ->          tid int primary key auto_increment,
    ->          typename varchar(20) unique not null,
    ->          typedesc varchar(30)
    ->  );
Query OK, 0 rows affected (0.01 sec)

mysql> create table products(
    ->          pid varchar(32) primary key,
    ->          pname varchar(20) not null unique,
    ->          pdesc varchar(30),
    ->          tid int,
    ->          foreign key(tid) references types(tid)
    ->  );
Query OK, 0 rows affected (0.02 sec)

mysql> create table orders(
    ->          oid varchar(32) primary key,
    ->          odescr varchar(20),
    ->          uid int,
    ->          orderdate datetime default now(),
    ->          foreign key(uid) references users(uid)
    ->  );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql>  create table details(
    ->          did varchar(32) primary key,
    ->          ddesc varchar(20),
    ->          oid varchar(32),
    ->          pid varchar(32),
    ->          foreign key(oid) references orders(oid),
    ->          foreign key(pid) references products(pid)
    ->  );
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+------------------+
| Tables_in_je1809 |
+------------------+
| details          |
| orders           |
| products         |
| student          |
| types            |
| users            |
+------------------+
6 rows in set (0.00 sec)

mysql> insert into types values(null, '电子产品', '电子产品描述')
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> select * from types;
+-----+----------+--------------+
| tid | typename | typedesc     |
+-----+----------+--------------+
|   1 | 电子产品 | 电子产品描述 |
+-----+----------+--------------+
1 row in set (0.00 sec)

mysql> insert into types values(null, '生活用品', '生活用品描述')
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> select * from types;
+-----+----------+--------------+
| tid | typename | typedesc     |
+-----+----------+--------------+
|   1 | 电子产品 | 电子产品描述 |
|   2 | 生活用品 | 生活用品描述 |
+-----+----------+--------------+
2 rows in set (0.00 sec)

mysql> select uuid();
+--------------------------------------+
| uuid()                               |
+--------------------------------------+
| ecab6e4f-4ac3-11e9-a8cd-001c423a43bc |
+--------------------------------------+
1 row in set (0.01 sec)

mysql> select replace(uuid(), '-', '');
+----------------------------------+
| replace(uuid(), '-', '')         |
+----------------------------------+
| 06eb3ddc4ac411e9a8cd001c423a43bc |
+----------------------------------+
1 row in set (0.00 sec)

mysql> insert into products values(replace(uuid(), '-', ''), 'mac pro', '22000', 1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into products values(replace(uuid(), '-', ''), 'iphone x', '8000', 1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into products values(replace(uuid(), '-', ''), '牙膏', '80', 2);
Query OK, 1 row affected (0.00 sec)

mysql> select * from types;
+-----+----------+--------------+
| tid | typename | typedesc     |
+-----+----------+--------------+
|   1 | 电子产品 | 电子产品描述 |
|   2 | 生活用品 | 生活用品描述 |
+-----+----------+--------------+
2 rows in set (0.00 sec)

mysql> select * from products;
+----------------------------------+----------+-------+------+
| pid                              | pname    | pdesc | tid  |
+----------------------------------+----------+-------+------+
| 3e83be774ac411e9a8cd001c423a43bc | mac pro  | 22000 |    1 |
| 4d1563574ac411e9a8cd001c423a43bc | iphone x | 8000  |    1 |
| 580c31bd4ac411e9a8cd001c423a43bc | 牙膏     | 80    |    2 |
+----------------------------------+----------+-------+------+
3 rows in set (0.00 sec)

mysql> insert into users(null, 'zhangchengkai', '888888', '13333333333', '南窑国际')
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'null, 'zhangchengkai', '888888', '13333333333', '南窑国际')' at line 1
mysql> insert into users values(null, 'zhangchengkai', '888888', '13333333333', '南窑国际')
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> insert into users values(null, 'kk', '666666', '139999999', '立人呢科技')
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> select * from users;
+-----+---------------+----------+-------------+------------+
| uid | username      | password | tel         | addr       |
+-----+---------------+----------+-------------+------------+
|   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际   |
|   2 | kk            | 666666   | 139999999   | 立人呢科技 |
+-----+---------------+----------+-------------+------------+
2 rows in set (0.00 sec)

mysql> select * from users;
+-----+---------------+----------+-------------+------------+
| uid | username      | password | tel         | addr       |
+-----+---------------+----------+-------------+------------+
|   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际   |
|   2 | kk            | 666666   | 139999999   | 立人呢科技 |
+-----+---------------+----------+-------------+------------+
2 rows in set (0.00 sec)

mysql> select * from products;
+----------------------------------+----------+-------+------+
| pid                              | pname    | pdesc | tid  |
+----------------------------------+----------+-------+------+
| 3e83be774ac411e9a8cd001c423a43bc | mac pro  | 22000 |    1 |
| 4d1563574ac411e9a8cd001c423a43bc | iphone x | 8000  |    1 |
| 580c31bd4ac411e9a8cd001c423a43bc | 牙膏     | 80    |    2 |
+----------------------------------+----------+-------+------+
3 rows in set (0.00 sec)

mysql> select * from types;
+-----+----------+--------------+
| tid | typename | typedesc     |
+-----+----------+--------------+
|   1 | 电子产品 | 电子产品描述 |
|   2 | 生活用品 | 生活用品描述 |
+-----+----------+--------------+
2 rows in set (0.00 sec)

mysql> desc orders;
+-----------+-------------+------+-----+-------------------+-------+
| Field     | Type        | Null | Key | Default           | Extra |
+-----------+-------------+------+-----+-------------------+-------+
| oid       | varchar(32) | NO   | PRI | NULL              |       |
| odescr    | varchar(20) | YES  |     | NULL              |       |
| uid       | int(11)     | YES  | MUL | NULL              |       |
| orderdate | datetime    | YES  |     | CURRENT_TIMESTAMP |       |
+-----------+-------------+------+-----+-------------------+-------+
4 rows in set (0.01 sec)

mysql> show create table orders;
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                                            |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| orders | CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `odescr` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `orderdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into orders (oid, odescr, uid)values(replace(uuid(), '-', ''), 'zhang orders', 1)
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> select * from orders;
+----------------------------------+--------------+------+---------------------+
| oid                              | odescr       | uid  | orderdate           |
+----------------------------------+--------------+------+---------------------+
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |
+----------------------------------+--------------+------+---------------------+
1 row in set (0.00 sec)

mysql> desc details
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| did   | varchar(32) | NO   | PRI | NULL    |       |
| ddesc | varchar(20) | YES  |     | NULL    |       |
| oid   | varchar(32) | YES  | MUL | NULL    |       |
| pid   | varchar(32) | YES  | MUL | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into details values(replace(uuid(), '-', ''), 'no1 detail descr', '02d146374acd11e9a8cd001c423a43bc', '3e83be774ac411e9a8cd001c423a43bc');
Query OK, 1 row affected (0.00 sec)

mysql> select * from details;
+----------------------------------+------------------+----------------------------------+----------------------------------+
| did                              | ddesc            | oid                              | pid                              |
+----------------------------------+------------------+----------------------------------+----------------------------------+
| 5c87035d4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc |
+----------------------------------+------------------+----------------------------------+----------------------------------+
1 row in set (0.00 sec)

mysql> insert into details values(replace(uuid(), '-', ''), 'no1 detail descr', '02d146374acd11e9a8cd001c423a43bc', '4d1563574ac411e9a8cd001c423a43bc');
Query OK, 1 row affected (0.00 sec)

mysql> insert into details values(replace(uuid(), '-', ''), 'no1 detail descr', '02d146374acd11e9a8cd001c423a43bc', '580c31bd4ac411e9a8cd001c423a43bc');
Query OK, 1 row affected (0.00 sec)

mysql> select * from details;
+----------------------------------+------------------+----------------------------------+----------------------------------+
| did                              | ddesc            | oid                              | pid                              |
+----------------------------------+------------------+----------------------------------+----------------------------------+
| 5c87035d4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc |
| d1cbe10b4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc |
| dccaa4724acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc |
+----------------------------------+------------------+----------------------------------+----------------------------------+
3 rows in set (0.00 sec)

mysql> select * from users u
    ->          inner join orders o on u.uid = o.uid
    ->          inner join details d on o.oid = d.oid
    ->          inner join products p on d.pid = p.pid
    ->          inner join types t on t.tid = p.tid;
+-----+---------------+----------+-------------+----------+----------------------------------+--------------+------+---------------------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
| uid | username      | password | tel         | addr     | oid                              | odescr       | uid  | orderdate           | did                              | ddesc            | oid                              | pid                              | pid                              | pname    | pdesc | tid  | tid | typename | typedesc     |
+-----+---------------+----------+-------------+----------+----------------------------------+--------------+------+---------------------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
|   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 | 5c87035d4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | mac pro  | 22000 |    1 |   1 | 电子产品 | 电子产品描述 |
|   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 | d1cbe10b4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | iphone x | 8000  |    1 |   1 | 电子产品 | 电子产品描述 |
|   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 | dccaa4724acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 牙膏     | 80    |    2 |   2 | 生活用品 | 生活用品描述 |
+-----+---------------+----------+-------------+----------+----------------------------------+--------------+------+---------------------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
3 rows in set (0.00 sec)

mysql> desc products;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| pid   | varchar(32) | NO   | PRI | NULL    |       |
| pname | varchar(20) | NO   | UNI | NULL    |       |
| pdesc | varchar(30) | YES  |     | NULL    |       |
| tid   | int(11)     | YES  | MUL | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> select u.uername, p.pname, p.pdesc, t.typename from users u
    ->          inner join orders o on u.uid = o.uid
    ->          inner join details d on o.oid = d.oid
    ->          inner join products p on d.pid = p.pid
    ->          inner join types t on t.tid = p.tid;
ERROR 1054 (42S22): Unknown column 'u.uername' in 'field list'
mysql> select u.username, p.pname, p.pdesc, t.typename from users u
    ->          inner join orders o on u.uid = o.uid
    ->          inner join details d on o.oid = d.oid
    ->          inner join products p on d.pid = p.pid
    ->          inner join types t on t.tid = p.tid;
+---------------+----------+-------+----------+
| username      | pname    | pdesc | typename |
+---------------+----------+-------+----------+
| zhangchengkai | mac pro  | 22000 | 电子产品 |
| zhangchengkai | iphone x | 8000  | 电子产品 |
| zhangchengkai | 牙膏     | 80    | 生活用品 |
+---------------+----------+-------+----------+
3 rows in set (0.00 sec)

mysql>  select u.username, p.pname, p.pdesc, t.typename from users u
    ->          inner join orders o on u.uid = o.uid
    ->          inner join details d on o.oid = d.oid
    ->          inner join products p on d.pid = p.pid
    ->          inner join types t on t.tid = p.tid
    ->          where u.username = 'zhangchengkai';
+---------------+----------+-------+----------+
| username      | pname    | pdesc | typename |
+---------------+----------+-------+----------+
| zhangchengkai | mac pro  | 22000 | 电子产品 |
| zhangchengkai | iphone x | 8000  | 电子产品 |
| zhangchengkai | 牙膏     | 80    | 生活用品 |
+---------------+----------+-------+----------+
3 rows in set (0.00 sec)

mysql> select * from orders o
    ->          users u,
    ->          details d,
    ->          products p,
    ->          types t
    ->          where o.uid = u.uid
    ->          and o.oid = d.oid
    ->          and d.pid = p.pid
    ->          and p.tid = t.tid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'users u,
                details d,
                products p,
                types t
                where o.uid = u.uid
                and o.oid ' at line 2
mysql> select * from orders o,
    ->          users u,
    ->          details d,
    ->          products p,
    ->          types t
    ->          where o.uid = u.uid
    ->          and o.oid = d.oid
    ->          and d.pid = p.pid
    ->          and p.tid = t.tid;
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
| oid                              | odescr       | uid  | orderdate           | uid | username      | password | tel         | addr     | did                              | ddesc            | oid                              | pid                              | pid                              | pname    | pdesc | tid  | tid | typename | typedesc     |
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | 5c87035d4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | mac pro  | 22000 |    1 |   1 | 电子产品 | 电子产品描述 |
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | d1cbe10b4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | iphone x | 8000  |    1 |   1 | 电子产品 | 电子产品描述 |
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | dccaa4724acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 牙膏     | 80    |    2 |   2 | 生活用品 | 生活用品描述 |
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
3 rows in set (0.00 sec)

mysql> select * from orders o,
    ->          users u,
    ->          details d,
    ->          products p,
    ->          types t
    ->          where o.uid = u.uid
    ->          and o.oid = d.oid
    ->          and d.pid = p.pid
    ->          and p.tid = t.tid
    ->          and o.oid = '02d146374acd11e9a8cd001c423a43bc';
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
| oid                              | odescr       | uid  | orderdate           | uid | username      | password | tel         | addr     | did                              | ddesc            | oid                              | pid                              | pid                              | pname    | pdesc | tid  | tid | typename | typedesc     |
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | 5c87035d4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | 3e83be774ac411e9a8cd001c423a43bc | mac pro  | 22000 |    1 |   1 | 电子产品 | 电子产品描述 |
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | d1cbe10b4acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | 4d1563574ac411e9a8cd001c423a43bc | iphone x | 8000  |    1 |   1 | 电子产品 | 电子产品描述 |
| 02d146374acd11e9a8cd001c423a43bc | zhang orders |    1 | 2019-03-20 14:25:45 |   1 | zhangchengkai | 888888   | 13333333333 | 南窑国际 | dccaa4724acd11e9a8cd001c423a43bc | no1 detail descr | 02d146374acd11e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 580c31bd4ac411e9a8cd001c423a43bc | 牙膏     | 80    |    2 |   2 | 生活用品 | 生活用品描述 |
+----------------------------------+--------------+------+---------------------+-----+---------------+----------+-------------+----------+----------------------------------+------------------+----------------------------------+----------------------------------+----------------------------------+----------+-------+------+-----+----------+--------------+
3 rows in set (0.00 sec)

mysql>