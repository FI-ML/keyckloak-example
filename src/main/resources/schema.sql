create schema db_session;


create table db_session.spring_session
(
    PRIMARY_ID varchar(36) not null
        primary key,
    SESSION_ID varchar(36) not null,
    CREATION_TIME bigint not null,
    LAST_ACCESS_TIME bigint not null,
    MAX_INACTIVE_INTERVAL int not null,
    EXPIRY_TIME bigint not null,
    PRINCIPAL_NAME varchar(100) null,
    constraint SPRING_SESSION_IX1
        unique (SESSION_ID)
);

create index SPRING_SESSION_IX2
    on db_session.spring_session (EXPIRY_TIME);

create index SPRING_SESSION_IX3
    on db_session.spring_session (PRINCIPAL_NAME);

create table db_session.spring_session_attributes
(
    SESSION_PRIMARY_ID varchar(36) not null,
    ATTRIBUTE_NAME varchar(200) not null,
    ATTRIBUTE_BYTES blob not null,
    primary key (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
    constraint SPRING_SESSION_ATTRIBUTES_FK
        foreign key (SESSION_PRIMARY_ID) references db_session.spring_session (PRIMARY_ID)
            on delete cascade
);
