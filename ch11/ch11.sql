create table replyBoard (
rno number primary key,
bno number not null references board1(num),
replytext varchar2(500) not null,
replyer varchar2(50) not null,
regdate date not null,
updatedate date not null,
del char(1)
);
alter table replyBoard add(del char(1));

select * from board1 order by num desc;
insert into REPLYBOARD values (1,255,'ANGKIMODDI','SONG',sysdate,sysdate,'y');
insert into REPLYBOARD values (2,255,'ANGKIMODDI','SONG',sysdate,sysdate,'n');
insert into REPLYBOARD values (4,255,'왜또넣어','42345',sysdate,sysdate,'n');
update REPLYBOARD set del='n' where rno =4;

select * from REPLYBOARD;