
SET NAMES 'utf8';

DROP DATABASE IF EXISTS sgreserva;

CREATE DATABASE sgreserva
	CHARACTER SET utf8
	COLLATE utf8_general_ci;



USE sgreserva;


CREATE TABLE sala (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_sala_id(id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


CREATE TABLE periodo (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_periodo_id(id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


CREATE TABLE reserva (
  id INT(11) NOT NULL AUTO_INCREMENT,
  sala_id INT(11) NOT NULL,
  periodo_id INT(11) NOT NULL,
  dia DATE NOT NULL,
  professor_desc VARCHAR(255) DEFAULT NULL,
  disciplina_desc VARCHAR(255) DEFAULT NULL,
  status INT(11) NOT NULL DEFAULT 1 COMMENT '1 reservada, 2 confirmada, 3 cancelada ',
  observacao TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_reserva_id(id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 29,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


ALTER TABLE reserva 
  ADD INDEX IDX_reserva_dia(dia);


ALTER TABLE reserva 
  ADD INDEX IDX_reserva_status(status);


ALTER TABLE reserva 
  ADD UNIQUE INDEX UK_reserva(sala_id, periodo_id, dia);


ALTER TABLE reserva 
  ADD CONSTRAINT FK_reserva_periodo_id FOREIGN KEY (periodo_id)
    REFERENCES periodo(id);


ALTER TABLE reserva 
  ADD CONSTRAINT FK_reserva_sala_id FOREIGN KEY (sala_id)
    REFERENCES sala(id);


CREATE TABLE usuario (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  senha VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_usuario_id(id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


ALTER TABLE usuario 
  ADD UNIQUE INDEX UK_usuario_email(email(15));


INSERT INTO sala VALUES
(1, 'Sala 1'),
(2, 'Sala 2'),
(3, 'Sala 3'),
(4, 'Sala 4'),
(5, 'Sala 5'),
(6, 'Sala 6');


INSERT INTO periodo VALUES
(1, '19:40'),
(2, '21:30'),
(3, '07:45'),
(4, '10:30');


INSERT INTO usuario VALUES
(3, 'teste', 'teste', '698dc19d489c4e4db73e28a713eab07b');


INSERT INTO reserva VALUES
(27, 1, 4, '2021-09-23', 'teste1', 'teste2', 1, 'teste3'),
(28, 1, 4, '2021-09-30', 'teste1', 'teste2', 3, 'teste3');


