%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicados Auxiliares

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: X,R -> {V,F}
% Devolve o comprimento de uma lista

comprimento( S,N ) :-
    length( S,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soluções: X,XS,R -> {V,F}
% Encontra todas as soluções

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inserção de conhecimento

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

% Remoção de conhecimento

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

% Testa se todos os predicados são verdadeiros

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Validações

% NIF válido (9 dígitos)

nifValido(N) :- number_chars(N,X), length(X,9).

% NIF válido (>=0)

nifPositivo(N) :- N >= 0.

% Valor válido (>=0)

valorValido(V) :- V >= 0.