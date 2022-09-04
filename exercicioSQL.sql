/**
01 - O que é JOIN? Quando é necessário?
R: A propriedade JOIN se refere a forma de como lidar com os dados, buscando o relacionamento
entre duas tabela sobre um determinado contexto de condição. É necessário na filtração
de dados, selecionar partes do que se deseja ver e analisar.

02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique.
R: SELECT * FROM tabela_1 INNER JOIN tabela_2;
Não faz diferença utilizar a propriedade Maiúscula ou Minúscula. No entanto, para uma boa prática
sobre o script é necessário que se utilize um padrão, por exemplo, propriedades SQL em Maiúsculas
e variáveis que especificam uma tabela ou coluna em Minúsculo.

04 - O que é primordial para que o resultado tenha sentido em consultas com JOIN? Explique.
R: Algo que é primordial para a consulta com JOIN é que, para uma comparação que faça sentido
é essencial que se faça uma condição para filtrar os dados desejados.

05 - Existe mais de uma maneira de realizar o JOIN? Quantas? Qual é a mais eficiente?
R: Existem dois padrões que são aceitos ao utilizar JOIN, o padrão SQL 89, e o padrão SQL 92. As duas maneiras
são eficientes.
--> PADRÃO SQL 89:
	SELECT * FROM tabela_1, tabela_2;
--> PADRÃO SQL 92:
	SELECT * FROM tabela_1 INNER JOIN tabela_2;
--------------------------------------------------------------------------------------------------------------------------------------
obs: Para cada questão utilize o padrão SQL89 e SQL92
01 - Liste o id e o nome de todas as cidades e as respectivas siglas do estado.
02 - Em relação ao resultado do exercício anterior,note que os nomes das colunas não estão claras. Refaça o comando para que torne mais claras.
03 - Refaça o exercício anterior atribuindo o nome completo da tabela em todos os atributos.
04 - Refaça o exercício anterior definindo o apelido na tabela.
*/
DROP DATABASE IF EXISTS curso_bd;
CREATE DATABASE curso_bd;
USE curso_bd;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200)
,sigla CHAR(2)
,ativo CHAR(1) DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT ativo_deve_ser_S_ou_N CHECK (ativo IN('S','N'))
);

CREATE TABLE cidade(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado(id)
,CONSTRAINT cidade_unica UNIQUE (nome,estado_id)
,CONSTRAINT ativo_valor_deve_ser_S_ou_N CHECK (ativo IN('S','N'))
);

INSERT INTO estado(nome,sigla) VALUES ('PARANA','PR');
INSERT INTO estado(nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado(nome,sigla) VALUES ('SANTA CATARINA','SC');

INSERT INTO cidade(nome,estado_id) VALUES ('PARANAVAI',1),('MARINGA',1),('CURITIBA',1);

INSERT INTO cidade(nome,estado_id) VALUES ('GUARULHOS',2),('SOROCABA',2),('CAMPINAS',2);

INSERT INTO cidade(nome,estado_id) VALUES ('FLORIANOPOLIS',3),('BALNEARIO CAMBORIU',3),('BLUMENAU',3);

-- Padrão SQL 89
-- SELECT * FROM estado, cidade WHERE cidade.estado_id = estado.id;

SELECT
	estado.id AS 'ID ESTADO'
    ,estado.nome AS 'NOME ESTADO'
    ,estado.sigla AS 'SIGLA ESTADO'
    ,estado.ativo AS 'ESTÁ ATIVO?'
    ,cidade.id AS 'ID CIDADE'
    ,cidade.nome AS 'NOME CIDADE'
    ,cidade.ativo AS 'ESTÁ ATIVO?'
    ,cidade.data_cadastro AS 'DATA CADASTRO CIDADE'
    ,cidade.estado_id 'ID DO ESTADO PERTENCENTE'
FROM
	estado AS estado, cidade AS cidade
WHERE cidade.estado_id = estado.id;

/*
-- Padrão SQL 92
SELECT 
	estado.id AS 'ID ESTADO'
    ,estado.nome AS 'NOME ESTADO'
    ,estado.sigla AS 'SIGLA ESTADO'
    ,estado.ativo AS 'ESTÁ ATIVO?'
    ,cidade.id AS 'ID CIDADE'
    ,cidade.nome AS 'NOME CIDADE'
    ,cidade.ativo AS 'ESTÁ ATIVO?'
    ,cidade.data_cadastro AS 'DATA CADASTRO CIDADE'
    ,cidade.estado_id 'ID DO ESTADO PERTENCENTE'
FROM estado JOIN cidade ON cidade.estado_id = estado.id;
*/