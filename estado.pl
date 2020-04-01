%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado adjudicante: #IdAd, Nome, NIF, Morada -> {V,F,D}

% Conhecimento Perfeito Positivo

adjudicante(1,'Município de Chaves',501205551,'Portugal,Vila Real,Chaves').
adjudicante(2,'Universidade do Minho',502011378,'Portugal,Braga,Braga').
adjudicante(3,'Benetton',980488443,'Portugal,Porto,Porto').
adjudicante(4,'Continente',501591109,'Portugal,Lisboa,Oeiras').
adjudicante(5,'EDP',503504564,'Portugal,Lisboa,Lisboa').
adjudicante(6,'Jerónimo Martins',500100144,'Portugal,Lisboa,Lisboa').
adjudicante(7,'Matrizauto',‎506678776,'Portugal,Porto,Marco de Canaveses').
adjudicante(8,'Vila Galé',501697276,'Portugal,Lisboa,Lisboa').

% Conhecimento Perfeito Negativo

-adjudicante(9,'Delta Cafés - Sociedade Gestora de Participações Sociais S.A',506210499,'Portugal,Lisboa,Lisboa').
-adjudicante(10,'P&C - Perfumes & Companhia, S.A',504163515,'Portugal,Lisboa,Cascais').

% Conhecimento Imperfeito Incerto
% Não se sabe o nif de Tintas Robbialac, S. A.:

adjudicante(11,'Tintas Robbialac, S. A.',nif_desconhecido,'Portugal,Lisboa,Loures').
excecao(adjudicante(IdAd,Nome,NIF,Morada)) :- adjudicante(IdAd,Nome,nif_desconhecido,Morada).

% Conhecimento Imperfeito Impreciso
% Não se sabe se Porcelanosa Lisboa - Comércio de Materiais de Construção, S.A tem nif 507512570 ou 507512571:

excecao(adjudicante(12,'Porcelanosa Lisboa - Comércio de Materiais de Construção, S.A',507512570,'Portugal,Lisboa,Lisboa')).
excecao(adjudicante(12,'Porcelanosa Lisboa - Comércio de Materiais de Construção, S.A',507512571,'Portugal,Lisboa,Lisboa')).

% Não se sabe se Bial - Consumer Health, S.A fica em Trofa ou Famalicão:

excecao(adjudicante(13,'Bial - Consumer Health, S.A',508905800,'Portugal,Porto,Trofa')).
excecao(adjudicante(13,'Bial - Consumer Health, S.A',508905800,'Portugal,Braga,Famalicão')).

% Conhecimento Imperfeito Interdito
% É impossível saber o nif da entidade adjudicante:

adjudicante(14,'Companhia de Seguros Fidelidade, S.a',nif_impossivel,'Portugal,Lisboa,Lisboa').
excecao(adjudicante(IdAd,Nome,NIF,Morada)) :- adjudicante((IdAd,Nome,nif_impossivel,Morada)).
nulointerdito(nif_impossivel).
+adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((IdAd,Nome,NIF,Morada), (adjudicante(14,'Companhia de Seguros Fidelidade, S.a',nif_impossivel,'Portugal,Lisboa,Lisboa'), nao(nulointerdito(nif_impossivel))), R),comprimento(R,0)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado adjudicatária: #IdAda, Nome, NIF, Morada -> {V,F,D}

% Conhecimento Perfeito Positivo

adjudicataria(1,'IKEA',505416654,'Portugal,Lisboa,Loures').
adjudicataria(2,'Maxmat',503246468,'Portugal,Porto,Maia').
adjudicataria(3,'Michelin',500908710,'Portugal,Lisboa,Lisboa').
adjudicataria(4,'FCB - Sociedade de Advogados',502152109,'Portugal,Lisboa,Lisboa').
adjudicataria(5,'Padaria Portuguesa',509323065,'Portugal,Lisboa,Lisboa').
adjudicataria(6,'Cofina Media',502801034,'Portugal,Lisboa,Lisboa').
adjudicataria(7,'Vista Alegre Atlantis, S.A',500889139,'Portugal,Aveiro,Ílhavo').

% Conhecimento Perfeito Negativo

-adjudicataria(8,'Staples Portugal - Equipamento de Escritório, S.A',503789372,'Portugal,Lisboa,Oeiras').
-adjudicataria(9,'Worten - Equipamentos Para O Lar S.A',503630330,'Portugal,Porto,Matosinhos').

% Conhecimento Imperfeito Incerto
% Não se sabe a morada de Roca, S.A:

