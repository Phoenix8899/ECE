#include <iostream>

int main()
{
    std::cout << "hello modMath" << std::endl;

    //bool done = false;

    int num = 289;
    int otherNum = 17;

    for(int i =2; i < 100; i++)
    {
        if(num%i == 0 && otherNum%i == 0)
        {
        num = num / i;
        otherNum = otherNum / i;
        i = 1;//restart the loop
        //i dont like how myself handled this code becuase myself doesnt know when i increments
        }
    }

    std::cout << otherNum << "/" << num << std::endl;

 return 0;   
}

