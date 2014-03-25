%{
	#include <stdio.h>
	int yywrap(void);
	int yylex(void);
	char c;
%}
%%
[0-9]+ {int x; sscanf(yytext, "%d", &x); c = x%5 ? '+' : '-'; ECHO;}
\n printf("(%c)\n", c); 
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
