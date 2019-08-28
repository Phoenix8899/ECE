#include <iostream>
#include "SciNo.hpp"

int main ()
{
    double itsADouble = 1.4;
    int itsAnInt = 5;
    std::cout << "Hello SciNo" <<std::endl;

    SciNo qwerty(itsADouble,itsAnInt);

    std::cout << qwerty.base << "^" << qwerty.power << std::endl;

    return 0;
};