#include <iostream>

int main()
{
    std::cout << "Hello coin practice" << std::endl;
    
    int num = 3741209; //magical!
    int count = 0;

    while (num >= 5)
    {
        num -= 5;
        count++;
    }
    while (num >= 3)
    {
        num -= 3;
        count ++;
    }
    while (num >= 1)
    {
        num -= 1;
        count ++;
    }

    std::cout << count << std::endl;

    num = 3741209;
    count  = 0;

    count = num / 5;
    num -= 5*count; //we could pull 5 out count times for now.
    count += num / 3;
    num -= 3*(num/3); //should work out becuase int math will truncate
    count += num/1;

    std::cout << count << std::endl;

    return 0;
};