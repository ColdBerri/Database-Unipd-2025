DROP TABLE IF EXISTS Opere CASCADE;
DROP TABLE IF EXISTS Quadro CASCADE;
DROP TABLE IF EXISTS Scultura CASCADE;
DROP TABLE IF EXISTS Installazione CASCADE;
DROP TABLE IF EXISTS Concettuale CASCADE;
DROP TABLE IF EXISTS Artisti CASCADE;
DROP TABLE IF EXISTS Collaborazioni CASCADE;
DROP TABLE IF EXISTS Mostre CASCADE;
DROP TABLE IF EXISTS Mostre_Temporanee CASCADE;
DROP TABLE IF EXISTS Restauri CASCADE;
DROP TABLE IF EXISTS Laboratori CASCADE;
DROP TABLE IF EXISTS Responsabili;
DROP TABLE IF EXISTS Zone_ CASCADE;
DROP TABLE IF EXISTS Collaborazioni_Mostre_temporanee;
 

CREATE TABLE IF NOT EXISTS Artisti(
    pseudonimo VARCHAR(64) PRIMARY KEY,
    nome VARCHAR(32),
    cognome VARCHAR(32),
    nazionalità VARCHAR(64) NOT NULL,
    sesso VARCHAR(64),
    data_di_nascita VARCHAR(64),
    data_di_morte VARCHAR(64)
);
INSERT INTO Artisti (pseudonimo, nome, cognome, nazionalità, sesso, data_di_nascita, data_di_morte) VALUES
('Picasso', 'Pablo', 'Picasso', 'Spagnolo', 'Maschio', '1881-10-25', '1973-04-08'),
('DaVinci', 'Leonardo', 'da Vinci', 'Italiano', 'Maschio', '1452-04-15', '1519-05-02'),
('Frida', 'Frida', 'Kahlo', 'Messicana', 'Femmina', '1907-07-06', '1954-07-13'),
('VanGogh', 'Vincent', 'van Gogh', 'Olandese', 'Maschio', '1853-03-30', '1890-07-29'),
('Monet', 'Claude', 'Monet', 'Francese', 'Maschio', '1840-11-14', '1926-12-05'),
('Warhol', 'Andy', 'Warhol', 'Americano', 'Maschio', '1928-08-06', '1987-02-22'),
('Banksy', 'Banksy', 'Unknown', 'Britannico', 'Maschio', '1974-07-28', NULL),
('Dali', 'Salvador', 'Dalí', 'Spagnolo', 'Maschio', '1904-05-11', '1989-01-23'),
('Klimt', 'Gustav', 'Klimt', 'Austriaco', 'Maschio', '1862-07-14', '1918-02-06'),
('Rodin', 'Auguste', 'Rodin', 'Francese', 'Maschio', '1840-11-12', '1917-11-17'),
('Koons', 'Jeff', 'Koons', 'Americano', 'Maschio', '1955-01-21', NULL),
('Hirst', 'Damien', 'Hirst', 'Britannico', 'Maschio', '1965-06-07', NULL),
('O''Keeffe', 'Georgia', 'O''Keeffe', 'Americana', 'Femmina', '1887-11-15', '1986-03-06'),
('Pollock', 'Jackson', 'Pollock', 'Americano', 'Maschio', '1912-01-28', '1956-08-11'),
('Kahlo', 'Frida', 'Kahlo', 'Messicana', 'Femmina', '1907-07-06', '1954-07-13'),
('Rothko', 'Mark', 'Rothko', 'Americano', 'Maschio', '1903-09-25', '1970-02-25'),
('Munch', 'Edvard', 'Munch', 'Norvegese', 'Maschio', '1863-12-12', '1944-01-23'),
('Matisse', 'Henri', 'Matisse', 'Francese', 'Maschio', '1869-12-31', '1954-11-03'),
('Cezanne', 'Paul', 'Cézanne', 'Francese', 'Maschio', '1839-01-19', '1906-10-22'),
('Basquiat', 'Jean-Michel', 'Basquiat', 'Americano', 'Maschio', '1960-12-22', '1988-08-12'),
('Botticelli', 'Sandro', 'Botticelli', 'Italiano', 'Maschio', '1445-03-01', '1510-05-17'),
('Magritte', 'René', 'Magritte', 'Belga', 'Maschio', '1898-11-21', '1967-08-15'),
('Caravaggio', 'Michelangelo', 'Merisi da Caravaggio', 'Italiano', 'Maschio', '1571-09-29', '1610-07-18'),
('Raphael', 'Raffaello', 'Sanzio', 'Italiano', 'Maschio', '1483-04-06', '1520-04-06'),
('Michelangelo', 'Michelangelo', 'Buonarroti', 'Italiano', 'Maschio', '1475-03-06', '1564-02-18'),
('Goya', 'Francisco', 'Goya', 'Spagnolo', 'Maschio', '1746-03-30', '1828-04-16'),
('Turner', 'Joseph', 'Turner', 'Britannico', 'Maschio', '1775-04-23', '1851-12-19'),
('Manet', 'Édouard', 'Manet', 'Francese', 'Maschio', '1832-01-23', '1883-04-30'),
('Degas', 'Edgar', 'Degas', 'Francese', 'Maschio', '1834-07-19', '1917-09-27'),
('Renoir', 'Pierre-Auguste', 'Renoir', 'Francese', 'Maschio', '1841-02-25', '1919-12-03'),
('Kusama', 'Yayoi', 'Kusama', 'Giapponese', 'Femmina', '1929-03-22', NULL),
('Eliasson', 'Olafur', 'Eliasson', 'Danese', 'Maschio', '1967-02-05', NULL),
('AiWeiwei', 'Ai', 'Weiwei', 'Cinese', 'Maschio', '1957-08-28', NULL),
('Kapoor', 'Anish', 'Kapoor', 'Britannico', 'Maschio', '1954-03-12', NULL),
('Abramović', 'Marina', 'Abramović', 'Serba', 'Femmina', '1946-11-30', NULL),
('Turrell', 'James', 'Turrell', 'Americano', 'Maschio', '1943-05-06', NULL),
('Hirst', 'Damien', 'Hirst', 'Britannico', 'Maschio', '1965-06-07', NULL),
('Orozco', 'Gabriel', 'Orozco', 'Messicano', 'Maschio', '1962-04-27', NULL),
('Whiteread', 'Rachel', 'Whiteread', 'Britannica', 'Femmina', '1963-04-20', NULL),
('Gormley', 'Antony', 'Gormley', 'Britannico', 'Maschio', '1950-08-30', NULL);
('Kosuth', 'Joseph', 'Kosuth', 'Americano', 'Maschio', '1945-01-31', NULL),
('Duchamp', 'Marcel', 'Duchamp', 'Francese', 'Maschio', '1887-07-28', '1968-10-02'),
('Ono', 'Yoko', 'Ono', 'Giapponese', 'Femmina', '1933-02-18', NULL),
('Beuys', 'Joseph', 'Beuys', 'Tedesco', 'Maschio', '1921-05-12', '1986-01-23'),
('Marclay', 'Christian', 'Marclay', 'Americano', 'Maschio', '1955-01-11', NULL);

