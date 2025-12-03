-- =========================================================
-- 1) USUARIO
-- =========================================================
INSERT INTO usuario (nome, email, telefone, ativo, cpf, dt_nascimento)
VALUES
('Ana Silva',         'ana.silva@example.com',      '(11) 98888-0001', TRUE, '111.111.111-11', '1990-03-15'),
('Bruno Costa',       'bruno.costa@example.com',    '(11) 98888-0002', TRUE, '222.222.222-22', '1988-07-20'),
('Carla Souza',       'carla.souza@example.com',    '(11) 98888-0003', TRUE, '333.333.333-33', '1995-01-10'),
('Diego Lima',        'diego.lima@example.com',     '(11) 98888-0004', TRUE, '444.444.444-44', '1992-05-05'),
('Elisa Rocha',       'elisa.rocha@example.com',    '(11) 98888-0005', TRUE, '555.555.555-55', '1989-09-09'),
('Felipe Martins',    'felipe.martins@example.com', '(11) 98888-0006', TRUE, '666.666.666-66', '1993-12-01'),
('Gabriela Alves',    'gabriela.alves@example.com', '(11) 98888-0007', TRUE, '777.777.777-77', '1997-04-18'),
('Henrique Dias',     'henrique.dias@example.com',  '(11) 98888-0008', TRUE, '888.888.888-88', '1991-08-30'),
('Isabela Ferreira',  'isabela.ferreira@example.com','(11) 98888-0009',TRUE, '999.999.999-99', '1994-02-22'),
('João Pereira',      'joao.pereira@example.com',   '(11) 98888-0010', TRUE, '000.000.000-00', '1987-06-12');

-- =========================================================
-- 2) ENDERECO
-- =========================================================
INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, pais)
VALUES
('Rua das Flores',     '100', 'Centro',            'São Paulo',      'SP', 'Brasil'),
('Avenida Brasil',     '200', 'Jardins',           'São Paulo',      'SP', 'Brasil'),
('Rua dos Pinheiros',  '50',  'Pinheiros',         'São Paulo',      'SP', 'Brasil'),
('Rua da Paz',         '120', 'Boa Vista',         'Curitiba',       'PR', 'Brasil'),
('Av. Atlântica',      '500', 'Copacabana',        'Rio de Janeiro', 'RJ', 'Brasil'),
('Rua das Palmeiras',  '30',  'Centro',            'Florianópolis',  'SC', 'Brasil'),
('Rua Sete de Abril',  '77',  'Centro',            'Belo Horizonte', 'MG', 'Brasil'),
('Av. Independência',  '900', 'Centro',            'Porto Alegre',   'RS', 'Brasil'),
('Rua Verde',          '15',  'Jardim Europa',     'Campinas',       'SP', 'Brasil'),
('Rua Azul',           '22',  'Vila Nova',         'Santos',         'SP', 'Brasil');

-- =========================================================
-- 3) ESPECIE
-- =========================================================
INSERT INTO especie (nome)
VALUES
('Cachorro'),           -- 1
('Gato'),               -- 2
('Coelho'),             -- 3
('Pássaro'),            -- 4
('Hamster'),            -- 5
('Tartaruga'),          -- 6
('Porquinho-da-índia'), -- 7
('Peixe'),              -- 8
('Réptil'),             -- 9
('Cavalo');             -- 10

-- =========================================================
-- 4) ALIMENTO
-- =========================================================
INSERT INTO alimento (nome, valor)
VALUES
('Ração Cães Filhotes',   120.00),
('Ração Cães Adultos',    130.00),
('Ração Gatos Filhotes',   95.00),
('Ração Gatos Adultos',   110.00),
('Feno para Coelhos',      80.00),
('Sementes para Pássaros', 45.00),
('Ração para Hamster',     35.00),
('Ração para Tartarugas',  50.00),
('Petisco Dental',         25.00),
('Ração para Peixes',      20.00);

-- =========================================================
-- 5) RACA
-- =========================================================
INSERT INTO raca (nome, qnt_alimento, id_especie)
VALUES
('SRD Pequeno',             200, 1),
('SRD Médio',               300, 1),
('Labrador',                350, 1),
('Siamês',                   60, 2),
('Persa',                    70, 2),
('Coelho Lop',               80, 3),
('Calopsita',                20, 4),
('Canário',                  15, 4),
('Hamster Sírio',            10, 5),
('Tartaruga Tigre-d''água',   5, 6);

