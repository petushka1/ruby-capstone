CREATE TABLE music_albums (
    id INT PRIMARY KEY NOT NULL,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    publish_date DATE NOT NULL,
    genre_id INT, 
    FOREIGN KEY (genre_id) REFERENCES genre(id)
); 
