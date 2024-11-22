CREATE OR REPLACE PROCEDURE ExportaDadosParaJSON
AS
  vJsonUsuarios CLOB;
  vJsonEnderecos CLOB;
  vJsonResidencias CLOB;
  vJsonComodos CLOB;
  vJsonEletrodomesticos CLOB;
  vJsonConsumoMensal CLOB;
  vJsonPontuacao CLOB;
BEGIN

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_usuario' VALUE id_usuario,
               'nome' VALUE nome,
               'email' VALUE email
             )
           )
    INTO vJsonUsuarios
    FROM T_PE_USUARIOS;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar usuários: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_endereco' VALUE id_endereco,
               'id_usuario' VALUE id_usuario,
               'logradouro' VALUE logradouro,
               'numero' VALUE numero,
               'complemento' VALUE complemento,
               'bairro' VALUE bairro,
               'cidade' VALUE cidade,
               'estado' VALUE estado,
               'cep' VALUE cep
             )
           )
    INTO vJsonEnderecos
    FROM T_PE_ENDERECOS;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar endereços: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_residencia' VALUE id_residencia,
               'id_usuario' VALUE id_usuario,
               'tipo_residencia' VALUE tipo_residencia,
               'quantidade_pessoas' VALUE quantidade_pessoas
             )
           )
    INTO vJsonResidencias
    FROM T_PE_RESIDENCIAS;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar residências: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_comodo' VALUE id_comodo,
               'id_usuario' VALUE id_usuario,
               'nome_comodo' VALUE nome_comodo,
               'descricao' VALUE descricao
             )
           )
    INTO vJsonComodos
    FROM T_PE_COMODOS;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar cômodos: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_eletrodomestico' VALUE id_eletrodomestico,
               'id_comodo' VALUE id_comodo,
               'nome_eletrodomestico' VALUE nome_eletrodomestico,
               'potencia_watts' VALUE potencia_watts,
               'horas_uso_dia' VALUE horas_uso_dia,
               'descricao' VALUE descricao
             )
           )
    INTO vJsonEletrodomesticos
    FROM T_PE_ELETRODOMESTICOS;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar eletrodomésticos: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_consumo_mensal' VALUE id_consumo_mensal,
               'id_usuario' VALUE id_usuario,
               'mes_referencia' VALUE TO_CHAR(mes_referencia, 'YYYY-MM'),
               'consumo_mensal_kwh' VALUE consumo_mensal_kwh
             )
           )
    INTO vJsonConsumoMensal
    FROM T_PE_CONSUMO_MENSAL;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar consumo mensal: ' || SQLERRM);
  END;

  BEGIN
    SELECT JSON_ARRAYAGG(
             JSON_OBJECT(
               'id_pontuacao' VALUE id_pontuacao,
               'id_usuario' VALUE id_usuario,
               'pontos_totais' VALUE pontos_totais,
               'data_atualizacao' VALUE TO_CHAR(data_atualizacao, 'YYYY-MM-DD')
             )
           )
    INTO vJsonPontuacao
    FROM T_PE_PONTUACAO_USUARIO;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro ao exportar pontuação: ' || SQLERRM);
  END;

  DBMS_OUTPUT.PUT_LINE('Exportação de dados concluída:');
  DBMS_OUTPUT.PUT_LINE('Usuários: ' || vJsonUsuarios);
  DBMS_OUTPUT.PUT_LINE('Endereços: ' || vJsonEnderecos);
  DBMS_OUTPUT.PUT_LINE('Residências: ' || vJsonResidencias);
  DBMS_OUTPUT.PUT_LINE('Cômodos: ' || vJsonComodos);
  DBMS_OUTPUT.PUT_LINE('Eletrodomésticos: ' || vJsonEletrodomesticos);
  DBMS_OUTPUT.PUT_LINE('Consumo Mensal: ' || vJsonConsumoMensal);
  DBMS_OUTPUT.PUT_LINE('Pontuação: ' || vJsonPontuacao);
END;

BEGIN
    ExportaDadosParaJSON;
END;