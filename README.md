# Assistente Lógico Pessoal

> Atividade da disciplina Linguagem de Programação e Paradigmas · UNIDAVI · 2026/2

**Aluno(a):** Julia da Silva Fitzlaff

**Linguagem do sistema:** Python

## O que é

Uma base de conhecimento em Prolog (`meus_dados.pl`) com fatos e regras sobre mim e um assistente em linha de comando que consulta essa base pela ponte (`prolog.py` ou `prolog.js`).

## Como executar

Requisitos: SWI-Prolog no PATH e Python 3 **ou** Node.js.

```bash
# testar a ponte
python teste_ponte.py      # ou: node teste_ponte.js

# executar o assistente
python assistente.py       # ou: node assistente.js
```

## Minha base

- Fatos: `eu/1`, `cursa/3`, `compromisso/3`, `sabe/2`, `gosta/2`
- Regras: `ocupado/2`, `livre/2`, `o_que_faco/3`, `pode_ensinar/1`, `dia_cheio/1` e a minha regra abaixo

## Minha regra (R6)

```prolog
% R6 · MINHA REGRA: sugere o que comer em um horário livre
sugestao_comida(Dia, Turno, Comida) :- livre(Dia, Turno), gosta(comida, Comida).
```

**O que ela significa:** a regra sugere uma comida para um dia e turno em que estou livre. O subobjetivo `livre(Dia, Turno)` usa a R2 para verificar que naquele horário não tenho aula nem compromisso. O subobjetivo `gosta(comida, Comida)` busca nos meus gostos as comidas de que gosto. A regra só é verdadeira quando as duas condições são atendidas, então horários ocupados não recebem sugestão.

## Saída real do assistente

```text
=== Assistente pessoal de julia ===
1. Minhas disciplinas
2. Agenda de um dia
3. Horários livres
4. Estou livre em...?
5. Linguagens que posso ensinar
6. Meus gostos por categoria
7. Dias cheios
8. Sugestão do que comer
0. Sair
> 1

== Minhas disciplinas ==
  - lpp (quarta, noite)
  - iot (segunda, noite)
  - mobile (terca, noite)
  - projetos (quinta, noite)
  - seguranca_em_alimentos (sexta, noite)

=== Assistente pessoal de julia ===
(...)
> 4
Dia: sabado
Turno (manha, tarde, noite): noite

Sim! sabado de noite está livre.

=== Assistente pessoal de julia ===
(...)
> 8
Dia: sabado
Turno (manha, tarde, noite): noite

== O que comer sabado de noite ==
  - hamburguer
  - sushi

=== Assistente pessoal de julia ===
(...)
> 0
Até mais!
```
