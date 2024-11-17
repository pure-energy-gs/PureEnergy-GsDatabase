CREATE OR REPLACE FUNCTION validar_email (p_email IN VARCHAR2) 
RETURN VARCHAR2 IS
    v_pattern VARCHAR2(100) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'; 
BEGIN
    
    IF NOT REGEXP_LIKE(p_email, v_pattern) THEN
        
        RAISE_APPLICATION_ERROR(-20001, 'Formato de e-mail inválido');
    END IF;
    
    
    RETURN 'E-mail válido';
EXCEPTION
    WHEN OTHERS THEN
        
        RETURN 'Erro: ' || SQLERRM;
END;


CREATE OR REPLACE FUNCTION validar_cep (p_cep IN VARCHAR2) 
RETURN VARCHAR2 IS
    v_pattern VARCHAR2(100) := '^\d{5}-\d{3}$'; 
BEGIN
    
    IF NOT REGEXP_LIKE(p_cep, v_pattern) THEN
        
        RAISE_APPLICATION_ERROR(-20003, 'Formato de CEP inválido');
    END IF;
    
   
    RETURN 'CEP válido';
EXCEPTION
    WHEN OTHERS THEN

        RETURN 'Erro: ' || SQLERRM;
END;