CREATE TABLE IF NOT EXISTS Collaborazioni(
    ente VARCHAR(32) PRIMARY KEY,
    tipo VARCHAR(64) NOT NULL,
    pubblico BOOLEAN NOT NULL
);
INSERT INTO Collaborazioni (ente, tipo, pubblico) VALUES
('Louvre', 'Museo', TRUE),
('Tate Modern', 'Museo', TRUE),
('Google Arts', 'Digitale', TRUE),
('UNESCO', 'Culturale', TRUE),
('Fondazione Prada', 'Privato', FALSE),
('Getty Museum', 'Museo', TRUE),
('MoMA', 'Museo', TRUE),
('Guggenheim', 'Museo', TRUE),
('British Museum', 'Museo', TRUE),
('Fondazione Beyeler', 'Privato', FALSE);


CREATE TABLE IF NOT EXISTS Responsabili(
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    livello INT NOT NULL,
    CHECK(livello BETWEEN 1 AND 5)
);
INSERT INTO Responsabili (codice_fiscale, livello) VALUES
('RSP001', 5),
('RSP002', 4),
('RSP003', 3),
('RSP004', 4),
('RSP005', 5),
('RSP006', 3),
('RSP007', 4),
('RSP008', 5),
('RSP009', 3),
('RSP010', 4);


