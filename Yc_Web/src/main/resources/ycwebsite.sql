--管理员登录表
create table admin(
	a_id integer primary key auto_increment,
	a_name varchar(100),
	a_pwd varchar(100)

)
insert into admin(a_name,a_pwd) values('admin','a');
select * from admin
--角色表
create table roles(
	r_id integer primary key auto_increment,
	r_name varchar(300)   --角色名
	
)
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

--新闻表
create table news(
	n_id integer primary key auto_increment,
	n_title varchar(300),    --标题
	n_content varchar(5000), --内容
	n_click integer,         --点击次数
	n_time datetime,        --创建时间
	n_sort integer,  	     --排序 
	n_reportor varchar(300)  --发布者
	n_status integer     --新闻发布状态
)
--学员项目表
create table projects(
	p_id integer primary key auto_increment,
	p_name varchar(300),     --项目名
	p_pic varchar(5000),     --项目图片
	p_developer varchar(300),   --开发者
	p_time time,             --开发时间
	p_addr varchar(500)      --项目发布地址 
)

--就业详情表
create table jobdetails(
	jd_id integer primary key auto_increment,
	jd_pic varchar(5000),       --照片
	jd_name varchar(300),       --学员名字
	jd_salary numeric,          --学员薪资
	jd_emptime time,            --就业时间
	jd_company varchar(300),    --所在公司
	jd_school varchar(500),	    --毕业学校
	jd_profession varchar(500)  --专业  
)

--关于公司表 
create table aboutyc(
	a_id integer primary key auto_increment,
	a_title varchar(300),	    --标题
	a_reptor varchar(300),		--发布者
	a_source varchar(5000),		--来源
	a_time time,				--发布时间
	a_content varchar(10000),	--内容
	a_tel integer,				--电话
	a_qq varchar(300),			--QQ
	a_address varchar(5000),	--地址
	a_code integer,				--邮编
	a_copr varchar(500)			--版权
)

--公司历史表
create table history(
	h_id integer primary key auto_increment,
	h_createtime time,			 --创办时间
	h_content varchar(5000),	 --介绍
	h_creator varchar(300) ,   	 --创办者
	h_reg  numeric            	 --注册资本
)

--标题栏表
create table titles(
	t_id integer primary key auto_increment,
	t_name varchar(300)			 --标题名
)

--公司活动表
create table activities(
	ac_id integer primary key auto_increment,
	ac_time time, 				 --活动时间
	ac_illus varchar(5000),	 	 --说明
	ac_pic varchar(5000)		 --图片（多图）
)

--课程体系表
create table coursys(
	cs_id integer primary key auto_increment,
	cs_name varchar(5000),		 --方向名
	cs_pic varchar(5000),		 --图片说明
	cs_version varchar(500),     --版本
	cs_text varchar(5000),		 --文字说明
	cs_status integer,
	cs_head varchar(5000)	--小头像
)
--开班信息表
create table openclass(
	oc_id integer primary key auto_increment,
	oc_name varchar(50),
	oc_time datetime,
	oc_pic varchar(5000),
	oc_status integer
)
alter table openclass add oc_status integer

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

--技术支持
create table technology(
	te_id integer primary key auto_increment,
	te_name varchar(300),		 --发表人
	te_time time,				 --时间
	te_content varchar(5000),	 --内容
	te_click integer,			 --浏览次数
	te_title varchar(300)        --标题
)

--学生报名表  --姓名 --电话  --意向方向
create table students(
	s_id integer primary key auto_increment,
	s_name varchar(300),      
	s_tel integer,			   
	s_direction varchar(500),  
	s_status integer
)
alter table students modify column s_tel varchar(20);
create table employ(
	e_id integer primary key auto_increment,
	e_position varchar(300),	 --职位
	e_validtime datetime,			 --有效时间
	e_amount integer,			 --招聘人数
	e_salary numeric,		     --工资待遇
	e_detail varchar(5000),		 --详细说明
	e_addr varchar(5000) 		 --简历投递地址	
)

--应聘表
create table applyjob(
	a_id integer primary key auto_increment,
	a_name varchar(100), --姓名
	a_tel varchar(200),	--电话
	a_email varchar(100), --邮箱
	a_orientation varchar(100),--方向
	a_detail varchar(500), --个人简介
	a_time datetime,	--申请时间	
	a_status integer default 0   -- 0 待审核，1 已审核 
	
)
create table jobtype(
	j_id integer primary key auto_increment,
	j_name varchar(100) ,
)
create table datadictionary(
	id int primary key auto_increment,
	type varchar(40),
	description varchar(5000)
)
select * from datadictionary

insert into datadictionary(id,type,description) values ('1','title','首页')
insert into datadictionary(id,type,description) values ('2','title','师资介绍')
insert into datadictionary(id,type,description) values ('3','title','课程体系')
insert into datadictionary(id,type,description) values ('4','title','学员项目')
insert into datadictionary(id,type,description) values ('5','title','就业详情')
insert into datadictionary(id,type,description) values ('6','title','关于源辰')
insert into datadictionary(id,type,description) values ('7','title','公司历史')
insert into datadictionary(id,type,description) values ('8','company','源辰信息科技是一家定位于大学生软件开发实战培训和企事业单位系统集成、项目研发于一体的综合性软件公司，以大学生高起点就业和为企事业单位提供信息化解决方案为目标。/公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。/我们的宗旨是服务于学生，致力于企业。')
insert into datadictionary(id,type,description) values ('9','footer','电话：0734-8355998/QQ：1728952785/邮政编码：421141/版权所有CopyRight 2016 源辰信息科技有限公司/地址：衡阳市解放西路丽天名园905室')
