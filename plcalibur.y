/* yacc file for yacc assignment */

%{
    #include <stdarg.h>
    #include <stdio.h>
    #include "shared.h"
    #define YYSTYPE char *
    extern int yylineno;
    int yylex();
    void yyerror(const char *s);
    int yydebug = 1;
    int indent = 0;
    char *iden_dum;
%}

/* Tokens Definition */
%token START_OF_COMMENT
%token END_OF_COMMENT
%token IF
%token ELSE
%token INTEGER
%token RETURN
%token VOID
%token WHILE
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token LESSOREQUAL
%token LESSTHAN
%token GREATERTHAN
%token GREATEROREQUAL
%token IS
%token ASSIGNMENT
%token ISNOT
%token EOL
%token COMMA
%token OPPARANTHESIS
%token CLSPARANTHESIS
%token OPBRACKET
%token CLSBRACKET
%token OPSQRBRACKET
%token CLSSQRBRACKET
%token AND
%token OR
%token DOUBLEIMP
%token MOD
%token QUOTE
%token DOT
%token LIST
%token ESCAPE
%token PRINTF
%token PRINTLN
%token CHAR
%token STRING
%token BOOLEAN
%token BREAK
%token CONTINUE
%token CLASS
%token MAIN
%token STATIC
%token FINAL
%token TRUE
%token FALSE
%token NAME
%token NUMBER

/* Grammar : plcalibur */
%%
program: declarations;
declarations: declarations declaration | declaration;
declaration: variable-declaration | function-declaration;
variable-declaration: type-specifier NAME EOL  |type-specifier NAME OPSQRBRACKET NUMBER CLSSQRBRACKET EOL;
type-specifier: INTEGER | VOID | CHAR | STRING | BOOLEAN;
function-declaration: type-specifier NAME OPBRACKET parameters CLSBRACKET compound-statement;
parameters: parameter-list | VOID;
parameter-list: parameter-list COMMA parameter | parameter;
parameter: type-specifier NAME | type-specifier NAME OPSQRBRACKET CLSSQRBRACKET;
compound-statement: OPPARANTHESIS local-declarations statements CLSPARANTHESIS;
local-declarations: local-declarations variable-declaration | %empty;
statements: statements statement | %empty;
statement: expression-statement | compound-statement | selection-statement | iteration-statement |
return-statement;
expression-statement: expression EOL | EOL;
selection-statement: IF OPBRACKET expression CLSBRACKET statement | IF OPBRACKET expression CLSBRACKET statement ELSE
statement ;
iteration-statement: WHILE OPPARANTHESIS BOOLEAN CLSPARANTHESIS OPBRACKET expression CLSBRACKET statement;
return-statement: RETURN EOL | RETURN expression EOL;
expression: variable ASSIGNMENT expression | simple-expression ;
variable: NAME | NAME OPSQRBRACKET expression CLSSQRBRACKET;
simple-expression: additive-expression comparison-operator additive-expression | additive-expression;
comparison-operator: LESSTHAN | LESSOREQUAL | GREATERTHAN | GREATEROREQUAL | IS | ISNOT;
additive-expression: additive-expression addition-operator term | term;
addition-operator: PLUS | MINUS;
term: term multiplication-operator factor | factor;
multiplication-operator: MULTIPLY | DIVIDE;
factor: OPBRACKET expression CLSBRACKET | variable | call-function | NUMBER;
call-function: NAME OPBRACKET arguments CLSBRACKET;
arguments: argument-list | %empty;
argument-list: argument-list COMMA expression | expression;

%%                                                                              
int main (void) {     
  yyparse ();
}


