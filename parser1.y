%{
#include <stdio.h>
#include <string.h>
char postfix[1024] = "";
int yyaprse();
int yylex();
int yyerror(char *s);
%}

%token NOUN VERB AD PUNC PRE SPACE

%%

S : s SPACE '\n' {printf("Accepted");}  
  
s :  NOUN VERB NOUN PRE {printf("Senteces");}
  |  NOUN VERB PRE { printf("Senteces");}
  | AD NOUN AD VERB AD NOUN PUNC
  |
%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Errr");
    return 1;
}
