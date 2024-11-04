%{
#include "parser.tab.h"

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

{INT}                   { yylval.val = atol(yytext); return(NUMBER) ; }
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
.                       { printf("invalid character.\n") ; return(EOL); }

%%

int yywrap(){
    return 1;
}

int main()
{
    yylex();
    return 0;
}