-- =========================================================
-- 6) FILIAL
-- =========================================================
INSERT INTO filial (id_endereco, telefone, nome)
VALUES
(1, '(11) 4000-0001', 'Filial Centro SP'),
(2, '(11) 4000-0002', 'Filial Jardins SP'),
(3, '(11) 4000-0003', 'Filial Pinheiros SP'),
(4, '(41) 4000-0004', 'Filial Curitiba'),
(5, '(21) 4000-0005', 'Filial Copacabana'),
(6, '(48) 4000-0006', 'Filial Florianópolis'),
(7, '(31) 4000-0007', 'Filial BH'),
(8, '(51) 4000-0008', 'Filial Porto Alegre'),
(9, '(19) 4000-0009', 'Filial Campinas'),
(10,'(13) 4000-0010', 'Filial Santos');

-- =========================================================
-- 7) ADOTANTE
-- (ligando cada usuário a um adotante)
-- =========================================================
INSERT INTO adotante (id_usuario)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- =========================================================
-- 8) ANIMAL  (já com id_filial)
-- =========================================================
INSERT INTO animal (nome_animal, data_nascimento, data_registro, data_saida, adotado, id_filial)
VALUES
('Rex',     '2022-01-10', '2023-05-01', '2024-02-15', TRUE,  1),
('Mia',     '2021-11-20', '2023-06-10', NULL,         FALSE, 1),
('Thor',    '2020-08-05', '2022-09-01', '2023-12-10', TRUE,  2),
('Luna',    '2023-01-15', '2023-02-01', NULL,         FALSE, 2),
('Bob',     '2022-10-01', '2023-03-05', NULL,         FALSE, 3),
('Nina',    '2021-03-09', '2023-01-12', '2023-08-20', TRUE,  3),
('Pipoca',  '2023-06-18', '2023-07-01', NULL,         FALSE, 4),
('Bidu',    '2022-04-30', '2022-05-10', '2024-01-05', TRUE,  5),
('Chico',   '2020-12-12', '2021-01-10', NULL,         FALSE, 6),
('Mel',     '2023-03-03', '2023-03-20', NULL,         FALSE, 7);

-- =========================================================
-- 9) VACINA
-- =========================================================
INSERT INTO vacina (nome_vacina, valor_vacina)
VALUES
('V8 Cães',              80.00),
('V10 Cães',             95.00),
('Antirrábica',          60.00),
('Gripe Canina',         70.00),
('Tríplice Felina',      85.00),
('Quádrupla Felina',     90.00),
('Vacina Coelhos',       50.00),
('Vacina Pássaros',      40.00),
('Vacina Roedores',      45.00),
('Múltipla Tartarugas',  55.00);

-- =========================================================
-- 10) ESPECIE_ALIMENTO  (N:N)
-- =========================================================
INSERT INTO especie_alimento (id_especie, id_alimento)
VALUES
(1, 1),  -- Cachorro / Ração Cães Filhotes
(1, 2),  -- Cachorro / Ração Cães Adultos
(1, 9),  -- Cachorro / Petisco Dental
(2, 3),  -- Gato / Ração Gatos Filhotes
(2, 4),  -- Gato / Ração Gatos Adultos
(3, 5),  -- Coelho / Feno
(4, 6),  -- Pássaro / Sementes
(5, 7),  -- Hamster / Ração Hamster
(6, 8),  -- Tartaruga / Ração Tartarugas
(8, 10); -- Peixe / Ração Peixes

-- =========================================================
-- 11) FILIAL_ESPECIE  (N:N)
-- =========================================================
INSERT INTO filial_especie (id_filial, id_especie)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 4),
(3, 2),
(3, 3),
(4, 1),
(5, 1),
(6, 2),
(7, 1);

-- =========================================================
-- 12) FUNCIONARIO
-- =========================================================
INSERT INTO funcionario (id_usuario, id_filial, salario, inicio_turno, fim_turno)
VALUES
(1, 1, 2500.00, '08:00', '17:00'),
(2, 1, 2600.00, '09:00', '18:00'),
(3, 2, 2700.00, '08:00', '17:00'),
(4, 3, 2800.00, '10:00', '19:00'),
(5, 4, 3000.00, '08:00', '17:00'),
(6, 5, 3200.00, '09:00', '18:00'),
(7, 6, 2300.00, '08:00', '17:00'),
(8, 7, 2400.00, '07:00', '16:00'),
(9, 8, 2600.00, '10:00', '19:00'),
(10,9, 2800.00, '08:00', '17:00');

-- =========================================================
-- 13) VACINAS_PERMITIDAS  (RACA x VACINA)
-- =========================================================
INSERT INTO vacinas_permitidas (id_raca, id_vacina)
VALUES
(1, 1),  -- SRD Pequeno / V8
(1, 3),  -- SRD Pequeno / Antirrábica
(2, 1),  -- SRD Médio / V8
(2, 2),  -- SRD Médio / V10
(3, 1),  -- Labrador / V8
(3, 2),  -- Labrador / V10
(4, 5),  -- Siamês / Tríplice Felina
(5, 6),  -- Persa / Quádrupla Felina
(6, 7),  -- Coelho Lop / Vacina Coelhos
(10,10); -- Tartaruga / Múltipla Tartarugas

