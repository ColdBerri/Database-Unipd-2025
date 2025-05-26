DROP TABLE IF EXISTS Opere CASCADE;
DROP TABLE IF EXISTS Artisti CASCADE;
DROP TABLE IF EXISTS Collaborazioni CASCADE;
DROP TABLE IF EXISTS Mostre CASCADE;
DROP TABLE IF EXISTS Mostre_Temporanee CASCADE;
DROP TABLE IF EXISTS Restauri CASCADE;
DROP TABLE IF EXISTS Laboratori CASCADE;
DROP TABLE IF EXISTS Responsabili CASCADE;
DROP TABLE IF EXISTS Zone_ CASCADE;
DROP TABLE IF EXISTS Visite CASCADE;
DROP TABLE IF EXISTS Collaborazioni_Mostre_temporanee CASCADE;

DROP DOMAIN IF EXISTS prezzo_quadro;

CREATE DOMAIN prezzo_quadro AS VARCHAR(20)
CHECK (VALUE ~ '^[0-9]+$' OR VALUE = 'inestimabile');

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
('Géricault', 'Théodore', 'Géricault', 'Francese', 'Maschio', '1791-09-26', '1824-01-26'),
('David', 'Jacques-Louis', 'David', 'Francese', 'Maschio', '1748-08-30', '1825-12-29'),
('Bosch', 'Hieronymus', 'Bosch', 'Olandese', 'Maschio', '1450-01-01', '1516-08-09'),
('Van Eyck', 'Jan', 'Van Eyck', 'Fiammingo', 'Maschio', '1390-03-24', '1441-07-09'),
('Titian', 'Tiziano', 'Vecellio', 'Italiano', 'Maschio', '1488-03-27', '1576-08-27'),
('Rubens', 'Peter Paul', 'Rubens', 'Fiammingo', 'Maschio', '1577-06-28', '1640-05-30'),
('Andrea del Sarto', 'Andrea', 'della Robbia', 'Italiano', 'Maschio', '1486-07-16', '1531-09-29'),
('Parmigianino', 'Francesco', 'Mazzola', 'Italiano', 'Maschio', '1503-01-11', '1540-08-24'),
('Picasso', 'Pablo', 'Picasso', 'Spagnolo', 'Maschio', '1881-10-25', '1973-04-08'),
('Da Vinci', 'Leonardo', 'da Vinci', 'Italiano', 'Maschio', '1452-04-15', '1519-05-02'),
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
('Orozco', 'Gabriel', 'Orozco', 'Messicano', 'Maschio', '1962-04-27', NULL),
('Whiteread', 'Rachel', 'Whiteread', 'Britannica', 'Femmina', '1963-04-20', NULL),
('Gormley', 'Antony', 'Gormley', 'Britannico', 'Maschio', '1950-08-30', NULL),
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
    FOREIGN KEY (responsabile) REFERENCES Responsabili(codice_fiscale)
);

CREATE OR REPLACE FUNCTION check_responsabile()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT livello FROM Responsabili WHERE ID_responsabile = NEW.responsabile) < 3 THEN
        RAISE EXCEPTION 'Il responsabile deve avere livello >= 3';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_responsabile_level
BEFORE INSERT OR UPDATE ON Zone_
FOR EACH ROW EXECUTE FUNCTION check_responsabile();

INSERT INTO Zone_ (nome_zona, ala, piano, responsabile) VALUES
('Arte Moderna', 'Est', 1, 'RSP001'),
('Arte Rinascimentale', 'Ovest', 2, 'RSP002'),
('Arte Contemporanea', 'Nord', 3, 'RSP003'),
('Sculture', 'Sud', 1, 'RSP004'),
('Installazioni', 'Est', 2, 'RSP005'),
('Arte Concettuale', 'Ovest', 3, 'RSP006'),
('Mostre Temporanee', 'Centrale', 1, 'RSP007');

