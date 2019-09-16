#include "SciNo.hpp"

SciNo::SciNo (double startingBase, int startingPower)
{
    base  = startingBase;
    power = startingPower;
}

//print
void SciNo::print()
{
    std::cout << this->base << "_E^" << this->power << std::endl;
}

//division
SciNo SciNo::operator / (const SciNo &theSecond)
{
    SciNo Result(0,0);
    Result.base = this->base / theSecond.base;
    Result.power = this->power - theSecond.power;
    if (Result.base < 1) //checking if the power is accurate
    {
        Result.base = Result.base *10;
        Result.power = Result.power - 1;
    }

    return Result;
}

//multiplication
SciNo SciNo::operator * (const SciNo &theSecond)
{
    SciNo Result(0,0);
    Result.base = this->base * theSecond.base;
    Result.power = this->power + theSecond.power;
    if (Result.base > 10) //checking of the power is accurate
    {
        Result.base = Result.base /10;
        Result.power = Result.power + 1;
    }

    return Result;
}

//add 
SciNo SciNo::operator + (const SciNo &theSecond)
{
    SciNo Result(0,0);
    Result.base = this->base + theSecond.base;
    Result.power = this->power;
    if (Result.base > 10) //checking of the power is accurate
    {
        Result.base = Result.base /10;
        Result.power = Result.power + 1;
    }

    return Result;
}
//subtract 
SciNo SciNo::operator - (const SciNo &theSecond)
{
    SciNo Result(0,0);
    Result.base = this->base - theSecond.base;
    Result.power = this->power;
    if (Result.base < 1) //checking of the power is accurate
    {
        Result.base = Result.base *10;
        Result.power = Result.power - 1;
    }

    return Result;
}