-- =========================================================
-- 14) VACINAS_TOMADAS
-- =========================================================
INSERT INTO vacinas_tomadas (id_animal, id_vacina, valor, data_vacina)
VALUES
(1, 1, 80.00, '2023-06-10'),
(1, 3, 60.00, '2023-06-20'),
(2, 5, 85.00, '2023-07-15'),
(3, 1, 80.00, '2022-10-05'),
(3, 3, 60.00, '2022-10-20'),
(4, 5, 85.00, '2023-09-01'),
(6, 3, 60.00, '2023-03-10'),
(7, 8, 40.00, '2023-12-01'),
(8, 1, 80.00, '2023-11-11'),
(9, 9, 45.00, '2021-04-04');

-- =========================================================
-- 15) DOACAO
-- =========================================================
INSERT INTO doacao (valor, data_doacao, id_filial)
VALUES
(100.00, '2024-01-05', 1),
(250.00, '2024-01-20', 1),
(300.00, '2024-02-10', 2),
(80.00,  '2024-02-15', 3),
(500.00, '2024-03-01', 4),
(200.00, '2024-03-05', 2),
(150.00, '2024-03-10', 5),
(600.00, '2024-04-01', 1),
(50.00,  '2024-04-05', 3),
(700.00, '2024-04-10', 2);

-- =========================================================
-- 16) EVENTO
-- =========================================================
INSERT INTO evento (id_filial, id_endereco, descricao_evento)
VALUES
(1, 1, 'Feira de Adoção Centro SP'),
(1, 2, 'Campanha de Vacinação SP'),
(2, 3, 'Feira de Adoção Pinheiros'),
(2, 4, 'Mutirão de Castração Curitiba'),
(3, 5, 'Feira de Adoção Copacabana'),
(4, 6, 'Evento Pet Florianópolis'),
(5, 7, 'Campanha de Doação BH'),
(6, 8, 'Feira Porto Alegre'),
(7, 9, 'Campanha Campinas'),
(8,10, 'Feira Santos');

-- =========================================================
-- 17) ANIMAL_RACA  (N:N)
-- =========================================================
INSERT INTO animal_raca (id_animal, id_raca)
VALUES
(1, 1),  -- Rex - SRD Pequeno
(2, 4),  -- Mia - Siamês
(3, 3),  -- Thor - Labrador
(4, 5),  -- Luna - Persa
(5, 2),  -- Bob - SRD Médio
(6, 6),  -- Nina - Coelho Lop
(7, 7),  -- Pipoca - Calopsita
(8, 1),  -- Bidu - SRD Pequeno
(9, 9),  -- Chico - Hamster Sírio
(10,8);  -- Mel - Canário

-- =========================================================
-- 18) ANIMAL_EVENTO  (N:N)
-- =========================================================
INSERT INTO animal_evento (id_animal, id_evento)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- =========================================================
-- 19) ADOCAO  (usa id_adotante e id_animal)
-- =========================================================
INSERT INTO adocao (id_adotante, id_animal, data_adocao, taxa_adocao, data_contrato, contrato, status)
VALUES
(1, 1, '2024-01-10', 150.00, '2024-01-10', 'contrato_001.pdf', 'Concluída'),
(2, 3, '2024-01-15', 120.00, '2024-01-15', 'contrato_002.pdf', 'Concluída'),
(3, 6, '2024-02-05', 130.00, '2024-02-05', 'contrato_003.pdf', 'Concluída'),
(4, 8, '2024-02-20', 100.00, '2024-02-20', 'contrato_004.pdf', 'Em análise'),
(5, 2, '2024-03-01', 180.00, '2024-03-01', 'contrato_005.pdf', 'Concluída'),
(1, 4, '2024-03-10', 140.00, '2024-03-10', 'contrato_006.pdf', 'Concluída'),
(6, 5, '2024-03-20', 110.00, '2024-03-20', 'contrato_007.pdf', 'Cancelada'),
(7, 7, '2024-04-02', 160.00, '2024-04-02', 'contrato_008.pdf', 'Concluída'),
(8, 9, '2024-04-15', 150.00, '2024-04-15', 'contrato_009.pdf', 'Concluída'),
(9,10, '2024-05-01', 170.00, '2024-05-01', 'contrato_010.pdf', 'Em análise');

-- =========================================================
-- 20) ESPECIE_FUNCIONARIO  (N:N)
-- =========================================================
INSERT INTO especie_funcionario (id_funcionario, id_especie)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4),
(5, 3),
(6, 1),
(7, 5),
(8, 1),
(9, 2),
(10,1);