SELECT * FROM facultad
JOIN programa ON facultad.id = programa.idfacultad

SELECT facultad.nombre, programa.nombre FROM facultad
JOIN programa ON facultad.id = programa.idfacultad

SELECT facultad.nombre, programa.nombre FROM facultad
JOIN programa ON facultad.id = programa.idfacultad 
WHERE programa.nombre="Ingenieria"

SELECT facultad.nombre, programa.nombre FROM facultad
JOIN programa ON facultad.id = programa.idfacultad 
WHERE facultad.nombre="Ingenieria"

SELECT facultad.nombre, programa.nombre FROM facultad
JOIN programa ON facultad.id = programa.idfacultad AND facultad.nombre="Ingenieria"

SELECT programa.nombre, asignatura.nombre
FROM programa 
JOIN malla ON programa.id = malla.idprograma
JOIN asignatura ON malla.idasignatura = asignatura.id AND programa.nombre="T Desarrollo SW";

#Ojo Ta malo
SELECT programa.nombre, asignatura.nombre
FROM programa 
JOIN asignatura ON programa.id = asignatura.id AND programa.nombre="T Desarrollo SW";


