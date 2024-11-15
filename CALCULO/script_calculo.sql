CREATE OR REPLACE FUNCTION validar_email (p_email IN VARCHAR2) 
RETURN VARCHAR2 IS
    v_pattern VARCHAR2(100) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'; -- Expressão regular para validar o formato do e-mail
BEGIN
    -- Verifica se o e-mail corresponde ao padrão usando REGEXP_LIKE
    IF NOT REGEXP_LIKE(p_email, v_pattern) THEN
        -- Se o formato for inválido, gera uma exceção
        RAISE_APPLICATION_ERROR(-20001, 'Formato de e-mail inválido');
    END IF;
    
    -- Se o formato for válido, retorna uma mensagem de sucesso
    RETURN 'E-mail válido';
EXCEPTION
    WHEN OTHERS THEN
        -- Tratamento de exceção
        RETURN 'Erro: ' || SQLERRM;
END;


CREATE OR REPLACE FUNCTION validar_cep (p_cep IN VARCHAR2) 
RETURN VARCHAR2 IS
    v_pattern VARCHAR2(100) := '^\d{5}-\d{3}$'; -- Expressão regular para validar o formato do CEP (ex: 12345-678)
BEGIN
    -- Verifica se o CEP corresponde ao padrão usando REGEXP_LIKE
    IF NOT REGEXP_LIKE(p_cep, v_pattern) THEN
        -- Se o formato for inválido, gera uma exceção
        RAISE_APPLICATION_ERROR(-20003, 'Formato de CEP inválido');
    END IF;
    
    -- Se o formato for válido, retorna uma mensagem de sucesso
    RETURN 'CEP válido';
EXCEPTION
    WHEN OTHERS THEN
        -- Tratamento de exceção
        RETURN 'Erro: ' || SQLERRM;
END;




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
