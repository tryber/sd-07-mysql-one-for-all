CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(musical_track.id) FROM SpotifyClone.musical_track) as 'cancoes',
  (SELECT COUNT(singers.id) FROM SpotifyClone.singers) as "artistas",
  (SELECT COUNT(albuns.id) FROM SpotifyClone.albuns) as "albuns";
