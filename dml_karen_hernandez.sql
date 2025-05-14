/*SELECT*/

/*1. Mostrar los datos de todas las regiones.*/
SELECT *
FROM 
	regiones;
	
/*2. Obtener los datos de todos los municipios.*/
SELECT * 
FROM 
	municipios;

/*3. Mostrar todos los municipios ordenados por código de departamento.*/
SELECT *
FROM 
	municipios ORDER BY cod_depto; 

/*4. Listar los datos de todos los departamentos que pertenecen a la región con código 6.*/
SELECT *
FROM
	departamentos
WHERE 
	cod_region =6;
	
/*5. Seleccionar a los ciudadanos que pertenecen al municipio con código 901, Los datos a mostrar
son DPI, nombre, apellido, dirección y teléfono móvil.*/
SELECT
	dpi,
	CONCAT(apellido,", ", nombre)AS nombre_completo,
	direccion,
	tel_movil
FROM 
	ciudadanos
WHERE 
	cod_muni=901;
	
/*6. Mostrar todos los datos de los ciudadanos que tiene el apellido Pérez.
Importante:
• Tomar en cuenta que el apellido puede o no tener tilde.
• No importa si el apellido se encuentra al inicio o al final.*/
SELECT * 
FROM 
	ciudadanos
WHERE 
	apellido LIKE "%Pérez%";
	
/*7. Listar a todos los departamentos ordenados por código de región.*/
SELECT *
FROM 
	departamentos
ORDER BY
	cod_region;
	
/*8. Mostrar los datos de todos los ciudadanos que pertenecen al municipio con código 101,
ordenar los datos por código de municipio y apellido.*/
SELECT *
FROM 
	ciudadanos 
WHERE 
	cod_muni=101
ORDER BY 
	cod_muni,
	apellido;
	
/*9. Obtener todos los municipios que finalizan con la letra z.*/
SELECT *
FROM 
	municipios
WHERE 
	nombre_municipio LIKE '%z';
	
/*10. Mostrar dpi, nombre completo (concatenar nombre y apellido) y teléfono móvil de los
ciudadanos del municipio con código 101, ordenar los datos por apellido de forma
descendente.*/
SELECT 
	dpi,
	CONCAT (nombre,", ", apellido)AS nombre_completo,
	tel_movil
FROM 
	ciudadanos 
WHERE
	cod_muni=101 
ORDER BY 
	apellido DESC;
	
/*11. Mostrar todos los ciudadanos que poseen nivel académico 3 y pertenecen al municipio 102,
ordenar los datos por código de municipio y apellido.*/
SELECT *
FROM 
	ciudadanos 
WHERE 
	cod_nivel_acad=3
AND   
	cod_muni=102
ORDER BY
	cod_muni,
	apellido;  /*NO EXITEN CIUDADANOS QUE POSEAN NIVEL 3 ACADEMICO Y QUE SEAN DEL MUNICIPIO 102*/
	
/*INSERT*/

/*12. Agregar un nuevo Ciudadano*/
INSERT INTO ciudadanos(
	dpi,
	apellido,
	nombre,
	direccion,
	tel_casa,
	tel_movil,
	email,
	fechanac,
	cod_nivel_acad,
	cod_muni)
VALUES(
	2283761300101,
	"Zoila Nue",
	"Vaciuda Dana",
	"1 calle 1-11 zona 1",
	23234545,
	56567878,
	"zoilavd@mail.com",
	"1995/01/01", 
	5,
	101);
/*verificar si el nuevo ciudadano se a registrado con exito*/
SELECT * 
FROM
	ciudadanos
WHERE 
	dpi=2283761300101;
	
/*13. Agregar una nueva región, invente los datos.*/
INSERT INTO regiones (
	cod_region,
	nombre,
	descripcion)
VALUES (
	10, 
	"Región X",
	"Región de prueba");
/*verificar si la nueva region fue registrada con exito*/
SELECT *
FROM 
	regiones;

/*14. Agregar un nuevo departamento para la región inventada.*/
INSERT INTO departamentos (
	cod_depto, 
	nombre_depto, 
	cod_region)
VALUES (25, 'Departamento Ficticio', 10);
/*verificar si el nuevo departamento fue registrado con exito*/
SELECT *
FROM  
	departamentos
WHERE 
	cod_depto=25;
	
/*15. Agregar un nuevo municipio en el departamento creado en el inciso anterior.*/
INSERT INTO municipios (
	cod_muni,
	nombre_municipio,
	cod_depto)
VALUES (
	2218,
	"Municipio Ficticio",
	23);
/*Verificar si el nuevo municipio fue registrado con exito*/
SELECT *
FROM
	municipios
WHERE 
	cod_muni=2218;
	
/*16. Agregar un nuevo nivel académico, invente los datos.*/
INSERT INTO nivelesacademicos (
	cod_nivel_acad,
	nombre,
	descripcion)
