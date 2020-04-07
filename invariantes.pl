 %--------------------------------- - - - - - - - - - -  -  -  -  -   -
 % Invariantes Estruturais e Referenciais

 %- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
 % Invariantes Universais

 % Invariante que garante que não existe conhecimento
 % perfeito positivo repetido

+T :: (solucoes(T, T, R),
       comprimento(R, 1)).

 % Invariante que garante que não existe conhecimento
 % perfeito negativo repetido

+(-T) :: (solucoes(T, -T, R),
          comprimento(R, 1)).

 % Invariante que não permite adicionar conhecimento
 % perfeito positivo que contradiz conhecimento perfeito negativo

 +T :: nao(-T).

 % Invariante que não permite adicionar conhecimento
 % perfeito negativo que contradiz conhecimento perfeito positivo

 +(-T) :: nao(T).

 % Invariante que garante que não existem excecoes repetidas

 +(excecao(T)) :: (solucoes(T, excecao(T), R),
                  comprimento(R, 1)).

 %- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
 % Invariantes Estruturais e Referenciais: Adjudicante

 % CHECK Invariante que garante que o id de cada adjudicante é único
 % para conhecimento perfeito positivo

 +adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes(IdAd, adjudicante(IdAd,_,_,_), R),comprimento(R, N),N==1).

 % Invariante que garante que o id de cada adjudicante é único
 % para conhecimento perfeito negativo

