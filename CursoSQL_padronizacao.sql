DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco;

USE aula_banco;

DROP TABLE IF EXISTS estado;

/** TABELA ESTADO **/
CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
/** REGRAS DA TABELA **/
,CHECK (ativo IN ('S','N'))
,CONSTRAINT pk_estado_id PRIMARY KEY (id)
,CONSTRAINT regra_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
);

/** EXEMPLO TABELA SEM REGRAS **/
-- INSERT INTO estado(id,nome,sigla,ativo,data_cadastro) VALUES(1,'PARANÁ','PR','S','2020-12-15');
-- INSERT INTO estado(id,nome,sigla,ativo,data_cadastro) VALUES(2,'PARANÁ','PR','S','2020-12-15');
-- INSERT INTO estado(id,nome,sigla,ativo,data_cadastro) VALUES(3,'AMAZONAS','AM','S','2020-12-15');

/** EXEMPLO TABELA COM REGRAS **/
INSERT INTO estado(nome,sigla) VALUES('PARANÁ','PR');
INSERT INTO estado(nome,sigla) VALUES('SÃO PAULO','SP');
INSERT INTO estado(nome,sigla) VALUES('AMAZONAS','AM');

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;

/** TABELA CIDADE **/
CREATE TABLE cidade(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
/** REGRAS DA TABELA **/
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT somente_valor_S_ou_N CHECK (ativo IN('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA', 1);
INSERT INTO cidade (nome,estado_id) VALUES ('SOROCABA', 2);
INSERT INTO cidade (nome,estado_id) VALUES ('MANAUS', 3);

SELECT * FROM cidade;