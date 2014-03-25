%{
	#include <stdio.h>
	int yywrap(void);
	int yylex(void);

	#define STACK_SIZE 100

	int stack[STACK_SIZE];
	int it = 0;

	void push(int x);
  int pop();
%}
%%
[0-9]  {int x; sscanf(yytext, "%d", &x); push(x);}
\+     {push(pop() + pop());}
\*     {push(pop() * pop());}
\n     {printf("%d\n", pop());}
\  ;
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }

void push(int x) {
	if (it == STACK_SIZE) exit(EXIT_FAILURE);
	stack[it++] = x;
}

int pop() {
	if (it < 0) exit(EXIT_FAILURE);
	return stack[--it];
}
