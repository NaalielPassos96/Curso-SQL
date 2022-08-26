/** Comentário **/
-- Comentário
DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco;

USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE -- CONSTRAINT INLINE: regras na mesma linha
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S' -- Linha de Definição
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK (ativo IN ('S','N')) -- CONSTRAINT OUT OF LINE: regras definida fora da Linha de Definição SEM NOME
-- ,CONSTRAINT pk_estado_id PRIMARY KEY (id)
,CONSTRAINT regra_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N')) -- CONSTRAINT OUT OF LINE: regras definida fora da Linha de Definição COM NOME
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


