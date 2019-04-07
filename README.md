# PL-yacc



Repository of Ege Şanel and Ebru Ekin for the PL course in CSE Akdeniz University
This project is done on a different platform which is why there is only one committant.Both contributors did their part.
Ege : Exclusively responsible for yacc ,grammar corrections and rewriting.
Ebru : Exclusively responsible for building the lex part from the bottom up. Our first lex file was too complicated for us to write proper grammar on.
Other parts of the project were done by collaboration.
(unfortunately we could not properly make the project work)

///////////////////Group Members///////////////////

Ege Şanel - 20150807026
Ebru Ekin - 20150807032

///////////////////PL-Name/////////////////// 

Our language is called "calibur".

///////////////////Grammar(BNF) and Syntax///////////////////

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

///////////////////Explanation of Syntax ////////////////

A program is built by one or more declarations. Declarations are made with a subset of declarations or a simple declaration. A simple declaration may be a variable declaration or a function declaration. Variable declarations first require a type specifier then the name of the variable and a semicolon(EOL), optionally brackets can be used to declare arrays. Function declarations are the same except there are brackets and in between parameters. parameters can be void. Every parameter is like a variable. Statements can be one of many types suh as expression, compound , selection , iteration , return. Selection statements are if else clauses. Iteration statements are loops (while only). Simple expressions are basic such as '+'. Comparison , additive , multiplication operators are self explanatory. Function calling is done like method calling in Java except there is no semi colon.

///////////////////More///////////////////

We choose Java as our referance language because of our familiarity with it.We also decided on not making many differences as this is our first lex project (or anything close). We tried to include many keywords and operational signs but we know there are lots missing as of right now, the reason being that we could not use all of them in the yacc part.
