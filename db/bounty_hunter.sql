DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT2,
  danger_level VARCHAR(255),
  last_known_location VARCHAR(255)
);



--  createdb bounty_hunter
--  psql -d bounty_hunter -f db/bounty_hunter.sql
--  ruby db/console.rb
