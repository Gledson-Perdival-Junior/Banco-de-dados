CREATE TABLE AUTOMOVEL(
    placa CHAR(7) PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano CHAR(4) NOT NULL
);

CREATE TABLE SEGURADO(
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE PERITO(
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE OFICINA(

);

CREATE TABLE SEGURO(
    segurado_cpf CHAR(11) NOT NULL,
    automovel_placa CHAR(7) NOT NULL,
    PRIMARY KEY (segurado_cpf, automovel_placa),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
);

CREATE TABLE SINISTRO(
    id INT PRIMARY KEY AUTO_INCREMENT,
    segurado_cpf CHAR(11) NOT NULL,
    automovel_placa CHAR(7) NOT NULL,
    data_ocorrencia DATE NOT NULL,
    descricao TEXT NOT NULL,
);

CREATE TABLE PERICIA(
    
);

CREATE TABLE REPARO(

);