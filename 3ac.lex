%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[ \t]    ; 
[a-zA-Z][a-zA-Z0-9]*   { return ID; }  
[0-9]+                 { return NUM; }  
"+"                    { return ADD; }
"-"                    { return SUB; }
"*"                    { return MUL; }
"/"                    { return DIV; }
"("                    { return LPAREN; }
")"                    { return RPAREN; }
"="                    { return ASSIGN; }
\n                     { return EOL; }
.                      { printf("Invalid token: %s\n", yytext); }
%%
