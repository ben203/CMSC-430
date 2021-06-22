/* 	Compiler Theory and Design
	Dr. Duane J. Jarc 
	Edited by Bedemariam Degef
	Date: 12/13/2020
	Desc:This file contains type definitions and the function
 	prototypes for the type checking functions
*/
typedef char* CharPtr;

enum Types {MISMATCH, INT_TYPE, REAL_TYPE, BOOL_TYPE, EMPTY};

void checkAssignment(Types lValue, Types rValue, string message);
void checkIf(Types ifCheck, Types statement1, Types statement2);
void checkCase(Types caseCheck);
void checkCases(Types lValue, Types rValue, string message);
void checknotop(Types btype);
Types checkArithmetic(Types left, Types right);
Types checkLogical(Types left, Types right);
Types checkRelational(Types left, Types right);
Types checkInteger(Types left, Types right);
Types checkIFThen(Types expression, Types left, Types right);
Types checkExpressions(Types expression, Types left, Types right);
