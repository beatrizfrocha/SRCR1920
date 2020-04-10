%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado adjudicante: #IdAd, Nome, NIF, Morada -> {V,F,D}

% Conhecimento Perfeito Positivo

adjudicante(1,'Municipio de Chaves',501205551,'Portugal,Vila Real,Chaves').
adjudicante(2,'Universidade do Minho',502011378,'Portugal,Braga,Braga').
adjudicante(3,'Benetton Textil - Confeccao de Texteis S.A',505919796,'Portugal,Porto,Porto').
adjudicante(4,'Continente Hipermercados, S.A',501591109,'Portugal,Lisboa,Oeiras').
adjudicante(5,'Edp Distribuicao - Energia S.A',504394029,'Portugal,Lisboa,Lisboa').
adjudicante(6,'Jeronimo Martins SGPS SA',500100144,'Portugal,Lisboa,Lisboa').
adjudicante(7,'Matrizauto - Comercio de Automoveis, S.A',506678776,'Portugal,Porto,Marco de Canaveses').
adjudicante(8,'Vila Gale-Sociedade de Empreendimentos Turisticos S.A',501697276,'Portugal,Lisboa,Lisboa').

% Conhecimento Perfeito Negativo

-adjudicante(9,'Delta Cafes - Sociedade Gestora de Participacoes Sociais S.A',506210499,'Portugal,Lisboa,Lisboa').
-adjudicante(10,'P&C - Perfumes & Companhia, S.A',504163515,'Portugal,Lisboa,Cascais').

% Conhecimento Imperfeito Incerto
% Não se sabe o nif de Tintas Robbialac, S. A.:

adjudicante(11,'Tintas Robbialac, S. A.',nif_desconhecido,'Portugal,Lisboa,Loures').
excecao(adjudicante(IdAd,Nome,NIF,Morada)) :- adjudicante(IdAd,Nome,nif_desconhecido,Morada).

% Conhecimento Imperfeito Impreciso
% Não se sabe se Porcelanosa Lisboa - Comercio de Materiais de Construcao, S.A tem nif 507512570 ou 507512571:

excecao(adjudicante(12,'Porcelanosa Lisboa - Comercio de Materiais de Construcao, S.A',507512570,'Portugal,Lisboa,Lisboa')).
excecao(adjudicante(12,'Porcelanosa Lisboa - Comercio de Materiais de Construcao, S.A',507512571,'Portugal,Lisboa,Lisboa')).

% Não se sabe se Bial - Consumer Health, S.A fica em Trofa ou Vila Nova de Famalicao:

excecao(adjudicante(13,'Bial - Consumer Health, S.A',508905800,'Portugal,Porto,Trofa')).
excecao(adjudicante(13,'Bial - Consumer Health, S.A',508905800,'Portugal,Braga,Vila Nova de Famalicao')).

% Não se sabe o nif exato de Casio Espa A Sl - Sucursal Em Portugal
% apenas se sabe que está entre 900000000 e 1000000000:

excecao(adjudicante(14,'Casio Espa A Sl - Sucursal Em Portugal',NIF,'Portugal,Lisboa,Lisboa')) :- NIF >= 900000000, NIF =< 1000000000.

% Conhecimento Imperfeito Interdito
% É impossível saber o nif da entidade adjudicante:

adjudicante(15,nome_impossivel,123456789,'Portugal,Lisboa,Lisboa').
excecao(adjudicante(IdAd,Nome,NIF,Morada)) :- adjudicante((IdAd,nome_impossivel,NIF,Morada)).
nulointerdito(nome_impossivel).
+adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((IdAd,Nome,NIF,Morada), (adjudicante(15,nome_impossivel,123456789,'Portugal,Lisboa,Lisboa'), nao(nulointerdito(nome_impossivel))), R),comprimento(R,0)).


adjudicante(15,'Fidelidade - Companhia de Seguros, S.A',nif_impossivel,'Portugal,Lisboa,Lisboa').
excecao(adjudicante(IdAd,Nome,NIF,Morada)) :- adjudicante((IdAd,Nome,nif_impossivel,Morada)).
nulointerdito(nif_impossivel).
+adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((IdAd,Nome,NIF,Morada), (adjudicante(15,'Fidelidade - Companhia de Seguros, S.A',nif_impossivel,'Portugal,Lisboa,Lisboa'), nao(nulointerdito(nif_impossivel))), R),comprimento(R,0)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado adjudicatária: #IdAda, Nome, NIF, Morada -> {V,F,D}

% Conhecimento Perfeito Positivo

adjudicataria(1,'Ikea Portugal - Moveis e Decoracao Lda',505416654,'Portugal,Lisboa,Loures').
adjudicataria(2,'Modelo - Distribuicao de Materiais de Construcao S.A',503246468,'Portugal,Porto,Maia').
adjudicataria(3,'Michelin, Companhia Luso-Pneu Lda',500908710,'Portugal,Lisboa,Lisboa').
adjudicataria(4,'F.castelo Branco & Associados - Sociedade de Advogados',502152109,'Portugal,Lisboa,Lisboa').
adjudicataria(5,'A Padaria Portuguesa Cq - Actividades Hoteleiras, Lda',509323065,'Portugal,Lisboa,Lisboa').
adjudicataria(6,'Cofina Media, S.A',502801034,'Portugal,Lisboa,Lisboa').
adjudicataria(7,'Woodspace - Design e Arquitectura de Interiores, Lda',514348712,'Portugal,Porto,Paredes').