adjudicataria(10,'Roca, S.A',500203466,morada_desconhecida).
excecao(adjudicataria(IdAda,Nome,NIF,Morada)) :- adjudicataria(IdAda,Nome,NIF,morada_desconhecida).

% Conhecimento Imperfeito Impreciso
% Não se sabe se a entidade adjudicatária se chama Xerox Portugal - Equipamentos de Escritório, Lda ou Zerox Portugal - Equipamentos de Escritório, Lda

excecao(adjudicataria(11,'Xerox Portugal - Equipamentos de Escritório, Lda',501656677,'Portugal,Lisboa,Lisboa')).
excecao(adjudicataria(11,'Zerox Portugal - Equipamentos de Escritório, Lda',501656677,'Portugal,Lisboa,Lisboa')).

% Conhecimento Imperfeito Interdito
% É impossível saber a morada da entidade adjudicatária:

adjudicataria(12,'Rubbermaid Portugal, Lda',500031835,morada_impossivel).
excecao(adjudicataria(IdAda,Nome,NIF,Morada)) :- adjudicataria(IdAda,Nome,NIF,morada_impossivel).
nulointerdito(morada_impossivel).
+adjudicataria(IdAda,Nome,NIF,Morada) :: (solucoes((IdAda,Nome,NIF,Morada),(adjudicataria(12,'Rubbermaid Portugal, Lda',500031835,morada_impossivel),nao(nulointerdito(morada_impossivel))), R),comprimento(R,0)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado contrato:#IdAd, #IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Data -> {V,F,D}
% Conhecimento Perfeito Positivo

contrato(1,4,'Aquisição de serviços','Ajuste direto','Assessoria jurídica',5000,40,'Lisboa',12-01-2020).
contrato(5,1,'Locação de bens móveis','Consulta prévia','Disponibilização de materiais',67900,200,'Loures',04-02-2020).
contrato(3,5,'Aquisição de bens móveis','Concurso público','Serviço de catering',2400,30,'Lisboa',05-03-2020).
contrato(8,7,'Aquisição de serviços','Ajuste direto','Decoração da área de restauração',76,568,'Ílhavo',02-04-2020).
contrato(2,2,'Locação de bens móveis','Consulta prévia','Disponibilização de materiais',3265,365,'Maia',30-01-2020).
contrato(7,3,'Aquisição de bens móveis','Concurso público','Manutenção de pneus',5489,730,'Lisboa',23-02-2020).
contrato(5,7,'Aquisição de serviços','Ajuste direto','Decoração da área de restauração',988,95,'Ílhavo',18-03-2020).
contrato(3,5,'Locação de bens móveis','Consulta prévia','Serviço de catering','Lisboa',6000,395,08-04-2020).
contrato(6,2,'Aquisição de bens móveis','Concurso público','Disponibilização de ferramentas','Maia',4600,600,11-01-2020).

-contrato(4,8,'Aquisição de serviços','Ajuste direto','Disponibilização de material de escritório',543,120,'Oeiras',03-03-2020).
-contrato(6,6,'Locação de bens móveis','Consulta prévia','Prestação de serviços audiovisuais',4090,7,'Lisboa',13-02-2020).
-contrato(10,9,'Aquisição de bens móveis','Concurso público','Disponibilização de eletrodomésticos',7000,90,'Matosinhos',14-02-2020).

% Conhecimento Imperfeito Incerto
% Não se sabe a descrição do contrato:

contrato(3,5,'Aquisição de serviços','Ajuste direto',descricao_desconhecida,4900,75,'Lisboa','16-01-2020').
excecao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data)) :- contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,descricao_desconhecida,Valor,Prazo,Local,Data).

% Conhecimento Imperfeito Impreciso
% Não se sabe se o contrato foi efetuado dia 01-01-2020 ou dia 02-02-2020

excecao(contrato(5,1,'Locação de bens móveis','Consulta prévia','Disponibilização de materiais',3000,100,'Loures',01-02-2020)).
excecao(contrato(5,1,'Locação de bens móveis','Consulta prévia','Disponibilização de materiais',3000,100,'Loures',02-02-2020)).

% Conhecimento Imperfeito Impreciso
% Não se sabe se o cuidado foi efetuado no dia 1 ou 2 de março de 2019:
excecao(cuidado('01-03-2019',5,1,'Consulta de rotina',9)).
excecao(cuidado('02-03-2019',5,1,'Consulta de rotina',9)).