%{
#include <stdio.h>
#include <string.h>
int temp_count = 0;
char* new_temp() {
    char* temp = (char*)malloc(10);
    sprintf(temp, "t%d", ++temp_count);
    return temp;
}
%}
%token ID NUM ADD SUB MUL DIV LPAREN RPAREN ASSIGN EOL
%%
input: 
    | input line
    ;
line: 
    expr EOL { printf("Three-Address Code:\n"); }
    ;
expr: 
    ID ASSIGN expr { printf("%s = %s\n", $1, $3); free($3); }
    | e1 { $$ = $1; }
    ;
e1: 
    e1 ADD e2 { $$ = new_temp(); printf("%s = %s + %s\n", $$, $1, $3); free($1); free($3); }
    | e1 SUB e2 { $$ = new_temp(); printf("%s = %s - %s\n", $$, $1, $3); free($1); free($3); }
    | e2 { $$ = $1; }
    ;
e2: 
    e2 MUL e3 { $$ = new_temp(); printf("%s = %s * %s\n", $$, $1, $3); free($1); free($3); }
    | e2 DIV e3 { $$ = new_temp(); printf("%s = %s / %s\n", $$, $1, $3); free($1); free($3); }
    | e3 { $$ = $1; }
    ;
e3: 
    LPAREN expr RPAREN { $$ = $2; }
    | ID { $$ = strdup($1); }
    | NUM { $$ = strdup($1); }
    ;
%%
int main() {
    yyparse();
    return 0;
}
int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
