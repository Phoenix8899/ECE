#include <iostream>

int main(){

    std::cout << "Hello math junk" << std::endl;
    int A; 
    int B; //two numbers to multipy by
    int Product = 0; 

    A = 14; 
    B = 526;

    Product = A*B;
    std::cout << std::endl;
    std::cout << "Basic operation" << std::endl;
    std::cout << Product << std::endl;
    
    Product = 0;

    for(int i =0; i < B;i++)
        {
            Product += A;    
        }
    std::cout << std::endl;
    std::cout << "Repeated addition" << std::endl;
    std::cout << Product << std::endl;

    Product = 0;

    std::cout << std::endl;
    std::cout << "B: " << B << std::endl;
    std::cout << "B mod 10" << std::endl << B%10 << std::endl;
    std::cout << std::endl;

    int Product_ones = 0;
    int Product_tens = 0;
    int Product_hundreds = 0;

    int B_ones  = B%10;
    int B_tens = ((B - (B_ones)) % 100)/10;
    int B_hundreds = ((B - (B_tens*10 + B_ones))%1000)/100;

    for (int i = 0; i < B_ones ;i++)
        {
            Product_ones += A;
        }

    std::cout << B << std::endl;
    std::cout << B_ones << std::endl;
    std::cout << B_tens << std::endl;
    std::cout << B_hundreds << std::endl;
    std::cout << std::endl;
    

    for (int i = 0; i < B_tens;i++)
        {
            Product_tens += A;
        }

   for (int i = 0; i < B_hundreds ;i++)
        {
            Product_hundreds += A;
        }

    Product += Product_ones + (Product_tens*10) + (Product_hundreds*100);

    std::cout << "tricksy hobbitses" << std::endl;
    std::cout << Product << std::endl << std::endl;

    return 0;
};