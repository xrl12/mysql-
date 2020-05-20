-- 连接数据库
MySQL -u root -h localhost -P 3306 -p 

-- 查看所有的数据库
show databases

-- 创建数据库
create database mydatabase charset utf8;

-- 带有关键字的数据库
create database `database` charset utf8;


-- 查看数据库
show databases;


-- 模糊匹配数据库
show databases 'per%';


-- 查看建库语句
show create database mydatabase;


-- 创建一个数据库，为了对后面执行修改字符集
create database mydatabase charset utf8;


-- 修改字符集
alter database mydatabase charset=gbk;
	

-- 删除数据库
drop database mydatabase;


-- 显式建表语句
create table if not exists student(
	name varchar(10),
	gender varchar(10),
	number varchar(10),
	age int
)charset utf8;


-- 隐式建表
create table if not exists mydatabase.class(
name varchar(10),
room varchar(10)
)charset utf8;


-- 查看所有表
show tables;


-- 模糊查询
show tables like '%s';


-- 查看表的建表语句
show create table class;


-- 修改表名
rename table student to mystudent;


-- 修改表选项
alter table mystudent charset = GBK;


# 增加字段
alter table mystudent add column id int first;


-- 修改字段 数据类型
alter table mystudent modify number char(10) after id;


-- 修改字段名
alter table  mystudent change gender sex varchar(10);

-- 删除字段
alter table mystudent drop age;


-- 删除表;
drop table class,mystudent;



-- 插入数据
insert into student values
('小徐一号','男','beicai001',18),
('小徐二号','男','beicai002',20),
('小徐三号','女','beicai003',22);


-- 指定字段列表插入数据
insert into student(gender,number,age,name) values
	('男','beicai004',24,'小徐四号');


-- 查看所有数据
select * from student;


-- 指定条件进行查询
select number,gender,age from student where name = '小徐一号';


-- 更新数据
update student set gender = '女' where id = 1;


-- 删除数据
delete from student where id = 1;



-- 创建整形
create table my_int (
int_1 tinyint,
int_2 smallint,
int_3 int,
int_4 mediumint,
int_5 bigint
)charset utf8;


-- 插入整形数据
insert into my_int values
	(100,100,100,100,100);  -- 有效数据

insert into my_int values
	('a','b','c','123');  -- 无效数据

insert into my_int values
	(255,10000,100000,100000000000000000000000000,1000000000000000000000); -- 无效数据 超出范围


-- 给表增加无符号类型
alter table my_int add int_6 tinyint unsigned;	


-- 只当显示宽度为1 
alter table my_int modify int_6 tinyint(1) unsigned;


-- 显示宽度为2 0填充
alter table my_int add int_7 tinyint(2) zerofill;


-- 插入数据
insert into my_int values
	(1,1,1,1,1,1,1);

insert into my_int values
	(100,100,100,100,100,100,100)



-- 创建浮点数表
create table my_float 
	(
		f1 float,
		f2 float(10,2), -- 十位在精度范围之外
		f3 float(6,2)  -- 六位在精度范围之内
		)charset utf8;


insert into my_float values
	(1000.10,1000.10,1000.10);

insert into my_float values
	(1234567890,12345678.90,1234.56);

insert into my_float values
	(3e38,3.01e7,1234.56);

insert into my_float values
	(999999999,99999999.99,9999.99);


-- 当我们在插入浮点数据类型的时候，小数部分可以超出长度，但是整数部分不可以超出长度
insert into my_float values
	(123456789,1234.12345678,123.9876543);

insert into my_float values
	(123456,1234.12,12345.56);	



-- 定点数的表
  create table my_decimal(
	f1 float(10,2),
	d1 decimal(10,2)
)charset utf8;


-- 插入数据
insert into my_decimal values
	(12345678.90,12345678.90);

insert into my_decimal values
	(12345678.90,12345678.90112321312321213);


 -- 创建时间日期表
create table my_data(
d1 datetime,
d2 date,
d3 time,
d4 timestamp,
d5 year
)charset utf8;


-- 插入数据
insert into my_data values
	('2020-05-16 21:12:30','2020-05-16','21:12:30','2020-05-16 21:12:30','2015');


-- 时间是用负数
insert into my_data values
	('2020-05-16 21:12:30','2020-05-16','-21:12:30','2020-05-16 21:12:30','2015');



-- -213 表示重过去到现在的时间段
insert into my_data values
	('2020-05-16 21:12:30','2020-05-16','-213:12:30','2020-05-16 21:12:30','2015');


-- -2 表示过去的两天
insert into my_data values
	('2020-05-16 21:12:30','2020-05-16','-2 13:12:30','2020-05-16 21:12:30','2015');


-- year可以使用两位或者四位
insert into my_data values
	('2020-05-16 21:12:30','2020-05-16','-2 13:12:30','2020-05-16 21:12:30','15');


-- 修改记录
update my_data set d1 = '2020-05-21 23:32:32' where d3='21:12:30';


-- 创建枚举
create table my_enum(
gender enum('男','女','保密')
)charset utf8;


-- 插入数据
insert into my_enum values
	('男'),('保密'); -- 有效数据

insert into my_enum values
	('male'); -- 无效数据


-- 将字段取出来进行+0运算
select gender + 0,gender from my_enum;


-- 数据插入枚举元素
insert into my_enum values
	(1),(2);


-- 创建班级表
create table my_class 
(
name varchar(20) not null, -- 不允许为空
room varchar(20) null  -- 允许为空 MySQL默认是允许为空
)charset utf8


-- 创建一个comment表
create table teacher(
name varchar(20) comment '老师性名',
money decimal(10,2) not null comment '老师工资'
);