CREATE TABLE IF NOT EXISTS Zone_ (
    nome_zona VARCHAR(64) PRIMARY KEY,
    ala VARCHAR(64) NOT NULL,
    piano INT NOT NULL,
    responsabile VARCHAR(16) NOT NULL,
    FOREIGN KEY (responsabile) REFERENCES Responsabili(codice_fiscale),
    --fare un check sul responsabile che sia almeno di livello 3 su 5
);
INSERT INTO Zone_ (nome_zona, ala, piano, responsabile) VALUES
('Arte Moderna', 'Est', 1, 'RSP001'),
('Arte Rinascimentale', 'Ovest', 2, 'RSP002'),
('Arte Contemporanea', 'Nord', 3, 'RSP003'),
('Sculture', 'Sud', 1, 'RSP004'),
('Installazioni', 'Est', 2, 'RSP005'),
('Arte Concettuale', 'Ovest', 3, 'RSP006'),
('Mostre Temporanee', 'Centrale', 1, 'RSP007');


CREATE TABLE IF NOT EXISTS Mostre(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    tema VARCHAR(64) NOT NULL,
    zona VARCHAR(64) NOT NULL,
    FOREIGN KEY (zona) REFERENCES Zone_(nome_zona)
);
INSERT INTO Mostre (nome_mostra, tema, zona) VALUES
('Impressionismo', 'Arte Moderna', 'Arte Moderna'),
('Rinascimento Italiano', 'Arte Rinascimentale', 'Arte Rinascimentale'),
('Surrealismo', 'Arte Contemporanea', 'Arte Contemporanea'),
('Sculture Classiche', 'Sculture', 'Sculture'),
('Installazioni Interattive', 'Installazioni', 'Installazioni'),
('Arte Concettuale', 'Arte Concettuale', 'Arte Concettuale'),
('Mostra Temporanea 2023', 'Varie', 'Mostre Temporanee');


CREATE TABLE IF NOT EXISTS Mostre_Temporanee(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    FOREIGN KEY (nome_mostra) REFERENCES Mostre(nome_mostra)
);
INSERT INTO Mostre_Temporanee (nome_mostra, data_inizio, data_fine) VALUES
('Mostra Temporanea 2023', '2023-01-01', '2023-12-31');

