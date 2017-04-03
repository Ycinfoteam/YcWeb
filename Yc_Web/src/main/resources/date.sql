--修改字段类型
alter table projects modify p_time datetime;
alter table technology modify te_time datetime;
alter table activities modify ac_time datetime;
--公司活动表  --活动时间 --说明  --图片（多图）--张做

alter table jobdetails modify jd_emptime datetime;
alter table jobdetails modify jd_salary varchar(500);
alter table aboutyc modify a_time datetime;
alter table aboutyc modify a_tel varchar(100);
alter table history modify h_createtime datetime;
alter table history modify h_reg varchar(500);

alter table news modify n_time datetime;
--就业表的更改
--修改字段默认值
alter table 表名 alter 字段名 set default 默认值;
--因为字段类型修改为了 datetime 对应bean 中改为Date   加上了toString

alter table projects default character set utf8 collate utf8_bin

commit;


select * from log_icecoldmonitor
--LogSetting(日志设置表)  id  表名    业务名称    主键  URL模板    --职位  --有效时间  --招聘人数 --工资待遇 --详细说明 --简历投递地址	
create table employ(
	e_id integer primary key auto_increment,
	e_position varchar(300),	 
	e_validtime datetime,			
	e_amount integer,			
	e_salary numeric,		     
	e_detail varchar(5000),		 
	e_addr varchar(5000) 		 
)

--应聘表 --姓名 --电话  --邮箱 --方向 --个人简介 --申请时间	 -- 0 待审核，1 已审核 
create table applyjob(
	a_id integer primary key auto_increment,
	a_name varchar(100), 
	a_tel varchar(200),	
	a_email varchar(100),
	a_orientation varchar(100),
	a_detail varchar(500), 
	a_time datetime,	
	a_status integer default 0   
	
)

insert into applyjob(a_name,a_tel,a_email,a_orientation,a_detail) 
values ("沈旭","18374727391","690892951@qq.com","Java工程师","具有一年开发经验");

insert into applyjob(a_name,a_tel,a_email,a_orientation,a_detail) 
values ("李润泽","18374745391","690892951@163.com","嵌入式工程师","具有一年开发经验");

insert into applyjob(a_name,a_tel,a_email,a_orientation,a_detail) 
values ("盛婕","17384745391","690892951@icloud.com","Hadoop工程师","拥有好的团队合作经验");

insert into applyjob(a_name,a_tel,a_email,a_orientation,a_detail) 
values ("胡彬","17394945391","690892951@icloud.com","数据库工程师","创新性好");


create table jobtype(
	j_id integer primary key auto_increment,
	j_name varchar(100) 
)

insert into jobtype(j_name) values('Java工程师');
insert into jobtype(j_name) values('大数据工程师');
insert into jobtype(j_name) values('Web前端工程师');
insert into jobtype(j_name) values('嵌入式工程师');

create table admin(
	a_id integer primary key auto_increment,
	a_name varchar(100),
	a_pwd varchar(100)
)


-- 数据字典表:	id:编号	type:类型    description:说明
create table datadictionary(
	id int primary key auto_increment,
	type varchar(40),
	description varchar(5000)
)

insert into datadictionary(type,description) values ('title','首页')
insert into datadictionary(type,description) values ('title','师资介绍')
insert into datadictionary(type,description) values ('title','课程体系')
insert into datadictionary(type,description) values ('title','学员项目')
insert into datadictionary(type,description) values ('title','就业详情')
insert into datadictionary(type,description) values ('title','关于源辰');
insert into datadictionary(type,description) values ('title','公司历史');
insert into datadictionary(type,description) values ('company','源辰信息科技是一家定位于大学生软件开发实战培训和企事业单位系统集成、项目研发于一体的综合性软件公司，以大学生高起点就业和为企事业单位提供信息化解决方案为目标。/公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。/我们的宗旨是服务于学生，致力于企业。');
insert into datadictionary(type,description) values ('footer','电话：0734-8355998/QQ：1728952785/邮政编码：421141/版权所有CopyRight 2016 源辰信息科技有限公司/地址：衡阳市解放西路丽天名园905室');
insert into datadictionary(type,description) values ('logo',null);






--学生报名表  --姓名 --电话  --意向方向
create table students(
	s_id integer primary key auto_increment,
	s_name varchar(300),      
	s_tel varchar(100),			   
	s_direction varchar(500),  
	s_status integer
)
drop table students
select * from students
insert into students(s_name,s_tel,s_direction,s_status) values("张晓仟",15073453495,"java软件工程师",1)

