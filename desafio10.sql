DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (ID_usuario int)
returns int reads sql data
begin
declare total int;
select 
count(*)
from SpotifyClone.historico_de_reproducao as h
where h.usuario_id = ID_usuario
into total;
return total;
end $$
DELIMITER  ;
