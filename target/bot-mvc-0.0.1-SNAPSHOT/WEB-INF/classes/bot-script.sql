--drop table tb_bot;
--drop sequence bot_seq;

CREATE TABLE tb_bot (
    id_bot           NUMBER(11) NOT NULL PRIMARY KEY,
    name             VARCHAR2(255),
    welcome_msg      VARCHAR2(255),
    farewell_msg     VARCHAR2(255),
    downtime         NUMBER(11),
    default_answer   VARCHAR2(255),
    id_segment      NUMBER(11) NOT NULL,
    CONSTRAINT FK_ID_SEGMENT FOREIGN KEY (id_segment) REFERENCES tb_segment(id_segment)
);

CREATE SEQUENCE bot_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tr_insert_id_bot
                  BEFORE INSERT ON tb_bot FOR EACH ROW       
BEGIN
 
SELECT bot_seq.NEXTVAL
INTO :NEW.id_bot
FROM DUAL;
END;
/

INSERT INTO TB_BOT (NAME, WELCOME_MSG, FAREWELL_MSG, DOWNTIME, DEFAULT_ANSWER, ID_SEGMENT) VALUES ('Nome do bot 1', 'Bem-vindo, terraqueo!', 'Adeus, terraqueo!', 1, 'Bot 1 ativado', 1);
INSERT INTO TB_BOT (NAME, WELCOME_MSG, FAREWELL_MSG, DOWNTIME, DEFAULT_ANSWER, ID_SEGMENT) VALUES ('Nome do bot 2', 'Bem-vindo, terraqueo!', 'Adeus, terraqueo!', 1, 'Bot 2 ativado', 2);
INSERT INTO TB_BOT (NAME, WELCOME_MSG, FAREWELL_MSG, DOWNTIME, DEFAULT_ANSWER, ID_SEGMENT) VALUES ('Nome do bot 3', 'Bem-vindo, terraqueo!', 'Adeus, terraqueo!', 1, 'Bot 3 ativado', 3);

commit;

SELECT * FROM TB_BOT;