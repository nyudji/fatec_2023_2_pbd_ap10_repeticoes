--1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o
--enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.
--https://www.beecrowd.com.br/judge/pt/problems/view/1059
--Gerar inteiros no intervalo de -50 a 50.
--USANDO LOOP
DO $$ 
DECLARE
    contador INTEGER := 1;
    numero_aleatorio INTEGER;
BEGIN
    WHILE contador <= 1 LOOP -- Altere 100 para o número desejado de valores aleatórios
        -- Gere um número inteiro aleatório no intervalo de -50 a 50
        numero_aleatorio := floor(random() * 101) - 50;
        
        -- Exiba o número aleatório na saída
        RAISE NOTICE 'Número aleatório: %', numero_aleatorio;
        
        contador := contador + 1;
    END LOOP;
END $$;

--https://www.beecrowd.com.br/judge/pt/problems/view/1060
--Gerar inteiros no intervalo de 20 a 50.
--USANDO WHILE
DO $$ 
DECLARE
    contador INTEGER := 1;
    numero_aleatorio INTEGER;
BEGIN
    WHILE contador <= 100 LOOP -- Altere 100 para o número desejado de valores aleatórios
        numero_aleatorio := floor(random() * 31) + 20;
        RAISE NOTICE 'Número aleatório (WHILE): %', numero_aleatorio;
        contador := contador + 1;
    END LOOP;
END $$;

--://www.beecrowd.com.br/judge/pt/problems/view/1071
-- inteiros no intervalo de 1 a 100.
--https://www.beecrowd.com.br/judge/pt/problems/view/1101
--USANDO FOR 
DO $$ 
DECLARE
    contador INTEGER;
    numero_aleatorio INTEGER;
BEGIN
    FOR contador IN 1..100 LOOP -- Intervalo de 1 a 100
        numero_aleatorio := floor(random() * 100) + 1; -- Intervalo de 1 a 100
        RAISE NOTICE 'Número aleatório (FOR): %', numero_aleatorio;
    END LOOP;
END $$;



--1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
-- a regra de Sarrus. Veja a regra aqui:
--https://en.wikipedia.org/wiki/Rule_of_Sarrus

CREATE OR REPLACE FUNCTION calcular_determinante(matriz double precision[][])
RETURNS double precision AS
$$
DECLARE
    det double precision;
BEGIN
    IF array_length(matriz, 1) IS DISTINCT FROM 3 OR array_length(matriz, 2) IS DISTINCT FROM 3 THEN
        RAISE EXCEPTION 'A matriz não é 3x3';
    END IF;

    det := (matriz[1][1] * matriz[2][2] * matriz[3][3] +
            matriz[1][2] * matriz[2][3] * matriz[3][1] +
            matriz[1][3] * matriz[2][1] * matriz[3][2]) -
           (matriz[1][3] * matriz[2][2] * matriz[3][1] +
            matriz[1][2] * matriz[2][1] * matriz[3][3] +
            matriz[1][1] * matriz[2][3] * matriz[3][2]);

    RETURN det;
END;
$$
LANGUAGE plpgsql;
SELECT calcular_determinante(array[[3.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]]) AS determinante;
