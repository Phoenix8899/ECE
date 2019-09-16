#include <iostream>
#include <string>

int main()
{
    std::cout << "hello Factors" << std::endl;

    //bool done = false;

    int num = 48;
    int otherNum = 48;
    std::string factors = "1";

    for(int i =2; i < 100; i++)
    {
        if(num%i == 0 && otherNum%i == 0)
        {
        num = num / i;
        otherNum = otherNum / i;

        factors+= "," + std::to_string(i);

        i = 1;//restart the loop
        //i dont like how myself handled this code becuase myself doesnt know when i increments


        }
    }

    std::cout << otherNum << "/" << num << std::endl;
    std::cout << "factorinator" << factors << std::endl;

 return 0;   
}

