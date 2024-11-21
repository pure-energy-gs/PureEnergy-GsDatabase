import oracledb
from datetime import datetime
import random

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


def inserir_pontuacao(conn, id_pontuacao, id_usuario, pontos_totais, data_atualizacao):
    try:
        data_atualizacao_date = datetime.strptime(data_atualizacao, '%Y-%m-%d')
        chamar_procedure(conn, "inserir_pontuacao", [id_pontuacao, id_usuario, pontos_totais, data_atualizacao_date])
    except oracledb.DatabaseError as e:
        print(f"Erro ao executar a procedure inserir_pontuacao:", e)

def inserir_dados(conn):
    print("Inserindo dados automaticamente nas tabelas...")

    nomes = ["Ana", "Carlos", "Fernanda", "João", "Larissa", "Marcelo", "Patricia", "Ricardo", "Vanessa", "Gustavo",
             "Pedro", "Luiza", "Rafael", "Marcela", "Vitor", "Paula", "Felipe", "Isabela", "Danilo", "Marta",
             "Roberto", "Simone", "Gustavo", "Bárbara", "Thiago", "Jéssica", "Eduardo", "Mariana", "André", "Tatiane",
             "Bruna", "Carla", "Tiago", "Lúcio", "Aline", "Cristiano", "Sabrina", "Victor", "Débora", "José", "Lúcia",
             "Rogério", "Daniela", "Anderson", "Cristiane", "César", "Natália", "Rui", "Cláudia", "Alfredo", "Gisele"]

    for i in range(1, 51):
        nome = nomes[i-1]
        email = f"{nome.lower()}@exemplo.com"
        senha = f"senha{i * 3}"
        inserir_usuario(conn, i, nome, email, senha)

    for i in range(1, 51):
        id_usuario = i  # Mantendo o id_usuario consistente com o número do loop
        logradouro = f"Rua {random.choice(['Avenida', 'Rua', 'Praça'])} {random.randint(1, 999)}"
        numero = str(random.randint(1, 999))
        complemento = f"Bloco {random.choice(['A', 'B', 'C'])} - {random.choice(['Apto', 'Casa', 'Comércio'])} {i}"
        bairro = f"Bairro {random.choice(['Central', 'Norte', 'Sul', 'Leste', 'Oeste'])}"
        cidade = random.choice(['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Curitiba', 'Porto Alegre'])
        estado = random.choice(['SP', 'RJ', 'MG', 'PR', 'RS'])
        cep = f"{random.randint(10000, 99999)}-{random.randint(1000, 9999)}"
        inserir_endereco(conn, i, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)

    for i in range(1, 51):
        id_usuario = i  # Garantir que o id_usuario seja o mesmo
        tipo_residencia = random.choice(["Casa", "Apartamento", "Chácara"])
        quantidade_pessoas = random.randint(1, 6)
        inserir_residencia(conn, i, id_usuario, tipo_residencia, quantidade_pessoas)

    tipos_comodos = ["Sala", "Cozinha", "Quarto", "Banheiro", "Varanda"]
    for i in range(1, 51):
        id_usuario = i  # Garantir que o id_usuario seja o mesmo
        nome_comodo = random.choice(tipos_comodos)
        descricao = f"Cômodo {i} - {random.choice(['bem iluminado', 'arejado', 'reformado', 'com móveis novos'])}"
        inserir_comodo(conn, i, id_usuario, nome_comodo, descricao)

    for i in range(1, 51):
        id_comodo = i  # Garantir que o id_comodo seja consistente
        nome_comodo = random.choice(tipos_comodos)

        if nome_comodo == "Cozinha":
            eletrodomesticos = ["Geladeira", "Microondas", "Fogão"]
        elif nome_comodo == "Quarto":
            eletrodomesticos = ["Ar-condicionado", "Ventilador", "Lâmpada"]
        elif nome_comodo == "Sala":
            eletrodomesticos = ["Ar-condicionado", "TV", "Home Theater"]
        elif nome_comodo == "Banheiro":
            eletrodomesticos = ["Secador de cabelo", "Lâmpada"]
        else:  # Varanda
            eletrodomesticos = ["Ventilador", "Lâmpada"]

        nome_eletrodomestico = random.choice(eletrodomesticos)
        potencia_watts = random.randint(500, 3000)
        horas_uso_dia = random.randint(1, 10)
        descricao = f"Eletrodoméstico {i} - {random.choice(['novo', 'usado', 'de última geração'])}"
        inserir_eletrodomestico(conn, i, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)

    for i in range(1, 51):
        id_usuario = i  # Garantir que o id_usuario seja o mesmo
        mes_referencia = f"2024-0{i % 12 + 1}-01"  # Para evitar valores fora do alcance de meses
        consumo_mensal_kwh = round(random.uniform(100.0, 1000.0), 2)
        inserir_consumo_mensal(conn, id_usuario, mes_referencia, consumo_mensal_kwh)

    for i in range(1, 51):
        id_usuario = i  # Garantir que o id_usuario seja o mesmo
        pontos_totais = random.randint(10, 100)
        data_atualizacao = datetime.now().strftime('%Y-%m-%d')
        inserir_pontuacao(conn, i, id_usuario, pontos_totais, data_atualizacao)


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
