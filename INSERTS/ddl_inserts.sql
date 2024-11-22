INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES (90, 'Jose Neto', 'jose.neto@email.com', 'senha123');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (90, 90, 'Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01234-567');

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas) 
VALUES (90, 90, 'Apartamento', 3);

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (90, 90, 'Sala de Estar', 'Sala ampla com sofá e TV.');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (90, 90, 'TV LED', 150, 5, 'TV de 50 polegadas');

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (90, 90, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 250);

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (90, 90, 100, SYSDATE);

INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES (91, 'Keven Ike', 'keven.ike@email.com', 'senha456');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (91, 91, 'Av. Brasil', '456', 'Bloco B', 'Jardins', 'São Paulo', 'SP', '01345-678');

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas) 
VALUES (91, 91, 'Casa', 4);

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (91, 91, 'Cozinha', 'Cozinha com fogão e geladeira.');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (91, 91, 'Geladeira', 300, 8, 'Geladeira Frost Free');

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (91, 91, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 320);

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (91, 91, 200, SYSDATE);

INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES (92, 'Vitor Cruz', 'vitor.cruz@email.com', 'senha789');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (92, 92, 'Rua da Liberdade', '789', 'Casa 1', 'Liberdade', 'São Paulo', 'SP', '01456-789');

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas) 
VALUES (92, 92, 'Casa', 2);

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (92, 92, 'Quarto', 'Quarto com cama de casal.');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (92, 92, 'Ar Condicionado', 1500, 6, 'Ar condicionado Split');

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (92, 92, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 450);

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (92, 92, 150, SYSDATE);
