--创建数据库
create database test_review charset=utf8;
--创建student表
create table student(
	id int(10) primary key not null unique auto_increment,
	name varchar(20) not null,
	sex varchar(4),
	birth year,
	department varchar(20) not null,
	address varchar(50)
);

create table score(
	id int(10) primary key not null unique auto_increment,
	stu_id int(10) not null,
	c_name varchar(20),
	grade int(10)
);

--向表中插入数据
--student表数据插入方法一
INSERT INTO student VALUES( 901,'张老大', '男',1985,'计算机系', '北京市海淀区');

INSERT INTO student VALUES( 902,'张老二', '男',1986,'中文系', '北京市昌平区');

INSERT INTO student VALUES( 903,'张三', '女',1990,'中文系', '湖南省永州市');

INSERT INTO student VALUES( 904,'李四', '男',1990,'英语系', '辽宁省阜新市');

INSERT INTO student VALUES( 905,'王五', '女',1991,'英语系', '福建省厦门市');

INSERT INTO student VALUES( 906,'王六', '男',1988,'计算机系', '湖南省衡阳市');
--student表数据插入方法二
insert into student (name,sex,birth,department,address) values
  ('张老二','男',1991,'中文系','北京市昌平区'),
  ('张三','女',1995,'中文系','湖南省永州市'),
  ('李四','男',1995,'英语系','辽宁省阜新市'),
  ('王五','女',1996,'英语系','福建省厦门市'),
  ('王六','男',1993,'计算机系','湖南省衡阳市');
--score表数据插入方法一
INSERT INTO score VALUES(NULL,901, '计算机',98);

INSERT INTO score VALUES(NULL,901, '英语', 80);

INSERT INTO score VALUES(NULL,902, '计算机',65);

INSERT INTO score VALUES(NULL,902, '中文',88);

INSERT INTO score VALUES(NULL,903, '中文',95);

INSERT INTO score VALUES(NULL,904, '计算机',70);

INSERT INTO score VALUES(NULL,904, '英语',92);

INSERT INTO score VALUES(NULL,905, '英语',94);

INSERT INTO score VALUES(NULL,906, '计算机',90);

INSERT INTO score VALUES(NULL,906, '英语',85);
--score表数据插入方法二
insert into score (stu_id,c_name,grade) values
  (901,'英语',80),
  (902,'计算机',65),
  (902,'中文',88),
  (903,'中文',95),
  (904,'计算机',70),
  (904,'英语',92),
  (905,'英语',94),
  (906,'计算机',90),
  (906,'英语',85);


--查询student表的所有记录
  select * from student;
  
 --查询student表的第2条到第4条记录
  select * from student limit 1,3;
  
--从student表查询所有学生的学号、姓名和院系信息
  select id,name,department from student;
  
--从student表中查询计算机系和英语系的学生的信息
  select *
  from student
  where department in ('计算机系','英语系');

  select * from student where department='计算机系' or department='英语系';
  
--从student表中查询年龄18~22岁的学生信息
  select *
  from student
  where 2018-birth between 18 and 22;
  
 --从student表中查询每个院系有多少人
  select department,count(department)
  from student
  group by department;
  
--从score表中查询每个科目的最高分
  select c_name,max(grade)
  from score
  group by c_name;
  
--查询李四的考试科目和考试成绩
  select c_name,grade
  from score
  where stu_id = (select id from student where name='李四');
  
  select c_name,grade from score left join student as s on s.id=score.stu_id where s.name='李四';


--用连接的方式查询所有学生的信息和考试信息
  select a.*,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id
  order by a.id;
  
  select * from student as a inner join score as b on a.id=b.stu_id;

--计算每个学生的总成绩
  select stu_id,count(c_name),sum(grade)
  from score
  group by stu_id;
  
--计算每个考试科目的平均成绩
  select c_name,avg(grade)
  from score
  group by c_name;
  
--查询计算机成绩低于95的学生信息
  select *
  from student
  where id in (select stu_id from score where c_name='计算机' and grade<95);
  
--查询同时参加计算机和英语考试的学生的信息
  select *
  from student
  where id in (select a.stu_id from score a,score b where a.stu_id=b.stu_id and a.c_name='计算机' and b.c_name='英语');
  
--将计算机考试成绩按从高到低排序
  select stu_id,grade
  from score
  where c_name='计算机'
  order by grade desc;
  
--从student表和score表中查询出学生的学号，然后合并查询结果
  select id from student
  union
  select stu_id from score;
  
--查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
  select a.name,a.department,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id and a.name regexp '^[张王]';
  题意 张、王必须为姓，即以其中之一开头
  --查询张姓或者王姓同学信息
  select * from student where name rlike '^[张王].+';
  select * from student where name like '张%' or name like '王%';

  select a.name,a.department,b.c_name,b.grade from student as a inner join score as b on a.id=b.stu_id where a.name rlike '^[张王].+';
  
--查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
  select a.name,2018-a.birth as age,a.department,b.c_name,b.grade
  from student a,score b
  where a.id=b.stu_id and a.address regexp '^湖南';

  select a.name,2019-a.birth as age,a.sex,a.apartment,b.c_name,b.grade from student as a inner join score as b on a.id=b.stu_id where a.address rlike '^湖南.+';