CREATE TABLE IF NOT EXISTS Opere(
    nome_opera VARCHAR(64) PRIMARY KEY,
    artista VARCHAR(64) NOT NULL,
    anno_creazione INT NOT NULL,
    valore_di_mercato INT NOT NULL,
    corrente_artistica VARCHAR(64) NOT NULL,
    messaggio TEXT NOT NULL,
    mostra VARCHAR(64),
    FOREIGN KEY (artista) REFERENCES Artisti(pseudonimo),
    FOREIGN KEY (mostra) REFERENCES MOSTRE 
);
INSERT INTO Opere (nome_opera, artista, anno_creazione, valore_di_mercato, corrente_artistica, messaggio, mostra) VALUES
('Guernica', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Monna Lisa', 'DaVinci', 1503, 860000000, 'Rinascimento', 'Ritratto enigmatico', 'Rinascimento Italiano'),
('La Notte Stellata', 'VanGogh', 1889, 100000000, 'Post-Impressionismo', 'Natura e cielo', 'Arte Moderna'),
('Les Nymphéas', 'Monet', 1916, 110000000, 'Impressionismo', 'Acqua e luce', 'Impressionismo'),
('Campbell Soup', 'Warhol', 1962, 50000000, 'Pop Art', 'Consumismo', 'Arte Contemporanea'),
('The Persistence of Memory', 'Dali', 1931, 150000000, 'Surrealismo', 'Tempo e memoria', 'Surrealismo'),
('Balloon Dog', 'Koons', 1994, 58000000, 'Arte Contemporanea', 'Oggetti comuni', 'Arte Contemporanea'),
('The Kiss', 'Klimt', 1908, 180000000, 'Art Nouveau', 'Amore e passione', 'Arte Moderna'),
('The Thinker', 'Rodin', 1902, 100000000, 'Scultura', 'Riflessione', 'Sculture Classiche'),
('Girl with Balloon', 'Banksy', 2002, 1200000, 'Street Art', 'Speranza', 'Arte Contemporanea'),
('The Scream', 'Munch', 1893, 120000000, 'Espressionismo', 'Angoscia', 'Arte Moderna'),
('The Starry Night', 'VanGogh', 1889, 100000000, 'Post-Impressionismo', 'Natura e cielo', 'Arte Moderna'),
('The Birth of Venus', 'Botticelli', 1485, 300000000, 'Rinascimento', 'Bellezza', 'Rinascimento Italiano'),
('The Last Supper', 'DaVinci', 1498, 450000000, 'Rinascimento', 'Religione', 'Rinascimento Italiano'),
('The Water Lily Pond', 'Monet', 1899, 110000000, 'Impressionismo', 'Natura', 'Impressionismo'),
('The Dance', 'Matisse', 1910, 150000000, 'Fauvismo', 'Movimento', 'Arte Moderna'),
('The Physical Impossibility of Death', 'Hirst', 1991, 12000000, 'Arte Contemporanea', 'Morte', 'Arte Contemporanea'),
('The Son of Man', 'Magritte', 1964, 10000000, 'Surrealismo', 'Mistero', 'Surrealismo'),
('The Kiss', 'Rodin', 1889, 80000000, 'Scultura', 'Amore', 'Sculture Classiche'),
('The Starry Night Over the Rhone', 'VanGogh', 1888, 90000000, 'Post-Impressionismo', 'Natura', 'Arte Moderna'),
('The Night Café', 'VanGogh', 1888, 85000000, 'Post-Impressionismo', 'Notte e solitudine', 'Arte Moderna'),
('The Card Players', 'Cezanne', 1895, 250000000, 'Post-Impressionismo', 'Vita quotidiana', 'Arte Moderna'),
('The Luncheon on the Grass', 'Manet', 1863, 120000000, 'Impressionismo', 'Controversia', 'Impressionismo'),
('The Balcony', 'Manet', 1868, 90000000, 'Impressionismo', 'Società', 'Impressionismo'),
('The Raft of the Medusa', 'Géricault', 1819, 150000000, 'Romanticismo', 'Sopravvivenza', 'Arte Moderna'),
('The Death of Marat', 'David', 1793, 130000000, 'Neoclassicismo', 'Rivoluzione', 'Arte Moderna'),
('The Third of May 1808', 'Goya', 1814, 140000000, 'Romanticismo', 'Resistenza', 'Arte Moderna'),
('The Garden of Earthly Delights', 'Bosch', 1505, 200000000, 'Rinascimento', 'Paradiso e inferno', 'Rinascimento Italiano'),
('The Arnolfini Portrait', 'Van Eyck', 1434, 180000000, 'Rinascimento', 'Matrimonio', 'Rinascimento Italiano'),
('The School of Athens', 'Raphael', 1511, 300000000, 'Rinascimento', 'Filosofia', 'Rinascimento Italiano'),
('The Creation of Adam', 'Michelangelo', 1512, 400000000, 'Rinascimento', 'Creazione', 'Rinascimento Italiano'),
('The Sistine Madonna', 'Raphael', 1513, 350000000, 'Rinascimento', 'Devozione', 'Rinascimento Italiano'),
('The Birth of John the Baptist', 'Caravaggio', 1604, 120000000, 'Barocco', 'Nascita', 'Arte Moderna'),
('The Assumption of the Virgin', 'Titian', 1518, 180000000, 'Rinascimento', 'Ascensione', 'Rinascimento Italiano'),
('The Conversion of Saint Paul', 'Caravaggio', 1601, 130000000, 'Barocco', 'Conversione', 'Arte Moderna'),
('The Calling of Saint Matthew', 'Caravaggio', 1600, 140000000, 'Barocco', 'Chiamata', 'Arte Moderna'),
('The Entombment of Christ', 'Caravaggio', 1604, 150000000, 'Barocco', 'Morte', 'Arte Moderna'),
('The Descent from the Cross', 'Rubens', 1614, 160000000, 'Barocco', 'Sacrificio', 'Arte Moderna'),
('The Adoration of the Magi', 'Leonardo', 1481, 200000000, 'Rinascimento', 'Adorazione', 'Rinascimento Italiano'),
('The Annunciation', 'Leonardo', 1475, 180000000, 'Rinascimento', 'Annunciazione', 'Rinascimento Italiano'),
('The Madonna of the Goldfinch', 'Raphael', 1506, 170000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Meadow', 'Raphael', 1506, 160000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Pomegranate', 'Botticelli', 1487, 150000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Harpies', 'Andrea del Sarto', 1517, 140000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Long Neck', 'Parmigianino', 1535, 130000000, 'Manierismo', 'Madonna', 'Arte Moderna'),
('The Madonna of the Chair', 'Raphael', 1514, 120000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Magnificat', 'Botticelli', 1483, 110000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Rosary', 'Caravaggio', 1607, 100000000, 'Barocco', 'Madonna', 'Arte Moderna'),
('The Madonna of the Yarnwinder', 'Leonardo', 1501, 90000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Carnation', 'Leonardo', 1478, 80000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Goldfinch', 'Raphael', 1506, 170000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Meadow', 'Raphael', 1506, 160000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Pomegranate', 'Botticelli', 1487, 150000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Harpies', 'Andrea del Sarto', 1517, 140000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Long Neck', 'Parmigianino', 1535, 130000000, 'Manierismo', 'Madonna', 'Arte Moderna'),
('The Madonna of the Chair', 'Raphael', 1514, 120000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Magnificat', 'Botticelli', 1483, 110000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Rosary', 'Caravaggio', 1607, 100000000, 'Barocco', 'Madonna', 'Arte Moderna'),
('The Madonna of the Yarnwinder', 'Leonardo', 1501, 90000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Carnation', 'Leonardo', 1478, 80000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('Infinity Mirror Room', 'Kusama', 1965, 5000000, 'Installazione', 'Infinito e riflessione', 'Installazioni Interattive'),
('The Weather Project', 'Eliasson', 2003, 10000000, 'Installazione', 'Natura e percezione', 'Installazioni Interattive'),
('Sunflower Seeds', 'AiWeiwei', 2010, 7000000, 'Installazione', 'Massa e individualità', 'Installazioni Interattive'),
('Cloud Gate', 'Kapoor', 2006, 23000000, 'Installazione', 'Riflessione e spazio', 'Installazioni Interattive'),
('The Artist is Present', 'Abramović', 2010, 5000000, 'Concettuale', 'Presenza e connessione', 'Arte Concettuale'),
('Roden Crater', 'Turrell', 1979, 15000000, 'Installazione', 'Luce e percezione', 'Installazioni Interattive'),
('For the Love of God', 'Hirst', 2007, 100000000, 'Concettuale', 'Morte e valore', 'Arte Concettuale'),
('Empty Shoe Box', 'Orozco', 1993, 500000, 'Concettuale', 'Oggetti e significato', 'Arte Concettuale'),
('Ghost', 'Whiteread', 1990, 2000000, 'Installazione', 'Assenza e memoria', 'Installazioni Interattive'),
('Angel of the North', 'Gormley', 1998, 3000000, 'Installazione', 'Umanità e spazio', 'Installazioni Interattive');
('My Bed', 'Hirst', 1998, 2500000, 'Installazione', 'Vita e disordine', 'Installazioni Interattive'),
('The Physical Impossibility of Death', 'Hirst', 1991, 12000000, 'Installazione', 'Morte e esistenza', 'Installazioni Interattive'),
('Lightning Field', 'Turrell', 1977, 8000000, 'Installazione', 'Luce e natura', 'Installazioni Interattive'),
('One and Three Chairs', 'Kosuth', 1965, 1500000, 'Concettuale', 'Oggetto e rappresentazione', 'Arte Concettuale'),
('Fountain', 'Duchamp', 1917, 3500000, 'Concettuale', 'Ready-made e provocazione', 'Arte Concettuale'),
('Cut Piece', 'Ono', 1964, 2000000, 'Concettuale', 'Partecipazione e vulnerabilità', 'Arte Concettuale'),
('I Like America and America Likes Me', 'Beuys', 1974, 3000000, 'Concettuale', 'Relazione e società', 'Arte Concettuale'),
('The Clock', 'Marclay', 2010, 5000000, 'Concettuale', 'Tempo e cinema', 'Arte Concettuale'),
('How to Explain Pictures to a Dead Hare', 'Beuys', 1965, 2500000, 'Concettuale', 'Comunicazione e arte', 'Arte Concettuale'),
('The Treachery of Images', 'Magritte', 1929, 4000000, 'Concettuale', 'Realtà e rappresentazione', 'Arte Concettuale');

CREATE TABLE IF NOT EXISTS Quadro(
    nome_quadro VARCHAR(64) PRIMARY KEY,
    base VARCHAR(32) NOT NULL,
    dimensione VARCHAR(64) NOT NULL,
    tecnica VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_quadro) REFERENCES Opere(nome_opera)
);
INSERT INTO Quadro (nome_quadro, base, dimensione, tecnica) VALUES
('Guernica', 'Tela', '349x776 cm', 'Olio'),
('Monna Lisa', 'Legno', '77x53 cm', 'Olio'),
('La Notte Stellata', 'Tela', '73.7x92.1 cm', 'Olio'),
('Les Nymphéas', 'Tela', '200x200 cm', 'Olio'),
('Campbell Soup', 'Tela', '50x40 cm', 'Acrilico'),
('The Scream', 'Cartone', '91x73.5 cm', 'Tempera'),
('The Starry Night', 'Tela', '73.7x92.1 cm', 'Olio'),
('The Birth of Venus', 'Tela', '172.5x278.5 cm', 'Tempera'),
('The Last Supper', 'Muro', '460x880 cm', 'Affresco'),
('The Water Lily Pond', 'Tela', '89x93 cm', 'Olio'),
('The Dance', 'Tela', '260x391 cm', 'Olio'),
('The Kiss', 'Tela', '180x180 cm', 'Olio'),
('The Persistence of Memory', 'Tela', '24x33 cm', 'Olio'),
('The Son of Man', 'Tela', '116x89 cm', 'Olio'),
('The Starry Night Over the Rhone', 'Tela', '72.5x92 cm', 'Olio'),
('The Night Café', 'Tela', '72.4x92.1 cm', 'Olio'),
('The Card Players', 'Tela', '47.5x57 cm', 'Olio'),
('The Luncheon on the Grass', 'Tela', '208x264 cm', 'Olio'),
('The Balcony', 'Tela', '170x124 cm', 'Olio'),
('The Raft of the Medusa', 'Tela', '491x716 cm', 'Olio'),
('The Death of Marat', 'Tela', '165x128 cm', 'Olio'),
('The Third of May 1808', 'Tela', '268x347 cm', 'Olio'),
('The Garden of Earthly Delights', 'Legno', '220x389 cm', 'Olio'),
('The Arnolfini Portrait', 'Legno', '82x60 cm', 'Olio'),
('The School of Athens', 'Muro', '500x770 cm', 'Affresco'),
('The Creation of Adam', 'Muro', '280x570 cm', 'Affresco'),
('The Sistine Madonna', 'Tela', '265x196 cm', 'Olio'),
('The Birth of John the Baptist', 'Tela', '152x198 cm', 'Olio'),
('The Assumption of the Virgin', 'Tela', '690x360 cm', 'Olio'),
('The Conversion of Saint Paul', 'Tela', '237x189 cm', 'Olio'),
('The Calling of Saint Matthew', 'Tela', '322x340 cm', 'Olio'),
('The Entombment of Christ', 'Tela', '300x203 cm', 'Olio'),
('The Descent from the Cross', 'Tela', '420x315 cm', 'Olio'),
('The Adoration of the Magi', 'Tela', '246x243 cm', 'Olio'),
('The Annunciation', 'Tela', '98x217 cm', 'Olio'),
('The Madonna of the Goldfinch', 'Tela', '107x77 cm', 'Olio'),
('The Madonna of the Meadow', 'Tela', '113x88 cm', 'Olio'),
('The Madonna of the Pomegranate', 'Tela', '143x143 cm', 'Olio'),
('The Madonna of the Harpies', 'Tela', '208x178 cm', 'Olio'),
('The Madonna of the Long Neck', 'Tela', '216x132 cm', 'Olio'),
('The Madonna of the Chair', 'Tela', '71x71 cm', 'Olio'),
('The Madonna of the Magnificat', 'Tela', '118x118 cm', 'Olio'),
('The Madonna of the Rosary', 'Tela', '364x249 cm', 'Olio'),
('The Madonna of the Yarnwinder', 'Tela', '50.2x36.4 cm', 'Olio'),
('The Madonna of the Carnation', 'Tela', '62x47.5 cm', 'Olio'),
('The Madonna of the Goldfinch', 'Tela', '107x77 cm', 'Olio'),
('The Madonna of the Meadow', 'Tela', '113x88 cm', 'Olio'),
('The Madonna of the Pomegranate', 'Tela', '143x143 cm', 'Olio'),
('The Madonna of the Harpies', 'Tela', '208x178 cm', 'Olio');


CREATE TABLE IF NOT EXISTS Scultura(
    nome_scultura VARCHAR(64) PRIMARY KEY,
    dimensioni VARCHAR(64) NOT NULL,
    tecnica_scultorea VARCHAR(64) NOT NULL,
    materiale VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_scultura) REFERENCES Opere(nome_opera)
);
INSERT INTO Scultura (nome_scultura, dimensioni, tecnica_scultorea, materiale) VALUES
('The Thinker', '190x98x150 cm', 'Fusione', 'Bronzo'),
('Balloon Dog', '307x363x114 cm', 'Modellazione', 'Acciaio inossidabile'),
('The Kiss', '181.5x112.3x117 cm', 'Scultura', 'Marmo'),
('David', '517 cm', 'Scultura', 'Marmo'),
('Venus de Milo', '204 cm', 'Scultura', 'Marmo'),
('Pietà', '174x195 cm', 'Scultura', 'Marmo'),
('Apollo Belvedere', '224 cm', 'Scultura', 'Marmo'),
('Laocoön and His Sons', '208 cm', 'Scultura', 'Marmo'),
('Winged Victory of Samothrace', '244 cm', 'Scultura', 'Marmo'),
('Discobolus', '152 cm', 'Scultura', 'Marmo'),
('Augustus of Prima Porta', '203 cm', 'Scultura', 'Marmo'),
('Hermes and the Infant Dionysus', '213 cm', 'Scultura', 'Marmo'),
('The Dying Gaul', '93 cm', 'Scultura', 'Marmo'),
('The Boxer at Rest', '128 cm', 'Scultura', 'Bronzo'),
('The Farnese Hercules', '317 cm', 'Scultura', 'Marmo'),
('The Rape of Proserpina', '255 cm', 'Scultura', 'Marmo'),
('The Ecstasy of Saint Teresa', '350 cm', 'Scultura', 'Marmo'),
('The Gates of Hell', '600x400x100 cm', 'Scultura', 'Bronzo'),
('The Burghers of Calais', '200x200x200 cm', 'Scultura', 'Bronzo'),
('The Age of Bronze', '180 cm', 'Scultura', 'Bronzo');


