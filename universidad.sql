SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2, telefono
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2, telefono, nif
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado 
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre 'departamento'
FROM persona p
JOIN profesor pr ON (id_profesor = p.id)
JOIN departamento d ON (d.id = pr.id_departamento)
WHERE tipo = 'profesor'
ORDER BY apellido1, apellido2, nombre;
SELECT a.nombre, anyo_inicio, anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
JOIN asignatura a ON a.id = ama.id_asignatura
WHERE nif = '26902806M';
SELECT d.nombre AS 'departamento'
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a USING(id_profesor)
JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY departamento;

SELECT p.nombre 'alumno/a'
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
WHERE p.tipo = 'alumno' AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019
GROUP BY p.nombre;


SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.tipo = 'profesor' AND d.nombre IS NULL;
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.nombre IS NULL;
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor' AND a.nombre IS NULL;
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN asignatura a USING (id_profesor)
WHERE p.nombre IS NULL;
SELECT d.nombre, COUNT(ama.id_curso_escolar)
FROM universidad.departamento d
LEFT JOIN universidad.profesor p ON p.id_departamento = d.id
LEFT JOIN universidad.asignatura a USING (id_profesor)
LEFT JOIN universidad.alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id
GROUP BY d.nombre
HAVING COUNT(ama.id_curso_escolar) = 0;


SELECT count(id)
FROM persona
WHERE tipo = 'alumno';
SELECT count(id)
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS 'departamento', count(p.id) AS Total
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor 
JOIN departamento d ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY Total DESC;
SELECT d.nombre AS 'departamento', count(p.id) AS Total
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN departamento d ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY Total DESC;
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.id
ORDER BY total DESC;
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.id
HAVING Total > 40
ORDER BY total DESC;
SELECT g.id, g.nombre AS 'Grado', a.tipo AS 'Tipo asignatura', SUM(creditos) AS 'Total creditos'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre, a.tipo;
SELECT anyo_inicio, COUNT(DISTINCT(ama.id_alumno))
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, count(a.nombre) 'total'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor'
GROUP BY p.id
ORDER BY total DESC;
SELECT * FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre AS 'departamento', a.nombre AS 'asignatura'
FROM persona p
JOIN profesor pr ON (id_profesor = p.id)
JOIN departamento d ON d.id = pr.id_departamento
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor' AND a.id IS NULL
ORDER BY departamento, p.apellido1, p.apellido2, p.nombre;