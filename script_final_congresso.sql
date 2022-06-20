
CREATE TABLE projeto.uf (
                uf CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT uf_pk PRIMARY KEY (uf)
);
COMMENT ON TABLE projeto.uf IS 'Tabela que guarda os dados das unidades federativas dos endereços.';
COMMENT ON COLUMN projeto.uf.uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.uf.nome IS 'Nome das unidades federativas.';


CREATE TABLE projeto.cidades (
                codigo_cidade INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                uf CHAR(2) NOT NULL,
                CONSTRAINT codigo_cidade_pk PRIMARY KEY (codigo_cidade)
);
COMMENT ON TABLE projeto.cidades IS 'Tabela que guarda os dados das cidades dos endereços.';
COMMENT ON COLUMN projeto.cidades.codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.cidades.nome IS 'Nome das cidades.';
COMMENT ON COLUMN projeto.cidades.uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';


CREATE TABLE projeto.bairros (
                codigo_bairro INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                codigo_cidade INTEGER NOT NULL,
                CONSTRAINT codigo_bairro_pk PRIMARY KEY (codigo_bairro)
);
COMMENT ON TABLE projeto.bairros IS 'Tabela que contém os dados dos bairros dos endereços.';
COMMENT ON COLUMN projeto.bairros.codigo_bairro IS 'Codigo do bairro. PK da tabela, e FK das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.bairros.nome IS 'Nome do bairro.';
COMMENT ON COLUMN projeto.bairros.codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';


CREATE TABLE projeto.palestrantes (
                codigo_palestrante VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                end_logradouro VARCHAR(100) NOT NULL,
                end_complemento VARCHAR(100),
                end_numero SMALLINT NOT NULL,
                end_cep CHAR(8) NOT NULL,
                end_codigo_bairro INTEGER NOT NULL,
                end_codigo_cidade INTEGER NOT NULL,
                end_uf CHAR(2) NOT NULL,
                email VARCHAR(50) NOT NULL,
                curriculum VARCHAR(200) NOT NULL,
                CONSTRAINT codigo_palestrante_pk PRIMARY KEY (codigo_palestrante)
);
COMMENT ON TABLE projeto.palestrantes IS 'Tabela que contém os dados dos palestrantes.';
COMMENT ON COLUMN projeto.palestrantes.codigo_palestrante IS 'Código que identifica o palestrante. PK da tabela, e PFK da tabela telefones_palestrantes.';
COMMENT ON COLUMN projeto.palestrantes.nome IS 'Nome do palestrante.';
COMMENT ON COLUMN projeto.palestrantes.end_logradouro IS 'Logradouro do endereço.';
COMMENT ON COLUMN projeto.palestrantes.end_complemento IS 'Complemento do endereço.';
COMMENT ON COLUMN projeto.palestrantes.end_numero IS 'Número do endereço.';
COMMENT ON COLUMN projeto.palestrantes.end_cep IS 'CEP do endereço.';
COMMENT ON COLUMN projeto.palestrantes.end_codigo_bairro IS 'Codigo do bairro. PK da tabela, e FK das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.palestrantes.end_codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.palestrantes.end_uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.palestrantes.email IS 'E-mail dos palestrantes.';
COMMENT ON COLUMN projeto.palestrantes.curriculum IS 'Descrição do curriculum do palestrante.';


CREATE TABLE projeto.telefones_palestrantes (
                codigo_palestrante VARCHAR(15) NOT NULL,
                telefone_palestrante NUMERIC(11) NOT NULL,
                CONSTRAINT telefone_palestrante_1_pk PRIMARY KEY (codigo_palestrante, telefone_palestrante)
);
COMMENT ON TABLE projeto.telefones_palestrantes IS 'Tabela que contém os números de telefone dos palestrantes.';
COMMENT ON COLUMN projeto.telefones_palestrantes.codigo_palestrante IS 'Código que identifica o palestrante. PK da tabela.';
COMMENT ON COLUMN projeto.telefones_palestrantes.telefone_palestrante IS 'Telefone do palestrante. Parte da PK da tabela.';