CREATE TABLE IF NOT EXISTS Installazione(
    nome_installazione VARCHAR(64) PRIMARY KEY,
    coinvolgimento_sensoriale VARCHAR(64) NOT NULL,
    interattività VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_installazione) REFERENCES Opere(nome_opera) 
);
INSERT INTO Installazione (nome_installazione, coinvolgimento_sensoriale, interattività) VALUES
('My Bed', 'Visivo e tattile', 'Media'),
('The Physical Impossibility of Death', 'Visivo', 'Bassa'),
('Lightning Field', 'Visivo', 'Alta');
('Infinity Mirror Room', 'Visivo', 'Alta'),
('The Weather Project', 'Visivo e tattile', 'Media'),
('Sunflower Seeds', 'Visivo e tattile', 'Bassa'),
('Cloud Gate', 'Visivo', 'Alta'),
('Roden Crater', 'Visivo', 'Media'),
('Ghost', 'Visivo', 'Bassa'),
('Angel of the North', 'Visivo', 'Bassa');


CREATE TABLE IF NOT EXISTS Concettuale(
    nome_opera_concettuale VARCHAR(64) PRIMARY KEY,
    medium_utilizzato VARCHAR(64) NOT NULL,
    partecipazione_pubblico BOOLEAN NOT NULL,
    FOREIGN KEY (nome_opera_concettuale) REFERENCES Opere(nome_opera) 
);
INSERT INTO Concettuale (nome_opera_concettuale, medium_utilizzato, partecipazione_pubblico) VALUES
('The Artist is Present', 'Performance', TRUE),
('For the Love of God', 'Scultura', FALSE),
('Empty Shoe Box', 'Oggetti', FALSE),
('One and Three Chairs', 'Oggetti', FALSE),
('Fountain', 'Oggetti', FALSE),
('Cut Piece', 'Performance', TRUE),
('I Like America and America Likes Me', 'Performance', TRUE),
('The Clock', 'Video', FALSE),
('How to Explain Pictures to a Dead Hare', 'Performance', TRUE),
('The Treachery of Images', 'Pittura', FALSE);


