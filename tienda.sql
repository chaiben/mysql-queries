SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio AS 'precio EUR', ROUND(precio*0.98,2) AS 'precio USD' FROM producto;
SELECT nombre AS 'nom de producto', precio AS 'euros', ROUND(precio*0.98,2) AS 'dòlars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTR(nombre,1,2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, FLOOR(precio) FROM producto;
SELECT codigo_fabricante FROM producto ORDER BY codigo_fabricante ASC;
SELECT DISTINCT(codigo_fabricante) FROM producto ORDER BY codigo_fabricante ASC;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante fº  ON (f.codigo = p.codigo_fabricante);
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY fabricant;
SELECT p.codigo AS 'codigo producto', p.nombre AS producte, f.codigo AS 'codigo fabricante', f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante);
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY preu ASC
LIMIT 1;
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant 
FROM producto p 
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
ORDER BY preu DESC
LIMIT 1;
SELECT p.nombre
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Lenovo';
SELECT p.nombre
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Crucial' AND precio > 200;
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre LIKE '%e';
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre REGEXP('e$');
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre LIKE '%w%';
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE f.nombre REGEXP('w');
SELECT p.nombre AS 'Producto', precio, f.nombre AS 'Fabricante'
FROM producto p
JOIN fabricante f 
  ON (f.codigo = p.codigo_fabricante)
WHERE precio >= 180
ORDER BY precio DESC, Producto ASC;
SELECT f.codigo, f.nombre
FROM fabricante f
JOIN producto p
  ON (f.codigo = p.codigo_fabricante)
GROUP BY (f.codigo);
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto' 
FROM fabricante f
LEFT JOIN producto p
  ON (f.codigo = p.codigo_fabricante);
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto' 
FROM fabricante f
LEFT JOIN producto p
  ON (f.codigo = p.codigo_fabricante)
WHERE p.nombre IS NULL;
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo';
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND precio = (
	SELECT p.precio
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
    ORDER BY p.precio DESC
    LIMIT 1
);
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1;
SELECT p.nombre
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Hewlett-Packard'
ORDER BY p.precio ASC
LIMIT 1;
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND precio >= (
	SELECT p.precio
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo'
    ORDER BY p.precio DESC
    LIMIT 1
);
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante
FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Asus' AND precio >= (
	SELECT AVG(p.precio)
	FROM producto p, fabricante f
	WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Asus'
    ORDER BY p.precio DESC
);