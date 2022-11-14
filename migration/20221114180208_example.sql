-- +goose Up
CREATE TABLE example
(
    id   SERIAL       NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- +goose Down
DROP TABLE example;
