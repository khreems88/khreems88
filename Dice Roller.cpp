// Dice Roller.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <string>

int main()
{
    int sides;
    std::string cont;

    std::cout << "Input the amount of sides on the dice to roll: \n";
    std::cin >> sides;
     
    std::cout << "The roll was: " << rand()%sides+1 << "\n";
    std::cout << "Roll again, Yes or No? \n";
    std::cin >> cont;

     while (cont == "Yes") {
         std::cout << "Input the amount of sides on the dice to roll: \n";
         std::cin >> sides;
         std::cout << "The roll was: " << rand()%sides+1 << "\n";
         std::cout << "Roll again, Yes or No? \n";
         std::cin >> cont;
     }
  
     std::cout << "End.";

}

