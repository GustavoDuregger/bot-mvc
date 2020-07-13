--drop table tb_segment;
--drop sequence segment_seq;

CREATE TABLE tb_segment (
    id_segment      NUMBER(11) NOT NULL PRIMARY KEY,
    name_segment            VARCHAR2(255)
);

CREATE SEQUENCE SEGMENT_SEQ START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tr_insert_id_segment
                  BEFORE INSERT ON tb_segment FOR EACH ROW       
BEGIN
 
SELECT SEGMENT_SEQ.NEXTVAL
INTO :new.id_segment
FROM DUAL;
END;
/

INSERT INTO tb_segment (name_segment) VALUES ('Cuidador');
INSERT INTO tb_segment (name_segment) VALUES ('Psicólogo');
INSERT INTO tb_segment (name_segment) VALUES ('Herói');

commit;

SELECT * FROM tb_segment;