CREATE TABLE projeto.programas (
                codigo_programas VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_programa_pk PRIMARY KEY (codigo_programas)
);
COMMENT ON TABLE projeto.programas IS 'Tabela que guarda as programações dos congressos.';
COMMENT ON COLUMN projeto.programas.codigo_programas IS 'Código que identifica a programação do congresso. PK da tabela.';
COMMENT ON COLUMN projeto.programas.nome IS 'Nome do programa.';


CREATE TABLE projeto.palestras (
                codigo_programas VARCHAR(15) NOT NULL,
                codigo_palestrante VARCHAR(15) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                classificacao BOOLEAN NOT NULL,
                CONSTRAINT codigo_programa_pfk PRIMARY KEY (codigo_programas, codigo_palestrante)
);
COMMENT ON TABLE projeto.palestras IS 'Tabela que serve de intermediária para a relação (n,n) entre palestrantes e programas.';
COMMENT ON COLUMN projeto.palestras.codigo_programas IS 'Código que identifica a programação do congresso. PK da tabela.';
COMMENT ON COLUMN projeto.palestras.codigo_palestrante IS 'Código que identifica o palestrante. PK da tabela, e PFK da tabela telefones_palestrantes.';
COMMENT ON COLUMN projeto.palestras.nome IS 'Nome da palestra.';
COMMENT ON COLUMN projeto.palestras.classificacao IS 'Classificação da palestra.';


CREATE TABLE projeto.materiais (
                codigo_programas VARCHAR(15) NOT NULL,
                codigo_palestrante VARCHAR(15) NOT NULL,
                material VARCHAR(50) NOT NULL,
                CONSTRAINT nome_pfk PRIMARY KEY (codigo_programas, codigo_palestrante, material)
);
COMMENT ON TABLE projeto.materiais IS 'Tabela que contém os materiais necessários para as palestras.';
COMMENT ON COLUMN projeto.materiais.codigo_programas IS 'Código que identifica a programação do congresso. PK da tabela.';
COMMENT ON COLUMN projeto.materiais.codigo_palestrante IS 'Código que identifica o palestrante. PK da tabela, e PFK da tabela telefones_palestrantes.';
COMMENT ON COLUMN projeto.materiais.material IS 'Material necessário para a palestra.';


CREATE TABLE projeto.informacoes_programas (
                codigo_programas VARCHAR(15) NOT NULL,
                data DATE NOT NULL,
                horario TIME NOT NULL,
                descricao VARCHAR(200) NOT NULL,
                CONSTRAINT codigo_programas_pfk PRIMARY KEY (codigo_programas)
);
COMMENT ON TABLE projeto.informacoes_programas IS 'Tabela que contém informações sobre os programas dos congressos.';
COMMENT ON COLUMN projeto.informacoes_programas.codigo_programas IS 'Código que identifica a programação do congresso. PK da tabela.';
COMMENT ON COLUMN projeto.informacoes_programas.data IS 'Data do programa.';
COMMENT ON COLUMN projeto.informacoes_programas.horario IS 'Horário programado.';
COMMENT ON COLUMN projeto.informacoes_programas.descricao IS 'Descrição do programa.';


CREATE TABLE projeto.organizadores (
                codigo_organizadores VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                atribuicao VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_organizador_pk PRIMARY KEY (codigo_organizadores)
);
COMMENT ON TABLE projeto.organizadores IS 'Tabela que guarda as informações dos organizadores dos congressos.';
COMMENT ON COLUMN projeto.organizadores.codigo_organizadores IS 'Código que identifica o organizador. PK da tabela.';
COMMENT ON COLUMN projeto.organizadores.nome IS 'Nome do organizador.';
COMMENT ON COLUMN projeto.organizadores.atribuicao IS 'Atribuição do organizador.';


CREATE TABLE projeto.telefones_organizadores (
                codigo_organizadores VARCHAR(15) NOT NULL,
                telefone_organizador NUMERIC(11) NOT NULL,
                CONSTRAINT telefones_organizadores_pk PRIMARY KEY (codigo_organizadores, telefone_organizador)
);
COMMENT ON TABLE projeto.telefones_organizadores IS 'Tabela que guarda os telefones de contato dos organizadores.';
COMMENT ON COLUMN projeto.telefones_organizadores.codigo_organizadores IS 'Código que identifica o organizador. PK da tabela.';
COMMENT ON COLUMN projeto.telefones_organizadores.telefone_organizador IS 'Telefone do organizador. Parte da PK da tabela.';


