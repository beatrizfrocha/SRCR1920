%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicados Auxiliares

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% CHECK Extensao do predicado comprimento: X,R -> {V,F}
% Devolve o comprimento de uma lista

comprimento( S,N ) :-
    length( S,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% CHECK Extensao do predicado soluções: X,XS,R -> {V,F}
% Encontra todas as soluções

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% CHECK Inserção de conhecimento

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

% CHECK Remoção de conhecimento

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

% CHECK Testa se todos os predicados são verdadeiros

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Validações

% CHECK NIF válido (9 dígitos)

nifValido(N) :- number_chars(N,X), length(X,9).

% CHECK NIF válido (>=0)

nifPositivo(N) :- N >= 0.

% CHECK Valor válido (>=0)

valorValido(V) :- V >= 0.

% CHECK Tipo de Procedimento válido (Ajuste direto, Consulta previa ou Concurso publico)

procedimentoValido(P) :- P == 'Ajuste direto'; 
                         P == 'Consulta previa';
                         P == 'Concurso publico'.

% CHECK Valor igual ou inferior a 5000 euros

valorAjuste(V) :- V =< 5000.

% CHECK Tipo de Contrato válido (Aquisicao de servicos)

contratoValido(C) :- C == 'Aquisicao de servicos'.

% CHECK Data válida (=< 1 ano)

dataValida(A) :- 2020-A =< 1.

% Regra dos 3 anos válida

regraValida(IdAd,IdAda,Ano,Valor) :- listaContratos(IdAd,IdAda,R),!,
                               filtraContratos(R,Ano,S),!,
                               somaContratos(S,N),!,
                               somaValida(N,Valor).

listaContratos(IdAd,IdAda,R) :- solucoes((Valor,Ano),contrato(_,IdAd,IdAda,_,_,_,Valor,_,_,_,_,Ano),R).

filtraContratos([],AnoC,[]).
filtraContratos([(Valor,Ano)|T],AnoC,R) :- anoValido(Ano,AnoC), filtraContratos(T,AnoC,R1), R = [(Valor,Ano)|R1];
                                           filtraContratos(T,AnoC,R1), R = R1.

anoValido(Ano,AnoC) :- AnoC - Ano >= 0, AnoC - Ano =< 3.

somaContratos([],0).
somaContratos([(Valor,Ano)|T],R) :- somaContratos(T,R1), R is Valor + R1.

somaValida(S,Valor) :- S < 75000+Valor.







%%%%%%%%%%%%