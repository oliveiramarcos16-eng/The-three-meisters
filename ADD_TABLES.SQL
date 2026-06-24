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






