CREATE TABLE projeto.patrocinadores (
                codigo_patrocinador VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                ramo VARCHAR(50) NOT NULL,
                end_logradouro VARCHAR(100) NOT NULL,
                end_complemento VARCHAR(100),
                end_numero SMALLINT NOT NULL,
                end_cep CHAR(8) NOT NULL,
                end_codigo_bairro INTEGER NOT NULL,
                end_codigo_cidade INTEGER NOT NULL,
                end_uf CHAR(2) NOT NULL,
                CONSTRAINT codigo_patrocinador_pk PRIMARY KEY (codigo_patrocinador)
);
COMMENT ON TABLE projeto.patrocinadores IS 'Tabela que contém os dados dos patrocinadores dos congressos.';
COMMENT ON COLUMN projeto.patrocinadores.codigo_patrocinador IS 'Código que identifica o patrocinador. PK da tabela, e serve como PFK para a tabela telefones_patrocinadores.';
COMMENT ON COLUMN projeto.patrocinadores.nome IS 'Nome do patrocinador.';
COMMENT ON COLUMN projeto.patrocinadores.ramo IS 'Ramo de atividade do patrocinador.';
COMMENT ON COLUMN projeto.patrocinadores.end_logradouro IS 'Logradouro do endereço.';
COMMENT ON COLUMN projeto.patrocinadores.end_complemento IS 'Complemento do endereço.';
COMMENT ON COLUMN projeto.patrocinadores.end_numero IS 'Número do endereço.';
COMMENT ON COLUMN projeto.patrocinadores.end_cep IS 'CEP do endereço.';
COMMENT ON COLUMN projeto.patrocinadores.end_codigo_bairro IS 'Codigo do bairro. PK da tabela, e FK das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.patrocinadores.end_codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.patrocinadores.end_uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';


CREATE TABLE projeto.categorias (
                codigo_categoria VARCHAR(15) NOT NULL,
                nome VARCHAR(30) NOT NULL,
                valor NUMERIC(8,2) NOT NULL,
                CONSTRAINT codigo_categoria_pk PRIMARY KEY (codigo_categoria)
);
COMMENT ON TABLE projeto.categorias IS 'Tabela que contém as categorias que classificam os congressos.';
COMMENT ON COLUMN projeto.categorias.codigo_categoria IS 'Código que determina a categoria. PK da tabela.';
COMMENT ON COLUMN projeto.categorias.nome IS 'Nome da categoria.';
COMMENT ON COLUMN projeto.categorias.valor IS 'Valor pago para a categoria.';


CREATE TABLE projeto.visitantes (
                codigo_visitante VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                end_logradouro VARCHAR(100) NOT NULL,
                end_complemento VARCHAR(100) NOT NULL,
                end_numero SMALLINT NOT NULL,
                end_cep CHAR(8) NOT NULL,
                end_codigo_bairro INTEGER NOT NULL,
                end_codigo_cidade INTEGER NOT NULL,
                end_uf CHAR(2) NOT NULL,
                CONSTRAINT codigo_visitantes_pk PRIMARY KEY (codigo_visitante)
);
COMMENT ON TABLE projeto.visitantes IS 'Tabela que guarda os dados dos visitantes dos congressos.';
COMMENT ON COLUMN projeto.visitantes.codigo_visitante IS 'Código que identifica o visitante. PK da tabela, e PFK da tabela telefones_visitantes.';
COMMENT ON COLUMN projeto.visitantes.nome IS 'Nome do visitante.';
COMMENT ON COLUMN projeto.visitantes.email IS 'E-mail do visitante.';
COMMENT ON COLUMN projeto.visitantes.end_logradouro IS 'Logradouro do endereço.';
COMMENT ON COLUMN projeto.visitantes.end_complemento IS 'Complemento do endereço.';
COMMENT ON COLUMN projeto.visitantes.end_numero IS 'Número do endereço.';
COMMENT ON COLUMN projeto.visitantes.end_cep IS 'CEP do endereço.';
COMMENT ON COLUMN projeto.visitantes.end_codigo_bairro IS 'Codigo do bairro. PK da tabela, e FK das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.visitantes.end_codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.visitantes.end_uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';


