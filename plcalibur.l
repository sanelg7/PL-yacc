/* lex file for yacc assignment */
%x IN_COMMENT 

%{	
	
    #include "plcalibur.tab.h"
 
	extern int line_number; 

    void yyerror(char const *s) {
    fprintf(stderr, "line %d: %s\n", line_number, s);
    }
 
    extern char* yytext;
%}
%option noyywrap    

%%

<INITIAL>"/*"         {BEGIN(IN_COMMENT);}
<IN_COMMENT>"*/"      {BEGIN(INITIAL);}
<IN_COMMENT>[^*\n]+   ;
<IN_COMMENT>"*"       ;
<IN_COMMENT>\n        {line_number++;}
<IN_COMMENT><<EOF>>   {
    printf("comment not terminated at line %d!", line_number);
   yyterminate();
 }

"if"                        return IF;
"else"                      return ELSE;
"return"                    return RETURN;
"while"                     return WHILE;
"+"                         return PLUS;
"-"                         return MINUS;
"*"                         return MULTIPLY;
"/"                         return DIVIDE;
"<="                        return LESSOREQUAL;
"<"                         return LESSTHAN;                     
">="                        return GREATEROREQUAL;
">"                         return GREATERTHAN;
"=="                        return IS;
"!="                        return ISNOT;
"="                         return ASSIGNMENT;
";"                         return EOL;
","                         return COMMA;
"{"                         return OPPARANTHESIS;
"}"                         return CLSPARANTHESIS;
"("                         return OPBRACKET;
")"                         return CLSBRACKET;
"["                         return OPSQRBRACKET;
"]"                         return CLSSQRBRACKET;
"and"						return AND;
"or"						return OR;
"<=>"						return DOUBLEIMP;
"%"							return MOD;
\"							return QUOTE;
"."							return DOT;
":"							return LIST;
"\\"						return ESCAPE;
"printf"					return PRINTF;
"println"					return PRINTLN;
"int"                       return INTEGER;
"char"						return CHAR;
"string"					return STRING;
"bool"						return BOOLEAN;
"void"                      return VOID;
"break"						return BREAK;
"continue"					return CONTINUE;
"class"						return CLASS;
"main"						return MAIN;
"static"					return STATIC;
"final"						return FINAL;
"true"						return TRUE;
"false"						return FALSE;
[a-zA-Z][a-zA-Z]*           return NAME;
[0-9][0-9]*                 return NUMBER;
[ \t\r]+                    ;
[\n]                        {line_number++;}
[a-zA-Z0-9]+                yyerror("Non-alphanumeric characters detected on identifier!!!");
[*][/]                      yyerror("Comment not initialized!!!");
.                           yyerror("Syntax 1error!!!");
