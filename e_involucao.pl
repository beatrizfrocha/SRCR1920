%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução/Involução de conhecimento

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento perfeito (positivo e negativo)

% CHECK Insere novo conhecimento na base de conhecimento

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

% CHECK Insere conhecimento perfeito positivo na base de conhecimento

evolucao(Termo, positivo) :-
    solucoes(Invariante, +Termo::Invariante, Lista),
    insercao(Termo),
    teste(Lista).

% CHECK Insere conhecimento perfeito negativo na base de conhecimento

 evolucao(Termo,negativo) :-
     solucoes(Invariante, +(-Termo)::Invariante, Lista),
     insercao(-Termo),
     teste(Lista).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito incerto

% Adjudicante

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com nome desconhecido

evolucao(adjudicante(IdAd,Nome_desconhecido,NIF,Morada), adjudicante, incerto, nome) :-
    evolucao(adjudicante(IdAd,Nome_desconhecido,NIF,Morada), positivo),
    insercao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                    adjudicante(IdAdjudicante,Nome_desconhecido,Nif,M))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com NIF desconhecido

evolucao(adjudicante(IdAd,Nome,NIF_desconhecido,Morada), adjudicante, incerto, nif) :-
    evolucao(adjudicante(IdAd,Nome,NIF_desconhecido,Morada), positivo),
    insercao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                    adjudicante(IdAdjudicante,N,NIF_desconhecido,M))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com morada desconhecida

evolucao(adjudicante(IdAd,Nome,NIF,Morada_desconhecida), adjudicante, incerto, morada) :-
    evolucao(adjudicante(IdAd,Nome,NIF,Morada_desconhecida), positivo),
    insercao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                    adjudicante(IdAdjudicante,N,Nif,Morada_desconhecida))).

% Adjudicatária

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com nome desconhecido

evolucao(adjudicataria(IdAda,Nome_desconhecido,NIF,Morada), adjudicataria, incerto, nome) :-
    evolucao(adjudicataria(IdAda,Nome_desconhecido,NIF,Morada), positivo),
    insercao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                    adjudicataria(IdAdjudicataria,Nome_desconhecido,Nif,M))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com NIF desconhecido

evolucao(adjudicataria(IdAda,Nome,NIF_desconhecido,Morada), adjudicataria, incerto, nif) :-
    evolucao(adjudicataria(IdAda,Nome,NIF_desconhecido,Morada), positivo),
    insercao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                    adjudicataria(IdAdjudicataria,N,NIF_desconhecido,M))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com morada desconhecida

evolucao(adjudicataria(IdAda,Nome,NIF,Morada_desconhecida), adjudicataria, incerto, morada) :-
    evolucao(adjudicataria(IdAda,Nome,NIF,Morada_desconhecida), positivo),
    insercao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                    adjudicataria(IdAdjudicataria,N,Nif,Morada_desconhecida))).

% Contrato

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id de adjudicante desconhecido

evolucao(contrato(IdC,IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, idad) :-
    evolucao(contrato(IdC,IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAd_desconhecido,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id da entidade adjudicatária desconhecido

evolucao(contrato(IdC,IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, idada) :-
    evolucao(contrato(IdC,IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAda_desconhecido,TC,TP,Desc,V,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de contrato desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, tipodecontrato) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TipoDeContrato_desconhecido,TP,Desc,V,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de procedimento desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, tipodeprocedimento) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TipoDeProcedimento_desconhecido,Desc,V,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com descrição desconhecida

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, descricao) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Descricao_desconhecida,V,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com valor desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Dia,Mes,Ano), contrato, incerto, valor) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,Valor_desconhecido,P,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com prazo desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Dia,Mes,Ano), contrato, incerto, prazo) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,Prazo_desconhecido,L,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com local desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Dia,Mes,Ano), contrato, incerto, local) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Dia,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,Local_desconhecido,D,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com dia desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia_desconhecido,Mes,Ano), contrato, incerto, dia) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia_desconhecido,Mes,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,Dia_desconhecido,M,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com mes desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes_desconhecido,Ano), contrato, incerto, mes) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes_desconhecido,Ano), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,Mes_desconhecido,A))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com ano desconhecido

evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano_desconhecido), contrato, incerto, ano) :-
    evolucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano_desconhecido), positivo),
    insercao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                    contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,Ano_desconhecido))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% CHECK Insere conhecimento imperfeito impreciso na base de conhecimento
% seja de adjudicante, adjudicatária ou contrato

evolucao(Termo, impreciso) :-
    solucoes(Invariante, +(excecao(Termo))::Invariante, Lista),
    insercao(excecao(Termo)),
    teste(Lista).

% CHECK Insere conhecimento imperfeito impreciso na base de conhecimento
% no caso de adjudicante com NIF contido dentro de um intervalo finito de valores

evolucao(adjudicante(IdAd,Nome,NIF_impreciso,Morada), adjudicante, impreciso, nif, LI, LS) :-
    insercao((excecao(adjudicante(IdAd,Nome,NIF_impreciso,Morada)) :-
                    NIF_impreciso >= LI, NIF_impreciso =< LS)).

% CHECK Insere conhecimento imperfeito impreciso na base de conhecimento
% no caso da entidade adjudicatária com NIF contido dentro de um intervalo finito de valores

evolucao(adjudicataria(IdAda,Nome,NIF_impreciso,Morada), adjudicataria, impreciso, nif, LI, LS) :-
    insercao((excecao(adjudicataria(IdAda,Nome,NIF_impreciso,Morada)) :-
                    NIF_impreciso >= LI, NIF_impreciso =< LS)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito

% CHECK Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de adjudicante com nome interdito
 
evolucao(adjudicante(IdAd,Nome_impossivel,NIF,Morada), adjudicante, interdito, nome) :-
    evolucao(adjudicante(IdAd,Nome_impossivel,NIF,Morada), positivo),
    insercao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                adjudicante(IdAdjudicante,Nome_impossivel,Nif,M))),
    insercao((nulointerdito(Nome_impossivel))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento perfeito (positivo e negativo)

% CHECK Extensão do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
    remocao( Termo ),
    teste( Lista ).

% CHECK Retira conhecimento perfeito positivo na base de conhecimento

involucao(Termo, positivo) :-
    solucoes(Invariante, -Termo::Invariante, Lista),
    remocao(Termo),
    teste(Lista).

% CHECK Retira conhecimento perfeito negativo na base de conhecimento

involucao(Termo, negativo) :-
    solucoes(Invariante, -(-Termo)::Invariante, Lista),
    remocao(-Termo),
    teste(Lista).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito incerto

% Adjudicante

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com nome desconhecido

involucao(adjudicante(IdAd,Nome_desconhecido,NIF,Morada), adjudicante, incerto, nome) :-
    involucao(adjudicante(IdAd,Nome_desconhecido,NIF,Morada), positivo),
    remocao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                     adjudicante(IdAdjudicante,Nome_desconhecido,Nif,M))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com NIF desconhecido

involucao(adjudicante(IdAd,Nome,NIF_desconhecido,Morada), adjudicante, incerto, nif) :-
    involucao(adjudicante(IdAd,Nome,NIF_desconhecido,Morada), positivo),
    remocao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                     adjudicante(IdAdjudicante,N,NIF_desconhecido,M))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com morada desconhecida

involucao(adjudicante(IdAd,Nome,NIF,Morada_desconhecida), adjudicante, incerto, morada) :-
    involucao(adjudicante(IdAd,Nome,NIF,Morada_desconhecida), positivo),
    remocao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                     adjudicante(IdAdjudicante,N,Nif,Morada_desconhecida))).

% Adjudicatária

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com nome desconhecido

involucao(adjudicataria(IdAda,Nome_desconhecido,NIF,Morada), adjudicataria, incerto, nome) :-
    involucao(adjudicataria(IdAda,Nome_desconhecido,NIF,Morada), positivo),
    remocao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                     adjudicataria(IdAdjudicataria,Nome_desconhecido,Nif,M))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com NIF desconhecido