CREATE TABLE projeto.telefones_visitantes (
                codigo_visitante VARCHAR(15) NOT NULL,
                telefone_visitante NUMERIC(11) NOT NULL,
                CONSTRAINT telefone_visitante_1_pk PRIMARY KEY (codigo_visitante, telefone_visitante)
);
COMMENT ON TABLE projeto.telefones_visitantes IS 'Tabela que contém os números de telefones dos visitantes.';
COMMENT ON COLUMN projeto.telefones_visitantes.codigo_visitante IS 'Código que identifica o visitante. PK da tabela, e PFK da tabela telefones_visitantes.';
COMMENT ON COLUMN projeto.telefones_visitantes.telefone_visitante IS 'Telefone do visitante. Parte da PK da tabela.';


CREATE TABLE projeto.locais (
                codigo_local VARCHAR(15) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                end_logradouro VARCHAR(100) NOT NULL,
                end_complemento VARCHAR(100),
                end_numero SMALLINT NOT NULL,
                end_cep CHAR(8) NOT NULL,
                end_codigo_bairro INTEGER NOT NULL,
                end_codigo_cidade INTEGER NOT NULL,
                end_uf CHAR(2) NOT NULL,
                tamanho VARCHAR NOT NULL,
                pessoa_de_contato VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_local_pk PRIMARY KEY (codigo_local)
);
COMMENT ON TABLE projeto.locais IS 'Tabela que guarda as informações dos locais que hospedam os congressos.';
COMMENT ON COLUMN projeto.locais.codigo_local IS 'Código que identifica o local agendado para os congressos. PK da tabela, e PFK da tabela telefones_locais.';
COMMENT ON COLUMN projeto.locais.nome IS 'Nome do local.';
COMMENT ON COLUMN projeto.locais.end_logradouro IS 'Logradouro do endereço.';
COMMENT ON COLUMN projeto.locais.end_complemento IS 'Complemento do endereço.';
COMMENT ON COLUMN projeto.locais.end_numero IS 'Número do endereço.';
COMMENT ON COLUMN projeto.locais.end_cep IS 'CEP do endereço.';
COMMENT ON COLUMN projeto.locais.end_codigo_bairro IS 'Codigo do bairro. PK da tabela, e FK das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.locais.end_codigo_cidade IS 'Codigo da cidade. PK da tabela, e FK da tabela bairros e das tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.locais.end_uf IS 'Sigla da unidade federativa dos endereços. PK da tabela, e FK para a tabela cidades, e para as tabelas que requerem endereços.';
COMMENT ON COLUMN projeto.locais.tamanho IS 'Tamanho do espaço que vai sediar o congresso.';
COMMENT ON COLUMN projeto.locais.pessoa_de_contato IS 'Nome da pessoa responsável pelo local.';


