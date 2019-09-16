#include <iostream>
#include "SciNo.hpp"

int main ()
{
    double itsADouble = 1.4;
    int itsAnInt = 5;
    std::cout << "Hello SciNo" <<std::endl;

    SciNo qwerty(itsADouble,itsAnInt);
    SciNo revenge(5.3,2);
    
    SciNo Jedi = qwerty / revenge;

    //std::cout << Jedi.base << "E" << Jedi.power << std::endl;
    Jedi.print();

    Jedi = revenge * qwerty;

    Jedi.print();

    Jedi = revenge + qwerty;

    Jedi.print();

    Jedi = revenge - qwerty;

    Jedi.print();

    Jedi.base = 10;
    Jedi.power = 25;

    Jedi.print();

    return 0;
};