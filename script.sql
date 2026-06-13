create database banco_suicidio;
use banco_suicidio;
drop database banco_suicidio;

create table suicidios(
	id int not null auto_increment primary key,
    ano int not null,
    idade int not null,
    sexo varchar(20),
    estado_id int,
    estado_civil_id int,
    escolaridade_id int,
    causa_id int,
    
    foreign key (estado_id) references estados(estado_id),
    foreign key (estado_civil_id) references estado_civil(estado_civil_id),
    foreign key (escolaridade_id) references escolaridade(escolaridade_id),
    foreign key (causa_id) references causas(causa_id)
);

create table estados(
	estado_id int not null auto_increment primary key,
    sigla_estado char(2)
);

create table estado_civil(
	estado_civil_id int not null auto_increment primary key,
    estciv varchar(100)
);

create table escolaridade(
	escolaridade_id int not null auto_increment primary key,
    esc varchar(100)
);

create table causas(
	causa_id int not null auto_increment primary key,
    causabas char(4),
    causabas_o char(4)
);

###Views###
#1
create view um as
select suicidios.idade,suicidios.ano,suicidios.sexo,estados.sigla_estado 
from suicidios join estados on suicidios.estado_id = estados.estado_id;

#2
create view dois as
select e.sigla_estado, count(*) as total
from suicidios s join estados e on s.estado_id = e.estado_id
group by e.sigla_estado;

#3
create view tres as
select e.sigla_estado, count(*)
from suicidios s join estados e on s.estado_id = e.estado_id
group by e.sigla_estado
limit 10;

#4
create view quatro as
select e.esc, count(*) as total
from suicidios s join escolaridade e on s.escolaridade_id = e.escolaridade_id
group by e.esc;

#5
create view cinco as
select e.estciv, count(*) as total
from suicidios s join estado_civil e on s.estado_civil_id = e.estado_civil_id
group by e.estciv;

#6
create view seis as
select s.idade, avg(idade) as media
from suicidios s join estados e on s.estado_id = e.estado_id
group by s.idade;

#7
create view sete as
select e.sigla_estado, ec.estciv, esc.esc, c.causabas, s.id, count(*) as total
from suicidios s join estados e on s.estado_id = e.estado_id
join estado_civil ec on s.estado_civil_id = ec.estado_civil_id
join escolaridade esc on s.escolaridade_id = esc.escolaridade_id
join causas c on s.causa_id = c.causa_id
group by e.sigla_estado, ec.estciv, esc.esc, c.causabas, s.id;




select * from um;
select * from dois;
select * from tres;
select * from quatro;
select * from cinco;
select * from seis;
select * from sete;









-- ==============================================
-- INSERTS: banco_suicidio
-- ==============================================
 
insert into estados (estado_id, sigla_estado) values
  (1, 'AC'),
  (2, 'AL'),
  (3, 'MS'),
  (4, 'MT'),
  (5, 'BH'),
  (6, 'DF'),
  (7, 'SP'),
  (8, 'RJ'),
  (9, 'RS'),
  (10, 'AM'),
  (11, 'RO');
  
 
insert into estado_civil (estado_civil_id, estciv) values
  (1, 'Casado/a'),
  (2, 'Solteiro/a'),
  (3, 'Viúvo/a');
 
insert into escolaridade (escolaridade_id, esc) values
  (1, '1 a 3 anos'),
  (2, '12 e mais'),
  (3, '4 a 7 anos'),
  (4, '8 a 11 anos'),
  (5, 'Nenhuma');
 
insert into causas (causa_id, causabas, causabas_o) values
  (1, 'X609', 'X609'),
  (2, 'X629', 'R98'),
  (3, 'X629', 'R99'),
  (4, 'X629', 'X629'),
  (5, 'X640', 'X640'),
  (6, 'X649', 'X649'),
  (7, 'X689', 'X689'),
  (8, 'X699', 'X699'),
  (9, 'X700', 'X700'),
  (10, 'X702', 'X702'),
  (11, 'X709', 'X709'),
  (12, 'X718', 'X718'),
  (13, 'X720', 'X720'),
  (14, 'X740', 'X740'),
  (15, 'X747', 'X747'),
  (16, 'X749', 'X749'),
  (17, 'X750', 'X750'),
  (18, 'X780', 'X780'),
  (19, 'X800', 'Y349');
 
