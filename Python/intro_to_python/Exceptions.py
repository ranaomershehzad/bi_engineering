#Exceptions - error:

try:
    age = int(input("age: "))
    risk = 100
    income = risk/age
    print(income)
except ZeroDivisionError:
    print("Age can't be zero")
except ValueError:
    print("Wrong type entered")