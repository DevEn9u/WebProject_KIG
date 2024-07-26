--------------------------------------------------------
--  ������ ������ - ȭ����-7��-23-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_BOARD_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "NGADMIN"."SEQ_BOARD_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 36 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "NGADMIN"."SEQ_COMMENTS_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 59 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "NGADMIN"."COMMENTS" 
   (	"COMM_IDX" NUMBER, 
	"BOARD_IDX" NUMBER, 
	"NAME" VARCHAR2(50), 
	"CONTENT" VARCHAR2(1000), 
	"ID" VARCHAR2(10) DEFAULT 'test9999', 
	"POSTDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DOWNLOAD_BOARD
--------------------------------------------------------

  CREATE TABLE "NGADMIN"."DOWNLOAD_BOARD" 
   (	"IDX" NUMBER, 
	"NAME" VARCHAR2(50), 
	"TITLE" VARCHAR2(200), 
	"CONTENT" VARCHAR2(2000), 
	"ID" VARCHAR2(10) DEFAULT 'test9999', 
	"POSTDATE" DATE DEFAULT sysdate, 
	"OFILE" VARCHAR2(200), 
	"SFILE" VARCHAR2(30), 
	"DOWNCOUNT" NUMBER(5,0) DEFAULT 0, 
	"VISITCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FREE_BOARD
--------------------------------------------------------

  CREATE TABLE "NGADMIN"."FREE_BOARD" 
   (	"IDX" NUMBER, 
	"NAME" VARCHAR2(50), 
	"TITLE" VARCHAR2(200), 
	"CONTENT" VARCHAR2(2000), 
	"ID" VARCHAR2(10) DEFAULT 'test9999', 
	"POSTDATE" DATE DEFAULT sysdate, 
	"VISITCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "NGADMIN"."MEMBER" 
   (	"ID" VARCHAR2(10), 
	"PASS" VARCHAR2(10), 
	"NAME" VARCHAR2(30), 
	"EMAIL" VARCHAR2(30), 
	"PHONE_NUMBER" VARCHAR2(30), 
	"REGIDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QNA_BOARD
--------------------------------------------------------

  CREATE TABLE "NGADMIN"."QNA_BOARD" 
   (	"IDX" NUMBER, 
	"NAME" VARCHAR2(50), 
	"TITLE" VARCHAR2(200), 
	"CONTENT" VARCHAR2(2000), 
	"ID" VARCHAR2(10) DEFAULT 'test9999', 
	"POSTDATE" DATE DEFAULT sysdate, 
	"VISITCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into NGADMIN.COMMENTS
SET DEFINE OFF;
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (26,24,'�ӽ�Ʈ�غ�','123444','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (53,27,'�ӽ�Ʈ�غ�','�׽�Ʈ3 ','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (29,21,'�ӽ�Ʈ�غ�','2222','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (37,25,'�ӽ�Ʈ�غ�','���� �Ǵ°ſ���?','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (54,27,'�ӽ�Ʈ�غ�','�׽�Ʈ3 ','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (3,21,'�ӽ�Ʈ�غ�','Test Comment 1234','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (4,21,'�ӽ�Ʈ�غ�','Test Comment 1234','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (58,27,'���α�','123123','river9',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (33,25,'�ӽ�Ʈ�غ�','��� �׽�Ʈ�Դϴ�.','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (50,27,'�ӽ�Ʈ�غ�','�׽�Ʈ
','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (57,34,'���α�','����Գ�. ','river9',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (24,24,'�ӽ�Ʈ�غ�','1234','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (25,24,'�ӽ�Ʈ�غ�','2222','musthave',to_date('24/07/22','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (32,24,'�ӽ�Ʈ�غ�','�̰Ŵ� �ƴ� �� �����ƿ�','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (34,25,'�ӽ�Ʈ�غ�','�̰� �ǳ���?
','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (35,25,'�ӽ�Ʈ�غ�','����¡�� �׽�Ʈ
','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (51,27,'�ӽ�Ʈ�غ�','�׽�Ʈ2
','musthave',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (55,27,'���ӹ�','12344','kig1132',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.COMMENTS (COMM_IDX,BOARD_IDX,NAME,CONTENT,ID,POSTDATE) values (56,27,'���ӹ�','123444444�ݱ�Ʈ
','kig1132',to_date('24/07/23','RR/MM/DD'));
REM INSERTING into NGADMIN.DOWNLOAD_BOARD
SET DEFINE OFF;
Insert into NGADMIN.DOWNLOAD_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,OFILE,SFILE,DOWNCOUNT,VISITCOUNT) values (19,'�ӽ�Ʈ�غ�','11','111','musthave',to_date('24/07/22','RR/MM/DD'),'Ǫ��_�˷���.jpg','20240722_9520914.jpg',1,0);
REM INSERTING into NGADMIN.FREE_BOARD
SET DEFINE OFF;
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (7,'������','�ڷ�� ����1 �Դϴ�.','����','test9999',to_date('24/07/19','RR/MM/DD'),0);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (8,'�庸��','�ڷ�� ����2 �Դϴ�.','����','test9999',to_date('24/07/19','RR/MM/DD'),0);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (9,'�̼���','�ڷ�� ����3 �Դϴ�.','����','test9999',to_date('24/07/19','RR/MM/DD'),0);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (10,'������','�ڷ�� ����4 �Դϴ�.','����','test9999',to_date('24/07/19','RR/MM/DD'),5);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (11,'������','�ڷ�� ����5 �Դϴ�.','����','test9999',to_date('24/07/19','RR/MM/DD'),32);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (12,'�ӽ�Ʈ�غ�','test','1234','test9999',to_date('24/07/19','RR/MM/DD'),3);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (13,'�ӽ�Ʈ�غ�','�׽�Ʈ2�Դϴ�.','5678','test9999',to_date('24/07/19','RR/MM/DD'),2);
Insert into NGADMIN.FREE_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (16,'�ӽ�Ʈ�غ�','�׽�Ʈ����','���̵�Ȯ���ϼ�

����ٲܰԿ�
����?','musthave',to_date('24/07/19','RR/MM/DD'),21);
REM INSERTING into NGADMIN.MEMBER
SET DEFINE OFF;
Insert into NGADMIN.MEMBER (ID,PASS,NAME,EMAIL,PHONE_NUMBER,REGIDATE) values ('river9','test1234','���α�','test@ascd.com','010-1234-0001',to_date('24/07/23','RR/MM/DD'));
Insert into NGADMIN.MEMBER (ID,PASS,NAME,EMAIL,PHONE_NUMBER,REGIDATE) values ('musthave','1234','�ӽ�Ʈ�غ�','musthave@naver.com','010-1111-2222',to_date('24/07/18','RR/MM/DD'));
Insert into NGADMIN.MEMBER (ID,PASS,NAME,EMAIL,PHONE_NUMBER,REGIDATE) values ('kig1132','test1234','���ӹ�','asdasd@f.com','010-1234-5555',to_date('24/07/18','RR/MM/DD'));
REM INSERTING into NGADMIN.QNA_BOARD
SET DEFINE OFF;
Insert into NGADMIN.QNA_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (25,'�ӽ�Ʈ�غ�','��� �׽�Ʈ','��� �׽�Ʈ
��� �׽�Ʈ
��� �׽�Ʈ
��� �׽�Ʈ
��� �׽�Ʈ
��� �׽�Ʈ
','musthave',to_date('24/07/23','RR/MM/DD'),1);
Insert into NGADMIN.QNA_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (21,'�ӽ�Ʈ�غ�','qna�׽�Ʈ�Դϴ�.','1234
��
��
��
��

��
��

�����ؤ�����','musthave',to_date('24/07/22','RR/MM/DD'),1);
Insert into NGADMIN.QNA_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (27,'�ӽ�Ʈ�غ�','123123','123123','musthave',to_date('24/07/23','RR/MM/DD'),2);
Insert into NGADMIN.QNA_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (34,'���α�','123213','123123','river9',to_date('24/07/23','RR/MM/DD'),1);
Insert into NGADMIN.QNA_BOARD (IDX,NAME,TITLE,CONTENT,ID,POSTDATE,VISITCOUNT) values (24,'�ӽ�Ʈ�غ�','123','123123','musthave',to_date('24/07/22','RR/MM/DD'),1);
--------------------------------------------------------
--  DDL for Index SYS_C008520
--------------------------------------------------------

  CREATE UNIQUE INDEX "NGADMIN"."SYS_C008520" ON "NGADMIN"."COMMENTS" ("COMM_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008508
--------------------------------------------------------

  CREATE UNIQUE INDEX "NGADMIN"."SYS_C008508" ON "NGADMIN"."DOWNLOAD_BOARD" ("IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008480
--------------------------------------------------------

  CREATE UNIQUE INDEX "NGADMIN"."SYS_C008480" ON "NGADMIN"."FREE_BOARD" ("IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008417
--------------------------------------------------------

  CREATE UNIQUE INDEX "NGADMIN"."SYS_C008417" ON "NGADMIN"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008500
--------------------------------------------------------

  CREATE UNIQUE INDEX "NGADMIN"."SYS_C008500" ON "NGADMIN"."QNA_BOARD" ("IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."COMMENTS" MODIFY ("BOARD_IDX" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."COMMENTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."COMMENTS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."COMMENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."COMMENTS" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."COMMENTS" ADD PRIMARY KEY ("COMM_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOWNLOAD_BOARD
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("DOWNCOUNT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" MODIFY ("VISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."DOWNLOAD_BOARD" ADD PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FREE_BOARD
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" MODIFY ("VISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."FREE_BOARD" ADD PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."MEMBER" MODIFY ("PASS" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."MEMBER" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."MEMBER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QNA_BOARD
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" MODIFY ("VISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "NGADMIN"."QNA_BOARD" ADD PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "NGADMIN"."COMMENTS" ADD CONSTRAINT "FK_COMMENT" FOREIGN KEY ("BOARD_IDX")
	  REFERENCES "NGADMIN"."QNA_BOARD" ("IDX") ENABLE;