insert into suicidios (ano, idade, sexo, estado_id, estado_civil_id, escolaridade_id, causa_id) values
  (2010, 10, 'Masculino', 1, 2, 1, 18),
  (2010, 24, 'Masculino', 1, 2, 1, 18),
  (2010, 14, 'Masculino', 1, 2, 1, 18),
  (2010, 26, 'Feminino', 1, 1, 1, 18),
  (2010, 28, 'Masculino', 1, 1, NULL, 13),
  (2010, 42, 'Feminino', 1, 2, 3, 18),
  (2010, 30, 'Masculino', 1, 2, 3, 9),
  (2010, 16, 'Masculino', 1, 2, NULL, 9),
  (2010, 58, 'Masculino', 1, 2, NULL, 3),
  (2010, 42, 'Masculino', 1, 2, NULL, 15),
  (2010, 38, 'Masculino', 1, 2, NULL, 9),
  (2010, 56, 'Masculino', 1, NULL, NULL, 9),
  (2010, 38, 'Feminino', 1, 1, NULL, 8),
  (2010, NULL, 'Masculino', 1, 2, NULL, 11),
  (2010, 26, 'Masculino', 1, 2, NULL, 14),
  (2010, 15, 'Masculino', 1, 2, NULL, 16),
  (2010, 61, 'Masculino', 1, 2, NULL, 2),
  (2010, 14, 'Feminino', 1, 2, NULL, 7),
  (2010, 28, 'Masculino', 1, NULL, NULL, 11),
  (2010, 22, 'Masculino', 1, 2, 4, 9),
  (2010, 37, 'Masculino', 1, NULL, NULL, 9),
  (2010, 35, 'Feminino', 1, NULL, NULL, 1),
  (2010, 27, 'Masculino', 1, 2, 3, 10),
  (2010, 43, 'Masculino', 1, 1, NULL, 11),
  (2010, 22, 'Masculino', 1, 2, NULL, 9),
  (2010, 38, 'Masculino', 1, NULL, NULL, 11),
  (2010, 32, 'Masculino', 1, NULL, NULL, 9),
  (2010, 39, 'Masculino', 1, NULL, NULL, 9),
  (2010, 14, 'Feminino', 1, 2, NULL, 7),
  (2010, 31, 'Masculino', 1, NULL, NULL, 2),
  (2010, 84, 'Masculino', 1, 2, NULL, 9),
  (2010, 61, 'Masculino', 1, NULL, NULL, 9),
  (2010, 30, 'Masculino', 1, 1, 5, 9),
  (2010, 45, 'Masculino', 1, 2, 5, 9),
  (2010, 21, 'Masculino', 1, 2, 2, 19),
  (2010, 23, 'Masculino', 1, 2, 3, 4),
  (2010, 39, 'Feminino', 1, NULL, NULL, 11),
  (2010, 25, 'Feminino', 1, NULL, NULL, 11),
  (2010, 27, 'Feminino', 1, 3, 4, 11),
  (2010, 19, 'Masculino', 1, NULL, NULL, 11),
  (2010, 27, 'Masculino', 1, NULL, NULL, 11),
  (2010, 44, 'Masculino', 2, 1, 3, 11),
  (2010, NULL, 'Masculino', 2, NULL, NULL, 11),
  (2010, 24, 'Masculino', 2, 2, 3, 11),
  (2010, 37, 'Feminino', 2, NULL, NULL, 11),
  (2010, 30, 'Masculino', 2, 2, NULL, 12),
  (2010, 16, 'Feminino', 2, 2, NULL, 9),
  (2010, 23, 'Masculino', 2, 2, NULL, 17),
  (2010, 52, 'Feminino', 2, 2, NULL, 6),
  (2010, 73, 'Masculino', 2, 1, NULL, 6);
  
  select * from suicidios;