-- 默认值default
create table my_default (
name varchar(20) not null,
age tinyint unsigned default 0,
gender enum('男','女','保密') default '男'
) charset utf8;


-- 插入数据
insert into my_default(name) values
	('小红');
insert into my_default values
	('男闺蜜',18,default);


-- 增加主键
create table my_pril(
name varchar(20) not null comment '姓名',
number char(10) primary key comment 'bc2019+0001,不能重复'
)charset utf8;


-- 复合主键
create table my_pril2(
number char(10) comment '学号：bc2010001',
course char(10) comment '课程代码 bc2589001',
score tinyint unsigned default 60 comment '成绩',
-- 增加主键限制 ：学号和课程号应该是对应的，具有唯一性
primary key(number,course)
)charset utf8;


-- 追加主键
create table my_pril3(
course char(10) not null comment '课程代码：不允许为空',
name varchar(10) not null comment '课程名字'
)charset utf8;

-- 修改字段 
alter table my_pril3 modify course char(10) primary key comment'课程代码：不允许为空';

-- 添加一个字段为主键
alter table my_pril3 add primary key (course);



-- 在主键里面插入数据
insert into my_pril values
	('古天乐','bc2019001'),
	('蔡康永','bc2019002');

insert into my_pril2 values
	('bc2019001','bc2589001',90),
	('bc2019001','bc2589002',85),
	('bc2019002','bc2589001',92);


-- 主键冲突
insert into my_pril values
	('刘涛','bc2019002') --  不可以主键冲突;

-- 复合主键 主键冲突
insert into my_pril2 values
	('bc2019001','bc2589001',100);


-- 删除主键
alter table my_pril3 drop primary key;


-- 追加主键
alter table my_pril3 add primary key(course,name);


-- 创建自增长
create table my_auto (
id int(1) primary key auto_increment comment '自增长',
name varchar(30) not null
)charset utf8;


-- 出发自增长
insert into my_auto(name) values
	('邓丽君');


insert into my_auto values
	(null,'成龙');


insert into my_auto values
	(default,'吴绮丽');


-- 指定数据
insert into my_auto values
	(6,'黄晓明');

insert into my_auto values
	(default,'杨颖');


-- 修改自增长(像下修改不生效)
alter table my_auto auto_increment = 3;


-- 修改自增长向上修改
alter table my_auto auto_increment = 10;


	-- 查看自增长对应的变量
show variables like 'auto_increment%';


-- 修改自增长步长
set auto_increment_increment = 5;


-- 查看是否修改成功
insert into my_auto values(
null,'杨紫'
);


insert into my_auto values(
	null,'张一山'
	);


-- 删除自增长
alter table my_auto modify id int primary key; 


-- 创建唯一键
create table my_unique1 (
number char(10) unique comment '学号：唯一允许为空',
name varchar(20) not null
)charset utf8;


create table my_unique2(
number char(10) not null comment '学号',
name varchar(20) not null ,
-- 增加唯一键
unique key(number)
 );

-- 追加唯一键
create table my_unique3(
id int primary key  auto_increment,
number char(10) not null,
name varchar(10) not null
)charset utf8;


alter table my_unique3 add unique key(number);


-- 插入数据
insert into my_unique1 values
	(null,'大熊'),
	('bc2019001','胖虎'),
	(null,'静香');

insert into my_unique1 values
	('bc2019001','哆啦A梦');


-- 删除唯一键
alter table my_Unique3 drop index number;


-- 创建索引
create unique index number on my_unique3(number);
alter table my_unique3 add unique key(number);
alter table my_unique3 add index(number)


-- 查看索引
show index from my_unique3 \G


--  主键冲突
-- 给班级表增加主键
alter table my_class add primary key(name);


-- 插入数据
insert into my_class values
	('python1907','B408'); -- 正确

insert into my_class values
	('python1907','B407'); -- 错误

-- 更新
insert into my_class(name,room) values
	('python1907','B407') on duplicate key update room='B407'; -- 解决冲突

insert into my_class values
	('python1903','B408');


-- 替换
replace into my_class values
	('python1903','B406');

replace into my_class values
('python1910','B410');


-- 复制表结构  (只会复制表结构，不会复制表数据)
create table my_copy like my_class;

-- 蠕虫复制
insert into my_copy select * from my_class;

-- 删除主键
alter table my_copy drop primary key;


-- 更新部分内容
update my_copy set room = 'A406' where room='B406' limit 4;


-- 删除部分数据
delete from my_copy where room='B409' limit 10; 



-- 清空表结构
truncate student;


-- select 选项
-- all选项
select * from my_copy;
select all * from my_copy;

-- distinct
select distinct * from my_copy;


-- 插入数据
insert into student(name,gender,number,age) values
	('徐瑞鑫一号','男','bc2019001',12),
	('徐瑞鑫二号','女','bc2019002',13),
	('徐瑞鑫三号','男','bc2019003',14),
	('徐瑞鑫四号','女','bc2019004',15),
	('徐瑞鑫五号','男','bc2019005',16);


-- 起别名
select id,
name as 名字,
gender as 性别,
number 学号,
age 年龄 from student;


-- 多表查询
select * from student,my_class;


-- 子查询
select * from (select * from student) as data;


-- 添加字段
alter table student add height tinyint unsigned;

-- 使用随机数rand
update student set height = floor(rand*20+170);


-- 找学生id为135
select * from student where id in(1,3,5);
select * from student where id=1 || id=5|| id=3;


-- 找学生身高在180到190之间
select all * from student where height>180 and height < 190;