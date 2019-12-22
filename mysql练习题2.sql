--mysql插入、更新、与删除

--food表创建
create table food(
	id int(10) primary key not null unique auto_increment,
	name varchar(20) not null,
	company varchar(30) not null,
	price float,
	produce_time year,
	validity_time int(4),
	address varchar(50)
);

--food表数据插入
insert into food(id,name,company,price,produce_time,validity_time,address) values(null,'AA饼干','AA饼干厂',2.5,2008,3,'北京'),
	(null,'CC牛奶','CC牛奶厂',3.5,2009,1,'河北'),
	(null,'EE果冻','EE果冻厂',1.5,2007,2,'北京'),
	(null,'FF咖啡','FF咖啡厂',20,2002,5,'天津'),
	(null,'GG奶糖','GG奶糖厂',14,2003,3,'广东');

--将“CC牛奶厂”的厂址（address）改为“内蒙古”，并且将价格改为3.2

UPDATE food SET address='内蒙古',price=3.2 WHERE name='CC牛奶';

--将厂址在北京的公司保质期（validity_time）都改为5年

UPDATE food SET validity_time=5 WHERE address='北京';

--删除过期食品的记录。若当前时间-生产年份（produce_time）>保质期（validity_time），则视为过期食
DELETE FROM food WHERE validity_time<(2013-produce_time);

--删除厂址为北京的食品的记录

DELETE FROM food WHERE address='北京';

--建立teacher表
create table teacher(
	id int(4) primary key not null unique auto_increment,
	num int(10) not null unique,
	name varchar(20) not null,
	sex varchar(4) not null,
	birthday datetime,
	address varchar(50)
);

--向teacher表中插入数据
 INSERT  INTO  teacher VALUES(1, 1001, '张三','男' ,'1984-11-08' ,'北京市昌平区'),

(NULL, 1002, '李四','女' ,'1970-01-21' ,'北京市海淀区') ,

(NULL, 1003, '王五','男' ,'1976-10-30' ,'北京市昌平区') ,

(NULL, 1004, '赵六','男' ,'1980-06-05' ,'北京市顺义区') ;


--更新id为1的记录，将生日（birthday）改为“1982-11-08”

UPDATE teacher SET birthday='1982-11-08' WHERE id=1;

 

--将性别（sex）为“男”的记录的家庭住址（address）都变为“北京市朝阳区”

UPDATE teacher SET address='北京市朝阳区' WHERE sex='男';

 

--删除教工号（num）为1002的记录删除

DELETE FROM teacher WHERE num=1002;
