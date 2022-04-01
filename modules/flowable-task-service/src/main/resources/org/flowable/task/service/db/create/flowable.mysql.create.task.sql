create table act_ru_task (
    id_ varchar(64),
    rev_ integer,
    execution_id_ varchar(64),
    proc_inst_id_ varchar(64),
    proc_def_id_ varchar(64),
    task_def_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    name_ varchar(255),
    parent_task_id_ varchar(64),
    description_ varchar(4000),
    task_def_key_ varchar(255),
    owner_ varchar(255),
    assignee_ varchar(255),
    delegation_ varchar(64),
    priority_ integer,
    create_time_ timestamp(3) null,
    due_date_ datetime(3),
    category_ varchar(255),
    suspension_state_ integer,
    tenant_id_ varchar(255) default '',
    form_key_ varchar(255),
    claim_time_ datetime(3),
    is_count_enabled_ tinyint,
    var_count_ integer,
    id_link_count_ integer,
    sub_task_count_ integer,
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_task_create on act_ru_task(create_time_);
create index act_idx_task_scope on act_ru_task(scope_id_, scope_type_);
create index act_idx_task_sub_scope on act_ru_task(sub_scope_id_, scope_type_);
create index act_idx_task_scope_def on act_ru_task(scope_definition_id_, scope_type_);

insert into act_ge_property values ('task.schema.version', '6.3.0.1', 1);