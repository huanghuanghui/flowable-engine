create table act_hi_identitylink (
    id_ varchar(64),
    group_id_ varchar(255),
    type_ varchar(255),
    user_id_ varchar(255),
    task_id_ varchar(64),
    create_time_ datetime(3),
    proc_inst_id_ varchar(64),
    scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_hi_ident_lnk_user on act_hi_identitylink(user_id_);
create index act_idx_hi_ident_lnk_scope on act_hi_identitylink(scope_id_, scope_type_);
create index act_idx_hi_ident_lnk_scope_def on act_hi_identitylink(scope_definition_id_, scope_type_);
