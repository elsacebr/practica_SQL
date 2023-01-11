select
	b.nombre as "Nombre modelo",
	m.nombre as "Marca",
	c.fecha_compra,
	c.matricula,
	c2.nombre as "Color", 
	c.num_km,
	c.num_poliza,
	s.nombre as "Aseguradora",
	g.nombre as "Grupo" 
from practica_elsa_cembrero.coche c
inner join practica_elsa_cembrero.modelo b on c.id_modelo = b.id_modelo
inner join practica_elsa_cembrero.marca m  on b.id_marca  = m.id_marca
inner join practica_elsa_cembrero.color c2 on c.id_color  = c2.id_color 
inner join practica_elsa_cembrero.seguro s on s.id_seguro  = c.id_seguro 
inner join practica_elsa_cembrero.grupoempresa g  on g.id_grupo  = m.id_grupo 
;