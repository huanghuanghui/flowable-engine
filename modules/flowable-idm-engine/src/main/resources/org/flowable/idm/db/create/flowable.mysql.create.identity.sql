create table act_id_property (
    name_ varchar(64),
    value_ varchar(300),
    rev_ integer,
    primary key (name_)
) engine=innodb default charset=utf8 collate utf8_bin;

insert into act_id_property
values ('schema.version', '6.3.0.1', 1);

create table act_id_bytearray (
    id_ varchar(64),
    rev_ integer,
    name_ varchar(255),
    bytes_ longblob,
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_group (
    id_ varchar(64),
    rev_ integer,
    name_ varchar(255),
    type_ varchar(255),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_membership (
    user_id_ varchar(64),
    group_id_ varchar(64),
    primary key (user_id_, group_id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_user (
    id_ varchar(64),
    rev_ integer,
    first_ varchar(255),
    last_ varchar(255),
    email_ varchar(255),
    pwd_ varchar(255),
    picture_id_ varchar(64),
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_info (
    id_ varchar(64),
    rev_ integer,
    user_id_ varchar(64),
    type_ varchar(64),
    key_ varchar(255),
    value_ varchar(255),
    password_ longblob,
    parent_id_ varchar(255),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_token (
    id_ varchar(64) not null,
    rev_ integer,
    token_value_ varchar(255),
    token_date_ timestamp(3),
    ip_address_ varchar(255),
    user_agent_ varchar(255),
    user_id_ varchar(255),
    token_data_ varchar(2000),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_priv (
    id_ varchar(64) not null,
    name_ varchar(255) not null,
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_id_priv_mapping (
    id_ varchar(64) not null,
    priv_id_ varchar(64) not null,
    user_id_ varchar(255),
    group_id_ varchar(255),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

alter table act_id_membership
    add constraint act_fk_memb_group
    foreign key (group_id_)
    references act_id_group (id_);

alter table act_id_membership
    add constraint act_fk_memb_user
    foreign key (user_id_)
    references act_id_user (id_);

alter table act_id_priv_mapping
    add constraint act_fk_priv_mapping
    foreign key (priv_id_)
    references act_id_priv (id_);

create index act_idx_priv_user on act_id_priv_mapping(user_id_);
create index act_idx_priv_group on act_id_priv_mapping(group_id_);

alter table act_id_priv
    add constraint act_uniq_priv_name
    unique (name_);
