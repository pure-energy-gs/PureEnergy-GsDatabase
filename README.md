# Pure Energy - Global Solution - FIAP 2024

# Integrantes:
- José Ribeiro dos Santos Neto RM 553844
- Keven Ike Pereira da Silva RM 553215
- Vitor Cruz dos Santos RM 553621

## Link do vídeo: 
- https://youtu.be/xff-RiTdHFc

Este projeto tem como objetivo gerenciar informações sobre usuários, endereços, residências, cômodos, eletrodomésticos e consumo mensal de energia elétrica. A estrutura do banco de dados foi projetada para armazenar dados relevantes e facilitar a consulta e manipulação das informações.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- **T_PE_USUARIOS**: Armazena informações dos usuários.
- **T_PE_ENDERECOS**: Contém os endereços dos usuários.
- **T_PE_RESIDENCIAS**: Detalha os tipos de residências e quantidade de pessoas.
- **T_PE_COMODOS**: Registra os cômodos de cada residência.
- **T_PE_ELETRODOMESTICOS**: Informações sobre os eletrodomésticos em cada cômodo.
- **T_PE_CONSUMO_MENSAL**: Registra o consumo mensal de energia elétrica dos usuários.
- **T_PE_PONTUACAO_USUARIO**: Armazena a pontuação total de cada usuário.

## Inserções no Banco de Dados

O projeto inclui um conjunto de comandos SQL para inserir dados de exemplo nas tabelas. Os dados incluem informações sobre usuários, seus endereços, residências, cômodos, eletrodomésticos, consumo mensal e pontuação.


#  Procedures:

## `INSERIR_USUARIO`

A **procedure `INSERIR_USUARIO`** é responsável por inserir um novo usuário na tabela `T_PE_USUARIOS`. Ela aceita os seguintes parâmetros de entrada:

- `p_id_usuario` (NUMBER): O ID único do usuário.
- `p_nome` (VARCHAR2): O nome do usuário.
- `p_email` (VARCHAR2): O e-mail do usuário.
- `p_senha` (VARCHAR2): A senha do usuário.

### Exceções:
- **DUP_VAL_ON_INDEX**: Levanta um erro quando já existe um usuário com o mesmo ID ou e-mail.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_ENDERECO`

A **procedure `INSERIR_ENDERECO`** insere um endereço de um usuário na tabela `T_PE_ENDERECOS`. Ela recebe os seguintes parâmetros:

- `p_id_endereco` (NUMBER): O ID único do endereço.
- `p_id_usuario` (NUMBER): O ID do usuário associado ao endereço.
- `p_logradouro` (VARCHAR2): O logradouro do endereço.
- `p_numero` (VARCHAR2): O número do endereço.
- `p_complemento` (VARCHAR2): O complemento do endereço.
- `p_bairro` (VARCHAR2): O bairro do endereço.
- `p_cidade` (VARCHAR2): A cidade do endereço.
- `p_estado` (VARCHAR2): O estado do endereço.
- `p_cep` (VARCHAR2): O CEP do endereço.

### Exceções:
- **DUP_VAL_ON_INDEX**: Levanta um erro se o ID do endereço já existir.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_RESIDENCIA`

A **procedure `INSERIR_RESIDENCIA`** insere um registro de residência para um usuário na tabela `T_PE_RESIDENCIAS`. Parâmetros de entrada:

- `p_id_residencia` (NUMBER): O ID da residência.
- `p_id_usuario` (NUMBER): O ID do usuário associado à residência.
- `p_tipo_residencia` (VARCHAR2): O tipo de residência (ex: Casa, Apartamento).
- `p_quantidade_pessoas` (NUMBER): A quantidade de pessoas na residência.

