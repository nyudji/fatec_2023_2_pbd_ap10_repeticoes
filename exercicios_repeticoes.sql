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
