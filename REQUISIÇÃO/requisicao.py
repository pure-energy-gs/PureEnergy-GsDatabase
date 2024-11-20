import oracledb
import json
import pandas as pd
from datetime import datetime

# Função para criar conexão
def criar_conexao():
    try:
        # Defina a string de conexão (DSN)
        dsnStr = oracledb.makedsn("oracle.fiap.com.br", 1521, "ORCL")
        
        # Estabelece a conexão
        conn = oracledb.connect(
            user="rm553621",
            password="051102",
            dsn=dsnStr
        )
        
        print("Conexão estabelecida com sucesso.")
        return conn
    
    except oracledb.DatabaseError as e:
        print("Erro ao conectar ao banco:", e)
        return None

# Função para tratar datetime e convertê-los para string
def converter_datetime(dados):
    for tabela in dados:
        for i, registro in enumerate(dados[tabela]):
            for chave, valor in registro.items():
                if isinstance(valor, datetime):  # Verifica se o valor é do tipo datetime
                    registro[chave] = valor.strftime('%Y-%m-%d %H:%M:%S')  # Converte para string
    return dados

# Função para exportar dados de todas as tabelas para JSON
def exportar_para_json():
    conn = criar_conexao()
    
    if conn is None:
        return

    # Consultas SQL para extrair dados de todas as tabelas
    tabelas = [
        "T_PE_USUARIOS",
        "T_PE_ENDERECOS",
        "T_PE_RESIDENCIAS",
        "T_PE_COMODOS",
        "T_PE_ELETRODOMESTICOS",
        "T_PE_CONSUMO_MENSAL",
        "T_PE_PONTUACAO_USUARIO"
    ]
    
    dados = {}

    try:
        cursor = conn.cursor()
        
        # Executa a consulta para cada tabela e armazena o resultado
        for tabela in tabelas:
            query = f"SELECT * FROM {tabela}"
            cursor.execute(query)
            colunas = [col[0] for col in cursor.description]  # Obtém os nomes das colunas
            registros = cursor.fetchall()  # Obtém todos os registros

            # Converte os dados em um dicionário
            dados[tabela] = [dict(zip(colunas, registro)) for registro in registros]
        
        # Converte qualquer campo datetime para string
        dados = converter_datetime(dados)
        
        # Salva os dados em um arquivo JSON
        with open('dados_exportados.json', 'w', encoding='utf-8') as f:
            json.dump(dados, f, ensure_ascii=False, indent=4)
        
        print("Dados exportados para JSON com sucesso.")

    except oracledb.DatabaseError as e:
        print("Erro ao exportar dados:", e)
    
    finally:
        cursor.close()
        conn.close()

# Chama a função para exportar os dados
exportar_para_json()
