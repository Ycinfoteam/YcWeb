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


--操作日志
CREATE TABLE log_icecoldmonitor (
  Id int(11) NOT NULL primary key AUTO_INCREMENT,
  level varchar(255) NOT NULL DEFAULT '' COMMENT '优先级',
  category varchar(255) NOT NULL DEFAULT '' COMMENT '类目',
  thread varchar(255) NOT NULL DEFAULT '' COMMENT '进程',
  time varchar(30) NOT NULL DEFAULT '' COMMENT '时间',
  location varchar(255) NOT NULL DEFAULT '' COMMENT '位置',
  note text COMMENT '日志信息',
)
select * from log_icecoldmonitor
--LogSetting(日志设置表)  id  表名    业务名称    主键  URL模板    
create table LogSetting(
	LogID integer primary key,
	TableName varchar(300),
	BusinessName varchar(300),
	PrimaryKey varchar(300),
	UrlTemplate varchar(300),
	CreateUser varchar(300),
	CreateTime datetime,
	DeleteScriptTemplate varchar(500),
	UpdateScriptTemplate varchar(500)
)
--LogOperation(操作日志)    id  logid  操作类型  主键值  内容 
create table LogOperation(
	ID integer primary key,
	LogId integer,
	OperationType integer,
	PrimaryKeyValue varchar(300),
	Content varchar(500),
	Url varchar(300),
	CreateUser varchar(500),
	CreateTime varchar(500)
)


--LogSettingDetail(日志设置明细
create table LogSettingDetail(
	DetailID integer primary key,
	LogID integer,
	ColumnName varchar(300),
	ColumnText varchar(300),
	ColumnDataType varchar(500),
	CreateTime datatime,
	CreateUser varchar(500),


)

--LogSetting（日志设置）——用来存储配置业务表名、业务名称、主键等

--LogSettingDetail（日志设置明细）——用来存储配置业务表需要记录的详细内容，如Employee表中，我们可能需要记录字段Name、Gender等信息。

--LogOperation（操作日志）——用来记录用户对各种业务操作的内容情况。
