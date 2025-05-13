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
