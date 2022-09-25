USE tienda;
# --- 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM producto;
# --- 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM producto;
# --- 3. Llista totes les columnes de la taula producto.
SELECT * FROM producto;
# --- 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio AS 'precio EUR', ROUND(precio*0.98,2) AS 'precio USD' FROM producto;
# --- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). 
#         Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS 'nom de producto', precio AS 'euros', ROUND(precio*0.98,2) AS 'dòlars' FROM producto;
# --- 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;
# --- 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;
# --- 8. Llista el nom de tots els fabricants en una columna, 
#         i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(SUBSTR(nombre,1,2)) FROM fabricante;
# --- 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM producto;
# --- 10. Llista els noms i els preus de tots els productes de la taula producto, 
#         truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, FLOOR(precio) FROM producto;
# --- 11. Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT codigo_fabricante FROM producto ORDER BY codigo_fabricante ASC;
# --- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT(codigo_fabricante) FROM producto ORDER BY codigo_fabricante ASC;
# --- 13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
# --- 14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
# --- 15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, 
#         pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
# --- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;
# --- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. 
#         La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3,2;
# --- 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). 
#         NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
# --- 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). 
#         NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
# --- 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
# --- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante);
# --- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. 
#         Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY fabricant;
# --- 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, 
#         de tots els productes de la base de dades.
SELECT p.codigo AS 'codigo producto', p.nombre AS producte, f.codigo AS 'codigo fabricante', f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante);
# --- 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY preu ASC
LIMIT 1;
# --- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY preu DESC
LIMIT 1;
# --- 26. Retorna una llista de tots els productes del fabricant Lenovo.
SELECT p.nombre
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Lenovo';
# --- 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT p.nombre
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Crucial' AND precio > 200;
# --- 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
# --- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
# --- 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
# Opción 1
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre LIKE '%e';
# Opción 2
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre REGEXP('e$');
# --- 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w 
#         en el seu nom.
# Opción 1
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre LIKE '%w%';
# Opción 2
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre REGEXP('w');
# --- 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, 
#         de tots els productes que tinguin un preu major o igual a 180 €. 
#         Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.nombre AS 'Producto', precio, f.nombre AS 'Fabricante'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE precio >= 180
ORDER BY precio DESC, Producto ASC;
# --- 33. Retorna un llistat amb el codi i el nom de fabricant, 
#         solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT f.codigo, f.nombre
FROM fabricante f
JOIN producto p
  ON (f.codigo = p.codigo_fabricante)
GROUP BY (f.codigo);
# --- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, 
#         juntament amb els productes que té cadascun d'ells. 
#         El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto' 
FROM fabricante f
LEFT JOIN producto p
  ON (f.codigo = p.codigo_fabricante);
# --- 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto' 
FROM fabricante f
LEFT JOIN producto p
  ON (f.codigo = p.codigo_fabricante)
WHERE p.nombre IS NULL;
# --- 36. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo';
# --- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. 
#         (Sense usar INNER JOIN).
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND precio = (
	SELECT p.precio
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
    ORDER BY p.precio DESC
    LIMIT 1
);
# --- 38. Llista el nom del producte més car del fabricant Lenovo.
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1;
# --- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Hewlett-Packard'
ORDER BY p.precio ASC
LIMIT 1;
# --- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND precio >= (
	SELECT p.precio
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
    ORDER BY p.precio DESC
    LIMIT 1
);
# --- 41. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Asus' AND precio >= (
	SELECT AVG(p.precio)
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Asus'
    ORDER BY p.precio DESC
);

# --- Base de dades Universidad
USE universidad;
# --- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, 
#     visualitza el diagrama E-R en un editor i efectua les següents consultes:

# --- 42. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
#         El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;
# --- 43. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2, telefono
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;
# --- 44. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
# --- 45. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades 
#         i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2, telefono, nif
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
# --- 46. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, 
#         en el tercer curs del grau que té l'identificador 7.
SELECT id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado 
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
# --- 47. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
#         El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
#         El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre 'departamento'
FROM persona p
JOIN profesor pr ON (id_profesor = p.id)
JOIN departamento d ON (d.id = pr.id_departamento)
WHERE tipo = 'profesor'
ORDER BY apellido1, apellido2, nombre;
# --- 48. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre, anyo_inicio, anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
JOIN asignatura a ON a.id = ama.id_asignatura
WHERE nif = '26902806M';
# --- 49. Retorna un llistat amb el nom de tots els departaments que tenen professors/es 
#         que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT d.nombre AS 'departamento'
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a USING(id_profesor)
JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
GROUP BY departamento;

# --- 50. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT p.nombre 'alumno/a'
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
WHERE p.tipo = 'alumno' AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019
GROUP BY p.nombre;

# --- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

# --- 51. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
#         El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
#         El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
#         El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
# --- 52. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.tipo = 'profesor' AND d.nombre IS NULL;
# --- 53. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN departamento d ON d.id = pr.id_departamento
WHERE p.nombre IS NULL;
# --- 54. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor' AND a.nombre IS NULL;
# --- 55. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN asignatura a USING (id_profesor)
WHERE p.nombre IS NULL;
# --- 56. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre, COUNT(ama.id_curso_escolar)
FROM universidad.departamento d
LEFT JOIN universidad.profesor p ON p.id_departamento = d.id
LEFT JOIN universidad.asignatura a USING (id_profesor)
LEFT JOIN universidad.alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id
GROUP BY d.nombre
HAVING COUNT(ama.id_curso_escolar) = 0;

# --- Consultes resum:

# --- 57. Retorna el nombre total d'alumnes que hi ha.
SELECT count(id)
FROM persona
WHERE tipo = 'alumno';
# --- 58. Calcula quants alumnes van néixer en 1999.
SELECT count(id)
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
# --- 59. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, 
#         una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
#         El resultat només ha d'incloure els departaments que tenen professors/es associats i 
#         haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS 'departamento', count(p.id) AS Total
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor 
JOIN departamento d ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY Total DESC;
# --- 60. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
#         Tingui en compte que poden existir departaments que no tenen professors/es associats. 
#         Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS 'departamento', count(p.id) AS Total
FROM persona p
RIGHT JOIN profesor pr ON p.id = pr.id_profesor 
RIGHT JOIN departamento d ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY Total DESC;
# --- 61. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
#         Tingues en compte que poden existir graus que no tenen assignatures associades. 
#         Aquests graus també han d'aparèixer en el llistat. 
#         El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.id
ORDER BY total DESC;
# --- 62. Retorna un llistat amb el nom de tots els graus existents en la base de dades i 
#         el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.id
HAVING Total > 40
ORDER BY total DESC;
# --- 63. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
#         El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i 
#         la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.id, g.nombre AS 'Grado', a.tipo AS 'Tipo asignatura', SUM(creditos) AS 'Total creditos'
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre, a.tipo;
# --- 64. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. 
#         El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i 
#         una altra amb el nombre d'alumnes matriculats.
SELECT anyo_inicio, COUNT(DISTINCT(ama.id_alumno))
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY anyo_inicio;
# --- 65. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. 
#         El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. 
#         El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. 
#         El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, count(a.nombre) 'total'
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor'
GROUP BY p.id
ORDER BY total DESC;
# --- 66. Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;
# --- 67. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre AS 'departamento', a.nombre AS 'asignatura'
FROM persona p
JOIN profesor pr ON (id_profesor = p.id)
JOIN departamento d ON d.id = pr.id_departamento
LEFT JOIN asignatura a USING (id_profesor)
WHERE p.tipo = 'profesor' AND a.id IS NULL
ORDER BY departamento, p.apellido1, p.apellido2, p.nombre;