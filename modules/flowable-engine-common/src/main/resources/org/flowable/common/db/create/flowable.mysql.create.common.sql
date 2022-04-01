create table act_ge_property (
    name_ varchar(64),
    value_ varchar(300),
    rev_ integer,
    primary key (name_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_ge_bytearray (
    id_ varchar(64),
    rev_ integer,
    name_ varchar(255),
    deployment_id_ varchar(64),
    bytes_ longblob,
    generated_ tinyint,
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

insert into act_ge_property
values ('common.schema.version', '6.3.0.1', 1);

insert into act_ge_property
values ('next.dbid', '1', 1);