involucao(adjudicataria(IdAda,Nome,NIF_desconhecido,Morada), adjudicataria, incerto, nif) :-
    involucao(adjudicataria(IdAda,Nome,NIF_desconhecido,Morada), positivo),
    remocao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                     adjudicataria(IdAdjudicataria,N,NIF_desconhecido,M))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso da entidade adjudicatária com morada desconhecida

involucao(adjudicataria(IdAda,Nome,NIF,Morada_desconhecida), adjudicataria, incerto, morada) :-
    involucao(adjudicataria(IdAda,Nome,NIF,Morada_desconhecida), positivo),
    remocao((excecao(adjudicataria(IdAdjudicataria,N,Nif,M)) :-
                     adjudicataria(IdAdjudicataria,N,Nif,Morada_desconhecida))).

% Contrato

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id de adjudicante desconhecido

involucao(contrato(IdC,IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, idad) :-
    involucao(contrato(IdC,IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAd_desconhecido,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id da entidade adjudicatária desconhecido

involucao(contrato(IdC,IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, idada) :-
    involucao(contrato(IdC,IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAda_desconhecido,TC,TP,Desc,V,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de contrato desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, tipodecontrato) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TipoDeContrato_desconhecido,TP,Desc,V,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de procedimento desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, tipodeprocedimento) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TipoDeProcedimento_desconhecido,Desc,V,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com descrição desconhecida

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Dia,Mes,Ano), contrato, incerto, descricao) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Descricao_desconhecida,V,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com valor desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Dia,Mes,Ano), contrato, incerto, valor) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,Valor_desconhecido,P,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com prazo desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Dia,Mes,Ano), contrato, incerto, prazo) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,Prazo_desconhecido,L,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com local desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Dia,Mes,Ano), contrato, incerto, local) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Dia,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,Local_desconhecido,D,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com dia desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia_desconhecido,Mes,Ano), contrato, incerto, dia) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia_desconhecido,Mes,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,Dia_desconhecido,M,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com mes desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes_desconhecido,Ano), contrato, incerto, mes) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes_desconhecido,Ano), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,Mes_desconhecido,A))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com ano desconhecido

involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano_desconhecido), contrato, incerto, ano) :-
    involucao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano_desconhecido), positivo),
    remocao((excecao(contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,A)) :-
                     contrato(IdContrato,IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D,M,Ano_desconhecido))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito impreciso

% Retira conhecimento imperfeito impreciso na base de conhecimento
% seja de adjudicante, adjudicatária ou contrato

involucao(Termo, impreciso) :-
    solucoes(Invariante, -(excecao(Termo))::Invariante, Lista),
    remocao(excecao(Termo)),
    teste(Lista).

% CHECK Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de adjudicante com NIF contido dentro de um intervalo finito de valores

involucao(adjudicante(IdAd,Nome,NIF_impreciso,Morada), adjudicante, impreciso, nif, LI, LS) :-
    remocao((excecao(adjudicante(IdAd,Nome,NIF_impreciso,Morada)) :-
                    NIF_impreciso >= LI, NIF_impreciso =< LS)).

% CHECK Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso da entidade adjudicatária com NIF contido dentro de um intervalo finito de valores

involucao(adjudicataria(IdAda,Nome,NIF_impreciso,Morada), adjudicataria, impreciso, nif, LI, LS) :-
    remocao((excecao(adjudicataria(IdAda,Nome,NIF_impreciso,Morada)) :-
                    NIF_impreciso >= LI, NIF_impreciso =< LS)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito interdito

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de adjudicante com nome interdito

 involucao(adjudicante(IdAd,Nome_impossivel,NIF,Morada), adjudicante, interdito, nome) :-
    involucao(adjudicante(IdAd,Nome_impossivel,NIF,Morada), positivo),
    remocao((excecao(utente(IdAdjudicante,N,Nif,M)) :-
                adjudicante(IdAdjudicante,Nome_impossivel,N,Nif,M))),
    remocao((nulointerdito(Nome_impossivel))).