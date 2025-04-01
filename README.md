# 📊 Banco de Dados - IntuitiveCare Challenge

Este projeto consiste na criação e manipulação de um banco de dados PostgreSQL para armazenar e processar informações extraídas no desafio da IntuitiveCare.  

## 🗄️ Descrição  

O banco de dados foi desenvolvido para armazenar dados processados de arquivos CSV, garantindo integridade e eficiência no armazenamento e consulta das informações. 
O banco é populado com dados extraídos e transformados por meio dos outros componentes do projeto, como `webscraping_ans` e `data_transformer`.  

## 🛠️ Tecnologias Utilizadas  

- **PostgreSQL** - Sistema gerenciador de banco de dados relacional  
- **SQL** - Linguagem utilizada para manipulação de dados  
- **pgAdmin4** - Interface gráfica para gerenciamento do PostgreSQL  

## ⚙️ Configuração do Banco de Dados  

### 📌 Pré-requisitos  

Antes de rodar o projeto, certifique-se de que você tem o PostgreSQL instalado. Se ainda não tiver, baixe e instale a versão mais recente:  

🔗 [Download do PostgreSQL](https://www.postgresql.org/download/)  

### 🏗️ Criando o Banco de Dados  

1️⃣ Acesse o PostgreSQL via terminal ou pgAdmin.  
2️⃣ Crie o banco de dados:  

    ```sql
    CREATE DATABASE meu_banco;

3️⃣ Conecte-se ao banco recém-criado:
  \c meu_banco
  
4️⃣ Crie a tabela para armazenar os dados

- Em desenvolvimento - incompleto-
