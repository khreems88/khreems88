#This code allows you to calculate compount interest on an investment

#Statements
initial="Input your initial investment: "
rate_of_return="What is the average annual rate of return on the investment?"
years="Enter the number of years the investment will grow: "

print(initial)
investment=input()
int(investment)

print(rate_of_return)
ROR=float(input())/100
int(ROR)

print(years)
n=input()
int(n)

final=float(investment)+float(ROR)*float(investment)*float(n)

print("Your $" + str(investment) + " investment will be worth $" + str(final) + " in " + str(n) + " years, based on the expected " + str(float(ROR)*100) + "% rate of return!")