--关于公司表      --标题 	--发布者 --来源 --发布时间 --内容 --电话 --QQ --地址 --邮编 --版权 --数据字典做
create table aboutyc(
	a_id integer primary key auto_increment,
	a_title varchar(300),	    
	a_reptor varchar(300),	
	a_source varchar(5000),		
	a_time datetime,				
	a_content varchar(10000),	
	a_tel  varchar(100),				
	a_qq varchar(300),			
	a_address varchar(5000),	
	a_code integer,				
	a_copr varchar(500)			
)
insert into aboutyc(a_title,a_reptor,a_source,a_time,a_content,a_tel,a_qq,a_address,a_code,a_copr) values('网易云音乐','钟霞',2.0,now(),'','gg','ii','','');
select a_id,a_title,a_reptor,a_source,a_time,a_content,a_tel,a_qq,a_address, a_code,a_copr from aboutyc
delete from aboutyc where a_id=1
--公司历史表  --时间  --内容  --涉及人物  --更多介绍 --张做
create table history(
	h_id integer primary key auto_increment,
	h_createtime datetime,			
	h_content varchar(5000),	
	h_creator varchar(300) ,   	
	h_reg  varchar(500)           	
)
insert into history(h_createtime,h_content,h_creator,h_reg) values();
select h_id,h_createtime,h_content,h_creator,h_reg from history
delete from history where h_id=1

--就业详情表 --照片  --学员名字 --学员薪资   --就业时间 --所在公司 --毕业学校  --专业   --张做
create table jobdetails(
	jd_id integer primary key auto_increment,
	jd_pic varchar(5000),       
	jd_name varchar(300),      
	jd_salary varchar(500),          
	jd_emptime datetime,          
	jd_company varchar(300), 
	jd_palace varchar(300),
	jd_school varchar(500),	    
	jd_profession varchar(500),
	jd_status integer
)
drop table jobdetails
 insert into jobdetails(jd_pic,jd_name,jd_salary,jd_emptime,jd_company,jd_school,jd_profession) values('网易云音乐','钟霞',2.0,now(),'','gg','ii');
select jd_id,jd_pic,jd_name,jd_salary,jd_emptime,jd_company,jd_school,jd_profession from jobdetails
delete from jobdetails where jd_id=1
update jobdetails set jd_name='kk',jd_id=3 where jd_id=3
--学员项目表 --项目名 --项目图片  --开发者 --开发时间 --项目发布地址  --是否显示 默认显示 
create table projects(
	p_id integer primary key auto_increment,
	p_name varchar(300),     
	p_pic varchar(5000),     
	p_developer varchar(300),  
	p_time datetime,             
	p_addr varchar(500),
	p_status integer default 1
)
drop table projects
commit
select p_id,p_name,p_pic,p_developer,date_format(p_time,'%Y-%m-%d'),p_addr from projects
--now()  以 yyyy-mm-dd hh:mm:ss 返回日期时间   curdate() 以 yyyy-mm-dd 显示今天的日期  curtime  返回当前时间
select p_id,p_name,p_pic,p_developer,p_time,p_addr from projects
insert into projects(p_name,p_pic,p_developer,p_time,p_addr) values('网易云音乐','','钟霞',now(),'衡阳');
--技术支持 --发表人  --时间  --内容  --浏览次数   --标题 --张做
create table technology(
	te_id integer primary key auto_increment,
	te_name varchar(300),		 
	te_time time,				
	te_content varchar(5000),	
	te_click integer,			
	te_title varchar(300)      
)
insert into technology(te_name,te_time,te_content,te_click,te_title) values('钟霞',now(),'springmvc框架详解',1,'springmvc框架详解');
select te_name,te_time,te_content,te_click,te_title from technology
--公司活动表  --活动时间 --说明  --图片（多图）--张做
create table activities(
	ac_id integer primary key auto_increment,
	ac_time time, 				
	ac_illus varchar(5000),	 	 
	ac_pic varchar(5000)		
)
select ac_id,ac_time,ac_illus,ac_pic from activities
insert into activities(ac_time,ac_illus,ac_pic) values(now(),'这个活动很棒','lai')

--师资表
create table teachers(
	t_id integer primary key auto_increment,
	t_title varchar(300),   --头衔
	t_name varchar(300),    --姓名
	t_job varchar(300),     --职位
	t_motto varchar(5000),  --座右铭
	t_skill varchar(5000),  --技术方向/经验
	t_pic varchar(5000),     --头像
	r_id integer             --所属角色
)

--新闻表  --标题 --内容  --点击次数  --创建时间 --排序  --发布者 --新闻发布状态
create table news(
	n_id integer primary key auto_increment,
	n_title varchar(300),   
	n_content varchar(5000), 
	n_click integer,        
	n_time timestamp,       
	n_sort integer,  	     
	n_reportor varchar(300),  
	n_status integer         
)
drop table news
--课程体系表
create table coursys(
	cs_id integer primary key auto_increment,
	cs_name varchar(5000),		 --方向名
	cs_pic varchar(5000),		 --图片说明
	cs_version varchar(500),     --版本
	cs_text varchar(5000),		 --主讲老师
	cs_status integer ,
	cs_head varchar(5000),		 --体系头像
)


--开班信息表
create table openclass(
	oc_id integer primary key auto_increment,
	oc_name varchar(50),
	oc_time datetime,
	oc_pic varchar(5000),
	oc_status integer
)

