
INSERT INTO character (name) VALUES ('clown');
INSERT INTO character (name) VALUES ('jester');
INSERT INTO character (name) VALUES ('czar');
INSERT INTO character (name) VALUES ('magnate');
INSERT INTO character (name) VALUES ('apprentice');
INSERT INTO character (name) VALUES ('neophyte');
INSERT INTO character (name) VALUES ('artisan');
INSERT INTO character (name) VALUES ('mage')

INSERT INTO vdi (name, character) VALUES ('Brent', (SELECT id FROM character WHERE name = 'apprentice'));
INSERT INTO vdi (name, character) VALUES ('Patrick', (SELECT id FROM character WHERE name = 'jester'));
INSERT INTO vdi (name, character) VALUES ('Don', (SELECT id FROM character WHERE name = 'artisan'));
INSERT INTO vdi (name, character) VALUES ('Waqas', (SELECT id FROM character WHERE name = 'magnate'));
INSERT INTO vdi (name, character) VALUES ('JF', (SELECT id FROM character WHERE name = 'czar'));
INSERT INTO vdi (name, character) VALUES ('Emmanuel', (SELECT id FROM character WHERE name = 'neophyte'));
INSERT INTO vdi (name, character) VALUES ('Bilal', (SELECT id FROM character WHERE name = 'mage'));


