CREATE VIEW cancoes_premium AS
SELECT
count(SpotifyClone.historico.usuario_id) as reproducoes,
SpotifyClone.cancoes.cancoes as nome
FROM SpotifyClone.historico
join SpotifyClone.cancoes
on SpotifyClone.historico.cancoes_id = SpotifyClone.cancoes.id
where usuario_id in (SELECT id as id_usuario FROM SpotifyClone.planos
where plano in('familiar', 'universitário'))
group by cancoes_id
order by 2;
