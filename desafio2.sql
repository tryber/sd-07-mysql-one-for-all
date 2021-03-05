CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(musical_track.id) FROM musical_track) as 'cancoes',
  (SELECT COUNT(singers.id) FROM singers) as "artistas",
  (SELECT COUNT(albuns.id) FROM albuns) as "albuns";
