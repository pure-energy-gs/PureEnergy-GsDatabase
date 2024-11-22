import oracledb
from datetime import datetime
import random

def criar_conexao():
    try:
        dsnStr = oracledb.makedsn("oracle.fiap.com.br", 1521, "ORCL")
        conn = oracledb.connect(
            user="rm553844",
            password="020705",
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
            conn.commit() 
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

def inserir_consumo_mensal(conn, id_usuario, mes_referencia, consumo_mensal_kwh):
    try:
        id_consumo_mensal = id_usuario

        mes_referencia_date = datetime.strptime(mes_referencia, '%Y-%m-%d').date()

        # Chamar a procedure
        chamar_procedure(conn, "INSERIR_CONSUMO_MENSAL", [id_consumo_mensal, id_usuario, mes_referencia_date, consumo_mensal_kwh])
        print(f"Consumo mensal para {mes_referencia} inserido com sucesso.")
    except ValueError as e:
        print(f"Erro de formato na data: {e}")
    except Exception as e:
        print(f"Erro ao inserir consumo mensal: {e}")


def inserir_pontuacao_usuario(conn, id_pontuacao, id_usuario, pontos_totais, data_atualizacao):
    try:
        data_atualizacao_date = datetime.strptime(data_atualizacao, '%Y-%m-%d')
        # Corrigido para chamar a procedure correta
        chamar_procedure(conn, "inserir_pontuacao_usuario", [id_pontuacao, id_usuario, pontos_totais, data_atualizacao_date])
    except oracledb.DatabaseError as e:
        print(f"Erro ao executar a procedure inserir_pontuacao_usuario:", e)


def inserir_dados(conn):
    print("Inserindo dados automaticamente nas tabelas...")

    # Lista com 10 nomes de usuários americanos
    nomes = ["James", "John", "Robert", "Michael", "William", "David", "Richard", "Cristhian", "Charles", "Thomas"]

    # Inserir usuários com ID único
    for i in range(1, 11):
        nome = nomes[i-1]
        email = f"{nome.lower()}@exemplo.com"
        senha = f"senha{i * 3}"
        inserir_usuario(conn, i, nome, email, senha)

    # Inserir endereços
    for i in range(1, 11):
        id_usuario = i
        logradouro = f"Street {random.choice(['Main', 'Oak', 'Pine', 'Maple'])} {random.randint(1, 999)}"
        numero = str(random.randint(1, 999))
        complemento = f"Suite {random.choice(['A', 'B', 'C'])} - {random.choice(['Apto', 'House', 'Office'])} {i}"
        bairro = f"Neighborhood {random.choice(['North', 'South', 'East', 'West'])}"
        cidade = random.choice(['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'])
        estado = random.choice(['NY', 'CA', 'IL', 'TX', 'AZ'])
        cep = f"{random.randint(10000, 99999)}-{random.randint(1000, 9999)}"
        inserir_endereco(conn, i, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)

    # Inserir residências
    for i in range(1, 11):
        id_usuario = i
        tipo_residencia = random.choice(["House", "Apartment", "Condo"])
        quantidade_pessoas = random.randint(1, 6)
        inserir_residencia(conn, i, id_usuario, tipo_residencia, quantidade_pessoas)

    # Inserir cômodos
    tipos_comodos = ["Living Room", "Kitchen", "Bedroom", "Bathroom", "Balcony"]
    for i in range(1, 11):
        id_usuario = i
        nome_comodo = random.choice(tipos_comodos)
        descricao = f"Room {i} - {random.choice(['spacious', 'bright', 'renovated', 'with new furniture'])}"
        inserir_comodo(conn, i, id_usuario, nome_comodo, descricao)

    # Inserir eletrodomésticos
    for i in range(1, 11):
        id_comodo = i
        nome_comodo = random.choice(tipos_comodos)

        if nome_comodo == "Kitchen":
            eletrodomesticos = ["Refrigerator", "Microwave", "Oven"]
        elif nome_comodo == "Bedroom":
            eletrodomesticos = ["Air conditioner", "Fan", "Lamp"]
        elif nome_comodo == "Living Room":
            eletrodomesticos = ["Air conditioner", "TV", "Home Theater"]
        elif nome_comodo == "Bathroom":
            eletrodomesticos = ["Hair dryer", "Lamp"]
        else:  # Balcony
            eletrodomesticos = ["Fan", "Lamp"]

        nome_eletrodomestico = random.choice(eletrodomesticos)
        potencia_watts = random.randint(500, 3000)
        horas_uso_dia = random.randint(1, 10)
        descricao = f"Appliance {i} - {random.choice(['new', 'used', 'latest model'])}"
        inserir_eletrodomestico(conn, i, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)

    # Inserir consumo mensal
    for i in range(1, 11):
        id_usuario = i
        mes_referencia = f"2024-{i % 12 + 1:02d}-01"  # Formatar o mês com 2 dígitos
        consumo_mensal_kwh = round(random.uniform(100.0, 1000.0), 2)
        inserir_consumo_mensal(conn, id_usuario, mes_referencia, consumo_mensal_kwh)

    # Inserir pontuação
    for i in range(1, 11):
        id_usuario = i
        pontos_totais = random.randint(10, 100)
        data_atualizacao = datetime.now().strftime('%Y-%m-%d')
        inserir_pontuacao_usuario(conn, i, id_usuario, pontos_totais, data_atualizacao)


def menu():
    print("Escolha uma opção:")
    print("1 - Inserir dados automaticamente.")
    print("2 - Sair.")
    
    opcao = input("Digite a opção: ")

    if opcao == "1":
        inserir_dados(conn)
    elif opcao == "2":
        print("Saindo...")
    else:
        print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    conn = criar_conexao()

    if conn:
        menu()

    fechar_conexao(conn)