% Conhecimento Perfeito Negativo

-adjudicataria(8,'Staples Portugal - Equipamento de Escritorio, S.A',503789372,'Portugal,Lisboa,Oeiras').
-adjudicataria(9,'Worten - Equipamentos Para O Lar S.A',503630330,'Portugal,Porto,Matosinhos').

% Conhecimento Imperfeito Incerto
% Não se sabe a morada de Roca, S.A:

adjudicataria(10,'Roca, S.A',500203466,morada_desconhecida).
excecao(adjudicataria(IdAda,Nome,NIF,Morada)) :- adjudicataria(IdAda,Nome,NIF,morada_desconhecida).

% Conhecimento Imperfeito Impreciso
% Não se sabe se a entidade adjudicatária se chama Xerox Portugal - Equipamentos de Escritorio, Lda ou Zerox Portugal - Equipamentos de Escritorio, Lda

excecao(adjudicataria(11,'Xerox Portugal - Equipamentos de Escritorio, Lda',501656677,'Portugal,Lisboa,Lisboa')).
excecao(adjudicataria(11,'Zerox Portugal - Equipamentos de Escritorio, Lda',501656677,'Portugal,Lisboa,Lisboa')).

% Conhecimento Imperfeito Interdito
% É impossível saber a morada da entidade adjudicatária:

adjudicataria(12,'Rubbermaid Portugal, Lda',500031835,morada_impossivel).
excecao(adjudicataria(IdAda,Nome,NIF,Morada)) :- adjudicataria(IdAda,Nome,NIF,morada_impossivel).
nulointerdito(morada_impossivel).
+adjudicataria(IdAda,Nome,NIF,Morada) :: (solucoes((IdAda,Nome,NIF,Morada),(adjudicataria(12,'Rubbermaid Portugal, Lda',500031835,morada_impossivel),nao(nulointerdito(morada_impossivel))), R),comprimento(R,0)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado contrato: #IdC, #IdAd, #IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Dia, Mês, Ano -> {V,F,D}
% Conhecimento Perfeito Positivo

contrato(1,1,4,'Aquisicao de servicos','Ajuste direto','Assessoria juridica',5000,40,'Chaves',12,01,2020).
contrato(2,5,1,'Aquisicao de servicos','Consulta previa','Montagem de equipamento',900,200,'Lisboa',04,02,2020).
contrato(3,3,5,'Aquisicao de servicos','Concurso publico','Servico de catering',2400,30,'Porto',05,03,2020).
contrato(4,8,7,'Aquisicao de servicos','Ajuste direto','Decoracao da area de restauracao',76,268,'Lisboa',02,04,2020).
contrato(5,2,2,'Aquisicao de servicos','Consulta previa','Montagem de equipamento',265,365,'Braga',30,01,2020).
contrato(6,7,3,'Aquisicao de servicos','Concurso publico','Manutencao de pneus',489,730,'Marco de Canaveses',23,02,2020).
contrato(7,5,7,'Aquisicao de servicos','Ajuste direto','Decoracao da area de restauracao',988,95,'Lisboa',18,03,2020).
contrato(8,3,5,'Aquisicao de servicos','Consulta previa','Servico de catering',5000,395,'Porto',08,04,2020).
contrato(9,6,2,'Aquisicao de servicos','Concurso publico','Montagem de equipamento','Lisboa',4600,600,11,01,2020).

% Conhecimento Perfeito Negativo

-contrato(10,4,8,'Aquisicao de servicos','Ajuste direto','Manutencao de impressoras',543,120,'Oeiras',03,03,2020).
-contrato(11,6,6,'Aquisicao de servicos','Consulta previa','Prestacao de Servicos audiovisuais',4090,7,'Lisboa',13,02,2020).
-contrato(12,10,9,'Aquisicao de servicos','Concurso publico','Manutencao de eletrodomesticos',4000,90,'Cascais',14,02,2020).

% Conhecimento Imperfeito Incerto
% Não se sabe a descrição do contrato:

contrato(13,3,5,'Aquisicao de servicos','Ajuste direto',descricao_desconhecida,4900,75,'Porto',16,01,2020).
excecao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano)) :- contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,descricao_desconhecida,Valor,Prazo,Local,Dia,Mes,Ano).

% Conhecimento Imperfeito Impreciso
% Não se sabe se o contrato foi efetuado dia 01-01-2020 ou dia 02-02-2020

excecao(contrato(14,5,1,'Aquisicao de servicos','Consulta previa','Montagem de equipamento',3000,100,'Lisboa',01,02,2020)).
excecao(contrato(14,5,1,'Aquisicao de servicos','Consulta previa','Montagem de equipamento',3000,100,'Lisboa',02,02,2020)).
