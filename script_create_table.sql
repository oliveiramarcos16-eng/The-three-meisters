USE copa_do_mundo_of;

CREATE TABLE pais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    sigla CHAR(3) NOT NULL UNIQUE,
    continente VARCHAR(50) NOT NULL
);

CREATE TABLE tecnico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE,
    nacionalidade VARCHAR(100),
    fk_pais INT NOT NULL,
    FOREIGN KEY (fk_pais) REFERENCES pais(id)
);

CREATE TABLE selecao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    sigla CHAR(3) NOT NULL UNIQUE,
    ranking_fifa INT,
    fk_pais INT NOT NULL,
    fk_tecnico INT,
    FOREIGN KEY (fk_pais) REFERENCES pais(id),
    FOREIGN KEY (fk_tecnico) REFERENCES tecnico(id)
);

CREATE TABLE funcao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE jogador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fk_funcao INT NOT NULL,
    fk_selecao INT NOT NULL,
    FOREIGN KEY (fk_funcao) REFERENCES funcao(id),
    FOREIGN KEY (fk_selecao) REFERENCES selecao(id)
);

CREATE TABLE estadio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(150) NOT NULL,
    capacidade INT NOT NULL
);

CREATE TABLE fase (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    fk_estadio INT NOT NULL,
    fk_fase INT NOT NULL,
    FOREIGN KEY (fk_estadio) REFERENCES estadio(id),
    FOREIGN KEY (fk_fase) REFERENCES fase(id)
);

CREATE TABLE selecao_partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_selecao INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_selecao) REFERENCES selecao(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE resultado_partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gols_selecao1 INT DEFAULT 0,
    gols_selecao2 INT DEFAULT 0,
    fk_partida INT NOT NULL UNIQUE,
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE arbitro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100)
);

CREATE TABLE arbitro_partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_arbitro INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_arbitro) REFERENCES arbitro(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE gol_partida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    minuto INT NOT NULL,
    fk_jogador INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_jogador) REFERENCES jogador(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE falta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    minuto INT NOT NULL,
    descricao VARCHAR(255),
    fk_jogador INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_jogador) REFERENCES jogador(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE penalti (
    id INT PRIMARY KEY AUTO_INCREMENT,
    minuto INT NOT NULL,
    convertido BOOLEAN NOT NULL,
    fk_jogador INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_jogador) REFERENCES jogador(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE substituicao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    minuto INT NOT NULL,
    fk_jogador_sai INT NOT NULL,
    fk_jogador_entra INT NOT NULL,
    fk_partida INT NOT NULL,
    FOREIGN KEY (fk_jogador_sai) REFERENCES jogador(id),
    FOREIGN KEY (fk_jogador_entra) REFERENCES jogador(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);

CREATE TABLE torcedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    identificador_pessoal VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE ingresso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_torcedor INT NOT NULL,
    fk_partida INT NOT NULL,
    setor VARCHAR(50),
    valor DECIMAL(10,2),
    FOREIGN KEY (fk_torcedor) REFERENCES torcedor(id),
    FOREIGN KEY (fk_partida) REFERENCES partida(id)
);
