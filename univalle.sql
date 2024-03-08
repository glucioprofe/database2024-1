CREATE TABLE facultad (
    id integer primary key auto_increment,
    nombre varchar(100),
    codigo varchar(4)
);

CREATE TABLE programa (
    id integer primary key auto_increment,
    nombre varchar(100),
    sigla varchar(4),
    codigo varchar(4),
    idfacultad integer,
    FOREIGN KEY (idfacultad) REFERENCES facultad(id)
);

INSERT INTO facultad (id, nombre, codigo) 
    VALUES
    (NULL, "Ingeniería", "FI01"); 

INSERT INTO facultad (id, nombre, codigo) 
    VALUES
    (NULL, "Humanistica", "Hu01"), 
    (NULL, "Ciencias Exactas", "CE01"); 
SELECT * FROM facultad;
