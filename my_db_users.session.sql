DROP TABLE "workers";
CREATE TABLE "workers"(
  "id" serial PRIMARY KEY,
  "name" varchar(128) NOT NULL,
  "birthday" date NOT NULL CHECK (
    "birthday" < current_date
    AND "birthday" > '1900/1/1'
  ),
  "salary" DECIMAL(16, 2) CHECK ("salary" > 0)
);
INSERT INTO "workers" ("name", "birthday", "salary")
VALUES ('Nikita', '26/10/1995', 300),
  ('Svetlana', '18/05/1990', 1200),
  ('Yaroslav', '14/08/1980', 1200),
  ('Petr', '17/01/1993', 1000);
INSERT INTO "workers" ("name", "birthday", "salary")
VALUES ('Vasiliy', '20/11/1997', 400),
('Olya', '14/08/1995', 500);
UPDATE "workers"
SET "salary" = 300
WHERE "name" = 'Svetlana';
UPDATE "workers"
SET "birthday" = '17/01/1987'
WHERE "id" = 4;
UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 300;
UPDATE "workers"
SET "birthday" = '27/07/1999'
WHERE "id" BETWEEN 2 AND 5;
UPDATE "workers"
SET "name" = 'Zhenya',
  "salary" = 1000
WHERE "name" = 'Vasiliy';
SELECT *
FROM workers
WHERE "id" = 3;
SELECT *
FROM workers
WHERE "salary" > 500;
SELECT "name",
  "salary",
  "birthday"
FROM workers
WHERE "name" = 'Zhenya';
SELECT *
FROM workers
WHERE "name" = 'Petr';
SELECT *
FROM workers
WHERE "name" != 'Petr';
SELECT *
FROM workers
WHERE extract(
    'year'
    from age("birthday")
  ) = 25
  OR "salary" = 1000;
SELECT *
FROM workers
WHERE extract(
    'year'
    from age("birthday")
  ) BETWEEN 25 AND 28;
SELECT *
FROM workers
WHERE extract(
    'year'
    from age("birthday")
  ) BETWEEN 23 AND 27
  OR "salary" BETWEEN 400 AND 1000;