CREATE TABLE IF NOT EXISTS Restauri (
    ID_restauro VARCHAR(64) PRIMARY KEY,
    estreno BOOLEAN NOT NULL,
    ente_collaborante VARCHAR(64),
    livello_degradazione INT NOT NULL,
    FOREIGN KEY (ente_collaborante) REFERENCES Collaborazioni(ente)
);
INSERT INTO Restauri (ID_restauro, estreno, ente_collaborante, livello_degradazione) VALUES
('RES001', FALSE, 'Louvre', 3),
('RES002', TRUE, 'Tate Modern', 5),
('RES003', FALSE, 'Getty Museum', 2),
('RES004', TRUE, 'MoMA', 4),
('RES005', FALSE, 'Guggenheim', 3),
('RES006', TRUE, 'British Museum', 4),
('RES007', FALSE, 'Fondazione Prada', 2),
('RES008', TRUE, 'UNESCO', 5),
('RES009', FALSE, 'Google Arts', 1),
('RES010', TRUE, 'Fondazione Beyeler', 4);


CREATE TABLE IF NOT EXISTS Laboratori (
    nome_laboratorio VARCHAR(64) PRIMARY KEY,
    ID_restauro VARCHAR(64) NOT NULL,
    numero_di_restauratori INT NOT NULL,
    livello_attrezzatura VARCHAR(64) NOT NULL,
    specializzazione VARCHAR(64) NOT NULL,
    FOREIGN KEY (ID_restauro) REFERENCES Restauri(ID_restauro)
);
INSERT INTO Laboratori (nome_laboratorio, ID_restauro, numero_di_restauratori, livello_attrezzatura, specializzazione) VALUES
('Lab1', 'RES001', 5, 'Alto', 'Dipinti'),
('Lab2', 'RES002', 7, 'Medio', 'Sculture'),
('Lab3', 'RES003', 4, 'Basso', 'Installazioni'),
('Lab4', 'RES004', 6, 'Alto', 'Arte Concettuale'),
('Lab5', 'RES005', 3, 'Medio', 'Quadri'),
('Lab6', 'RES006', 8, 'Alto', 'Sculture'),
('Lab7', 'RES007', 5, 'Medio', 'Dipinti'),
('Lab8', 'RES008', 6, 'Alto', 'Installazioni'),
('Lab9', 'RES009', 4, 'Basso', 'Arte Concettuale'),
('Lab10', 'RES010', 7, 'Alto', 'Quadri');

