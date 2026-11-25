:- encoding(utf8).
:- discontiguous gosta/2.
% =====================================================================
%  meus_dados.pl · Assistente Lógico Pessoal · LPP
%  Base de conhecimento pessoal. Troque os dados de exemplo (da "alex")
%  pelos SEUS dados. Use só letras minúsculas, sem acento e sem espaço
%  nos átomos (ex.: banco_de_dados, the_office).
%  NÃO coloque dados sensíveis: CPF, endereço, telefone, saúde, etc.
% =====================================================================

% ---------- ETAPA 2 · FATOS ----------

% Quem sou eu
eu(julia).
fase(6).
cidade(rio_do_sul).

% Dias e turnos da semana (não altere)
dia(segunda).  dia(terca).  dia(quarta).  dia(quinta).  dia(sexta).  dia(sabado).
turno(manha).  turno(tarde).  turno(noite).

% Disciplinas que curso neste semestre: cursa(Disciplina, Dia, Turno)
cursa(lpp, quarta, noite).
cursa(iot, segunda, noite).
cursa(mobile, terca, noite).
cursa(projetos, quinta, noite).
cursa(seguranca_em_alimentos, sexta, noite).

% Outros compromissos: compromisso(Dia, Turno, Atividade)
compromisso(segunda, manha, trabalho).
compromisso(segunda, tarde, trabalho).
compromisso(terca, manha, trabalho).
compromisso(terca, tarde, trabalho).
compromisso(quarta, manha, trabalho).
compromisso(quarta, tarde, trabalho).
compromisso(quinta, manha, trabalho).
compromisso(quinta, tarde, trabalho).
compromisso(sexta, manha, trabalho).
compromisso(sexta, tarde, trabalho).

% Linguagens que sei: sabe(Linguagem, Nivel)   Nivel: basico | intermediario | avancado
sabe(python, basico).
sabe(javascript, basico).
sabe(php, basico).
sabe(sql, avancado).

% Do que eu gosto: gosta(Categoria, Item)
gosta(serie, from).
gosta(serie, stranger_things).
gosta(comida, hamburguer).
gosta(comida, sushi).
gosta(hobby, artesanato).
gosta(hobby, viajar).
gosta(musica, rock).
gosta(musica, pop).

% ---------- ETAPA 3 · REGRAS ----------
% (cole aqui as regras R1 a R6 da Etapa 3)

% R1 · Estou ocupado se tenho aula OU compromisso (duas cláusulas = OU)
ocupado(Dia, Turno) :- cursa(_, Dia, Turno).
ocupado(Dia, Turno) :- compromisso(Dia, Turno, _).

% R2 · Estou livre se NÃO for possível provar que estou ocupado
livre(Dia, Turno) :- dia(Dia), turno(Turno), \+ ocupado(Dia, Turno).

% R3 · O que faço em um dia e turno (aula ou compromisso)
o_que_faco(Dia, Turno, Atividade) :- cursa(Atividade, Dia, Turno).
o_que_faco(Dia, Turno, Atividade) :- compromisso(Dia, Turno, Atividade).

% R4 · Posso ensinar uma linguagem se sei em nível intermediário ou avançado
pode_ensinar(Linguagem) :- sabe(Linguagem, Nivel), member(Nivel, [intermediario, avancado]).

% R5 · Dia cheio: dois turnos ou mais ocupados
dia_cheio(Dia) :- dia(Dia), findall(T, ocupado(Dia, T), Ts), sort(Ts, Unicos), length(Unicos, N), N >= 2.

% R6 · MINHA REGRA: sugere o que comer em um horário livre
sugestao_comida(Dia, Turno, Comida) :- livre(Dia, Turno), gosta(comida, Comida).