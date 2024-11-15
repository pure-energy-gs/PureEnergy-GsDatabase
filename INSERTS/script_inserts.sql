INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES ('U001', 'Maria Silva', 'maria.silva@email.com', 'senha123');

INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES ('U002', 'João Oliveira', 'joao.oliveira@email.com', 'senha456');

INSERT INTO T_PE_USUARIOS (id_usuario, nome, email, senha) 
VALUES ('U003', 'Ana Santos', 'ana.santos@email.com', 'senha789');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (1, 'U001', 'Rua das Flores', '123', 'Apto 301', 'Centro', 'São Paulo', 'SP', '01001-000');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (2, 'U002', 'Av. Paulista', '1000', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310-100');

INSERT INTO T_PE_ENDERECOS (id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)
VALUES (3, 'U003', 'Rua das Palmeiras', '45', 'Casa', 'Jardim América', 'Campinas', 'SP', '13025-300');

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
VALUES (1, 'U001', 'Apartamento', 3);

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
VALUES (2, 'U002', 'Casa', 4);

INSERT INTO T_PE_RESIDENCIAS (id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)
VALUES (3, 'U003', 'Apartamento', 2);

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (1, 'U001', 'Sala de Estar', 'Principal área de convivência');

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (2, 'U001', 'Cozinha', 'Cozinha com eletrodomésticos modernos');

INSERT INTO T_PE_COMODOS (id_comodo, id_usuario, nome_comodo, descricao)
VALUES (3, 'U002', 'Quarto', 'Quarto principal com suíte');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (1, 1, 'Televisão', 150, 5, 'Smart TV LED 40 polegadas');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (2, 2, 'Geladeira', 250, 24, 'Geladeira Frost Free 450L');

INSERT INTO T_PE_ELETRODOMESTICOS (id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)
VALUES (3, 2, 'Micro-ondas', 1200, 1, 'Micro-ondas Inox 20L');

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (1, 'U001', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 320.5);

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (2, 'U002', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 450.0);

INSERT INTO T_PE_CONSUMO_MENSAL (id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)
VALUES (3, 'U003', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 280.3);

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (1, 'U001', 150, TO_DATE('2024-10-15', 'YYYY-MM-DD'));

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (2, 'U002', 200, TO_DATE('2024-10-15', 'YYYY-MM-DD'));

INSERT INTO T_PE_PONTUACAO_USUARIO (id_pontuacao, id_usuario, pontos_totais, data_atualizacao)
VALUES (3, 'U003', 180, TO_DATE('2024-10-15', 'YYYY-MM-DD'));



