CREATE TABLE usuario (
    id_usuario   SERIAL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) NOT NULL,
    telefone     VARCHAR(17),
    ativo        BOOLEAN DEFAULT TRUE,
    cpf          VARCHAR(14) NOT NULL,
    dt_criacao   DATE DEFAULT CURRENT_DATE,
    dt_nascimento DATE NOT NULL);

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    logradouro  VARCHAR(100) NOT NULL,
    numero      VARCHAR(10)  NOT NULL,
    bairro      VARCHAR(50)  NOT NULL,
    cidade      VARCHAR(50)  NOT NULL,
    estado      CHAR(2)      NOT NULL,
    pais        VARCHAR(50)  DEFAULT 'Brasil');

CREATE TABLE especie (
    id_especie SERIAL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL);

CREATE TABLE alimento (
    id_alimento SERIAL PRIMARY KEY,
    nome        VARCHAR(50) NOT NULL,
    valor       NUMERIC(10,2) NOT NULL);

CREATE TABLE raca (
    id_raca       SERIAL PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    qnt_alimento  INT NOT NULL,
    id_especie    INT NOT NULL REFERENCES especie(id_especie)
        ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE filial (
    id_filial   SERIAL PRIMARY KEY,
    id_endereco INT NOT NULL REFERENCES endereco(id_endereco)
        ON UPDATE CASCADE ON DELETE CASCADE,
    telefone    VARCHAR(20) NOT NULL,
    nome        VARCHAR(100) NOT NULL);

CREATE TABLE adotante (
    id_adotante SERIAL PRIMARY KEY,
    id_usuario  INT NOT NULL REFERENCES usuario(id_usuario)
        ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE animal (
    id_animal       SERIAL PRIMARY KEY,
    nome_animal     VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    data_registro   DATE DEFAULT CURRENT_DATE,
    data_saida      DATE,
    adotado         BOOLEAN DEFAULT FALSE,
    id_filial       INT NOT NULL REFERENCES filial(id_filial)
        ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE vacina (
    id_vacina    SERIAL PRIMARY KEY,
    nome_vacina  VARCHAR(255) NOT NULL,
    valor_vacina NUMERIC(10,2));

CREATE TABLE adocao (
    id_adocao    SERIAL PRIMARY KEY,
    id_adotante  INT NOT NULL REFERENCES adotante(id_adotante)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_animal    INT NOT NULL REFERENCES animal(id_animal)
        ON UPDATE CASCADE ON DELETE CASCADE,
    data_adocao  DATE DEFAULT CURRENT_DATE,
    taxa_adocao  NUMERIC(10,2),
    data_contrato DATE,
    contrato     VARCHAR(255),
    status       VARCHAR(255));

CREATE TABLE especie_alimento (
    id_especie  INT NOT NULL REFERENCES especie(id_especie)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_alimento INT NOT NULL REFERENCES alimento(id_alimento)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_especie, id_alimento));

CREATE TABLE animal_raca (
    id_animal INT NOT NULL REFERENCES animal(id_animal)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_raca   INT NOT NULL REFERENCES raca(id_raca)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_animal, id_raca));

CREATE TABLE vacinas_permitidas (
    id_raca   INT NOT NULL REFERENCES raca(id_raca)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_vacina INT NOT NULL REFERENCES vacina(id_vacina)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_raca, id_vacina));

CREATE TABLE vacinas_tomadas (
    id_vacina_tomada SERIAL PRIMARY KEY,
    id_animal INT NOT NULL REFERENCES animal(id_animal)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_vacina INT REFERENCES vacina(id_vacina)
        ON UPDATE CASCADE ON DELETE SET NULL,
    valor     NUMERIC(10,2),
    data_vacina DATE NOT NULL);

CREATE TABLE doacao (
    id_doacao SERIAL PRIMARY KEY,
    valor       NUMERIC(10,2) NOT NULL,
    data_doacao DATE DEFAULT CURRENT_DATE,
    id_filial   INT NOT NULL REFERENCES filial(id_filial)
        ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE evento (
    id_evento  SERIAL PRIMARY KEY,
    id_filial  INT NOT NULL REFERENCES filial(id_filial)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_endereco INT NOT NULL REFERENCES endereco(id_endereco)
        ON UPDATE CASCADE ON DELETE CASCADE,
    descricao_evento VARCHAR(255));

CREATE TABLE animal_evento (
    id_animal INT NOT NULL REFERENCES animal(id_animal)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_evento INT NOT NULL REFERENCES evento(id_evento)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_animal, id_evento));

CREATE TABLE filial_especie (
    id_filial  INT NOT NULL REFERENCES filial(id_filial)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_especie INT NOT NULL REFERENCES especie(id_especie)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_filial, id_especie));

CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    id_usuario     INT NOT NULL REFERENCES usuario(id_usuario)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_filial      INT NOT NULL REFERENCES filial(id_filial)
        ON UPDATE CASCADE ON DELETE CASCADE,
    salario        NUMERIC(10,2) NOT NULL,
    inicio_turno   TIME NOT NULL,
    fim_turno      TIME NOT NULL);

CREATE TABLE especie_funcionario (
    id_funcionario INT NOT NULL REFERENCES funcionario(id_funcionario)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_especie     INT NOT NULL REFERENCES especie(id_especie)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_funcionario, id_especie));