CREATE TABLE Client_gop
(
  id_client NUMBER(10, 0) NOT NULL,
  nume VARCHAR(20) NOT NULL,
  prenume VARCHAR(20) NOT NULL,
  telefon CHAR(10) NOT NULL,
  email VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_client),
  UNIQUE(telefon),
  UNIQUE(email)
);

CREATE TABLE Tara_gop
(
  id_tara NUMBER(10, 0) NOT NULL,
  nume varchar(25) NOT NULL,
  PRIMARY KEY (id_tara)
);

CREATE TABLE Marca_gop
(
  id_marca NUMBER(10, 0) NOT NULL,
  denumire VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_marca),
  UNIQUE(denumire)
);


CREATE TABLE Model_gop
(
  id_model NUMBER(10, 0) NOT NULL,
  denumire VARCHAR(20) NOT NULL,
  id_marca NUMBER(10, 0) NOT NULL,
  PRIMARY KEY (id_model),
  FOREIGN KEY (id_marca) REFERENCES Marca_gop(id_marca),
  UNIQUE(denumire)
);

CREATE TABLE Locatie_gop
(
  id_locatie NUMBER(10, 0) NOT NULL,
  strada VARCHAR(20) NOT NULL,
  judet VARCHAR(20) NOT NULL,
  oras VARCHAR(20) NOT NULL,
  id_tara NUMBER(10, 0) NOT NULL,
  PRIMARY KEY (id_locatie),
  FOREIGN KEY (id_tara) REFERENCES Tara_gop(id_tara)
);

CREATE TABLE Reprezentanta_gop
(
  id_reprezentanta NUMBER(10, 0) NOT NULL,
  id_locatie NUMBER(10, 0) NOT NULL,
  PRIMARY KEY (id_reprezentanta),
  FOREIGN KEY (id_locatie) REFERENCES Locatie_gop(id_locatie)
);

CREATE TABLE Masina_gop
(
  id_masina NUMBER(10, 0) NOT NULL,
  id_model NUMBER(10, 0) NOT NULL,
  id_reprezentanta NUMBER(10, 0) NOT NULL,
  an_fab NUMBER(10, 0) NOT NULL,
  combustibil VARCHAR(10) NOT NULL,
  km NUMBER(10, 0) NOT NULL,
  tara_origine VARCHAR(20) NOT NULL,
  pret_zi NUMBER(10, 0) NOT NULL,
  PRIMARY KEY (id_masina),
  FOREIGN KEY (id_model) REFERENCES Model_gop(id_model),
  FOREIGN KEY (id_reprezentanta) REFERENCES Reprezentanta_gop(id_reprezentanta),
  CHECK (km > 0)
);

CREATE TABLE Angajat_gop
(
  id_angajat NUMBER(10, 0) NOT NULL,
  nume VARCHAR(20) NOT NULL,
  prenume VARCHAR(20) NOT NULL,
  telefon CHAR(10) NOT NULL,
  email VARCHAR(20) NOT NULL,
  salariu NUMBER(10, 0) NOT NULL,
  id_reprezentanta NUMBER(10, 0) NOT NULL,
  id_manager NUMBER(10, 0),
  PRIMARY KEY (id_angajat),
  FOREIGN KEY (id_reprezentanta) REFERENCES Reprezentanta_gop(id_reprezentanta),
  FOREIGN KEY (id_manager) REFERENCES Angajat_gop(id_angajat),
  UNIQUE(telefon),
  UNIQUE(email)
);

CREATE TABLE Inchiriere_gop
(
  id_inchiriere NUMBER(10, 0) NOT NULL,
  id_masina NUMBER(10, 0) NOT NULL,
  id_client NUMBER(10, 0) NOT NULL,
  id_angajat NUMBER(10, 0) NOT NULL,
  data_inceput DATE NOT NULL,
  data_sfarsit DATE NOT NULL,
  feedback NUMBER(10, 1) NOT NULL,
  PRIMARY KEY (id_inchiriere, id_masina, id_client),
  FOREIGN KEY (id_masina) REFERENCES Masina_gop(id_masina),
  FOREIGN KEY (id_client) REFERENCES Client_gop(id_client),
  FOREIGN KEY (id_angajat) REFERENCES Angajat_gop(id_angajat),
  UNIQUE (id_client, data_inceput, data_sfarsit),
  CHECK (data_inceput <= data_sfarsit),
  CHECK (feedback >= 1 AND feedback <= 5)
);

