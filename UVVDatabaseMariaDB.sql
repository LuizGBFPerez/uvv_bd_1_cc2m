CREATE TABLE uvv.funcionario #Tabela que armazena as informações dos funcionários.
			 (
                cpf CHAR(11) PRIMARY KEY NOT NULL, #CPF do funcionário. É a PK da tabela.
                primeiro_nome VARCHAR(15) NOT NULL, #Primeiro nome do funcionário.
                nome_meio CHAR(1), #Inicial do nome do meio do funcionário, caso tenha.
                ultimo_nome VARCHAR(15) NOT NULL, #Sobrenome do funcionário.
                data_nascimento DATE, #Data de nascimento do funcionário.
                endereco VARCHAR(30), #Endereço do funcionário.
                sexo CHAR(1), #Sexo do funcionário.
                salario DECIMAL(10,2), #Salário do funcionário.
                cpf_supervisor CHAR(11) NOT NULL, #CPF do supervisor do funcionário. Serve como FK para a própria tabela.
                numero_departamento INTEGER NOT NULL, #Número do departamento do funcionário.
                CONSTRAINT funcionario_funcionario_fk
				FOREIGN KEY (cpf_supervisor)
				REFERENCES funcionario (cpf)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION 
			 );


CREATE TABLE uvv.departamento #Tabela que armazena as informações dos departamentos.
			 (
                numero_departamento INTEGER PRIMARY KEY NOT NULL, #Número do departamento. É a PK dessa tabela.
                nome_departamento VARCHAR(15) UNIQUE NOT NULL, #Nome do departamento. Dado propriedades únicas através da chave UNIQUE.
                cpf_gerente CHAR(11) NOT NULL, #CPF do gerente. É uma FK para a tabela funcionários.
                data_inicio_gerente DATE, #Data do início do gerente no departamento.
                CONSTRAINT funcionario_departamento_fk
                FOREIGN KEY (cpf_gerente)
				REFERENCES uvv.funcionario(cpf)
					ON UPDATE NO ACTION
					ON DELETE NO ACTION
			 );


CREATE TABLE uvv.projeto #Tabela que armazena as informações dos projetos dos departamentos.
			 (
                numero_projeto INTEGER PRIMARY KEY NOT NULL, #Número do projeto. É a PK da tabela.
                nome_projeto VARCHAR(15) UNIQUE NOT NULL, #Nome do projeto. Dado propriedades únicas através da chave UNIQUE.
                local_projeto VARCHAR(15), #Localização do projeto.
                numero_departamento INTEGER NOT NULL, #Número do departamento. Serve como FK para a tabela departamento.
                CONSTRAINT departamento_projeto_fk
				FOREIGN KEY (numero_departamento)
				REFERENCES uvv.departamento(numero_departamento)
					ON UPDATE NO ACTION
					ON DELETE NO ACTION
			 );


CREATE TABLE uvv.trabalha_em #Tabela para armazenar quais funcionários trabalham em quais projetos.
			 (
                cpf_funcionario CHAR(11) NOT NULL, #CPF do funcionário. Faz parte da PK dessa tabela, e serve como FK para a tabela funcionário.
                numero_projeto INTEGER NOT NULL, #Número do projeto. Parte da PK dessa tabela, e é uma FK para a tabela projeto.
                horas DECIMAL(3,1) NOT NULL, #Horas trabalhadas pelo funcionário neste projeto.
                PRIMARY KEY (cpf_funcionario, numero_projeto) #Expressão que determina as múltiplas PKs da tabela.
			 );
			

CREATE TABLE uvv.localizacoes_departamento #Tabela que armazena as possíveis localizações dos departamentos.
			 (
                numero_departamento INTEGER NOT NULL, #Número do departamento. Parte da PK dessa tabela, e serve de FK para a tabela departamento.
                localizacao VARCHAR(15) NOT NULL, #Localização do departamento. Parte da PK da tabela. Mudado do nome orignal 'local' para evitar confusões do código.
                PRIMARY KEY (numero_departamento, localizacao), #Expressão que determina as múltiplas PKs da tabela.
                CONSTRAINT departamento_localizacoes_departamento_fk
				FOREIGN KEY (numero_departamento)
				REFERENCES uvv.departamento(numero_departamento)
					ON UPDATE NO ACTION
					ON DELETE NO ACTION
			 );
			

CREATE TABLE uvv.dependente #Tabela que armazena as informações dos dependentes dos funcionários.
			 (
                cpf_funcionario CHAR(11) NOT NULL, #CPF do funcionário.Parte da PK da tabela, e também uma FK para a tabela funcionário
                nome_dependente VARCHAR(15) NOT NULL, #Nome do dependente. Parte da PK da tabela.
                sexo CHAR(1), #Sexo do dependente.
                data_nascimento DATE, #Data de nascimento do dependente.
                parentesco VARCHAR(15) NOT NULL, #Descrição do parentesco do dependente com o funcionário.
                PRIMARY KEY (cpf_funcionario, nome_dependente), #Expressão que determina as múltiplas PKs da tabela.
                CONSTRAINT funcionario_dependente_fk  
                FOREIGN KEY (cpf_funcionario)
				REFERENCES uvv.funcionario(cpf)
					ON UPDATE NO ACTION
					ON DELETE NO ACTION
			 );
			
			
ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto(numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario(cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
