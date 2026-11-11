CREATE DATABASE EMPRESA;
USE EMPRESA;
 
CREATE TABLE Tb_Cidade (
    pk_id_cid INT PRIMARY KEY,
    nome_cid  VARCHAR(30) NOT NULL,
    uf_cid    VARCHAR(2) UNIQUE NOT NULL
);
 
CREATE TABLE Tb_Funcao (
    pk_id_funcao INT IDENTITY PRIMARY KEY,
    nome_funcao   VARCHAR(20) UNIQUE NOT NULL
);
 
CREATE TABLE Tb_Local (
    pk_id_loc INT IDENTITY PRIMARY KEY,
    nome_loc  VARCHAR(20) UNIQUE NOT NULL
);
 
CREATE TABLE Tb_Depto (
    pk_id_depto INT IDENTITY PRIMARY KEY,
    nome_depto VARCHAR(20) UNIQUE NOT NULL,
    fk_id_loc_depto  INT NOT NULL
    FOREIGN KEY (fk_id_loc_depto) REFERENCES Tb_Local(pk_id_loc)
);
 
CREATE TABLE Tb_Funcionario (
    pk_id_func         INT IDENTITY,
    fk_id_funcao_func  INT NOT NULL,
    fk_id_cid          INT NOT NULL,
    fk_id_depto        INT NOT NULL,
    cpf_func           NUMERIC(11) UNIQUE NOT NULL,
    dt_admissao_func   DATE NOT NULL,
    salario_func       NUMERIC(7,2) NOT NULL,
    nome_func          VARCHAR(40) NOT NULL,
    FOREIGN KEY (fk_id_funcao_func) REFERENCES Tb_Funcao(pk_id_funcao),
    FOREIGN KEY (fk_id_cid) REFERENCES Tb_Cidade(pk_id_cid),
    FOREIGN KEY (fk_id_depto) REFERENCES Tb_Depto(pk_id_depto)
);
