
	--管理员登录表--姓名 --密码
create table users(
	u_id integer primary key auto_increment,
	u_name varchar(300),    
	u_password varchar(300) 
)
select u_id,u_name,u_password from users
--角色表 --角色名
create table roles(
	r_id integer primary key auto_increment,
	r_name varchar(300)  
)
select r_id,r_name from roles
--师资表  --头衔  --姓名 --职位  --座右铭 --技术方向/经验 --头像 --所属角色
create table teachers(
	t_id integer primary key auto_increment,
	t_title varchar(300),  
	t_name varchar(300),    
	t_job varchar(300),     
	t_motto varchar(5000), 
	t_skill varchar(5000),  
	t_pic varchar(5000),     
	r_id integer             
)

--新闻表 --标题 --内容 --点击次数  --创建时间 --排序  --发布者
create table news(
	n_id integer primary key auto_increment,
	n_title varchar(300),    
	n_content varchar(5000), 
	n_click integer,         
	n_time timestamp,       
	n_sort integer,  	     
	n_reportor varchar(300)  
)
 





select a_id,a_title,a_reptor,a_source,a_time,a_content,a_tel,a_qq,a_address,a_code,a_copr from Aboutyc
insert into Aboutyc values()
	

--标题栏表
create table titles(
	t_id integer primary key auto_increment,
	t_name varchar(300)			 --标题名
)
--关于公司表      --标题 	--发布者 --来源 --发布时间 --内容 --电话 --QQ --地址 --邮编 --版权 --数据字典做
create table aboutyc(
	a_id integer primary key auto_increment,
	a_title varchar(300),	    
	a_reptor varchar(300),	
	a_source varchar(5000),		
	a_time time,				
	a_content varchar(10000),	
	a_tel integer,				
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
	h_createtime time,			
	h_content varchar(5000),	
	h_creator varchar(300) ,   	
	h_reg  numeric            	
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
	jd_profession varchar(500) 
)
drop table jobdetails
 insert into jobdetails(jd_pic,jd_name,jd_salary,jd_emptime,jd_company,jd_school,jd_profession) values('网易云音乐','钟霞',2.0,now(),'','gg','ii');
select jd_id,jd_pic,jd_name,jd_salary,jd_emptime,jd_company,jd_school,jd_profession from jobdetails
delete from jobdetails where jd_id=1
update jobdetails set jd_name='kk',jd_id=3 where jd_id=3
--学员项目表 --项目名 --项目图片  --开发者 --开发时间 --项目发布地址   --张做
create table projects(
	p_id integer primary key auto_increment,
	p_name varchar(300),     
	p_pic varchar(5000),     
	p_developer varchar(300),  
	p_time datetime,             
	p_addr varchar(500)      
)
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
--课程体系表
create table coursys(
	cs_id integer primary key auto_increment,
	cs_name varchar(5000),		 --方向名
	cs_pic varchar(5000),		 --图片说明
	cs_version varchar(500),     --版本
	cs_text varchar(5000)		 --文字说明
)

--招聘表
create table employ(
	e_id integer primary key auto_increment,
	e_position varchar(300),	 --职位
	e_validtime time,			 --有效时间
	e_amount integer,			 --招聘人数
	e_salary numeric,		     --工资待遇
	e_detail varchar(5000),		 --详细说明
	e_addr varchar(5000) 		 --简历投递地址	
)



--学生报名表
create table students(
	s_id integer primary key auto_increment,
	s_name varchar(300),       --姓名
	s_tel integer,			   --电话
	s_direction varchar(500)   --意向方向
)
	
