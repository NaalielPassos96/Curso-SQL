CREATE TABLE estado(
);
id  INT PRIMARY KEY
,nome VARCHAR (200) NOT NULL UNIQUE      -- CONSTRAINT INLINE
,sigla CHAR (2)NOT NULL UNIQUE 
,ativo CHAR (1)NOT NULL DEFAULT
data_cadastro DATETIME NOT NULL DEFAULT CuRRENT
-- ,CHECK (ativo IN ('S','N')  )  -- CONSTRAINT OUT OF LINE - regra sem nome 
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N') ) -- CONTRAINT OUT OF LINE -- regra com nome

);
