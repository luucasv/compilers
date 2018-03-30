/*
    29/03/2018
    Disciplina: Compliadores - Engenharia da Computacao - Centro de Informatica
    Resolucao da primeira aula pratica
    Aluno: Lucas Vinicius da Costa Santana <lvcs@cin.ufpe.br>
*/

grammar AP1;

s : (cmd ';') + ;

cmd : ID '=' exp
    | exp
    | ;

exp : exp '+' term
    | exp '-' term
    | term
    ;

term : term '*' factor
     | term '/' factor
     | factor
     ;

factor : base
       | '-' base
       ;

base : '(' exp ')'
     | INT
     | ID
     ;

ID : [a-zA-Z_][a-zA-Z0-9_]*;
INT : [0-9]+;
LINECOMMENT: '//' (.)*? '\n' -> skip;
BLOCKCOMMENT: '/*' (.)*? '*/' -> skip;
WS : [ \t\r\n]+ -> skip;
