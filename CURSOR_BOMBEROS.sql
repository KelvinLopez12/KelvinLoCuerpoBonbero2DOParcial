/*ESTE CURSOR MUESTRA LAS COMUNIDADES, LA CANTIDAD DE SINIESTROS QUE SE HAN ATENDIDO
Y LOS BOMBEROS QUE HAN PARTICIPADO EN ESTA LABOR
*/
/*CURSOR*/
DO $$
/*DECLARAMOS EL CURSOR*/
DECLARE
	REGISTRO RECORD;
	CUR_COMUNIDAD CURSOR FOR 
	/*lA CONSULTA PRINCIPAL CUENTA LOS SERVICIOS*/
	SELECT 
	COMUNIDAD.NOMBRE_COMUNIDAD,
	BOMB.CANTIDAD AS CANTIDAD_BOMBEROS,
	COUNT(SERVICIO.ID_SERVICIO) AS CANTIDAD_SERVICIOS
	FROM COMUNIDAD 
	INNER JOIN SERVICIO ON SERVICIO.ID_COMUNIDAD=COMUNIDAD.ID_COMUNIDAD
	INNER JOIN 
	(
		/*ESTA SUBCONSULTA DEVUELVE EL NUM DE BOMBEROS QUE ATENNDIERON EN UNA COMUNIDAD*/
		SELECT 
		COMUNIDAD.NOMBRE_COMUNIDAD AS COMUNIDAD,
		COUNT(DISTINCT SERVICIOS_BOMBEROS.ID_BOMBERO) AS CANTIDAD
		FROM COMUNIDAD
		INNER JOIN SERVICIO ON SERVICIO.ID_COMUNIDAD=COMUNIDAD.ID_COMUNIDAD
		INNER JOIN SERVICIOS_BOMBEROS ON SERVICIOS_BOMBEROS.ID_SERVICIO=SERVICIO.ID_SERVICIO
		WHERE SERVICIOS_BOMBEROS.ASISTENCIA_SB='SI'
		GROUP BY COMUNIDAD
	) AS BOMB
	ON COMUNIDAD.NOMBRE_COMUNIDAD=BOMB.COMUNIDAD
	GROUP BY COMUNIDAD.NOMBRE_COMUNIDAD, CANTIDAD_BOMBEROS;
/*AQUI SE ABRE EL CURSOR*/
BEGIN
FOR REGISTRO IN CUR_COMUNIDAD LOOP
	RAISE NOTICE 'EN LA COMUNIDAD: % SE HAN ATENDIDO  % SINIESTOS ATENDIDOS POR % BOMBEROS',
	REGISTRO.NOMBRE_COMUNIDAD,REGISTRO.CANTIDAD_SERVICIOS, REGISTRO.CANTIDAD_BOMBEROS;
END LOOP ;
END $$
LANGUAGE 'plpgsql';

