%{
	#include <stdio.h>
	int yywrap(void);
	int yylex(void);
	int col = 0;
	int it = 1;
	char s[6];
%}
%s columns
%%
<columns>.{5}\  {if (it == col) { sscanf(yytext, "%s", s); printf("%s\n", s); } it++;}
<columns>\n     {it = 1;}
<INITIAL>\ +[0-9]+\    {sscanf(yytext, "%d", &col); BEGIN columns;}
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
