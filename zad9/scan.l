%{
	#include <stdio.h>
	int yywrap(void);
	int yylex(void);
%}
%%
[a-z]+|[A-Z]+|\n { ECHO; }
.{1}   {printf("."); }
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
