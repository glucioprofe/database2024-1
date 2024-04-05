CREATE TABLE facultad (
    id integer unsigned primary key auto_increment,
    nombre varchar(100) unique,
    codigo varchar(4) unique
);
 
CREATE TABLE programa (
    id integer unsigned primary key auto_increment,
    nombre varchar(100) unique,
    sigla varchar(4) unique,
    codigo varchar(4) unique,
    idfacultad integer unsigned,
    FOREIGN KEY (idfacultad) REFERENCES facultad(id)
);

CREATE TABLE asignatura (
    id integer unsigned primary key auto_increment,
    nombre varchar(100),
    creditos TINYINT,
    codigo varchar(5) unique,
    horas TINYINT
);

CREATE TABLE malla (
    id integer unsigned primary key auto_increment,
    idasignatura integer unsigned,
    idprograma integer unsigned,
    semestre TINYINT,
    FOREIGN KEY (idasignatura) REFERENCES asignatura(id),
    FOREIGN KEY (idprograma) REFERENCES programa(id),
    UNIQUE (idasignatura, idprograma)
);

CREATE TABLE estudiante (
    id integer unsigned primary key auto_increment,
    nombres varchar(100),
    documento varchar(15),
    codigo varchar(12) unique,
    jornada varchar(3)
);

CREATE TABLE matricula (
    id integer unsigned primary key auto_increment,
    fechamatricula date,
    idmalla integer unsigned,
    idestudiante integer unsigned,
    FOREIGN KEY (idmalla) REFERENCES malla(id),
    FOREIGN KEY (idestudiante) REFERENCES estudiante(id)
);