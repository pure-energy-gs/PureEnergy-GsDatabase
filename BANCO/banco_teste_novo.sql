CREATE TABLE T_USUARIOS (
    id_usuario VARCHAR2 PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    senha VARCHAR2(50) NOT NULL
);

CREATE TABLE T_ENDERECOS (
    id_endereco NUMBER PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    logradouro VARCHAR2(100) NOT NULL,
    numero VARCHAR2(10),
    complemento VARCHAR2(50),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(2),
    cep VARCHAR2(10),
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIOS(id_usuario)
);

CREATE TABLE T_RESIDENCIAS (
    id_residencia NUMBER PRIMARY KEY,           
    id_usuario NUMBER NOT NULL,                 
    tipo_residencia VARCHAR2(50) NOT NULL,      
    quantidade_pessoas NUMBER NOT NULL,         
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIOS(id_usuario)  
);


CREATE TABLE T_COMODOS (
    id_comodo NUMBER PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    nome_comodo VARCHAR2(100) NOT NULL,
    descricao VARCHAR2(255),
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIOS(id_usuario)
);

CREATE TABLE T_ELETRODOMESTICOS (
    id_eletrodomestico NUMBER PRIMARY KEY,
    id_comodo NUMBER NOT NULL,
    nome_eletrodomestico VARCHAR2(100) NOT NULL,
    potencia_watts NUMBER NOT NULL,  
    horas_uso_dia NUMBER NOT NULL,   
    descricao VARCHAR2(255),
    FOREIGN KEY (id_comodo) REFERENCES T_COMODOS(id_comodo)
);


CREATE TABLE T_CONSUMO_MENSAL (
    id_consumo_mensal NUMBER PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    mes_referencia DATE NOT NULL,  
    consumo_mensal_kwh NUMBER NOT NULL,  
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIOS(id_usuario)
);

CREATE TABLE T_PONTUACAO_USUARIO (
    id_pontuacao NUMBER PRIMARY KEY, 
    id_usuario NUMBER NOT NULL,
    pontos_totais NUMBER DEFAULT 0,
    data_atualizacao DATE DEFAULT SYSDATE,
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES T_USUARIOS(id_usuario)
);
