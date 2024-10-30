%{
#include <stdio.h>
void count();
void stat();
int token_number = 0;
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

enum Tokens func(enum Tokens tk){
    printf("%d\n" , tk);
}

%}

DIGIT    [0-9]
ID       [a-zA-z][a-zA-z0-9]*
INT      {DIGIT}+
REAL     {DIGIT}*"."{DIGIT}+


%%
if                                  { count(); func(IF); }
else                                { count(); func(ELSE); }
"else if"                           { count(); func(ELSEIF); }
int                                 { count(); func(INT); }
char                                { count(); func(CHAR); }
float                               { count(); func(FLOAT); }
switch                              { count(); func(SWITCH); }
case                                { count(); func(CASE); }
break                               { count(); func(BREAK); }
continue                            { count(); func(CONTINUE); }
do                                  { count(); func(DO); }
for                                 { count(); func(FOR); }
while                               { count(); func(WHILE); }
void                                { count(); func(VOID); }
return                              { count(); func(RETURN); }
"stat"                              { stat(); }
"exit"                              { stat(); return 0; }
{INT}                               { printf("%s is DIGIT\n",yytext); }
{ID}                                { printf("%s is IDENTIFIER\n" , yytext); }

[ \t\n]+                            {}
\/\/.*                              {}
\/\*.*\*\/                          {}

.                                   { printf("%s is ERROR\n" , yytext); }
%%

void count(){
    token_number++;
}

void stat(){
    printf("\n token number : %d\n" , token_number);
}

int yywrap(){}
int main(){
    yylex();
    return 0;
}
