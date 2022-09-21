/* 1-to-many relationship built through FOREIGN KEY integration */

CREATE TABLE books (
    id INT PRIMARY KEY,
    publisher VARCHAR(250),
    publish_date DATE NOT NULL,
    cover_state VARCHAR(100),
    archived BOOLEAN,
    label_id INT NOT NULL,

    FOREIGN KEY (label_id) REFERENCES label(id)
);