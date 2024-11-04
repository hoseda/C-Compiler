%{
#include "y.tab.h"

enum Tokens {
    INT = 0,
    CHAR,
    FLOAT,
    IF,
    ELSE,
    ELSEIF,
    SWITCH,
    CASE,
    BREAK,
    CONTINUE,
    DO,
    FOR,
    WHILE,
    VOID,
    RETURN,
};

const char* keywordsName[] = {"INT" , "CHAR" , "FLOAT" , "IF" , "ELSE" , "ELSEIF" , "SWITCH" , "CASE" , "BREAK" , "CONTINUE" , "DO" , "FOR" , "WHILE" , "VOID" , "RETURN"};
enum Tokens func(enum Tokens tk){
    printf("%s\n" , keywordsName[tk]);
}

%}

DIGIT    [0-9]
ID       [a-zA-Z_][a-zA-Z0-9_]*
INT      {DIGIT}+
REAL     {DIGIT}+"."{DIGIT}+


%%

{INT}                   { yylval.val = atot(yytext); return(NUMBER) ; }
{REAL}                  { sscanf(yytext , "%f" , &yylval.val); return(NUMBER) ; }

"+"                     return(PLUS);
"-"                     return(MINUS);
"*"                     return(MULT);
"/"                     return(DIV);
"^"                     return(EXPON);
"("                     return(LB);
")"                     return(RB);
\n                      return(EOL);
[\t ]*
.                       {yyerror("invalid character.") ; return(EOL); }

%%


int yywrap(){}
int main(int argc , char *argv[]){
    yyin = fopen(argv[1] , "r");
    yylex();
    fclose(yyin);
    return 0;
}
