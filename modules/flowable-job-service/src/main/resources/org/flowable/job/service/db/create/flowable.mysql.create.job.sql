create table act_ru_job (
    id_ varchar(64) not null,
    rev_ integer,
    type_ varchar(255) not null,
    lock_exp_time_ timestamp(3) null,
    lock_owner_ varchar(255),
    exclusive_ boolean,
    execution_id_ varchar(64),
    process_instance_id_ varchar(64),
    proc_def_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    retries_ integer,
    exception_stack_id_ varchar(64),
    exception_msg_ varchar(4000),
    duedate_ timestamp(3) null,
    repeat_ varchar(255),
    handler_type_ varchar(255),
    handler_cfg_ varchar(4000),
    custom_values_id_ varchar(64),
    create_time_ timestamp(3) null,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_ru_timer_job (
    id_ varchar(64) not null,
    rev_ integer,
    type_ varchar(255) not null,
    lock_exp_time_ timestamp(3) null,
    lock_owner_ varchar(255),
    exclusive_ boolean,
    execution_id_ varchar(64),
    process_instance_id_ varchar(64),
    proc_def_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    retries_ integer,
    exception_stack_id_ varchar(64),
    exception_msg_ varchar(4000),
    duedate_ timestamp(3) null,
    repeat_ varchar(255),
    handler_type_ varchar(255),
    handler_cfg_ varchar(4000),
    custom_values_id_ varchar(64),
    create_time_ timestamp(3) null,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_ru_suspended_job (
    id_ varchar(64) not null,
    rev_ integer,
    type_ varchar(255) not null,
    exclusive_ boolean,
    execution_id_ varchar(64),
    process_instance_id_ varchar(64),
    proc_def_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    retries_ integer,
    exception_stack_id_ varchar(64),
    exception_msg_ varchar(4000),
    duedate_ timestamp(3) null,
    repeat_ varchar(255),
    handler_type_ varchar(255),
    handler_cfg_ varchar(4000),
    custom_values_id_ varchar(64),
    create_time_ timestamp(3) null,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_ru_deadletter_job (
    id_ varchar(64) not null,
    rev_ integer,
    type_ varchar(255) not null,
    exclusive_ boolean,
    execution_id_ varchar(64),
    process_instance_id_ varchar(64),
    proc_def_id_ varchar(64),
    scope_id_ varchar(255),
    sub_scope_id_ varchar(255),
    scope_type_ varchar(255),
    scope_definition_id_ varchar(255),
    exception_stack_id_ varchar(64),
    exception_msg_ varchar(4000),
    duedate_ timestamp(3) null,
    repeat_ varchar(255),
    handler_type_ varchar(255),
    handler_cfg_ varchar(4000),
    custom_values_id_ varchar(64),
    create_time_ timestamp(3) null,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create table act_ru_history_job (
    id_ varchar(64) not null,
    rev_ integer,
    lock_exp_time_ timestamp(3) null,
    lock_owner_ varchar(255),
    retries_ integer,
    exception_stack_id_ varchar(64),
    exception_msg_ varchar(4000),
    handler_type_ varchar(255),
    handler_cfg_ varchar(4000),
    custom_values_id_ varchar(64),
    adv_handler_cfg_id_ varchar(64),
    create_time_ timestamp(3) null,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) engine=innodb default charset=utf8 collate utf8_bin;

create index act_idx_job_exception_stack_id on act_ru_job(exception_stack_id_);
create index act_idx_job_custom_values_id on act_ru_job(custom_values_id_);

create index act_idx_timer_job_exception_stack_id on act_ru_timer_job(exception_stack_id_);
create index act_idx_timer_job_custom_values_id on act_ru_timer_job(custom_values_id_);

create index act_idx_suspended_job_exception_stack_id on act_ru_suspended_job(exception_stack_id_);
create index act_idx_suspended_job_custom_values_id on act_ru_suspended_job(custom_values_id_);

create index act_idx_deadletter_job_exception_stack_id on act_ru_deadletter_job(exception_stack_id_);
create index act_idx_deadletter_job_custom_values_id on act_ru_deadletter_job(custom_values_id_);

alter table act_ru_job
    add constraint act_fk_job_exception
    foreign key (exception_stack_id_)
    references act_ge_bytearray (id_);

alter table act_ru_job
    add constraint act_fk_job_custom_values
    foreign key (custom_values_id_)
    references act_ge_bytearray (id_);

alter table act_ru_timer_job
    add constraint act_fk_timer_job_exception
    foreign key (exception_stack_id_)
    references act_ge_bytearray (id_);

alter table act_ru_timer_job
    add constraint act_fk_timer_job_custom_values
    foreign key (custom_values_id_)
    references act_ge_bytearray (id_);

alter table act_ru_suspended_job
    add constraint act_fk_suspended_job_exception
    foreign key (exception_stack_id_)
    references act_ge_bytearray (id_);

alter table act_ru_suspended_job
    add constraint act_fk_suspended_job_custom_values
    foreign key (custom_values_id_)
    references act_ge_bytearray (id_);

alter table act_ru_deadletter_job
    add constraint act_fk_deadletter_job_exception
    foreign key (exception_stack_id_)
    references act_ge_bytearray (id_);

alter table act_ru_deadletter_job
    add constraint act_fk_deadletter_job_custom_values
    foreign key (custom_values_id_)
    references act_ge_bytearray (id_);

create index act_idx_job_scope on act_ru_job(scope_id_, scope_type_);
create index act_idx_job_sub_scope on act_ru_job(sub_scope_id_, scope_type_);
create index act_idx_job_scope_def on act_ru_job(scope_definition_id_, scope_type_);

create index act_idx_tjob_scope on act_ru_timer_job(scope_id_, scope_type_);
create index act_idx_tjob_sub_scope on act_ru_timer_job(sub_scope_id_, scope_type_);
create index act_idx_tjob_scope_def on act_ru_timer_job(scope_definition_id_, scope_type_);

create index act_idx_sjob_scope on act_ru_suspended_job(scope_id_, scope_type_);
create index act_idx_sjob_sub_scope on act_ru_suspended_job(sub_scope_id_, scope_type_);
create index act_idx_sjob_scope_def on act_ru_suspended_job(scope_definition_id_, scope_type_);

create index act_idx_djob_scope on act_ru_deadletter_job(scope_id_, scope_type_);
create index act_idx_djob_sub_scope on act_ru_deadletter_job(sub_scope_id_, scope_type_);
create index act_idx_djob_scope_def on act_ru_deadletter_job(scope_definition_id_, scope_type_);

insert into act_ge_property values ('job.schema.version', '6.3.0.1', 1);