+(-adjudicante(IdAd,Nome,NIF,Morada)) :: (solucoes(IdAd, -adjudicante(IdAd,_,_,_), R),
                          comprimento(R, N),N==1).

 % CHECK Garantir que adjudicantes com ids diferentes têm diferente informação
 % para conhecimento perfeito positivo

 +adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((Nome,NIF,Morada), adjudicante(_,Nome,NIF,Morada), R),comprimento(R, 1)).

 % Garantir que adjudicantes com ids diferentes têm diferente informação
 % para conhecimento perfeito negativo

 +(-adjudicante(IdAd,Nome,NIF,Morada)) :: (solucoes((Nome,NIF,Morada), -adjudicante(_,Nome,NIF,Morada), R),comprimento(R, 1)).

 % CHECK Garantir que o NIF do adjudicante é válido (9 dígitos)
 % para conhecimento perfeito positivo

 +adjudicante(_,_,NIF,_) :: nifValido(NIF).

 % Garantir que o NIF do adjudicante é válido (9 dígitos)
 % para conhecimento perfeito negativo

 +(-adjudicante(_,_,NIF,_)) :: nifValido(NIF).

 % CHECK Garantir que o NIF do adjudicante é válido (>=0)
 % para conhecimento perfeito positivo

 +adjudicante(_,_,NIF,_) :: nifPositivo(NIF).

 % Garantir que o NIF do adjudicante é válido (>=0)
 % para conhecimento perfeito negativo

 +(-adjudicante(_,_,NIF,_)) :: nifPositivo(NIF).

 % Invariante que impede a inserção de conhecimento perfeito positivo relativo
 % a um adjudicante com nome interdito (conhecimento imperfeito interdito)

 +adjudicante(IdAd,Nome,NIF,Morada) :: (solucoes((IdAd,Nomeint,NIF,Morada), (adjudicante(IdAd,Nomeint,NIF,Morada), nulointerdito(Nomeint)), R),comprimento(R,0)).

 % Garantir que não é possível remover um adjudicante com contratos

 -adjudicante(IdAd,_,_,_) :: (solucoes(IdAd, contrato(IdAd,_,_,_,_,_,_,_,_), R),comprimento(R, 0)).

 %- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
 % Invariantes Estruturais e Referenciais: Adjudicatária

 % CHECK Invariante que garante que o id de cada entidade adjudicatária é único
 % para conhecimento perfeito positivo

 +adjudicataria(IdAda,Nome,NIF,Morada) :: (solucoes(IdAda, adjudicataria(IdAda,_,_,_), R),comprimento(R, 1)).

 % Invariante que garante que o id de cada entidade adjudicatária é único
 % para conhecimento perfeito negativo

 +(-adjudicataria(IdAda,Nome,NIF,Morada)) :: (solucoes(IdAda, -adjudicataria(IdAda,_,_,_), R),comprimento(R, 1)).

 % CHECK Garantir que entidades adjudicatárias com ids diferentes têm diferente informação
 % para conhecimento perfeito positivo

 +adjudicataria(IdAda,Nome,NIF,Morada) :: (solucoes((Nome,NIF,Morada), adjudicataria(_,Nome,NIF,Morada), R),comprimento(R, 1)).

 % Garantir que entidades adjudicatárias com ids diferentes têm diferente informação
 % para conhecimento perfeito negativo

 +(-adjudicataria(IdAda,Nome,NIF,Morada)) :: (solucoes((Nome,NIF,Morada), -adjudicataria(_,Nome,NIF,Morada), R),comprimento(R, 1)).

 % CHECK Garantir que o NIF da entidade adjudicatária é válido (9 dígitos)
 % para conhecimento perfeito positivo

 +adjudicataria(_,_,NIF,_) :: nifValido(NIF).

 % Garantir que o NIF da entidade adjudicatária é válido (9 dígitos)
 % para conhecimento perfeito negativo

 +(-adjudicataria(_,_,NIF,_)) :: nifValido(NIF).

 % CHECK Garantir que o NIF da entidade adjudicatária é válido (>=0)
 % para conhecimento perfeito positivo

 +adjudicataria(_,_,NIF,_) :: nifPositivo(NIF).

 % Garantir que o NIF da entidade adjudicatária é válido (>=0)
 % para conhecimento perfeito negativo

 +(-adjudicataria(_,_,NIF,_)) :: nifPositivo(NIF).

 % Garantir que não é possível remover uma entidade adjudicatária com contratos

 -adjudicataria(IdAda,_,_,_) :: (solucoes(IdAda, contrato(_,IdAda,_,_,_,_,_,_,_), R),comprimento(R, 0)).

 %- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
 % Invariantes Estruturais e Referenciais: Contrato

 % CHECK Garantir que o id do adjudicante associado ao contrato existe

 +contrato(IdAd,_,_,_,_,_,_,_,_) :: (solucoes(IdAd, adjudicante(IdAd,_,_,_), R),comprimento(R, 1)).

 % CHECK Garantir que o id da entidade adjudicatária associada ao contrato existe

 +contrato(_,IdAda,_,_,_,_,_,_,_) :: (solucoes(IdAda, adjudicataria(IdAda,_,_,_), R),comprimento(R, 1)).

 % CHECK Garantir que o valor de cada contrato é válido (>= 0)
 % para conhecimento perfeito positivo

 +contrato(_,_,_,_,_,Valor,_,_,_) :: valorValido(Valor).

 % Garantir que o valor de cada contrato é válido (>= 0)
 % para conhecimento perfeito negativo

 +(-contrato(_,_,_,_,_,Valor,_,_,_)) :: valorValido(Valor).

 % CHECK Garantir que o Tipo de Procedimento é válido (Ajuste direto, Consulta previa ou Concurso publico)
 % para conhecimento perfeito positivo

 +contrato(_,_,_,Procedimento,_,_,_,_,_) :: procedimentoValido(Procedimento).

 % Garantir que o Tipo de Procedimento é válido (Ajuste direto, Consulta previa ou Concurso publico)
 % para conhecimento perfeito negativo

 +(-contrato(_,_,_,Procedimento,_,_,_,_,_)) :: procedimentoValido(Procedimento).

 % CHECK Garantir que os contratos por Ajuste direto têm um valor igual ou inferior a 5000 euros
 % para conhecimento perfeito positivo

 +contrato(_,_,_,'Ajuste direto',_,Valor,_,_,_) :: valorAjuste(Valor).

 % Garantir que os contratos por Ajuste direto têm um valor igual ou inferior a 5000 euros
 % para conhecimento perfeito negativo

 +(-contrato(_,_,_,'Ajuste direto',_,Valor,_,_,_)) :: valorAjuste(Valor).

 % CHECK Garantir que o Tipo de Contrato é válido (Aquisicao de servicos)
 % para conhecimento perfeito positivo

 +contrato(_,_,Contrato,_,_,_,_,_,_) :: contratoValido(Contrato).

 % Garantir que o Tipo de Contrato é válido (Aquisicao de servicos)
 % para conhecimento perfeito negativo

 +(-contrato(_,_,Contrato,_,_,_,_,_,_)) :: contratoValido(Contrato).