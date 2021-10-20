create database controleEscolar;

use controleEscolar;

create table disciplina(
	codDisciplina int auto_increment not null primary key,
	codProfessor int,
	descDisciplina varchar(50),
	cargaHoraria int,
	ativa boolean
);

desc disciplina;
desc aluno;
desc professor;
desc matricula ;
desc notas;

select * from aluno;
select * from professor p	 ;
select * from disciplina d ;
select * from matricula m ;


select codAluno, nomeAluno, cpfAluno, cpfAluno, dataNascimento, dataMatricula, nomePai, nomeMae, responsavel, foneResponsavel, matriculado from aluno where codAluno = 1;

create table aluno(
	codAluno int auto_increment not null primary key,
	nomeAluno varchar(50) not null,
	cpfAluno varchar(30),
	dataNascimento date,
	dataMatricula date,
	nomePai varchar(50),
	nomeMae varchar(50),
	responsavel varchar(50),
	foneResponsavel varchar(50),
	matriculado boolean
);

create table professor(
	codProfessor int auto_increment not null primary key,
	nomeProfessor varchar(50) not null,
	ativo boolean
);

create table matricula(
	codMatricula int auto_increment not null primary key,
	codAluno int not null,
	codDisciplina int not null,
	dataMatricula date
);

create table notas(
	codNota int auto_increment not null primary key,
	codAluno int not null,
	codDisciplina int not null,
	vlrNota float(5,2)
);

alter table disciplina add constraint fk_disciplina_professor foreign key (codProfessor) references professor(codProfessor);
alter table matricula add constraint fk_matricula_aluno foreign key (codAluno) references aluno(codAluno);
alter table matricula add constraint fk_matricula_disciplina foreign key (codDisciplina) references disciplina(codDisciplina);
alter table notas add constraint fk_notas_aluno foreign key (codAluno) references aluno(codAluno);
alter table notas add constraint fk_notas_disciplina foreign key (codDisciplina) references disciplina(codDisciplina);

update aluno set matriculado = true where codAluno = 1;

select * from aluno;

update aluno
set matriculado = true 
where codAluno = 1;

delete from matricula where codMatricula = 2;

select * from notas;
select * from matricula;

select codDisciplina , nomeProfessor, descDisciplina , cargaHoraria , ativa 
from disciplina d 
inner join professor p on d.codProfessor = p.codProfessor 
;

select AVG(vlrNota) from notas n where codAluno = 1;

