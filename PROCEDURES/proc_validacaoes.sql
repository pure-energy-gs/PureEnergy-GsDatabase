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
        
        RETURN 'Erro ao validar e-mail: ' || SQLERRM;
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
        
        RETURN 'Erro ao validar CEP: ' || SQLERRM;
END;

CREATE OR REPLACE FUNCTION FN_VALIDAR_USUARIO (p_id_usuario IN NUMBER)
RETURN BOOLEAN
IS
    v_count NUMBER;
BEGIN
    -
    SELECT COUNT(*)
    INTO v_count
    FROM T_PE_USUARIOS
    WHERE id_usuario = p_id_usuario;

    
    RETURN v_count > 0; 
EXCEPTION
    WHEN OTHERS THEN
        
        RAISE_APPLICATION_ERROR(-20024, 'Erro ao validar usuário: ' || SQLERRM);
END;

