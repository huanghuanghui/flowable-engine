create table act_hi_varinst (
    id_ varchar(64) not null,
    rev_ integer default 1,
    proc_inst_id_ varchar(64),
    execution_id_ varchar(64),
    task_id_ varchar(64),
    name_ varchar(255) not null,
    var_type_ varchar(100),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    bytearray_id_ varchar(64),
    double_ double,
    long_ bigint,
    text_ varchar(4000),
    text2_ varchar(4000),
    create_time_ datetime(3),
    last_updated_time_ datetime(3),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_hi_procvar_name_type on act_hi_varinst(name_, var_type_);
create index act_idx_hi_var_scope_id_type on act_hi_varinst(scope_id_, scope_type_);
create index act_idx_hi_var_sub_id_type on act_hi_varinst(sub_scope_id_, scope_type_);
