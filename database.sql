
CREATE TABLE if not exists Clients (
  id bigserial  PRIMARY KEY,
  login VARCHAR(20) NOT NULL UNIQUE,
  creation_date  TIMESTAMP not NULL DEFAULT current_timestamp,
  first_name   VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE if not exists Author (
  id bigserial PRIMARY Key ,
name varchar(30) Not Null,
	birth_date Date,
	death_date Date
);

Create table if not exists Publications (
	id bigserial primary key,
	title varchar(30) not null,
  publication DATE not null,
	author_id bigint REFERENCES Author (id)
);

CREATE TABLE if not EXISTS Books (
  id bigserial primary key,
  publication_id bigint not null REFERENCES Publications(id),
  isbn char(13)
);

CREATE table if not exists Borrowings (
  id bigserial primary key,
  client_id bigint references Clients(id),
  book_id bigint references Books(id),
  return_timestamp TIMESTAMP,
);

CREATE table if not exists fines (
  id bigserial primary key,
  value money not null,
  borrowing_id bigint references Borrowings(id),
  if_paid boolean
);

INSERT INTO Clients (
  login, first_name, last_name
) VALUES (
  'a', 'b', 'c'
);