create table act_hi_taskinst (
    id_ varchar(64) not null,
    rev_ integer default 1,
    proc_def_id_ varchar(64),
    task_def_id_ varchar(64),
    task_def_key_ varchar(255),
    proc_inst_id_ varchar(64),
    execution_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    name_ varchar(255),
    parent_task_id_ varchar(64),
    description_ varchar(4000),
    owner_ varchar(255),
    assignee_ varchar(255),
    start_time_ datetime(3) not null,
    claim_time_ datetime(3),
    end_time_ datetime(3),
    duration_ bigint,
    delete_reason_ varchar(4000),
    priority_ integer,
    due_date_ datetime(3),
    form_key_ varchar(255),
    category_ varchar(255),
    tenant_id_ varchar(255) default '',
    last_updated_time_ datetime(3),
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_hi_task_scope on act_hi_taskinst(scope_id_, scope_type_);
create index act_idx_hi_task_sub_scope on act_hi_taskinst(sub_scope_id_, scope_type_);
create index act_idx_hi_task_scope_def on act_hi_taskinst(scope_definition_id_, scope_type_);