CREATE TABLE IF NOT EXISTS Collaborazioni_Mostre_temporanee (
    nome_mostra VARCHAR(64),
    ente_collaborante VARCHAR(64),
    PRIMARY KEY(nome_mostra, ente_collaborante),
    FOREIGN KEY (nome_mostra) REFERENCES Mostre_Temporanee(nome_mostra),
    FOREIGN KEY (ente_collaborante) REFERENCES Collaborazioni(ente)
);
INSERT INTO Collaborazioni_Mostre_temporanee (nome_mostra, ente_collaborante) VALUES
('Mostra Temporanea 2023', 'Louvre'),
('Mostra Temporanea 2023', 'Tate Modern'),
('Mostra Temporanea 2023', 'Google Arts'),
('Mostra Temporanea 2023', 'UNESCO'),
('Mostra Temporanea 2023', 'Fondazione Prada'),
('Mostra Temporanea 2023', 'Getty Museum'),
('Mostra Temporanea 2023', 'MoMA'),
('Mostra Temporanea 2023', 'Guggenheim'),
('Mostra Temporanea 2023', 'British Museum'),
('Mostra Temporanea 2023', 'Fondazione Beyeler');

--QUERY 


--Query 1 : stampare i nomi degli artisti che hanno più opere di un numero scelto dall'utente tra tutte le mostre 


--Query 2 : stampare la mostra che, sommando i valori del tipo di opera scelto da utente (quadri/sculture/installazioni/opere concettuali), ha il maggior valore complessivo


--Query 3 : stampare il nome dell'ente che ha collaborato più volte per i restauri e l'dentificativo del responsabile che ha seguito più restauri con quell'ente


--Query 4 : stampare l'ala del museo con più mostre che hanno almeno un numero di opere minimo scelto da utente


--Query 5 : stampare la lista di tutte le mostre temporanee che hanno opere di almeno tre tipi diversi e che abbiano un tema scelto dall'utente


--Query 6 : stampare il nome dei laboratori che hanno un livello di attrezzatura e un numero di restauratori almeno quanto scelto da utente
--          e che siano esterni ai laboratori del museo.  




