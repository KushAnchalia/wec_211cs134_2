%{
#include "y.tab.h"
%}

alpha [A-Z]
num [0-9]
alpha2 [a-zA-Z]
alphanum [a-zA-Z0-9]

%%

{alpha}{alpha2}* { printf("Noun: %s\n", yytext); return NOUN;}
[a-z]+ { printf("Adwords: %s\n", yytext); return AD;}
.*[0-9] { printf("Verb: %s\n", yytext); return VERB;}
[.?!] { printf("Punctuation: %s\n", yytext); return PUNC;}
"@".* { printf("Preposition: %s\n", yytext); return PRE;}
[ \t\n]+ { /* Ignore whitespace characters */ return SPACE;}
. { printf("Words: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
