CREATE TABLE farmacia(
    id INT PRIMARY KEY AUTO_INCREMENT,
    gerente VARCHAR(100) NOT NULL UNIQUE FOREIGN KEY (gerente) REFERENCES funcionarios(CPF) CHECK (gerente IN (SELECT CPF FROM funcionarios WHERE cargo = 'Administrador')),
    filial VARCHAR(50),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE funcionarios(
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL CHECK (cargo IN ('Farmacêutico', 'Vendedor', 'Entregador', 'Caixa', 'Administrador')),
    farmacia_id INT UNIQUE,
    FOREIGN KEY (farmacia_id) REFERENCES farmacia(id)
);

CREATE TABLE medicamentos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE vendas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_CPF CHAR(11) NOT NULL,
    medicamento_id INT NOT NULL,
    quantidade INT NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (funcionario_CPF) REFERENCES funcionarios(CPF),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id)
);

CREATE TABLE entregas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_CPF CHAR(11) NOT NULL,
    medicamento_id INT NOT NULL,
    endereco_entrega VARCHAR(200) NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (funcionario_CPF) REFERENCES funcionarios(CPF),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id)
);

CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULl
);