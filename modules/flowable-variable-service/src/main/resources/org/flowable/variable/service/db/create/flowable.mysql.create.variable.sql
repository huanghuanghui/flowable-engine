create table act_ru_variable (
    id_ varchar(64) not null,
    rev_ integer,
    type_ varchar(255) not null,
    name_ varchar(255) not null,
    execution_id_ varchar(64),
    proc_inst_id_ varchar(64),
    task_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    bytearray_id_ varchar(64),
    double_ double,
    long_ bigint,
    text_ varchar(4000),
    text2_ varchar(4000),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_ru_var_scope_id_type on act_ru_variable(scope_id_, scope_type_);
create index act_idx_ru_var_sub_id_type on act_ru_variable(sub_scope_id_, scope_type_);

alter table act_ru_variable
    add constraint act_fk_var_bytearray
    foreign key (bytearray_id_)
    references act_ge_bytearray (id_);

insert into act_ge_property values ('variable.schema.version', '6.3.0.1', 1);