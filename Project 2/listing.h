/* Bedemariam Degef
   Project 2  
   11/10/2020
   File description: This file contains the function prototypes for the functions that produce the    
		    compilation listing
*/

enum ErrorCategories {LEXICAL, SYNTAX, GENERAL_SEMANTIC, DUPLICATE_IDENTIFIER,
	UNDECLARED};

void firstLine();
void nextLine();
int lastLine();
void appendError(ErrorCategories errorCategory, string message);



