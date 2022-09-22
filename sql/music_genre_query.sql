SELECT m.id, g.name, m.publish_date, m.on_spotify, m.archived 
FROM music_albums m
JOIN genres g
ON m.id = g.genre_id