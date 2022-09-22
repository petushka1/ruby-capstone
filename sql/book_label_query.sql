/* Create new table for all books of same label */

SELECT b.id, b.publisher, b.publish_date, b.cover_state FROM books b
JOIN label l
ON l.id = b.label_id