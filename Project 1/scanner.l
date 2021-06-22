/* Bedemariam Degef
   Project 1  
   10/27/2020
   File description:This file contains the lexical analyzer */


/* Compiler Theory and Design
   Dr. Duane J. Jarc */

/* This file contains flex input file */

%{
#include <cstdio>
#include <string>

using namespace std;

#include "listing.h"
#include "tokens.h"

%}

%option noyywrap

ws		[ \t\r]+
comment		\-\-.*\n
comment2	\/\/.*\n
line		[\n]
id		[A-Za-z](_?[A-Za-z0-9])* 
digit		[0-9]
int		{digit}+
punc		[\(\),:;]
REAL_LITERAL   {digit}+.{digit}*([Ee][+-]?{digit}+)? 
%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine();}
{line}		{ ECHO; nextLine();}
"=>"		{ ECHO; return(ARROW); }
"<"		{ ECHO; return(RELOP); }
"+"|"-"		{ ECHO; return(ADDOP); }  
"*"|"/"		{ ECHO; return(MULOP); }  
or		{ ECHO; return(OROP); }
not		{ ECHO; return(NOTOP); }
begin		{ ECHO; return(BEGIN_); }
boolean		{ ECHO; return(BOOLEAN); }
end		{ ECHO; return(END); }
rem		{ ECHO; return(REMOP); }
"**"		{ ECHO; return(EXPOP); }
"="|"/="|"<"|">"|">="|"<="	 { ECHO; return(RELOP); } 
true            { ECHO; return(BOOL_LITERAL); } 
false           { ECHO; return(BOOL_LITERAL); } 
endreduce	{ ECHO; return(ENDREDUCE); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
reduce		{ ECHO; return REDUCE; }
returns		{ ECHO; return(RETURNS); }
case		{ ECHO; return(CASE); }
else		{ ECHO; return(ELSE); }
endcase		{ ECHO; return(ENDCASE); }
endif		{ ECHO; return(ENDIF); }
if		{ ECHO; return(IF); }
others		{ ECHO; return(OTHERS); }
real		{ ECHO; return(REAL_LITERAL); }
then		{ ECHO; return(THEN); }
when		{ ECHO; return(WHEN); }
and		{ ECHO; return(ANDOP); }
{id}		{ ECHO; return(IDENTIFIER);}
{int}		{ ECHO; return(INT_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%

int main()
{
	firstLine();
	
	FILE *file = fopen("lexemes.txt", "wa"); 
	int token = yylex();
	while (token)
	{
		fprintf(file, "%d %s\n", token, yytext);
		token = yylex();
	}
	lastLine();
	fclose(file);
	return 0;
}