VALUES (
	9,
	"Nivel Ficticio",
	"Nivel agregado de prueba");
/*Verificar si el nuevo nivel academico fue agregado exitosamente*/
SELECT * 
FROM 
	nivelesacademicos
WHERE 
	cod_nivel_acad=9;

/*17. Agregar nombre, teléfono de casa, teléfono móvil, código de nivel académico, código de
municipio y dpi para un ciudadano. (invente los datos).*/
INSERT INTO ciudadanos (
	nombre,
	apellido,
	tel_casa,
	tel_movil,
	cod_nivel_acad,
	cod_muni,
	dpi)
VALUES (
	"Karen Mishel",
	"Hernández Coché",
	12345678,
	87654321,
	9,
	2218,
	1111222233334);
/*verificar si el nuevo ciudadano se a registrado con exito*/
SELECT *
FROM ciudadanos 
WHERE dpi=1111222233334;

/*UPDATE*/

/*18. Cambiar la dirección y el teléfono para el ciudadano con el DPI 2283761300101, los nuevos
datos son:
Dirección: 7ma. calle 7-77 zona 7
Teléfono de casa: 22224444*/	
UPDATE 
	ciudadanos 
SET 
	direccion="7ma. calle 7-77 zona 7",
	tel_casa="22224444"
WHERE 
	dpi=2283761300101;
/*Verificar si el cambio de datos al ciudadano fue resgistrado con exito*/
SELECT *
FROM ciudadanos
WHERE dpi=2283761300101;

/*19. Modificar el correo electrónico para el ciudadano con el DPI 4455667780105 este debe ser
zoyelnuevo@mail.com.*/
UPDATE 
	ciudadanos
SET 
	email="zoyelnuevo@mail.com"
WHERE 
	dpi=4455667780105;
/*Verificar si el cambio de datos al ciudadano fue registrado con exito*/
SELECT *
FROM ciudadanos
WHERE dpi=4455667780105; /*Este ciudadano no existe en la base de datos*/

/*20. Modificar Apellido, dirección, teléfono de casa, teléfono móvil y fecha de nacimiento de algún
ciudadano existente, invente todos los datos.*/
UPDATE 
	ciudadanos
SET 
	apellido="Coché Hernández",
	direccion="Calzada atanasio tzul 51 calle zona 12",
	tel_casa="87654321",
	tel_movil="12345678",
	fechanac="2007/06/10"
WHERE 
	dpi=1111222233334;
/*Verificar si el cambio de datos al ciudadano fue registrado con exito*/
SELECT *
FROM ciudadanos
WHERE dpi=1111222233334;

/*21. Cambiar el nombre de la región agregada en el inciso 13, el nombre debe ser Región 13.*/
UPDATE 
	regiones
SET 
	nombre="Región 13"
WHERE 
	cod_region=10;
/*Verificar si el cambio de datos al ciudadano fue registrado con exito*/
SELECT *
FROM regiones
WHERE cod_region=10;

/*22. Modificar los datos del nivel académico agregado en el inciso 16, el nombre debe ser Nivel 16 y
en la descripción colocar el texto nombre modificado en la consulta 22.*/
UPDATE 
	nivelesacademicos
SET 
	nombre="Nivel 16",
	descripcion="nombre modificado en la consulta 22"
WHERE 
	cod_nivel_acad=9;
/*Verificar si el cambio de datos al ciudadano fue registrado con exito*/
SELECT * 
FROM 
	nivelesacademicos
WHERE 
	cod_nivel_acad=9;
	
/*DELETE*/

/*23. Eliminar el nivel académico inventado.*/
DELETE 
FROM 
	nivelesacademicos
WHERE 
	cod_nivel_acad=9;

/*24. Eliminar todos los ciudadanos que nacieron en el municipio con el código 2217*/
DELETE
FROM 
	ciudadanos 
WHERE
	cod_muni=2217;

/*25. Eliminar al ciudadano con DPI 2283761300101*/ 
DELETE
FROM 
	ciudadanos
WHERE 
	dpi=2283761300101;

/*26. Eliminar a todos los ciudadanos que nacieron en el municipio 101 y que tienen fecha de
nacimiento menor a 1980.*/	
DELETE 
FROM 
	ciudadanos
WHERE 
	cod_muni = 101 
	AND 
	fechanac < '1980-01-01';

/*27. Eliminar todos los departamentos de la región no. 7*/
DELETE 
FROM 
	departamentos 
WHERE 
	cod_region=7; /*no existe el codigo de region 7*/
	
/*28. Eliminar a los ciudadanos con teléfono móvil 33734648 y teléfono de casa 21243830*/
DELETE 
FROM 
	ciudadanos
WHERE 
	tel_movil = '33734648' 
	AND 
	tel_casa = '21243830';