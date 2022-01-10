#include <iostream>
#include <string>
using namespace std;

int main() {
	string character; 
	string name;

	std::cout << "Please state your name: \n";
	std::cin >> name;

	std::cout << "Hi " << name << "! Please input a character from The Office that you would like to hear a quote from: \n";
	std::cin >> character;

	while (character != "Done") {

		if (character == "Michael") {
			std::cout << "I'm not superstitious, but I am a little stitious.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Dwight") {
			std::cout << "BUTTLICKER! OUR PRICES HAVE NEVER BEEN LOWER!\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Jim") {
			std::cout << "5-7 minutes, 5-7 minutes, 5-7 minutes, 6 minutes. Different, but not really.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Pam") {
			std::cout << "I'd like to see a machine that puts candy out for people......vending machine.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Andy") {
			std::cout << "Break me off a piece of that Fancy Feast.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Stanley") {
			std::cout << "Boy have you lost your mind, cause I'll help you find it!\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Phyllis") {
			std::cout << "I wonder what people would say they like about me...probably my jugs.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Ryan") {
			std::cout << "I don't know...can't explain it.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Kelly") {
			std::cout << "I have a lot of questions, first of all: how dare you?\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Kevin") {
			std::cout << "The key is to overcook the onions. Everyone is going to get to know each other in the pot.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Creed") {
			std::cout << "If I can't scuba, then what's this all been about?\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Oscar") {
			std::cout << "Kids, sometimes it pays to be gay.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Angela") {
			std::cout << "I only weigh 82 pounds! Save Bandit!\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else if (character == "Darryl") {
			std::cout << "Dinkin' Flicka.\n";
			std::cout << "How about another character? Or type 'Done' to end: ";
			std::cin >> character;
		}

		else {
			std::cout << "Oops! Kevin didn't think that character was important enough to write code for. Try again or type 'Done' to end: \n";
			std::cin >> character;
		}
	}
		
}


