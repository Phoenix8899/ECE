#include <iostream>

int main()
{

    int inputarino;
    std::cout << "im waiting on you..." << std::endl;
   // std::cin >> inputarino;

    while(1)
    {

            std::cout << "press stuff for things" << std::endl;
            std::cin >> inputarino;
        try 
        {

            if (inputarino != 5)
                throw 20;
        }
        catch(int e)
        {
            std::cout << "you are dumb x" << e << std::endl;
        }
    }

    return 0;
}
