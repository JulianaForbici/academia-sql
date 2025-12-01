-------------------------------------------------------- \\ 

-- Exercícios dos SELECTs


-- 1
select count(*) as clientes from cliente;

-- 2
select p.nome as plano, count(c.id_cliente) as quantidade
from plano p
left join cliente c on c.id_plano = p.id_plano
group by p.id_plano, p.nome
order by p.nome;

-- 3
select distinct nome from musico order by nome;

-- 4
select nome,valor, limite_downloads, *  from plano;

-- 5
select g.nome as gravadora,
count(distinct d.id_musico) as qtde_artistas
from gravadora g
left join disco d on d.id_gravadora = g.id_gravadora
group by g.nome;

-- 6
select g.nome as gravadora,
count(distinct d.id_musico) as qtde_artistas
from gravadora g
join disco d on d.id_gravadora = g.id_gravadora
group by g.nome
order by qtde_artistas desc
limit 1;

-- 7
select music.titulo from musica music join musico m on m.numero_bi = music.numero_bi where m.nome = 'adele';

-- 8
select music.titulo
from musica music
join disco d on d.id_disco = music.id_disco
join gravadora g on g.id_gravadora = d.id_gravadora
where g.nome = 'universal music';

-- 9
select g.nome as genero,
count(m.id_musica) as qtde_musicas
from genero g
left join musica m on m.id_genero = g.id_genero
group by g.nome;

-- 10
select c.nome as cliente,
count(d.id_download) as qtde_downloads
from cliente c
left join download d on d.id_cliente = c.id_cliente
group by c.nome;

-- 11
select g.nome as genero,
count(d.id_download) as qtde_downloads
from download d
join cliente c   on c.id_cliente = d.id_cliente
join plano p     on p.id_plano = c.id_plano
join musica m    on m.id_musica = d.id_musica
join genero g    on g.id_genero = m.id_genero
where p.nome = 'basico'
group by g.nome
order by qtde_downloads desc
limit 1;

-- 12
select m2.nome       as artista,
g.nome        as gravadora,
count(d.id_download) as qtde_downloads
from download d
join cliente c on c.id_cliente = d.id_cliente
join plano p on p.id_plano = c.id_plano
join musica m on m.id_musica = d.id_musica
join musico m2 on m2.numero_bi = m.numero_bi
join disco di on di.id_disco = m.id_disco
join gravadora g on g.id_gravadora = di.id_gravadora
where p.nome = 'basico'
group by m2.nome, g.nome
order by qtde_downloads desc;


-- 13
select p.nome as plano,
count(c.id_cliente) as qtde_clientes,
p.valor as valor_plano,
count(c.id_cliente) * p.valor   as total_por_plano
from plano p
left join cliente c on c.id_plano = p.id_plano
group by p.id_plano, p.nome, p.valor;

-- 14
select sum(p.valor) as faturamento_total
from cliente c
join plano p on p.id_plano = c.id_plano;

-- 15
select g.nome as gravadora,
count(m.id_musica) as qtde_musicas
from gravadora g
left join disco d  on d.id_gravadora = g.id_gravadora
left join musica m on m.id_disco= d.id_disco
group by g.nome;
