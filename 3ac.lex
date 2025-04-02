%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[ \t]    ;  /* Ignore whitespace */
[a-zA-Z][a-zA-Z0-9]*   { return ID; }  /* Variables */
[0-9]+                 { return NUM; }  /* Numbers */
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
