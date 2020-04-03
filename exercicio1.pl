%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de Conhecimento e Raciocínio com capacidade 
% para caracterizar um universo de discurso na área da contratação pública 
% para a realização contratos para a prestação de serviços. 

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
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).
