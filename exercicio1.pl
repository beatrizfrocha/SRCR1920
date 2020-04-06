%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de Conhecimento e Raciocínio com capacidade 
% para caracterizar um universo de discurso na área da contratação pública 
% para a realização de contratos para a prestação de serviços. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op( 900,xfy,'::' ).

:- dynamic '-'/1.
:- dynamic adjudicante/4.
:- dynamic adjudicataria/4.
:- dynamic contrato/9.

:- dynamic excecao/1.
:- dynamic nulointerdito/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado

:- include('estado.pl').
:- include('invariantes.pl').
:- include('aux.pl').
:- include('e_involucao.pl').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Pressuposto do Mundo Fechado
% para o predicado adjudicante e adjudicataria

-adjudicante(IdAd,Nome,NIF,Morada) :-
    nao(adjudicante(IdAd,Nome,NIF,Morada)),
    nao(excecao(adjudicante(IdAd,Nome,NIF,Morada))).

-adjudicataria(IdAda,Nome,NIF,Morada) :-
    nao(adjudicataria(IdAda,Nome,NIF,Morada)),
    nao(excecao(adjudicataria(IdAda,Nome,NIF,Morada))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Sistema de Inferência

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demoLista: [Questao],[Resposta] -> {V,F,D}
% capaz de responder a várias questões em simultâneo

demoLista([],[]).
demoLista([Questao|Questoes],[Resposta|Respostas]) :- demo(Questao,Resposta),
                          demoLista(Questoes,Respostas).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado conjuncaoLista: [Questao],Resposta -> {V,F,D}
% capaz de fazer a conjunção de uma lista de questões
% produzindo um resultado final

conjuncaoLista([],Resposta).
conjuncaoLista([Questao],Resposta) :- demo(Questao,Resposta).
conjuncaoLista([Questao|Questoes], Resposta) :- demo(Questao, Resposta1), 
    conjuncaoLista(Questoes,Resposta2), 
    conjuncao(Resposta1,Resposta2,Resposta).

% Extensao do predicado disjuncaoLista: [Questao],Resposta -> {V,F,D}
% capaz de fazer a disjunção de uma lista de questões
% produzindo um resultado final

disjuncaoLista([],Resposta).
disjuncaoLista([Questao],Resposta) :- demo(Questao,Resposta).
disjuncaoLista([Questao|Questoes], Resposta) :- demo(Questao, Resposta1), 
    disjuncaoLista(Questoes,Resposta2), 
    disjuncao(Resposta1,Resposta2,Resposta).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado conjuncao_disjuncao: (Operador, Questao1, Questao2),Resposta -> {V,F,D}
% capaz de fazer a conjunção ou a disjunção de duas questões
% produzindo um resultado final

conjuncao_disjuncao(('OR',Questao1,Questao2),Resposta) :- conjuncao_disjuncao(Questao1,Resposta1), conjuncao_disjuncao(Questao2,Resposta2), disjuncao(Resposta1,Resposta2,Resposta).
conjuncao_disjuncao(('AND',Questao1,Questao2),Resposta) :- conjuncao_disjuncao(Questao1,Resposta1), conjuncao_disjuncao(Questao2,Resposta2), conjuncao(Resposta1,Resposta2,Resposta).
conjuncao_disjuncao(Questao,Resposta) :- demo(Questao,Resposta).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado conjuncao_disjuncaoLista: [Questao], Resposta -> {V,F,D}
% capaz de fazer a conjunção e/ou disjunção de uma lista de questões
% produzindo um resultado final

conjuncao_disjuncaoLista([],verdadeiro).
conjuncao_disjuncaoLista([Questao],Resposta) :- demo(Questao,Resposta).
conjuncao_disjuncaoLista([Questao1,'AND'|Questoes],Resposta) :- demo(Questao1,Resposta1),
                            conjuncao_disjuncaoLista(Questoes,Resposta2),
                            conjuncao(Resposta1,Resposta2,Resposta).
conjuncao_disjuncaoLista([Questao1,'OR'|Questoes],Resposta) :- demo(Questao1,Resposta1),
                           conjuncao_disjuncaoLista(Questoes,Resposta2),
                           disjuncao(Resposta1,Resposta2,Resposta).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado conjuncao: X,Y -> {V,F,D}

conjuncao(verdadeiro,verdadeiro,verdadeiro).
conjuncao(verdadeiro,desconhecido,desconhecido).
conjuncao(desconhecido,verdadeiro,desconhecido).
conjuncao(desconhecido,desconhecido,desconhecido).
conjuncao(falso,_,falso).
conjuncao(_,falso,falso).

% Extensao do predicado disjuncao: X,Y -> {V,F,D}

disjuncao(verdadeiro,_,verdadeiro).
disjuncao(_,verdadeiro,verdadeiro).
disjuncao(falso,falso,falso).
disjuncao(falso,desconhecido,desconhecido).
disjuncao(desconhecido,falso,desconhecido).
disjuncao(desconhecido,desconhecido,desconhecido).