CREATE TABLE IF NOT EXISTS Guida(
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    lingua_parlata VARCHAR(32) NOT NULL,
    disponibilita VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS Mostre(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    tema VARCHAR(64) NOT NULL,
    zona VARCHAR(64) NOT NULL,
    FOREIGN KEY (zona) REFERENCES Zone_(nome_zona)
);

INSERT INTO Mostre (nome_mostra, tema, zona) VALUES
('Impressionismo', 'Stile Impressionista', 'Arte Moderna'),
('Arte Moderna', 'Avanguardia', 'Arte Moderna'),
('Arte Contemporanea', 'Postmodernismo', 'Arte Moderna'),
('Rinascimento Italiano', 'Arte Rinascimentale', 'Arte Rinascimentale'),
('Surrealismo', 'Movimento Surrealista', 'Arte Contemporanea'),
('Sculture Classiche', 'Arte Greca e Romana', 'Sculture'),
('Installazioni Interattive', 'Tecnologia e Arte', 'Installazioni'),
('Arte Concettuale', 'Minimalismo e Concettualismo', 'Arte Concettuale'),
('Mostra Temporanea 2023','Tecnologia e Arte','Installazioni');

CREATE TABLE IF NOT EXISTS Mostre_permanenti(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    guida VARCHAR(16) NOT NULL,
    FOREIGN KEY (nome_mostra) REFERENCES Mostre(nome_mostra),
    FOREIGN KEY (guida) REFERENCES Guida(codice_fiscale)
);

CREATE TABLE IF NOT EXISTS Mostre_Temporanee(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    catalogo VARCHAR(64) NOT NULL,
    CHECK (data_inizio < data_fine),
    FOREIGN KEY (nome_mostra) REFERENCES Mostre(nome_mostra)
);
INSERT INTO Mostre_Temporanee (nome_mostra, data_inizio, data_fine) VALUES
('Mostra Temporanea 2023', '2023-01-01', '2023-12-31');

CREATE TABLE IF NOT EXISTS Opere(
    nome_opera VARCHAR(64) PRIMARY KEY,
    artista VARCHAR(64) NOT NULL,
    anno_creazione INT NOT NULL,
    valore_di_mercato prezzo_quadro NOT NULL,
    corrente_artistica VARCHAR(64) NOT NULL,
    messaggio TEXT NOT NULL,
    mostra VARCHAR(64),
    CHECK (anno_creazione > 0 AND anno_creazione <= EXTRACT(YEAR FROM CURRENT_DATE)),
    FOREIGN KEY (artista) REFERENCES Artisti(pseudonimo),
    FOREIGN KEY (mostra) REFERENCES MOSTRE 
);

INSERT INTO Opere (nome_opera, artista, anno_creazione, valore_di_mercato, corrente_artistica, messaggio, mostra) VALUES
('David', 'Picasso', 1937, 'inestimabile', 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Guernica', 'Picasso', 1937, 'inestimabile', 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Monna Lisa', 'Da Vinci', 1503, 'inestimabile', 'Rinascimento', 'Ritratto enigmatico', 'Rinascimento Italiano'),
('The Last Supper', 'Da Vinci', 1498, 'inestimabile', 'Rinascimento', 'Religione', 'Rinascimento Italiano'),
('The Creation of Adam', 'Michelangelo', 1512, 'inestimabile', 'Rinascimento', 'Creazione', 'Rinascimento Italiano'),
('The School of Athens', 'Raphael', 1511, 'inestimabile', 'Rinascimento', 'Filosofia', 'Rinascimento Italiano'),
('The Birth of Venus', 'Botticelli', 1485, 'inestimabile', 'Rinascimento', 'Bellezza', 'Rinascimento Italiano'),
('The Garden of Earthly Delights', 'Bosch', 1505, 'inestimabile', 'Rinascimento', 'Paradiso e inferno', 'Rinascimento Italiano'),
('The Starry Night', 'VanGogh', 1889, 'inestimabile', 'Post-Impressionismo', 'Natura e cielo', 'Arte Moderna'),
('Venus de Milo', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Pietà', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Apollo Belvedere', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Laocoön and His Sons', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Winged Victory of Samothrace', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Discobolus', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Augustus of Prima Porta', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('Hermes and the Infant Dionysus', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Dying Gaul', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Boxer at Rest', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Farnese Hercules', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Rape of Proserpina', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Ecstasy of Saint Teresa', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Gates of Hell', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Burghers of Calais', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('The Age of Bronze', 'Picasso', 1937, 200000000, 'Cubismo', 'Pace e guerra', 'Arte Moderna'),
('La Notte Stellata', 'VanGogh', 1889, 100000000, 'Post-Impressionismo', 'Natura e cielo', 'Arte Moderna'),
('Les Nymphéas', 'Monet', 1916, 110000000, 'Impressionismo', 'Acqua e luce', 'Impressionismo'),
('Campbell Soup', 'Warhol', 1962, 50000000, 'Pop Art', 'Consumismo', 'Arte Contemporanea'),
('The Persistence of Memory', 'Dali', 1931, 150000000, 'Surrealismo', 'Tempo e memoria', 'Surrealismo'),
('Balloon Dog', 'Koons', 1994, 58000000, 'Arte Contemporanea', 'Oggetti comuni', 'Arte Contemporanea'),
('The Kiss', 'Klimt', 1908, 180000000, 'Art Nouveau', 'Amore e passione', 'Arte Moderna'),
('The Thinker', 'Rodin', 1902, 100000000, 'Scultura', 'Riflessione', 'Sculture Classiche'),
('Girl with Balloon', 'Banksy', 2002, 1200000, 'Street Art', 'Speranza', 'Arte Contemporanea'),
('The Scream', 'Munch', 1893, 120000000, 'Espressionismo', 'Angoscia', 'Arte Moderna'),
('The Water Lily Pond', 'Monet', 1899, 110000000, 'Impressionismo', 'Natura', 'Impressionismo'),
('The Dance', 'Matisse', 1910, 150000000, 'Fauvismo', 'Movimento', 'Arte Moderna'),
('The Son of Man', 'Magritte', 1964, 10000000, 'Surrealismo', 'Mistero', 'Surrealismo'),
('The Starry Night Over the Rhone', 'VanGogh', 1888, 90000000, 'Post-Impressionismo', 'Natura', 'Arte Moderna'),
('The Night Café', 'VanGogh', 1888, 85000000, 'Post-Impressionismo', 'Notte e solitudine', 'Arte Moderna'),
('The Card Players', 'Cezanne', 1895, 250000000, 'Post-Impressionismo', 'Vita quotidiana', 'Arte Moderna'),
('The Luncheon on the Grass', 'Manet', 1863, 120000000, 'Impressionismo', 'Controversia', 'Impressionismo'),
('The Balcony', 'Manet', 1868, 90000000, 'Impressionismo', 'Società', 'Impressionismo'),
('The Raft of the Medusa', 'Géricault', 1819, 150000000, 'Romanticismo', 'Sopravvivenza', 'Arte Moderna'),
('The Death of Marat', 'David', 1793, 130000000, 'Neoclassicismo', 'Rivoluzione', 'Arte Moderna'),
('The Third of May 1808', 'Goya', 1814, 140000000, 'Romanticismo', 'Resistenza', 'Arte Moderna'),
('The Arnolfini Portrait', 'Van Eyck', 1434, 180000000, 'Rinascimento', 'Matrimonio', 'Rinascimento Italiano'),
('The Sistine Madonna', 'Raphael', 1513, 350000000, 'Rinascimento', 'Devozione', 'Rinascimento Italiano'),
('The Assumption of the Virgin', 'Titian', 1518, 180000000, 'Rinascimento', 'Ascensione', 'Rinascimento Italiano'),
('The Conversion of Saint Paul', 'Caravaggio', 1601, 130000000, 'Barocco', 'Conversione', 'Arte Moderna'),
('The Calling of Saint Matthew', 'Caravaggio', 1600, 140000000, 'Barocco', 'Chiamata', 'Arte Moderna'),
('The Entombment of Christ', 'Caravaggio', 1604, 150000000, 'Barocco', 'Morte', 'Arte Moderna'),
('The Descent from the Cross', 'Rubens', 1614, 160000000, 'Barocco', 'Sacrificio', 'Arte Moderna'),
('The Adoration of the Magi', 'Da Vinci', 1481, 200000000, 'Rinascimento', 'Adorazione', 'Rinascimento Italiano'),
('The Annunciation', 'Da Vinci', 1475, 180000000, 'Rinascimento', 'Annunciazione', 'Rinascimento Italiano'),
('The Madonna of the Goldfinch', 'Raphael', 1506, 170000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Meadow', 'Raphael', 1506, 160000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Pomegranate', 'Botticelli', 1487, 150000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Harpies', 'Andrea del Sarto', 1517, 140000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Long Neck', 'Parmigianino', 1535, 130000000, 'Manierismo', 'Madonna', 'Arte Moderna'),
('The Madonna of the Chair', 'Raphael', 1514, 120000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Magnificat', 'Botticelli', 1483, 110000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Rosary', 'Caravaggio', 1607, 100000000, 'Barocco', 'Madonna', 'Arte Moderna'),
('The Madonna of the Yarnwinder', 'Da Vinci', 1501, 90000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('The Madonna of the Carnation', 'Da Vinci', 1478, 80000000, 'Rinascimento', 'Madonna', 'Rinascimento Italiano'),
('Infinity Mirror Room', 'Kusama', 1965, 5000000, 'Installazione', 'Infinito e riflessione', 'Installazioni Interattive'),
('The Weather Project', 'Eliasson', 2003, 1000000, 'Installazione', 'Natura e percezione', 'Installazioni Interattive'),
('Sunflower Seeds', 'AiWeiwei', 2010, 7000000, 'Installazione', 'Massa e individualità', 'Installazioni Interattive'),
('Cloud Gate', 'Kapoor', 2006, 23000000, 'Installazione', 'Riflessione e spazio', 'Installazioni Interattive'),
('The Artist is Present', 'Abramović', 2010, 5000000, 'Concettuale', 'Presenza e connessione', 'Arte Concettuale'),
('Roden Crater', 'Turrell', 1979, 15000000, 'Installazione', 'Luce e percezione', 'Installazioni Interattive'),
('For the Love of God', 'Hirst', 2007, 100000000, 'Concettuale', 'Morte e valore', 'Arte Concettuale'),
('Empty Shoe Box', 'Orozco', 1993, 500000, 'Concettuale', 'Oggetti e significato', 'Arte Concettuale'),
('Ghost', 'Whiteread', 1990, 2000000, 'Installazione', 'Assenza e memoria', 'Installazioni Interattive'),
('Angel of the North', 'Gormley', 1998, 3000000, 'Installazione', 'Umanità e spazio', 'Installazioni Interattive'),
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

CREATE TABLE IF NOT EXISTS Laboratori (
    nome_laboratorio VARCHAR(64) PRIMARY KEY,
    ID_restauro VARCHAR(64) NOT NULL,
    numero_di_restauratori INT NOT NULL,
    livello_attrezzatura VARCHAR(64) NOT NULL,
    specializzazione VARCHAR(64) NOT NULL
);
INSERT INTO Laboratori (nome_laboratorio, ID_restauro, numero_di_restauratori, livello_attrezzatura, specializzazione) VALUES
('Lab1', 'RES001', 5, 'Alto', 'Dipinti'),
('Lab2', 'RES002', 7, 'Medio', 'Sculture'),
('Lab3', 'RES003', 4, 'Basso', 'Installazioni'),
('Lab4', 'RES004', 6, 'Alto', 'Legno'),
('Lab5', 'RES005', 3, 'Medio', 'Quadri'),
('Lab6', 'RES006', 8, 'Alto', 'Sculture'),
('Lab7', 'RES007', 5, 'Medio', 'Dipinti'),
('Lab8', 'RES008', 6, 'Alto', 'Installazioni'),
('Lab9', 'RES009', 4, 'Basso', 'Arte Concettuale'),
('Lab10', 'RES010', 7, 'Alto', 'Quadri');


CREATE TABLE IF NOT EXISTS Restauri (
    ID_restauro VARCHAR(64) PRIMARY KEY,
    opera_da_restaurare VARCHAR(64) NOT NULL,
    responsabile VARCHAR(16) NOT NULL,
    ente_collaborante VARCHAR(64),
    livello_degradazione INT NOT NULL,
    laboratorio VARCHAR(64) NOT NULL,
    FOREIGN KEY (laboratorio) REFERENCES Laboratori(nome_laboratorio),
    FOREIGN KEY (responsabile) REFERENCES Responsabili(codice_fiscale),
    FOREIGN KEY (ente_collaborante) REFERENCES Collaborazioni(ente),
    FOREIGN KEY (opera_da_restaurare) REFERENCES Opere(nome_opera)

);

INSERT INTO Restauri (ID_restauro, opera_da_restaurare, responsabile, esterno, ente_collaborante, livello_degradazione) VALUES
('RES001', 'Guernica', 'RSP001', FALSE, NULL, 3),
('RES002', 'Monna Lisa', 'RSP002', TRUE, 'Tate Modern', 5),
('RES003', 'La Notte Stellata', 'RSP003', FALSE, NULL, 2),
('RES004', 'Les Nymphéas', 'RSP004', TRUE, 'MoMA', 4),
('RES005', 'Campbell Soup', 'RSP005', FALSE, NULL, 3),
('RES006', 'The Persistence of Memory', 'RSP006', TRUE, 'British Museum', 4),
('RES007', 'Balloon Dog', 'RSP007', FALSE, NULL, 2),
('RES008', 'The Kiss', 'RSP008', TRUE, 'UNESCO', 5),
('RES009', 'The Thinker', 'RSP009', FALSE, NULL, 1),
('RES010', 'Girl with Balloon', 'RSP010', TRUE, 'Fondazione Beyeler', 4);

CREATE TABLE IF NOT EXISTS Concesso (
    nome_mostra VARCHAR(64),
    ente_di_collaborazione VARCHAR(64),
    PRIMARY KEY(nome_mostra, ente_di_collaborazione),
    FOREIGN KEY (nome_mostra) REFERENCES Mostre_Temporanee(nome_mostra),
    FOREIGN KEY (ente_di_collaborazione) REFERENCES Collaborazioni(ente)
);
INSERT INTO Concesso (nome_mostra, ente_di_collaborazione) VALUES
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

-- INDICI

--QUERY 

--Query 1 : Stampare tutte le guide disponibili un deteminato giorno e che parlano la lingua scelta

SELECT 
    g.codice_fiscale, g.lingua_parlata,g.disponibilita,
    m.nome_mostra,m.tema,m.zona
FROM 
    Guida g
JOIN 
    Mostre m ON g.disponibilita = 'Lun-Mer'
WHERE 
    g.lingua_parlata = 'Inglese'
ORDER BY 
    m.zona, g.codice_fiscale;

--Query 2 : stampare l'identificativo del responsabile che ha seguito più restauri, fatti in un laboratorio esterno,
--          con un livello di degradazione scelto da utente.
WITH restauri_per_responsabile AS (     
    SELECT responsabile, COUNT(*) AS Nrestauri
    FROM Restauri
    WHERE livello_degradazione >= 2 --scelta da utente tipo NUM
    GROUP BY responsabile
)

SELECT responsabile, Nrestauri
FROM restauri_per_responsabile
WHERE Nrestauri = (SELECT MAX(Nrestauri)
                   FROM restauri_per_responsabile)


--Query 3 : stampare l'ente, o gli enti, pubblico o privato in base alla scelta dell'utente, che ha/hanno collaborato di 
--          più con il museo sia per mostre che per restauri. inlotre stampare il numero di collaborazioni totali.
WITH collaborazioni_mostre AS (
    SELECT ente_di_collaborazione, COUNT(*) AS com
    FROM Collaborazioni_Mostre_temporanee CM, Collaborazioni C
    WHERE C.ente = CM.ente_di_collaborazione AND C.Pubblico = TRUE --scelta dell'utente
    GROUP BY ente_di_collaborazione
),
    collaborazioni_restauri AS(
        SELECT ente_collaborante, COUNT(*) AS cor
        FROM Restauri R, Collaborazioni C
        WHERE C.Pubblico = TRUE AND R.ente_collaborante = C.ente  --stessa var di prima per scelta da utente
        GROUP BY ente_collaborante
    ),

    collab_totali AS(
        SELECT ente_collaborante, SUM(com + cor) AS totc
        FROM collaborazioni_mostre CM, collaborazioni_restauri CR
        WHERE CM.ente_di_collaborazione = CR.ente_collaborante
        GROUP BY ente_collaborante
    )

SELECT ente_collaborante, totc
FROM collab_totali
WHERE totc = (SELECT MAX(totc)
              FROM collab_totali)

--Query 4 : trova le mostre che ospitano opere di almeno 2 artisti diversi e mostra il numero di artisti coinvolti per ogni mostra

SELECT o.mostra, COUNT(DISTINCT a.pseudonimo) AS numero_artisti_coinvolti
FROM Opere o
JOIN Artisti a ON o.artista = a.pseudonimo
WHERE o.mostra IS NOT NULL
GROUP BY o.mostra
HAVING COUNT(DISTINCT a.pseudonimo) >= 2
ORDER BY numero_artisti_coinvolti DESC;


--Query 5 : scelta un'ala del museo da utente stampare il nome delle zone, della msotra in quella zona e di opere per mostra esposte in quell'ala
WITH opere_per_mostra AS (
    SELECT mostra, COUNT(*) AS opm
    FROM Opere
    GROUP BY mostra
)

SELECT nome_zona, mostra, opm
FROM Zone_ Z, opere_per_mostra OM, Mostre M
WHERE M.zona = Z.nome_zona AND OM.mostra = M.nome_mostra AND Z.ala = 'Est'--scelta dell'utente
