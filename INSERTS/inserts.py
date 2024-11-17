import oracledb
from datetime import datetime

def criar_conexao():
    try:
        dsnStr = oracledb.makedsn("oracle.fiap.com.br", 1521, "ORCL")
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

def fechar_conexao(conn):
    if conn:
        conn.close()
        print("Conexão fechada com sucesso.")

def chamar_procedure(conn, procedure_name, params):
    try:
        with conn.cursor() as cursor:
            cursor.callproc(procedure_name, params)
            print(f"Procedure {procedure_name} executada com sucesso.")
    except oracledb.DatabaseError as e:
        print(f"Erro ao executar a procedure {procedure_name}:", e)

def inserir_usuario(conn, id_usuario, nome, email, senha):
    chamar_procedure(conn, "inserir_usuario", [id_usuario, nome, email, senha])

def inserir_endereco(conn, id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep):
    chamar_procedure(conn, "inserir_endereco", [id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep])

def inserir_residencia(conn, id_residencia, id_usuario, tipo_residencia, quantidade_pessoas):
    chamar_procedure(conn, "inserir_residencia", [id_residencia, id_usuario, tipo_residencia, quantidade_pessoas])

def inserir_comodo(conn, id_comodo, id_usuario, nome_comodo, descricao):
    chamar_procedure(conn, "inserir_comodo", [id_comodo, id_usuario, nome_comodo, descricao])

def inserir_eletrodomestico(conn, id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao):
    chamar_procedure(conn, "inserir_eletrodomestico", [id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao])

def inserir_consumo_mensal(conn, id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh):
    chamar_procedure(conn, "inserir_consumo_mensal", [id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh])

def inserir_pontuacao(conn, id_pontuacao, id_usuario, pontos_totais, data_atualizacao):
    chamar_procedure(conn, "inserir_pontuacao", [id_pontuacao, id_usuario, pontos_totais, data_atualizacao])

def menu(conn):
    while True:
        print("\nEscolha uma tabela para inserir dados:")
        print("1. T_PE_USUARIOS")
        print("2. T_PE_ENDERECOS")
        print("3. T_PE_RESIDENCIAS")
        print("4. T_PE_COMODOS")
        print("5. T_PE_ELETRODOMESTICOS")
        print("6. T_PE_CONSUMO_MENSAL")
        print("7. T_PE_PONTUACAO_USUARIO")
        print("8. Sair")
        escolha = input("Digite o número da sua escolha: ")

        if escolha == "1":
            id_usuario = int(input("ID do Usuário: "))
            nome = input("Nome: ")
            email = input("Email: ")
            senha = input("Senha: ")
            inserir_usuario(conn, id_usuario, nome, email, senha)

        elif escolha == "2":
            id_endereco = int(input("ID do Endereço: "))
            id_usuario = int(input("ID do Usuário: "))
            logradouro = input("Logradouro: ")
            numero = input("Número: ")
            complemento = input("Complemento: ")
            bairro = input("Bairro: ")
            cidade = input("Cidade: ")
            estado = input("Estado (UF): ")
            cep = input("CEP: ")
            inserir_endereco(conn, id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)

        elif escolha == "3":
            id_residencia = int(input("ID da Residência: "))
            id_usuario = int(input("ID do Usuário: "))
            tipo_residencia = input("Tipo de Residência: ")
            quantidade_pessoas = int(input("Quantidade de Pessoas: "))
            inserir_residencia(conn, id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)

        elif escolha == "4":
            id_comodo = int(input("ID do Cômodo: "))
            id_usuario = int(input("ID do Usuário: "))
            nome_comodo = input("Nome do Cômodo: ")
            descricao = input("Descrição: ")
            inserir_comodo(conn, id_comodo, id_usuario, nome_comodo, descricao)

        elif escolha == "5":
            id_eletrodomestico = int(input("ID do Eletrodoméstico: "))
            id_comodo = int(input("ID do Cômodo: "))
            nome_eletrodomestico = input("Nome do Eletrodoméstico: ")
            potencia_watts = int(input("Potência em Watts: "))
            horas_uso_dia = int(input("Horas de uso por dia: "))
            descricao = input("Descrição: ")
            inserir_eletrodomestico(conn, id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)

        elif escolha == "6":
            id_consumo_mensal = int(input("ID do Consumo Mensal: "))
            id_usuario = int(input("ID do Usuário: "))
            mes_referencia = input("Mês de Referência (YYYY-MM-DD): ")
            consumo_mensal_kwh = float(input("Consumo Mensal em kWh: "))
            inserir_consumo_mensal(conn, id_consumo_mensal, id_usuario, mes_referencia, consumo_mensal_kwh)

        elif escolha == "7":
            id_pontuacao = int(input("ID da Pontuação: "))
            id_usuario = int(input("ID do Usuário: "))
            pontos_totais = int(input("Pontos Totais: "))
            data_atualizacao = input("Data de Atualização (YYYY-MM-DD): ")
            inserir_pontuacao(conn, id_pontuacao, id_usuario, pontos_totais, data_atualizacao)

        elif escolha == "8":
            print("Saindo do programa.")
            break

        else:
            print("Opção inválida. Por favor, escolha uma opção válida.")

if __name__ == "__main__":
    conn = criar_conexao()
    if conn:
        menu(conn)
        fechar_conexao(conn)
