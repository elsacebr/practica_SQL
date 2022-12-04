create schema practica_elsa_cembrero authorization avlvrkkt;

create table practica_elsa_cembrero.grupoEmpresa(
	id_grupo varchar(10) not null,
	nombre varchar(200) not null,
	constraint grupoEmpresa_PK primary key(id_grupo)
);

create table practica_elsa_cembrero.marca(
	id_marca varchar(10) not null,
	nombre varchar(200) not null,
	constraint marca_PK primary key(id_marca)
);

alter table practica_elsa_cembrero.marca
add column id_grupo varchar(10) null; 

alter table practica_elsa_cembrero.marca
add constraint marca_FK foreign key (id_grupo)
references practica_elsa_cembrero.grupoEmpresa(id_grupo);

create table practica_elsa_cembrero.color(
	id_color varchar(10) not null,
	nombre varchar(200) not null,
	constraint color_PK primary key(id_color)
);


create table practica_elsa_cembrero.seguro(
	id_seguro varchar(10) not null,
	nombre varchar(200) not null,
	constraint seguro_PK primary key(id_seguro)
);

create table practica_elsa_cembrero.moneda(
	id_moneda varchar(10) not null,
	nombre varchar(200) not null,
	constraint moneda_PK primary key(id_moneda)
);

create table practica_elsa_cembrero.modelo(
	id_modelo varchar(10) not null,
	id_marca varchar(10) not null,
	nombre varchar(200) not null,
	constraint modelo_PK primary key(id_modelo)
);


alter table practica_elsa_cembrero.modelo
add constraint modelo_FK2 foreign key (id_marca)
references practica_elsa_cembrero.marca (id_marca);

create table practica_elsa_cembrero.coche(
	id_coche varchar(10) not null,
	id_seguro varchar(10) not null,
	id_color varchar(10) not null,
	id_modelo varchar(10) not null,
	matricula varchar(200) not null,
	num_poliza varchar(200) not null,
	fecha_compra date not null,
	num_km numeric not null,
	constraint coche_PK primary key(id_coche)
);

alter table practica_elsa_cembrero.coche
add constraint coche_FK foreign key (id_seguro)
references practica_elsa_cembrero.seguro (id_seguro);

alter table practica_elsa_cembrero.coche
add constraint coche_FK2 foreign key (id_color)
references practica_elsa_cembrero.color (id_color);

alter table practica_elsa_cembrero.coche
add constraint coche_FK3 foreign key (id_modelo)
references practica_elsa_cembrero.modelo (id_modelo);

create table practica_elsa_cembrero.histRevisiones(
	id_revisiones varchar(10) not null,
	id_coche varchar(10) not null,
	id_moneda varchar(10) not null,
	num_km_rev numeric not null,
	num_revisiones integer not null,
	fecha_revision date not null,
	importe numeric not null,
	constraint histRevisiones_PK primary key(id_revisiones)
);

alter table practica_elsa_cembrero.histRevisiones
add constraint histRevisiones_FK foreign key (id_coche)
references practica_elsa_cembrero.coche (id_coche);

alter table practica_elsa_cembrero.histRevisiones
add constraint histRevisiones_F2 foreign key (id_moneda)
references practica_elsa_cembrero.moneda (id_moneda);


insert into practica_elsa_cembrero.grupoempresa 
(id_grupo, nombre)
values ('1', 'BMW Group');

insert into practica_elsa_cembrero.marca 
(id_grupo, id_marca, nombre)
values ('1', '1', 'BMW');

insert into practica_elsa_cembrero.marca 
(id_grupo, id_marca, nombre)
values ('1', '2', 'Mini');

select * from practica_elsa_cembrero.grupoempresa 

select * from practica_elsa_cembrero.marca 

insert into practica_elsa_cembrero.color
(id_color, nombre)
values ('1', 'Negro')

insert into practica_elsa_cembrero.color
(id_color, nombre)
values ('2', 'Rojo')

insert into practica_elsa_cembrero.modelo
(id_marca, id_modelo, nombre)
values ('1', '1', 'BMW X4')

insert into practica_elsa_cembrero.modelo
(id_marca, id_modelo, nombre)
values ('2', '2', 'Countryman')

select * from practica_elsa_cembrero.modelo

insert into practica_elsa_cembrero.seguro 
(id_seguro, nombre)
values ('1', 'AXA')

insert into practica_elsa_cembrero.seguro 
(id_seguro, nombre)
values ('2', 'Mapfre')

select * from practica_elsa_cembrero.seguro

insert into practica_elsa_cembrero.moneda 
(id_moneda, nombre)
values ('1', 'EUR')

insert into practica_elsa_cembrero.coche
(id_coche, id_seguro, id_color, id_modelo, matricula, num_poliza, fecha_compra, num_km)
values ('1', '1', '1', '1', '4509FCZ', '6464T', '2021-05-25', 22300)

insert into practica_elsa_cembrero.coche
(id_coche, id_seguro, id_color, id_modelo, matricula, num_poliza, fecha_compra, num_km)
values ('2', '2', '2', '2', '1234ABC', '8086B', '2020-06-20', 32500)

select * from practica_elsa_cembrero.coche


insert into practica_elsa_cembrero.histrevisiones 
(id_revisiones, id_coche, id_moneda, num_km_rev, num_revisiones, fecha_revision, importe)
values ('1', '1', '1', 10000, 1, '2022-05-25', 30.50)

insert into practica_elsa_cembrero.histrevisiones 
(id_revisiones, id_coche, id_moneda, num_km_rev, num_revisiones, fecha_revision, importe)
values ('2', '2', '1', 15000, 1, '2021-06-20', 30.50)

select * from practica_elsa_cembrero.histrevisiones
