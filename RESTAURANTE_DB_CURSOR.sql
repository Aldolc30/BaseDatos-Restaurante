--------------------- CURSOR ---------------------
/*
Con estructura for o while. Cuantas veces ha preparado un plato o receta un determinado chef en la empresa 
y el dinero que generó.
*/
DO $$
DECLARE
	NUM1 INT = 0;
	TABLA_DATO RECORD;
	NUM INT;
	NUM2 REAL = 0;
	NUMCHEF INT = 10;
	
	CURSOR1 CURSOR IS
	SELECT * FROM CHEF
	INNER JOIN RECETA ON RECETA.ID_CHEF = CHEF.ID_CHEF
	WHERE CHEF.ID_CHEF = NUMCHEF;
	
	CURSOR2 CURSOR IS
	SELECT * FROM FACTURA
	INNER JOIN DETALLE_FACTURA DF ON DF.ID_FACTURA = FACTURA.ID_FACTURA
	INNER JOIN PLATO ON DF.ID_PLATO = PLATO.ID_PLATO
	INNER JOIN RECETA ON PLATO.ID_PLATO = RECETA.ID_PLATO
	INNER JOIN CHEF ON RECETA.ID_CHEF = CHEF.ID_CHEF
	WHERE CHEF.ID_CHEF = NUMCHEF;

BEGIN
	FOR NUM IN CURSOR1 LOOP
	NUM1 = NUM1 + COUNT(NUM.ID_CHEF);
	END LOOP;
	
	FOR NUM IN CURSOR2 LOOP
	NUM2 = NUM2 + SUM(NUM.VALOR_NETO);
	END LOOP;
	
OPEN CURSOR1;
FETCH CURSOR1 INTO TABLA_DATO;

RAISE NOTICE 'Nombre: %, Apellido: %, Cantidad: %, Total: %',
				TABLA_DATO.NOMB_CHEF,TABLA_DATO.APELL_CHEF, NUM1, NUM2;

END $$
LANGUAGE 'plpgsql'