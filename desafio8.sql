DELIMITER $$

CREATE TRIGGER `trigger_usuario_delete`
    BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
        BEGIN
            DELETE FROM SpotifyClone.users_artists
                WHERE id_user = OLD.id_user;
            DELETE FROM SpotifyClone.users_songs
                WHERE id_user = OLD.id_user;
        END $$
DELIMITER ;
