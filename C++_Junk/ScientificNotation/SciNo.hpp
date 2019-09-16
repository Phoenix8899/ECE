#pragma once 

#include <iostream>
//#include <math>

class SciNo
{
    public:

    double base = 0;
    int power = 0;
    
     SciNo (double startingBase , int startingPower);

    SciNo operator  + (const SciNo &theSecond);
    SciNo operator  - (const SciNo &theSecond);
    SciNo operator  * (const SciNo &theSecond);
    SciNo operator / (const SciNo &theSecond);

    void print();

    //learn to overload opperators here
};