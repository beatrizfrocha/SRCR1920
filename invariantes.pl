%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Universais

% Invariante que garante que não existe conhecimento
% perfeito positivo repetido

+C :: (solucoes(C, C, R),comprimento(R, 1)).

% Invariante que garante que não existe conhecimento
% perfeito negativo repetido

+(-C) :: (solucoes(C, -C, R),comprimento(R, 1)).

% Invariante que não permite adicionar conhecimento
% perfeito positivo que contradiz conhecimento perfeito negativo

+C :: nao(-C).

% Invariante que não permite adicionar conhecimento
% perfeito negativo que contradiz conhecimento perfeito positivo

+(-C) :: nao(C).

% Invariante que garante que não existem excecoes repetidas

+(excecao(C)) :: (solucoes(C, excecao(C), R),comprimento(R, 1)).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicante

% Invariante que garante que o id de cada adjudicante é único
% para conhecimento perfeito positivo

+adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes(Id, adjudicante(IdAd,_,_,_), R),comprimento(R, 1)).

% Invariante que garante que o id de cada adjudicante é único
% para conhecimento perfeito negativo

+(-adjudicante(IdAd,Nome,NIF,Morada)) :: (solucoes(Id, -adjudicante(IdAd,_,_,_), R),comprimento(R, 1)).

% Garantir que adjudicantes com ids diferentes têm diferente informação
% para conhecimento perfeito positivo

+adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((Nome,NIF,Morada), utente(_,Nome,NIF,Morada), R),comprimento(R, 1)).

% Garantir que adjudicantes com ids diferentes têm diferente informação
% para conhecimento perfeito negativo

+(-adjudicante(IdAd,Nome,NIF,Morada)) :: (solucoes((Nome,NIF,Morada), -utente(_,Nome,NIF,Morada), R),comprimento(R, 1)).