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

SELECT facultad.nombre, programa.nombre
FROM facultad
JOIN programa ON facultad.id = programa.idfacultad AND idfacultad=4

SELECT facultad.nombre, COUNT(programa.id)
FROM facultad
JOIN programa ON facultad.id = programa.idfacultad
GROUP BY(facultad.id);

//COUNT AVG SUM
//MAX MIN 

SELECT COUNT(id) FROM facultad;

SELECT MAX(facultad.id) FROM facultad;

SELECT facultad.id FROM facultad ORDER BY id desc LIMIT 1;

SELECT facultad.nombre, COUNT(programa.id)
FROM facultad
LEFT JOIN programa ON facultad.id = programa.idfacultad
GROUP BY(facultad.id);

Muestre el nombre de la facultad, el nombre del programa y el numero de asignaturas que tiene cada programa. Incluya los programas que no tienen asignaturas.


SELECT facultad.nombre, programa.nombre, COUNT(asignatura.id)
FROM  facultad
JOIN programa ON facultad.id = programa.idfacultad
LEFT JOIN malla ON programa.id = malla.idprograma
LEFT JOIN asignatura ON malla.idasignatura= asignatura.id
GROUP BY facultad.id, programa.id;


SELECT facultad.nombre, programa.nombre, COUNT (programa.id)
FROM facultad
LEFT JOIN programa  ON asignatura.id= asignatura.id
LEFT JOIN asignatura ON programa.id = asignatura.id

GROUP by(facultad.id, asignatura.id);

SELECT programa.nombre, AVG(asignatura.creditos)
FROM programa
JOIN malla ON malla.idprograma = programa.id
JOIN asignatura ON malla.idasignatura = asignatura.id
GROUP BY programa.id LIMIT 10;

CREATE VIEW vw_creditos AS
SELECT programa.nombre AS programa, AVG(asignatura.creditos) AS promedio
FROM programa
JOIN malla ON malla.idprograma = programa.id
JOIN asignatura ON malla.idasignatura = asignatura.id
GROUP BY programa.id LIMIT 10;

UPDATE programa SET nombre="Contaduria" WHERE nombre='Shanahan-Stehr';

CREATE VIEW vw_programa AS
SELECT asignatura.nombre as asignatura, programa.nombre as programa
from asignatura
join malla on asignatura.id = malla.idasignatura
join programa on malla.idprograma = programa.id
order by asignatura.nombre;

SELECT * FROM vw_programa WHERE programa LIKE '%Des';