### Exceções:
- **NO_DATA_FOUND**: Levanta um erro se o usuário especificado não existir.
- **DUP_VAL_ON_INDEX**: Levanta um erro se o ID da residência já existir.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_COMODO`

A **procedure `INSERIR_COMODO`** insere um cômodo associado a um usuário na tabela `T_PE_COMODOS`. Parâmetros de entrada:

- `p_id_comodo` (NUMBER): O ID do cômodo.
- `p_id_usuario` (NUMBER): O ID do usuário associado ao cômodo.
- `p_nome_comodo` (VARCHAR2): O nome do cômodo.
- `p_descricao` (VARCHAR2): A descrição do cômodo.

### Exceções:
- **NO_DATA_FOUND**: Levanta um erro se o usuário especificado não existir.
- **DUP_VAL_ON_INDEX**: Levanta um erro se o ID do cômodo já existir.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_ELETRODOMESTICO`

A **procedure `INSERIR_ELETRODOMESTICO`** insere um eletrodoméstico em um cômodo associado a um usuário na tabela `T_PE_ELETRODOMESTICOS`. Parâmetros de entrada:

- `p_id_eletrodomestico` (NUMBER): O ID do eletrodoméstico.
- `p_id_comodo` (NUMBER): O ID do cômodo onde o eletrodoméstico será inserido.
- `p_nome_eletrodomestico` (VARCHAR2): O nome do eletrodoméstico.
- `p_potencia_watts` (NUMBER): A potência do eletrodoméstico em watts.
- `p_horas_uso_dia` (NUMBER): O número de horas de uso diário do eletrodoméstico.
- `p_descricao` (VARCHAR2): A descrição do eletrodoméstico.

