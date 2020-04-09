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

evolucao(contrato(IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, idad) :-
    evolucao(contrato(IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAd_desconhecido,IdAdjudicataria,TC,TP,Desc,V,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id da entidade adjudicatária desconhecido

evolucao(contrato(IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, idada) :-
    evolucao(contrato(IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAda_desconhecido,TC,TP,Desc,V,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de contrato desconhecido

evolucao(contrato(IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, tipodecontrato) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TipoDeContrato_desconhecido,TP,Desc,V,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de procedimento desconhecido

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Data), contrato, incerto, tipodeprocedimento) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TipoDeProcedimento_desconhecido,Desc,V,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com descrição desconhecida

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Data), contrato, incerto, descricao) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Descricao_desconhecida,V,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com valor desconhecido

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Data), contrato, incerto, valor) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,Valor_desconhecido,P,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com prazo desconhecido

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Data), contrato, incerto, prazo) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,Prazo_desconhecido,L,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com local desconhecido

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Data), contrato, incerto, local) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Data), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,Local_desconhecido,D))).

% CHECK Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com data desconhecida

evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data_desconhecida), contrato, incerto, data) :-
    evolucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data_desconhecida), positivo),
    insercao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                    contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,Data_desconhecida))).

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

involucao(contrato(IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, idad) :-
    involucao(contrato(IdAd_desconhecido,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAd_desconhecido,IdAdjudicataria,TC,TP,Desc,V,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com id da entidade adjudicatária desconhecido

involucao(contrato(IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, idada) :-
    involucao(contrato(IdAd,IdAda_desconhecido,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAda_desconhecido,TC,TP,Desc,V,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de contrato desconhecido

involucao(contrato(IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), contrato, incerto, tipodecontrato) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato_desconhecido,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TipoDeContrato_desconhecido,TP,Desc,V,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com tipo de procedimento desconhecido

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Data), contrato, incerto, tipodeprocedimento) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento_desconhecido,Descricao,Valor,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TipoDeProcedimento_desconhecido,Desc,V,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com descrição desconhecida

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Data), contrato, incerto, descricao) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao_desconhecida,Valor,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Descricao_desconhecida,V,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com valor desconhecido

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Data), contrato, incerto, valor) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor_desconhecido,Prazo,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,Valor_desconhecido,P,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com prazo desconhecido

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Data), contrato, incerto, prazo) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo_desconhecido,Local,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,Prazo_desconhecido,L,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com local desconhecido

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Data), contrato, incerto, local) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local_desconhecido,Data), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,Local_desconhecido,D))).

% CHECK Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do contrato com data desconhecida

involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data_desconhecida), contrato, incerto, data) :-
    involucao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data_desconhecida), positivo),
    remocao((excecao(contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,D)) :-
                     contrato(IdAdjudicante,IdAdjudicataria,TC,TP,Desc,V,P,L,Data_desconhecida))).

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
    remocao((excecao(adjudicante(IdAdjudicante,N,Nif,M)) :-
                adjudicante(IdAdjudicante,Nome_impossivel,Nif,M))),
    remocao((nulointerdito(Nome_impossivel))).