--client
insert into client_gop
values (1, 'Popescu', 'Adrian', '0712345678', 'popescu@gmail.com');

insert into client_gop
values (2, 'Vasilescu', 'Maria', '0712345679', 'vasilescu@gmail.com');

insert into client_gop
values (3, 'Codreanu', 'Alexandru', '0712345689', 'alex.codr@gmail.com');

insert into client_gop
values (4, 'Marin', 'Lucretia', '0712345789', 'marin.l@gmail.com');

insert into client_gop
values (5, 'Marinache', 'Maria', '0712345710', 'mar.maria@gmail.com');

insert into client_gop
values (6, 'Constantinescu', 'Ioana', '0712345640', 'constantinescu.ioana@gmail.com');

insert into client_gop
values (7, 'Popa', 'Vasile', '0745345710', 'vasilepopa@gmail.com');

insert into client_gop
values (8, 'Grigorescu', 'Cosmina', '0745125710', 'grigorescu_cosmina@gmail.com');

--tara
insert into tara_gop
values (1, 'Romania');

insert into tara_gop
values (2, 'Germania');

insert into tara_gop
values (3, 'Olanda');

--marca
insert into marca_gop
values (1, 'VW');

insert into marca_gop
values (2, 'Audi');

insert into marca_gop
values (3, 'Mercedes');

insert into marca_gop
values (4, 'Renault');

insert into marca_gop
values (5, 'Dacia');

--model
insert into model_gop
values (1, 'Golf', 1);

insert into model_gop
values (2, 'Passat', 1);

insert into model_gop
values (3, 'Megane', 4);

insert into model_gop
values (4, 'Logan', 5);

insert into model_gop
values (5, 's class', 3);

insert into model_gop
values (6, 'A4', 2);

--locatie_gop
insert into locatie_gop
values (1, 'Bd. Iuliu Maniu', 'Bucuresti', 'Bucuresti', 1);

insert into locatie_gop
values (2, 'Bd. Nicolae Balcescu', 'Arges', 'Pitesti', 1);

insert into locatie_gop
values (3, 'Calea Dorobantilor', 'Cluj', 'Cluj-Napoca', 1);

insert into locatie_gop
values (4, 'Str. Gheorghe Lazar', 'Timis', 'Timisoara', 1);

--reprezentanta
insert into reprezentanta_gop
values (1, 1);

insert into reprezentanta_gop
values (2, 2);

insert into reprezentanta_gop
values (3, 4);

insert into reprezentanta_gop
values (4, 3);

--angajat
insert into angajat_gop
values (1, 'Morteanu', 'Fred', '0712345678', 'morteanu@gmail.com', 4000, 1, null);

insert into angajat_gop
values (2, 'Popescu', 'Teodora', '0712345688', 'teo.pop@gmail.com', 3000, 1, 1);

insert into angajat_gop
values (3, 'Marin', 'Mihai', '0712345699', 'mmhai@gmail.com', 2500, 1, 1);

insert into angajat_gop
values (4, 'Stefan', 'Cosmin', '0712345698', 'stefcosmin@gmail.com', 2500, 1, 1);

insert into angajat_gop
values (5, 'Mateescu', 'Andrei', '0712345001', 'andreimat@gmail.com', 2000, 1, 2);

insert into angajat_gop
values (6, 'Constantinescu', 'Valentina', '0712345000', 'valiConst@gmail.com', 2000, 1, 2);

insert into angajat_gop
values (7, 'Constantin', 'Alin', '0735000000', 'const.alin@gmail.com', 6000, 2, null);

insert into angajat_gop
values (8, 'Marculescu', 'Dan', '0735000001', 'dan_marc@gmail.com', 4000, 2, 7);


--masina

insert into masina_gop
values (1, 1, 1, 2010, 'benzina', 200000, 'Germania', 10);

