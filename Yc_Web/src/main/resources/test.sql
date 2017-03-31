--新闻表的测试数据
select n_id,n_title,n_content,n_click,date_format(n_time,'%Y-%m-%d') n_time,n_sort,n_reportor,n_status from news
insert into news(n_title,n_content,n_click,n_time,n_sort,n_reportor,n_status) values('源辰28班三期项目开始','源辰28班学期将满一年，进入三期项目阶段',0,curdate(),1,'admin',0)
delete from news;
select n_id,n_title,n_content,n_click,date_format(n_time,'%Y-%m-%d') n_time,n_sort,n_reportor,n_status from news order by n_sort desc limit 0,5
--课程体系表的测试数据
select cs_id,cs_name,cs_pic,cs_version,cs_text,cs_head from coursys
insert into coursys(cs_name,cs_pic,cs_version,cs_text) values('源辰','a','a','a');
select cs_id,cs_name,cs_pic,cs_version,cs_text,cs_status from coursys  order by cs_id desc limit 1,5
--增加一个课程体系头像字段
alter table coursys add cs_head varchar(5000)

--学生报名信息表的测试数据
select s_id,s_name,s_tel,s_direction,s_status from students
insert into students(s_name,s_tel,s_direction,s_status) values('a',111111,'前端工程师',0);
show variables like 'character_set_%';
--增加一个学生发送信息状态字段
alter table students add s_status integer
--师资表的测试数据
select t_id,t_title,t_name,t_job,t_motto,t_skill,t_pic,r_id from teachers
select t_id,t_title,t_name,t_job,t_motto,t_skill,t_pic,r_id from teachers where t_name='a' limit 1;
insert into teachers (t_name) values('小桌子')
--职位的测试数据
create table jobtype(
	j_id integer primary key auto_increment,
	j_name varchar(100) 
)
select * from jobtype
insert into jobtype(j_name) values('Java工程师');
insert into jobtype(j_name) values('大数据工程师');
insert into jobtype(j_name) values('Web前端工程师');
insert into jobtype(j_name) values('嵌入式工程师');


select a_id,a_name,a_pwd from admin