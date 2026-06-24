ALTER TABLE pais 
ADD COLUMN participacoes INT DEFAULT 0,
ADD COLUMN melhor_colocacao INT,
ADD COLUMN titulos INT DEFAULT 0,
ADD COLUMN ano_primeira_participacao YEAR;

-- Adicionando colunas extras na tabela tecnico
ALTER TABLE tecnico 
ADD COLUMN nome_completo VARCHAR(150),
ADD COLUMN idade INT,
ADD COLUMN fk_selecao_atual INT,
ADD COLUMN ano_contratacao YEAR,
ADD COLUMN data_inicio_carreira DATE,
ADD COLUMN anos_experiencia INT,
ADD COLUMN titulos INT DEFAULT 0,
ADD COLUMN melhor_resultado_copa INT,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE selecao 
ADD COLUMN grupo_atual CHAR(1),
ADD COLUMN ano_copa YEAR,
ADD COLUMN status ENUM('classificada', 'eliminada', 'campeã', 'em_disputa') DEFAULT 'em_disputa',
ADD COLUMN jogos_disputados INT DEFAULT 0,
ADD COLUMN vitorias INT DEFAULT 0,
ADD COLUMN empates INT DEFAULT 0,
ADD COLUMN derrotas INT DEFAULT 0,
ADD COLUMN gols_marcados INT DEFAULT 0,
ADD COLUMN gols_sofridos INT DEFAULT 0,
ADD COLUMN saldo_gols INT AS (gols_marcados - gols_sofridos) STORED,
ADD COLUMN pontos INT DEFAULT 0,
ADD COLUMN fase_atual ENUM('grupos', 'oitavas', 'quartas', 'semi', 'final', 'campeã') DEFAULT 'grupos',
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE funcao 
ADD COLUMN descricao TEXT,
ADD COLUMN abreviacao VARCHAR(10),
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE jogador 
ADD COLUMN nome_completo VARCHAR(150),
ADD COLUMN data_nasc DATE,
ADD COLUMN idade INT,
ADD COLUMN altura DECIMAL(4,2),
ADD COLUMN peso DECIMAL(5,2),
ADD COLUMN numero_camisa INT,
ADD COLUMN jogos_copa INT DEFAULT 0,
ADD COLUMN gols_copa INT DEFAULT 0,
ADD COLUMN assistencias_copa INT DEFAULT 0,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE estadio 
ADD COLUMN cidade VARCHAR(100),
ADD COLUMN pais VARCHAR(100),
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE fase 
ADD COLUMN ordem INT,
ADD COLUMN descricao TEXT,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE partida 
ADD COLUMN rodada VARCHAR(50),
ADD COLUMN publico INT,
ADD COLUMN arbitro_principal INT,
ADD COLUMN status ENUM('agendada', 'em_andamento', 'finalizada', 'cancelada') DEFAULT 'agendada',
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE resultado_partida 
ADD COLUMN vencedor INT,                    -- ID da selecao vencedora
ADD COLUMN penaltis_selecao1 INT,
ADD COLUMN penaltis_selecao2 INT,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE arbitro 
ADD COLUMN idade INT,
ADD COLUMN experiencia_copa INT DEFAULT 0,
ADD COLUMN ativo BOOLEAN DEFAULT TRUE,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE arbitro_partida 
ADD COLUMN funcao ENUM('Principal', 'Assistente 1', 'Assistente 2', 'Quarto Arbitro') DEFAULT 'Principal',
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE gol_partida 
ADD COLUMN tipo_gol ENUM('Normal', 'Cabeçada', 'Pênalti', 'Falta', 'Contra') DEFAULT 'Normal',
ADD COLUMN assistencia INT,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE falta 
ADD COLUMN cartao ENUM('Amarelo', 'Vermelho', 'Segundo Amarelo') DEFAULT 'Amarelo',
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE penalti 
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE substituicao 
ADD COLUMN motivo VARCHAR(100),
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE torcedor 
ADD COLUMN nacionalidade VARCHAR(100),
ADD COLUMN email VARCHAR(150),
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE ingresso 
ADD COLUMN tipo ENUM('Normal', 'VIP', 'Cadeira', 'Geral') DEFAULT 'Normal',
ADD COLUMN status ENUM('vendido', 'reservado', 'cancelado') DEFAULT 'vendido',
ADD COLUMN data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN criado_em DATETIME DEFAULT CURRENT_TIMESTAMP;


