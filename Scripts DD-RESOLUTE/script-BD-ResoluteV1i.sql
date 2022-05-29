CREATE DATABASE RESOLUTE;

use RESOLUTE;

######################
#EMPRESA
######################
# PK == Id_empresa
# FK == ----
# UNIQUE == CNPJ

CREATE TABLE Empresa(
Id_empresa int not null auto_increment,
razaoSocial varchar(100) not null,
CNPJ varchar(25) unique not null,
email varchar(80),
tipoEmpresa varchar(30) not null,
observacoes varchar(255) not null,
dtEntradaRl datetime not null,
modelo tinyint default(0),
constraint PK_empresa primary key(Id_empresa)
);

describe Empresa;
SELECT*FROM Empresa;

#########################
# PK == Id_endereco
# FK == Id_empresa_fk
# ----

CREATE TABLE End_empresa(
Id_endereco int not null auto_increment,
Id_empresa_fk int,
logradouro varchar(150),
cep varchar(20),
bairro varchar(50),
estado varchar(30),
pais varchar(30),
constraint Id_endereco primary key(Id_endereco),
constraint Id_empresa_fk foreign key(Id_empresa_fk)references Empresa(Id_empresa)
);

describe End_empresa;
SELECT*FROM End_empresa;

##########################
# PK == Id_telefone
# FK == Id_empresa_fk
# ----

CREATE TABLE Tel_empresa(
Id_telefone int not null auto_increment,
Id_empresa_fk int,
ddd varchar(7),
telefone varchar(15),
constraint Tel_empresa primary key(Id_telefone),
constraint Id_empresa_fk_tel foreign key(Id_empresa_fk) references Empresa(Id_empresa)
);

describe Tel_empresa;
SELECT*FROM Tel_empresa;

###########################
#######-FREELANCER-########
###########################
# PK == Id_freela
# FK == Id_empresa_fk
# ----
# genero 0=Homem,1=feminina,2= Não informado 

CREATE TABLE Freelancer(
Id_freela int not null auto_increment,
nomeCompleto varchar(100),
nomeSocial varchar(100),
email varchar(80) not null,
CPF varchar(20) unique not null,
genero int ,
certificacao varchar(255),
tipoContrato varchar(100),
constraint Id_freela primary key(Id_freela)
);

describe Freelancer;
SELECT*FROM freelancer;

###########################
# PK == Id_telefone
# FK == Id_freela_fk
# ----

CREATE TABLE Tel_Freela(
Id_telefone int not null auto_increment,
Id_freela_fk int,
ddd varchar(7),
telefone varchar(15),
constraint Tel_Freela primary key(Id_telefone),
constraint Id_freela_fk foreign key(Id_freela_fk) references Freelancer(Id_freela)
);
describe Tel_Freela;
SELECT*FROM Tel_Freela;

###########################
# PK == Profisapcd
# FK == -----
# genero 0=Homem,1=feminina,2= Não informado 
# freelancer 0 = nao é , 1 = é freelancer , por padrao vem como zero

CREATE TABLE Profisapcd(
Id_pcd int not null auto_increment,
nomeCompleto varchar(100),
nomeSocial varchar(100),
email varchar(80) not null,
CPF varchar(20) unique not null,
genero int,
acessibilidadeAmbiente varchar(255),
habilidadeTrabalho varchar(255),
freelancer tinyint default(0),
constraint Profisapcd primary key(Id_pcd)
);

describe Profisapcd;
SELECT*FROM Profisapcd;

###########################
# PK == Id_telefone
# FK == Id_freela_fk
# ----

CREATE TABLE Tel_pcd(
Id_telefone int not null auto_increment,
Id_pcd_fk int,
ddd varchar(7),
telefone varchar(15),
constraint Tel_Freela primary key(Id_telefone),
constraint Id_pcd_fk foreign key(Id_pcd_fk) references Profisapcd(Id_pcd)
);
describe Tel_Freela;
SELECT*FROM Tel_Freela;






