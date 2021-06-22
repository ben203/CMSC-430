/* Compiler Theory and Design
   Dr. Duane J. Jarc 
   Edited by Bedemariam Degef
   Date: 12.13.2020
   Desc: Define Parse tree grammar
   and syntactic analyzer
   */
%{

#include <string>
#include <vector>
#include <map>

using namespace std;


#include "types.h"
#include "listing.h"
#include "symbols.h"

int yylex();
void yyerror(const char* message);

Symbols<Types> symbols;

%}

%error-verbose

%union
{
	CharPtr iden;
	Types type;
}

%token <iden> IDENTIFIER
%token <type> INT_LITERAL REAL_LITERAL BOOL_LITERAL NOTOP CASE CASES TRUE FALSE ELSE ENDIF IF
%token ADDOP MULOP RELOP ANDOP EXPOP OROP  REMOP
%token ARROW THEN WHEN 
%token BEGIN_ BOOLEAN END ENDREDUCE FUNCTION INTEGER IS 
%token REDUCE RETURNS ENDCASE  OTHERS REAL
%type <type> type statement statement_ reductions expression binary exponent unary relation term
	factor primary cases case case2

%%
 
function:	
	function_header optional_variable body ;
	
function_header:	
	FUNCTION IDENTIFIER parameters RETURNS type ';' | 
	FUNCTION IDENTIFIER RETURNS type ';' |
	error ';' ;

optional_variable:
	optional_variable variable |
	error ';' |
	;

variable:	
	IDENTIFIER ':' type IS statement_ 
		{checkAssignment($3, $5, "Variable Initialization");
		{if (symbols.find($1, $3)) appendError(DUPLICATE_IDENTIFIER, $1);
		symbols.insert($1, $3);} };

parameters:
	parameter optional_parameter;

optional_parameter:
	optional_parameter ',' parameter |
	;

parameter:
	IDENTIFIER ':' type {symbols.insert($1, $3);} ;
	
type:
	INTEGER {$$ = INT_TYPE;} |
	REAL {$$ = REAL_TYPE;} |
	BOOLEAN {$$ = BOOL_TYPE;} ;

body:
	BEGIN_ statement_ END ';' ;
    
statement_:
	statement ';' |
	error ';' {$$ = MISMATCH;} ;
	
statement:
	expression |
	REDUCE operator reductions ENDREDUCE {$$ = $3;} |
	IF expression THEN statement_ ELSE statement_ ENDIF {checkIf($2, $4, $6);} |
	CASE expression IS cases OTHERS ARROW statement_ ENDCASE {checkCase($2);} ;


operator:
	ADDOP |
	MULOP ;
	
cases:
	case case2 {checkCases($1, $2, "Case");} ;
	
case:
	WHEN INT_LITERAL ARROW expression ';' {$$ = $4;} ;

case2:
	WHEN INT_LITERAL ARROW expression ';' {$$ = $4;} ;

reductions:
	reductions statement_ {$$ = checkArithmetic($1, $2);} |
	{$$ = INT_TYPE;} ;

expression:
	expression OROP binary {$$ = checkLogical($1, $3);} |
	binary;
	
binary:
	binary ANDOP relation {$$ = checkLogical($1, $3);} |
	relation ;

relation:
	relation RELOP term {$$ = checkRelational($1, $3);}|
	term ;

term:
	term ADDOP factor {$$ = checkArithmetic($1, $3);} |
	factor ;
      
factor:
	factor MULOP primary  {$$ = checkArithmetic($1, $3);} |
	factor REMOP exponent {$$ = checkInteger($1, $3);} |
	exponent ;

exponent:
	unary |
	unary  EXPOP exponent {$$ = checkArithmetic($1,$3);};

unary:
	NOTOP primary {$$ = $2;}|
	primary;	

primary:
	'(' expression ')' {$$ = $2;} |
	INT_LITERAL | REAL_LITERAL |	BOOL_LITERAL |
	IDENTIFIER {if (!symbols.find($1, $$)) appendError(UNDECLARED, $1);} ;
    
%%

void yyerror(const char* message)
{
	appendError(SYNTAX, message);
}

int main(int argc, char *argv[])    
{
	firstLine();
	yyparse();
	lastLine();
	return 0;
} 
