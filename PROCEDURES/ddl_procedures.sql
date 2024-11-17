CREATE OR REPLACE PROCEDURE sp_inserir_usuario(
    p_id_usuario IN T_PE_USUARIOS.id_usuario%TYPE,
    p_nome IN T_PE_USUARIOS.nome%TYPE,
    p_email IN T_PE_USUARIOS.email%TYPE,
    p_senha IN T_PE_USUARIOS.senha%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha)
    VALUES (p_id_usuario, p_nome, p_email, p_senha);
END;


CREATE OR REPLACE PROCEDURE sp_inserir_endereco(
    p_id_endereco IN T_PE_ENDERECOS.id_endereco%TYPE,
    p_id_usuario IN T_PE_ENDERECOS.id_usuario%TYPE,
    p_logradouro IN T_PE_ENDERECOS.logradouro%TYPE,
    p_numero IN T_PE_ENDERECOS.numero%TYPE,
    p_complemento IN T_PE_ENDERECOS.complemento%TYPE,
    p_bairro IN T_PE_ENDERECOS.bairro%TYPE,
    p_cidade IN T_PE_ENDERECOS.cidade%TYPE,
    p_estado IN T_PE_ENDERECOS.estado%TYPE,
    p_cep IN T_PE_ENDERECOS.cep%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
    VALUES (p_id_endereco, p_id_usuario, p_logradouro, p_numero, p_complemento, p_bairro, p_cidade, p_estado, p_cep);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_residencia(
    p_id_residencia IN T_PE_RESIDENCIAS.id_residencia%TYPE,
    p_id_usuario IN T_PE_RESIDENCIAS.id_usuario%TYPE,
    p_tipo_residencia IN T_PE_RESIDENCIAS.tipo_residencia%TYPE,
    p_quantidade_pessoas IN T_PE_RESIDENCIAS.quantidade_pessoas%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
    VALUES (p_id_residencia, p_id_usuario, p_tipo_residencia, p_quantidade_pessoas);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_residencia(
    p_id_residencia IN T_PE_RESIDENCIAS.id_residencia%TYPE,
    p_id_usuario IN T_PE_RESIDENCIAS.id_usuario%TYPE,
    p_tipo_residencia IN T_PE_RESIDENCIAS.tipo_residencia%TYPE,
    p_quantidade_pessoas IN T_PE_RESIDENCIAS.quantidade_pessoas%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
    VALUES (p_id_residencia, p_id_usuario, p_tipo_residencia, p_quantidade_pessoas);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_comodo(
    p_id_comodo IN T_PE_COMODOS.id_comodo%TYPE,
    p_id_usuario IN T_PE_COMODOS.id_usuario%TYPE,
    p_nome_comodo IN T_PE_COMODOS.nome_comodo%TYPE,
    p_descricao IN T_PE_COMODOS.descricao%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
    VALUES (p_id_comodo, p_id_usuario, p_nome_comodo, p_descricao);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_eletrodomestico(
    p_id_eletrodomestico IN T_PE_ELETRODOMESTICOS.id_eletrodomestico%TYPE,
    p_id_comodo IN T_PE_ELETRODOMESTICOS.id_comodo%TYPE,
    p_nome_eletrodomestico IN T_PE_ELETRODOMESTICOS.nome_eletrodomestico%TYPE,
    p_potencia_watts IN T_PE_ELETRODOMESTICOS.potencia_watts%TYPE,
    p_horas_uso_dia IN T_PE_ELETRODOMESTICOS.horas_uso_dia%TYPE,
    p_descricao IN T_PE_ELETRODOMESTICOS.descricao%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
    VALUES (p_id_eletrodomestico, p_id_comodo, p_nome_eletrodomestico, p_potencia_watts, p_horas_uso_dia, p_descricao);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_consumo_mensal(
    p_id_consumo_mensal IN T_PE_CONSUMO_MENSAL.id_consumo_mensal%TYPE,
    p_id_usuario IN T_PE_CONSUMO_MENSAL.id_usuario%TYPE,
    p_mes_referencia IN T_PE_CONSUMO_MENSAL.mes_referencia%TYPE,
    p_consumo_mensal_kwh IN T_PE_CONSUMO_MENSAL.consumo_mensal_kwh%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
    VALUES (p_id_consumo_mensal, p_id_usuario, p_mes_referencia, p_consumo_mensal_kwh);
END;

CREATE OR REPLACE PROCEDURE sp_inserir_pontuacao(
    p_id_pontuacao IN T_PE_PONTUACAO_USUARIO.id_pontuacao%TYPE,
    p_id_usuario IN T_PE_PONTUACAO_USUARIO.id_usuario%TYPE,
    p_pontos_totais IN T_PE_PONTUACAO_USUARIO.pontos_totais%TYPE
)
AS
BEGIN
    INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais)
    VALUES (p_id_pontuacao, p_id_usuario, p_pontos_totais);
END;