### Exceções:
- **NO_DATA_FOUND**: Levanta um erro se o cômodo especificado não existir.
- **DUP_VAL_ON_INDEX**: Levanta um erro se o ID do eletrodoméstico já existir.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_CONSUMO_MENSAL`

A **procedure `INSERIR_CONSUMO_MENSAL`** insere o consumo mensal de energia de um usuário na tabela `T_PE_CONSUMO_MENSAL`. Parâmetros de entrada:

- `p_id_consumo_mensal` (NUMBER): O ID do consumo mensal.
- `p_id_usuario` (NUMBER): O ID do usuário.
- `p_mes_referencia` (DATE): O mês de referência do consumo.
- `p_consumo_mensal_kwh` (NUMBER): O valor do consumo mensal em kWh.

### Exceções:
- **NO_DATA_FOUND**: Levanta um erro se o usuário especificado não existir.
- **DUP_VAL_ON_INDEX**: Levanta um erro se já existir um registro de consumo mensal com o mesmo ID.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.

---

## `INSERIR_PONTUACAO_USUARIO`

A **procedure `INSERIR_PONTUACAO_USUARIO`** insere uma pontuação associada a um usuário na tabela `T_PE_PONTUACAO_USUARIO`. Parâmetros de entrada:

- `p_id_pontuacao` (NUMBER): O ID da pontuação.
- `p_id_usuario` (NUMBER): O ID do usuário.
- `p_pontos_totais` (NUMBER): O total de pontos do usuário.
- `p_data_atualizacao` (DATE): A data de atualização da pontuação.

### Exceções:
- **NO_DATA_FOUND**: Levanta um erro se o usuário especificado não existir.
- **DUP_VAL_ON_INDEX**: Levanta um erro se já existir um registro de pontuação com o mesmo ID.
- **OUTRAS EXCEÇÕES**: Levanta um erro inesperado com a mensagem do erro original.





# Funções (Validações): 

## `validar_email`

A **função `validar_email`** é responsável por validar o formato de um endereço de e-mail. Ela recebe um parâmetro de entrada:

- `p_email` (VARCHAR2): O endereço de e-mail a ser validado.

### Funcionamento:
A função utiliza uma expressão regular para verificar se o e-mail está no formato adequado. Caso o formato seja inválido, um erro será gerado, e a mensagem `"Formato de e-mail inválido"` será retornada.

### Retorno:
- **E-mail válido**: Caso o e-mail esteja no formato correto.
- **Erro ao validar e-mail**: Caso ocorra algum erro inesperado durante a validação.

### Exceções:
- **-20001**: Levanta um erro se o formato do e-mail for inválido.

---

## `validar_cep`

A **função `validar_cep`** valida o formato de um CEP (Código de Endereçamento Postal). Ela recebe um parâmetro de entrada:

- `p_cep` (VARCHAR2): O CEP a ser validado.

### Funcionamento:
A função usa uma expressão regular para garantir que o CEP esteja no formato correto (XXXXX-XXX). Se o formato não for válido, a função retornará uma mensagem de erro.

### Retorno:
- **CEP válido**: Caso o CEP esteja no formato correto.
- **Erro ao validar CEP**: Caso ocorra um erro inesperado durante a validação.

### Exceções:
- **-20003**: Levanta um erro caso o formato do CEP seja inválido.

---

## `FN_VALIDAR_USUARIO`

A **função `FN_VALIDAR_USUARIO`** verifica se o usuário existe na tabela `T_PE_USUARIOS`. Ela recebe o seguinte parâmetro de entrada:

- `p_id_usuario` (NUMBER): O ID do usuário a ser validado.

### Funcionamento:
A função executa uma consulta na tabela `T_PE_USUARIOS` para verificar se existe algum registro com o `id_usuario` fornecido. Se o ID não existir, a função retorna `FALSE`. Caso contrário, ela retorna `TRUE`.

### Retorno:
- **TRUE**: Caso o usuário exista.
- **FALSE**: Caso o usuário não exista.

### Exceções:
- **-20024**: Levanta um erro se ocorrer algum problema na consulta ou na validação do usuário.




# Código de Inserção de Dados no Banco de Dados Oracle

## Objetivo
O código tem como objetivo inserir dados automaticamente em um banco de dados Oracle. Ele preenche tabelas com informações de usuários, endereços, residências, cômodos, eletrodomésticos, consumo mensal e pontuação, além de permitir interação com o banco através de um menu no terminal.

## Funções Principais

### 1. `criar_conexao()`
Estabelece a conexão com o banco de dados Oracle.

### 2. `fechar_conexao(conn)`
Fecha a conexão com o banco de dados.

### 3. `chamar_procedure(conn, procedure_name, params)`
Chama uma procedure no banco de dados com os parâmetros fornecidos.

### 4. `inserir_usuario(conn, id_usuario, nome, email, senha)`
Insere um novo usuário na tabela de usuários.

### 5. `inserir_endereco(conn, id_endereco, id_usuario, logradouro, numero, complemento, bairro, cidade, estado, cep)`
Insere um endereço para um usuário.

### 6. `inserir_residencia(conn, id_residencia, id_usuario, tipo_residencia, quantidade_pessoas)`
Insere dados sobre a residência de um usuário.

### 7. `inserir_comodo(conn, id_comodo, id_usuario, nome_comodo, descricao)`
Insere um cômodo para um usuário.

### 8. `inserir_eletrodomestico(conn, id_eletrodomestico, id_comodo, nome_eletrodomestico, potencia_watts, horas_uso_dia, descricao)`
Insere um eletrodoméstico em um cômodo.

### 9. `inserir_consumo_mensal(conn, id_usuario, mes_referencia, consumo_mensal_kwh)`
Insere o consumo mensal de energia para um usuário.

### 10. `inserir_pontuacao(conn, id_pontuacao, id_usuario, pontos_totais, data_atualizacao)`
Insere a pontuação total de um usuário.

### 11. `inserir_dados(conn)`
Insere automaticamente dados nas tabelas de usuários, endereços, residências, cômodos, eletrodomésticos, consumo mensal e pontuação.

### 12. `menu()`
Exibe um menu interativo no terminal para escolher entre inserir dados automaticamente ou sair do programa.

## Execução do Código

1. **Conexão**: A função `criar_conexao()` é chamada para estabelecer a conexão com o banco de dados.
2. **Menu**: O menu é exibido no terminal com as opções para inserir dados ou sair.
3. **Inserção de Dados**: Ao escolher inserir dados, a função `inserir_dados()` popula as tabelas com dados aleatórios.
4. **Fechamento**: A conexão é fechada com a função `fechar_conexao()`.

## Considerações
- O código gera dados aleatórios para fins de teste, não para produção.
- As credenciais do banco de dados são sensíveis e devem ser protegidas.



# Exportação de Dados para JSON a partir de Oracle Database

## Objetivo
Este código tem como objetivo realizar a exportação de dados de várias tabelas de um banco de dados Oracle para um arquivo JSON. Ele se conecta ao banco de dados, seleciona os dados de tabelas específicas, converte campos de data e hora para o formato adequado e salva os dados em um arquivo JSON.

## Funções Principais

### 1. `criar_conexao()`
Esta função estabelece a conexão com o banco de dados Oracle, utilizando as credenciais fornecidas (usuário, senha e DSN). Ela retorna um objeto de conexão caso a conexão seja bem-sucedida ou `None` em caso de erro.

#### Parâmetros:
- **Nenhum**.

#### Retorno:
- **Conexão Oracle** se bem-sucedida.
- **None** em caso de erro.

### 2. `converter_datetime(dados)`
Esta função recebe os dados exportados do banco e percorre cada tabela, convertendo qualquer valor do tipo `datetime` para o formato `'%Y-%m-%d %H:%M:%S'`.

#### Parâmetros:
- **dados**: Dicionário contendo os dados exportados.

#### Retorno:
- **dados**: Dicionário com os valores `datetime` convertidos para o formato adequado.

### 3. `exportar_para_json()`
Esta função é a principal do processo. Ela chama a função `criar_conexao()` para estabelecer a conexão com o banco de dados e seleciona dados de tabelas específicas (`T_PE_USUARIOS`, `T_PE_ENDERECOS`, `T_PE_RESIDENCIAS`, `T_PE_COMODOS`, `T_PE_ELETRODOMESTICOS`, `T_PE_CONSUMO_MENSAL`, `T_PE_PONTUACAO_USUARIO`). Os dados são convertidos usando a função `converter_datetime()` e então exportados para um arquivo JSON.

#### Parâmetros:
- **Nenhum**.

#### Retorno:
- **Nenhum** (apenas imprime o status da operação).

## Processo de Execução

1. **Estabelecimento de Conexão**:
   A função `criar_conexao()` é chamada, estabelecendo a conexão com o banco de dados Oracle.
   
2. **Execução de Consultas**:
   As tabelas selecionadas são consultadas uma a uma, e os resultados são armazenados em um dicionário.

3. **Conversão de Datas**:
   Os dados retornados das tabelas passam pela função `converter_datetime()`, que converte os campos `datetime` para o formato adequado.

4. **Exportação para JSON**:
   Os dados finais são salvos em um arquivo chamado `dados_exportados.json`.

5. **Fechamento de Conexão**:
   O cursor e a conexão com o banco de dados são fechados.

## Tabelas Exportadas

As tabelas do banco de dados Oracle que são consultadas e cujos dados são exportados para o arquivo JSON são:

- `T_PE_USUARIOS`
- `T_PE_ENDERECOS`
- `T_PE_RESIDENCIAS`
- `T_PE_COMODOS`
- `T_PE_ELETRODOMESTICOS`
- `T_PE_CONSUMO_MENSAL`
- `T_PE_PONTUACAO_USUARIO`

## Considerações

- As credenciais do banco de dados estão hardcoded no código, o que pode ser inseguro para produção. Idealmente, as credenciais deveriam ser armazenadas de forma mais segura, como em um arquivo de configuração ou variável de ambiente.
- O código manipula dados `datetime` e os converte para um formato específico, garantindo que os dados exportados estejam no formato adequado para visualização e uso posterior.
- A função de exportação cria um arquivo JSON chamado `dados_exportados.json` na pasta onde o script é executado.
