#include <iostream>

int main()
{
    std::cout << "Hello Exponents" << std::endl;

    long  long int B = 5;
    long long int P = 0;

    long long int Product = 1;

    for (int j = 0; j < 28; j++) //27 is the highest we can go with long long ints
        {
            P = j;
            for(int i = 0; i < P; i++)
                {
                    Product = Product * B;
                }
        std::cout << "P:" << P << " => ";
        std::cout << Product << std::endl;

        Product = 1;
        }

    /*
        origionall plan was to try to split this up but in the end I found that this was unnessicary
        becuase long long ints cant compute exponents all that high. so I need to come back to this with 
        a big number class. 
     */

    return 0;
};