--新闻表的测试数据
select n_id,n_title,n_content,n_click,n_time,n_sort,n_reportor from news
insert into news(n_title,n_content,n_click,n_time,n_sort,n_reportor) values('源辰28班三期项目开始','源辰28班学期将满一年，进入三期项目阶段',0,current_timestamp,1,'admin');

--课程体系表的测试数据
select cs_id,cs_name,cs_pic,cs_version,cs_text from coursys
insert into coursys(cs_name,cs_pic,cs_version,cs_text) values('a','a','a','a');

--学生报名信息表的测试数据
select s_id,s_name,s_tel,s_direction from students
insert into students(s_name,s_tel,s_direction) values('a',111111,'a');