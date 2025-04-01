-- Criando o banco de dados
CREATE DATABASE ans_dados;

-- Usando o banco de dados
\c ans_data;

-- Criando tabela para os dados cadastrais das operadoras
CREATE TABLE operadoras (
    id_operadora SERIAL PRIMARY KEY,
    reg_ans INT UNIQUE NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    uf CHAR(2),
    data_registro DATE
);

-- Criando tabela para as demonstrações contábeis
CREATE TABLE demonstracoes_contabeis (
    id SERIAL PRIMARY KEY,
    reg_ans INT NOT NULL,
    trimestre INT NOT NULL,
    ano INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor NUMERIC(15,2) NOT NULL,
    FOREIGN KEY (reg_ans) REFERENCES operadoras(reg_ans)
);

-- Query analítica para encontrar as 10 operadoras com maiores despesas no último trimestre
SELECT o.razao_social, SUM(d.valor) AS total_despesas
FROM demonstracoes_contabeis d
JOIN operadoras o ON d.reg_ans = o.reg_ans
WHERE d.descricao ILIKE '%SINISTROS CONHECIDOS OU AVISADOS%'
AND d.ano = (SELECT MAX(ano) FROM demonstracoes_contabeis)
AND d.trimestre = (SELECT MAX(trimestre) FROM demonstracoes_contabeis WHERE ano = (SELECT MAX(ano) FROM demonstracoes_contabeis))
GROUP BY o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

-- Query analítica para encontrar as 10 operadoras com maiores despesas no último ano
SELECT o.razao_social, SUM(d.valor) AS total_despesas
FROM demonstracoes_contabeis d
JOIN operadoras o ON d.reg_ans = o.reg_ans
WHERE d.descricao ILIKE '%SINISTROS CONHECIDOS OU AVISADOS%'
AND d.ano = (SELECT MAX(ano) FROM demonstracoes_contabeis)
GROUP BY o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;