CREATE TABLE projeto.congressos (
                codigo_congresso VARCHAR(15) NOT NULL,
                nome VARCHAR(30) NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                horario_inicio TIME NOT NULL,
                horario_fim TIME NOT NULL,
                publico_alvo VARCHAR(100) NOT NULL,
                codigo_programas VARCHAR(15) NOT NULL,
                codigo_visitante VARCHAR(15) NOT NULL,
                codigo_organizadores VARCHAR(15) NOT NULL,
                descricao VARCHAR(100) NOT NULL,
                codigo_categoria VARCHAR(15) NOT NULL,
                codigo_local VARCHAR(15) NOT NULL,
                CONSTRAINT codigo_congressos_pk PRIMARY KEY (codigo_congresso)
);
COMMENT ON TABLE projeto.congressos IS 'Tabela que contém os dados referentes aos congressos em si.';
COMMENT ON COLUMN projeto.congressos.codigo_congresso IS 'Codigo que categoriza o congresso. PK da tabela.';
COMMENT ON COLUMN projeto.congressos.nome IS 'Nome do congresso.';
COMMENT ON COLUMN projeto.congressos.data_inicio IS 'Data de início do congresso.';
COMMENT ON COLUMN projeto.congressos.data_fim IS 'Data de término do congresso.';
COMMENT ON COLUMN projeto.congressos.horario_inicio IS 'Horário de início do congresso.';
COMMENT ON COLUMN projeto.congressos.horario_fim IS 'Horário de término do congresso.';
COMMENT ON COLUMN projeto.congressos.publico_alvo IS 'Descrição do público-alvo do congresso.';
COMMENT ON COLUMN projeto.congressos.codigo_programas IS 'Código que identifica a programação do congresso. PK da tabela.';
COMMENT ON COLUMN projeto.congressos.codigo_visitante IS 'Código que identifica o visitante. PK da tabela, e PFK da tabela telefones_visitantes.';
COMMENT ON COLUMN projeto.congressos.codigo_organizadores IS 'Código que identifica o organizador. PK da tabela.';
COMMENT ON COLUMN projeto.congressos.descricao IS 'Descrição sobre o congresso.';
COMMENT ON COLUMN projeto.congressos.codigo_categoria IS 'Código que determina a categoria. PK da tabela.';
COMMENT ON COLUMN projeto.congressos.codigo_local IS 'Código que identifica o local agendado para os congressos. PK da tabela, e PFK da tabela telefones_locais.';


CREATE TABLE projeto.patrocinio (
                codigo_patrocinador VARCHAR(15) NOT NULL,
                codigo_congresso VARCHAR(15) NOT NULL,
                valor NUMERIC(8,2) NOT NULL,
                forma_de_pagamento VARCHAR(20) NOT NULL,
                CONSTRAINT codigo_patrocinador_pfk PRIMARY KEY (codigo_patrocinador, codigo_congresso)
);
COMMENT ON TABLE projeto.patrocinio IS 'Tabela que serve de intermediária para a relação (n,n) entre patrocinadores e congressos.';
COMMENT ON COLUMN projeto.patrocinio.codigo_patrocinador IS 'Código que identifica o patrocinador. PK da tabela, e serve como PFK para a tabela telefones_patrocinadores.';
COMMENT ON COLUMN projeto.patrocinio.codigo_congresso IS 'Codigo que categoriza o congresso. PK da tabela.';
COMMENT ON COLUMN projeto.patrocinio.valor IS 'Valor do patrocínio pago pelo patrocinador ao congresso.';
COMMENT ON COLUMN projeto.patrocinio.forma_de_pagamento IS 'Forma de pagamento.';


CREATE TABLE projeto.telefones_locais (
                codigo_local VARCHAR(15) NOT NULL,
                telefone_local NUMERIC(11) NOT NULL,
                CONSTRAINT telefone_local_1_pk PRIMARY KEY (codigo_local, telefone_local)
);
COMMENT ON TABLE projeto.telefones_locais IS 'Tabela que guarda todos os possíveis telefones dos locais.';
COMMENT ON COLUMN projeto.telefones_locais.codigo_local IS 'Código que identifica o local agendado para os congressos. PK da tabela.';
COMMENT ON COLUMN projeto.telefones_locais.telefone_local IS 'Telefone do local. Parte da PK da tabela.';


