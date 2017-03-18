--修改字段类型
alter table projects modify p_time datetime;
alter table technology modify te_time datetime;
alter table activities modify ac_time datetime;
alter table news modify n_time datetime;
--修改字段默认值
alter table 表名 alter 字段名 set default 默认值;
--因为字段类型修改为了 datetime 对应bean 中改为Date   加上了toString

alter table projects default character set utf8 collate utf8_bin

commit;