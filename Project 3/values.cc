/* 

    Bedemariam Degef
    12/27/2020
    Project 3
    File description: This file implements the functions defined in values.h
 */

 
#include <string>
#include <vector>
#include <cmath>

using namespace std;

#include "values.h"
#include "listing.h"

int evaluateReduction(Operators operator_, int head, int tail)
{
	if (operator_ == ADD)
		return head + tail;
	return head * tail;
}


int evaluateRelational(int left, Operators operator_, int right)
{
	int result;
	switch (operator_)
	{
		case LESS:
			result = left < right;
			break;
		case GREATER:
			result = left > right;
			break;	
		case EQUAL:
			result = left = right;
			break;	
		case UNEQUAL:
			result = left /= right;
			break;	
		case LESS_EQUAL:
			result = left <= right;
			break;
		case GR_EQUAL:
			result = left >= right;
			break;		
	}
	return result;
}

int evaluateArithmetic(int left, Operators operator_, int right)
{
	int result;
	switch (operator_)
	{
		case ADD:
			result = left + right;
			break;
		case SUBTRACT:
			result = left - right;
			break;
		case MULTIPLY:
			result = left * right;
			break;
		case DIVIDE:
			result = left / right;
			break;
		case REM:
			result= left % right;
			break;
			
	}
	return result;
}

double evaluateReduction_d(Operators operator_, double head, double tail)
{
	if (operator_ == ADD)
		return head + tail;
	return head * tail;
}


double evaluateRelational(double left, Operators operator_, double right)
{
	int result;
	switch (operator_)
	{
		case LESS:
			result = left < right;
			break;
		case GREATER:
			result = left > right;
			break;	
		case EQUAL:
			result = left = right;
			break;	
		case UNEQUAL:
			result = left /= right;
			break;	
		case LESS_EQUAL:
			result = left <= right;
			break;
		case GR_EQUAL:
			result = left >= right;
			break;		
	}
	return result;
}

double evaluateArithmetic(double left, Operators operator_, double right)
{
	double result;
	switch (operator_)
	{
		case ADD:
			result = left + right;
			break;
		case SUBTRACT:
			result = left - right;
			break;
		case MULTIPLY:
			result = left * right;
			break;
		case DIVIDE:
			result = left / right;
			break;
		
			
	}
	return result;
}