ALTER TABLE projeto.cidades ADD CONSTRAINT uf_cidades_fk
FOREIGN KEY (uf)
REFERENCES projeto.uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.locais ADD CONSTRAINT uf_locais_fk
FOREIGN KEY (end_uf)
REFERENCES projeto.uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.visitantes ADD CONSTRAINT uf_visitantes_fk
FOREIGN KEY (end_uf)
REFERENCES projeto.uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.patrocinadores ADD CONSTRAINT uf_patrocinadores_fk
FOREIGN KEY (end_uf)
REFERENCES projeto.uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.palestrantes ADD CONSTRAINT uf_palestrantes_fk
FOREIGN KEY (end_uf)
REFERENCES projeto.uf (uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.bairros ADD CONSTRAINT cidades_bairros_fk
FOREIGN KEY (codigo_cidade)
REFERENCES projeto.cidades (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.locais ADD CONSTRAINT cidades_locais_fk
FOREIGN KEY (end_codigo_cidade)
REFERENCES projeto.cidades (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.visitantes ADD CONSTRAINT cidades_visitantes_fk
FOREIGN KEY (end_codigo_cidade)
REFERENCES projeto.cidades (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.patrocinadores ADD CONSTRAINT cidades_patrocinadores_fk
FOREIGN KEY (end_codigo_cidade)
REFERENCES projeto.cidades (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.palestrantes ADD CONSTRAINT cidades_palestrantes_fk
FOREIGN KEY (end_codigo_cidade)
REFERENCES projeto.cidades (codigo_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.locais ADD CONSTRAINT bairros_locais_fk
FOREIGN KEY (end_codigo_bairro)
REFERENCES projeto.bairros (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.visitantes ADD CONSTRAINT bairros_visitantes_fk
FOREIGN KEY (end_codigo_bairro)
REFERENCES projeto.bairros (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.patrocinadores ADD CONSTRAINT bairros_patrocinadores_fk
FOREIGN KEY (end_codigo_bairro)
REFERENCES projeto.bairros (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.palestrantes ADD CONSTRAINT bairros_palestrantes_fk
FOREIGN KEY (end_codigo_bairro)
REFERENCES projeto.bairros (codigo_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.telefones_palestrantes ADD CONSTRAINT palestrantes_telefones_palestrantes_fk
FOREIGN KEY (codigo_palestrante)
REFERENCES projeto.palestrantes (codigo_palestrante)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.palestras ADD CONSTRAINT palestrantes_palestras_fk
FOREIGN KEY (codigo_palestrante)
REFERENCES projeto.palestrantes (codigo_palestrante)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.informacoes_programas ADD CONSTRAINT programas_informacoes_programas_fk
FOREIGN KEY (codigo_programas)
REFERENCES projeto.programas (codigo_programas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.palestras ADD CONSTRAINT programas_palestras_fk
FOREIGN KEY (codigo_programas)
REFERENCES projeto.programas (codigo_programas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.congressos ADD CONSTRAINT programas_congressos_fk
FOREIGN KEY (codigo_programas)
REFERENCES projeto.programas (codigo_programas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.materiais ADD CONSTRAINT palestras_materiais_fk
FOREIGN KEY (codigo_palestrante, codigo_programas)
REFERENCES projeto.palestras (codigo_palestrante, codigo_programas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.telefones_organizadores ADD CONSTRAINT organizadores_telefones_organizadores_fk
FOREIGN KEY (codigo_organizadores)
REFERENCES projeto.organizadores (codigo_organizadores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.congressos ADD CONSTRAINT organizadores_congressos_fk
FOREIGN KEY (codigo_organizadores)
REFERENCES projeto.organizadores (codigo_organizadores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.patrocinio ADD CONSTRAINT patrocinadores_patrocinio_fk
FOREIGN KEY (codigo_patrocinador)
REFERENCES projeto.patrocinadores (codigo_patrocinador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.congressos ADD CONSTRAINT categorias_congressos_fk
FOREIGN KEY (codigo_categoria)
REFERENCES projeto.categorias (codigo_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.telefones_visitantes ADD CONSTRAINT visitantes_telefones_visitantes_fk
FOREIGN KEY (codigo_visitante)
REFERENCES projeto.visitantes (codigo_visitante)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.congressos ADD CONSTRAINT visitantes_congressos_fk
FOREIGN KEY (codigo_visitante)
REFERENCES projeto.visitantes (codigo_visitante)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.telefones_locais ADD CONSTRAINT locais_telefones_locais_fk
FOREIGN KEY (codigo_local)
REFERENCES projeto.locais (codigo_local)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.congressos ADD CONSTRAINT locais_congressos_fk
FOREIGN KEY (codigo_local)
REFERENCES projeto.locais (codigo_local)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto.patrocinio ADD CONSTRAINT congressos_patrocinio_fk
FOREIGN KEY (codigo_congresso)
REFERENCES projeto.congressos (codigo_congresso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
