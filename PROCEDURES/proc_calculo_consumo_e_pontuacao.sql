
CREATE OR REPLACE FUNCTION FN_CALCULAR_CONSUMO_DIARIO(
    p_potencia_watts NUMBER,
    p_horas_uso_dia NUMBER
) RETURN NUMBER IS
    v_consumo_diario_kwh NUMBER;
BEGIN
    v_consumo_diario_kwh := (p_potencia_watts * p_horas_uso_dia) / 1000;
    RETURN v_consumo_diario_kwh;
END;

CREATE OR REPLACE FUNCTION FN_CALCULAR_PONTUACAO(
    p_consumo_mensal_kwh NUMBER
) RETURN NUMBER IS
    v_pontuacao NUMBER;
BEGIN
    IF p_consumo_mensal_kwh <= 100 THEN
        v_pontuacao := 1000;
    ELSIF p_consumo_mensal_kwh <= 200 THEN
        v_pontuacao := 800;
    ELSIF p_consumo_mensal_kwh <= 300 THEN
        v_pontuacao := 600;
    ELSE
        v_pontuacao := 400;
    END IF;
    RETURN v_pontuacao;
END;