%{
#include <stdio.h>
%}

%%
[0-9]+                            { printf("%s is DIGIT\n",yytext); }
[a-zA-Z]([a-zA-Z]|[0-9])*         { printf("%s is IDENTIFIER\n" , yytext); }

int                               { printf("%s is a KEYWORD\n" , yytext); }


.                                 { printf("%s is ERROR\n" , yytext); }

%%

int yywrap(){}

int main()
{
    yylex();
    return 0;
}