insert into masina_gop
values (2, 1, 1, 2015, 'diesel', 150000, 'Olanda', 12);

insert into masina_gop
values (3, 1, 1, 2017, 'benzina', 100000, 'Germania', 15);

insert into masina_gop
values (4, 2, 1, 2018, 'diesel', 120000, 'Elvetia', 16);

insert into masina_gop
values (5, 1, 2, 2017, 'benzina', 100001, 'Germania', 15); -- in pitesti

insert into masina_gop
values (6, 4, 1, 2009, 'benzina', 250000, 'Franta', 8);

insert into masina_gop
values (7, 3, 1,  2008, 'diesel', 270000, 'Franta', 9);

insert into masina_gop
values (8, 5, 1,  2019, 'Benzina', 90000, 'Germania', 30);

insert into masina_gop
values (9, 2, 1,  2020, 'Benzina', 10000, 'Germania', 15);

insert into masina_gop
values (10, 2, 1,  2015, 'diesel', 180000, 'Austria', 15);

insert into masina_gop
values (11, 3, 2,  2018, 'diesel', 150000, 'Franta', 14); 

insert into masina_gop
values (12, 6, 1,  2018, 'diesel', 100000, 'Olanda', 18);

--inchiriere
insert into inchiriere_gop
values (1, 2, 5, 2, to_date('01-07-2019', 'DD-MM-YYYY'), to_date('13-07-2019', 'DD-MM-YYYY'), 3.1);

insert into inchiriere_gop
values (2, 2, 2, 1, to_date('01-10-2019', 'DD-MM-YYYY'), to_date('13-10-2019', 'DD-MM-YYYY'), 4.5);

insert into inchiriere_gop
values (3, 2, 7, 3, to_date('12-08-2019', 'DD-MM-YYYY'), to_date('12-08-2019', 'DD-MM-YYYY'), 5);

insert into inchiriere_gop
values (4, 1, 4, 6, to_date('01-09-2020', 'DD-MM-YYYY'), to_date('15-09-2020', 'DD-MM-YYYY'), 3.7);

insert into inchiriere_gop
values (5, 5, 1, 7, to_date('12-01-2020', 'DD-MM-YYYY'), to_date('20-01-2020', 'DD-MM-YYYY'), 4.9);


insert into inchiriere_gop
values (6, 7, 2, 5, to_date('20-11-2019', 'DD-MM-YYYY'), to_date('29-11-2019', 'DD-MM-YYYY'), 2.9);

insert into inchiriere_gop
values (7, 12, 3, 5, to_date('12-12-2019', 'DD-MM-YYYY'), to_date('13-12-2019', 'DD-MM-YYYY'), 4.7);

insert into inchiriere_gop
values (8, 6, 4, 2, to_date('01-02-2020', 'DD-MM-YYYY'), to_date('06-02-2020', 'DD-MM-YYYY'), 5);

insert into inchiriere_gop
values (9, 6, 6, 1, to_date('07-02-2020', 'DD-MM-YYYY'), to_date('13-02-2020', 'DD-MM-YYYY'), 2);

insert into inchiriere_gop
values (10, 8, 2, 3, to_date('12-02-2020', 'DD-MM-YYYY'), to_date('29-02-2020', 'DD-MM-YYYY'), 5);

insert into inchiriere_gop
values (11, 7, 2, 3, to_date('10-08-2019', 'DD-MM-YYYY'), to_date('11-08-2019', 'DD-MM-YYYY'), 2.9);

insert into inchiriere_gop
values (12, 12, 2, 3, to_date('01-09-2019', 'DD-MM-YYYY'), to_date('03-09-2019', 'DD-MM-YYYY'), 2.9);

insert into inchiriere_gop
values (13, 7, 2, 4, to_date('10-09-2019', 'DD-MM-YYYY'), to_date('11-09-2019', 'DD-MM-YYYY'), 2.9);

insert into inchiriere_gop
values (14, 12, 2, 4, to_date('04-10-2019', 'DD-MM-YYYY'), to_date('07-10-2019', 'DD-MM-YYYY'), 2.9);

commit;

