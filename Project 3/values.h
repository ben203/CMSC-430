/* 

    Bedemariam Degef
    12/27/2020
    Project 3
    File description: This file contains function definitions for the evaluation functions
 */




typedef char* CharPtr;
enum Operators {LESS, ADD, SUBTRACT, DIVIDE, MULTIPLY, POWER, ARROW, GREATER, EQUAL, UNEQUAL, GR_EQUAL, LESS_EQUAL, REM, };

int evaluateReduction(Operators operator_, int head, int tail);
int evaluateRelational(int left, Operators operator_, int right);
int evaluateArithmetic(int left, Operators operator_, int right);
double evaluateReduction_d(Operators operator_, double head, double tail);
double evaluateRelational_d(double left, Operators operator_, double right);
double evaluateArithmetic_d(double left, Operators operator_, double right);


 
