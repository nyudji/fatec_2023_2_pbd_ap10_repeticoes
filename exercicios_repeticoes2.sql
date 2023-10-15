/*
Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
utilizando a regra de Sarrus

Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.
*/


CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;


DO
$$
DECLARE
	valor INT := valor_aleatorio_entre(-50, 50);
	valor2 INT := valor_aleatorio_entre(20, 50);
	valor3 INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor aleatório entre [-50 e 50] é: %', valor;
	RAISE NOTICE 'O valor aleatório entre [20 e 50] é: %', valor2;
	RAISE NOTICE 'O valor aleatório entre [1 e 100] é: %', valor3;
END;
$$


/*Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
utilizando a regra de Sarrus*/

DO
$$
DECLARE
    matriz INT[][] := ARRAY[ARRAY[0, 0, 0],
                            ARRAY[0, 0, 0],
                            ARRAY[0, 0, 0]];
    i INT;
    j INT;
BEGIN
    -- Preenche a matriz com valores aleatórios
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            matriz[i][j] := valor_aleatorio_entre(1, 12);
        END LOOP;
    END LOOP;

    -- Imprime a matriz gerada
    RAISE NOTICE 'Matriz:';
    FOR i IN 1..3 LOOP
        RAISE NOTICE '% % %', matriz[i][1], matriz[i][2], matriz[i][3];
    END LOOP;

    -- Calcula o determinante usando a regra de Sarrus
    RAISE NOTICE 'Determinante da matriz: %', 
        (matriz[1][1] * matriz[2][2] * matriz[3][3] +
         matriz[1][2] * matriz[2][3] * matriz[3][1] +
         matriz[1][3] * matriz[2][1] * matriz[3][2] -
         matriz[1][3] * matriz[2][2] * matriz[3][1] -
         matriz[1][2] * matriz[2][1] * matriz[3][3] -
         matriz[1][1] * matriz[2][3] * matriz[3][2]);
END;
$$