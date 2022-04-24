SELECT cpf, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento
FROM elmasri.funcionario;

insert into elmasri.funcionario values
		(12345678966, 'João', 'B', 'Silva', '1965-01-09', 'RuadasFlores,751,SãoPaulo,SP', 'M', 30000, 33344555587, 5),
		(33344555587, 'Fernando', 'T', 'Wong', '1955-12-08', 'RuadaLapa,34,SãoPaulo,SP', 'M', 40000, 88866555576, 5),
		(99988777767, 'Alice', 'J', 'Zelaya', '1968-01-19', 'RuaSouzaLima,35,Curitiba,PR', 'F', 25000, 98765432168, 4),
		(98765432168, 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av.Art.Lima,54,St.André,SP', 'F', 43000, 88866555576, 4),
		(66688444476, 'Ronaldo', 'K', 'Lima', '1962-09-05', 'RuaRebouças,65,Piracicaba,SP', 'M', 38000, 33344555587, 5),
		(45345345376, 'Joice', 'A', 'Leite', '1972-07-31', 'Av.LucasObes,74,São Paulo,SP', 'F', 25000, 33344555587, 5),
		(98798798733, 'André', 'V', 'Pereira', '1969-03-29', 'RuaTimbeira,35,São Paulo,SP', 'M', 25000, 98765432168, 4);
insert into elmasri.funcionario values (cpf, primeiro_nome, nome_meio, ultimo_nome, data_nascimento, endereco, sexo, salario, numero_departamento)
		(88866555576, 'Jorge', 'E', 'Brito', '1937-11-10', 'RuadoHorto,35,São Paulo,SP', 'M', 55000, 1);
		

SELECT numero_departamento, nome_departamento, cpf_gerente, data_inicio_gerente
FROM elmasri.departamento;	
	
insert into elmasri.departamento values
		(5, 'Pesquisa', 33344555587, '1988-05-22'),
		(4, 'Administração', 98765432168, '1995-01-01'),
		(1, 'Matriz', 88866555576, '1981-06-19');
		

SELECT numero_departamento, "local"
FROM elmasri.localizacoes_departamento;
	
insert into elmasri.localizacoes_departamento values 
		(1, 'São Paulo'),
		(4, 'Mauá'),
		(5, 'Santo André'),
		(5, 'Itu'),
		(5, 'São Paulo');
	

SELECT numero_projeto, nome_projeto, local_projeto, numero_departamento
FROM elmasri.projeto;

insert into elmasri.projeto values
		(1, 'ProdutoX', 'Santo André', 5),
		(2, 'ProdutoY', 'Itu', 5),
		(3, 'ProdutoZ', 'São Paulo', 5),
		(10, 'Informatização', 'Mauá', 4),
		(20, 'Reorganização', 'São Paulo', 1),
		(30, 'Novosbenefícios', 'Mauá', 4);


SELECT cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco
FROM elmasri.dependente;

insert into elmasri.dependente values
		(33344555587, 'Alice', 'F', '1986-04-05', 'Filha'),
		(33344555587, 'Tiago', 'M', '1983-10-25', 'Filho'),
		(33344555587, 'Janaína', 'F', '1958-05-03', 'Esposa'),
		(98765432168, 'Antônio', 'M', '1942-02-28', 'Marido'),
		(12345678966, 'Michael', 'M', '1988-01-04', 'Filho'),
		(12345678966, 'Alícia', 'F', '1988-12-30', 'Filha'),
		(12345678966, 'Elizabeth', 'F', '1967-05-05', 'Esposa');


select cpf_funcionario, numero_projeto, horas
from elmasri.trabalha_em;

insert into elmasri.trabalha_em values
		(12345678966, 1, 32.5),
		(12345678966, 2, 7.5),
		(66688444476, 3, 40),
		(45345345376, 1, 20),
		(45345345376, 2, 20),
		(33344555587, 2, 10),
		(33344555587, 3, 10),
		(33344555587, 10, 10),
		(33344555587, 20, 10),
		(99988777767, 30, 30),
		(99988777767, 10, 10),
		(98798798733, 10, 35),
		(98798798733, 30, 5),
		(98765432168, 30, 20),
		(98765432168, 20, 15),
		(88866555576, 20, null);