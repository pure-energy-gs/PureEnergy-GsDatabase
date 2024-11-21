CREATE OR REPLACE PROCEDURE INSERIR_USUARIO (
    p_id_usuario IN NUMBER,
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2
) AS
BEGIN
    INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha)
    VALUES (p_id_usuario, p_nome, p_email, p_senha);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: Já existe um usuário com este ID ou e-mail.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro inesperado ao inserir usuário: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE INSERIR_ENDERECO (
    p_id_endereco IN NUMBER,
    p_id_usuario IN NUMBER,
    p_logradouro IN VARCHAR2,
    p_numero IN VARCHAR2,
    p_complemento IN VARCHAR2,
    p_bairro IN VARCHAR2,
    p_cidade IN VARCHAR2,
    p_estado IN VARCHAR2,
    p_cep IN VARCHAR2
) AS
BEGIN
    INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
    VALUES (p_id_endereco, p_id_usuario, p_logradouro, p_numero, p_complemento, p_bairro, p_cidade, p_estado, p_cep);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro: Já existe um endereço com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Erro inesperado ao inserir endereço: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE INSERIR_RESIDENCIA (
    p_id_residencia IN NUMBER,
    p_id_usuario IN NUMBER,
    p_tipo_residencia IN VARCHAR2,
    p_quantidade_pessoas IN NUMBER
) AS
BEGIN
    INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
    VALUES (p_id_residencia, p_id_usuario, p_tipo_residencia, p_quantidade_pessoas);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20006, 'Erro: O usuário especificado não existe.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20007, 'Erro: Já existe uma residência com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20008, 'Erro inesperado ao inserir residência: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE INSERIR_COMODO (
    p_id_comodo IN NUMBER,
    p_id_usuario IN NUMBER,
    p_nome_comodo IN VARCHAR2,
    p_descricao IN VARCHAR2
) AS
BEGIN
    INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
    VALUES (p_id_comodo, p_id_usuario, p_nome_comodo, p_descricao);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20009, 'Erro: O usuário especificado não existe.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20010, 'Erro: Já existe um cômodo com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20011, 'Erro inesperado ao inserir cômodo: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE INSERIR_ELETRODOMESTICO (
    p_id_eletrodomestico IN NUMBER,
    p_id_comodo IN NUMBER,
    p_nome_eletrodomestico IN VARCHAR2,
    p_potencia_watts IN NUMBER,
    p_horas_uso_dia IN NUMBER,
    p_descricao IN VARCHAR2
) AS
BEGIN
    INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
    VALUES (p_id_eletrodomestico, p_id_comodo, p_nome_eletrodomestico, p_potencia_watts, p_horas_uso_dia, p_descricao);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20012, 'Erro: O cômodo especificado não existe.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20013, 'Erro: Já existe um eletrodoméstico com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20014, 'Erro inesperado ao inserir eletrodoméstico: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE INSERIR_CONSUMO_MENSAL (
    p_id_consumo_mensal IN NUMBER,
    p_id_usuario IN NUMBER,
    p_mes_referencia IN DATE,
    p_consumo_mensal_kwh IN NUMBER
) AS
BEGIN
    INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
    VALUES (p_id_consumo_mensal, p_id_usuario, p_mes_referencia, p_consumo_mensal_kwh);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20015, 'Erro: O usuário especificado não existe.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20016, 'Erro: Já existe um registro de consumo mensal com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20017, 'Erro inesperado ao inserir consumo mensal: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE INSERIR_PONTUACAO_USUARIO (
    p_id_pontuacao IN NUMBER,
    p_id_usuario IN NUMBER,
    p_pontos_totais IN NUMBER,
    p_data_atualizacao IN DATE
) AS
BEGIN
    INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
    VALUES (p_id_pontuacao, p_id_usuario, p_pontos_totais, p_data_atualizacao);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20018, 'Erro: O usuário especificado não existe.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20019, 'Erro: Já existe um registro de pontuação com este ID.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20020, 'Erro inesperado ao inserir pontuação do usuário: ' || SQLERRM);
END;
