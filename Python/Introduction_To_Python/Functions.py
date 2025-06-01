# functions:

def greet_user():
    print("Hi, there!")
    print("I am Omer :)")


print("Start")
greet_user()
print("Finish")

# Parameters
# name inside this function is a parameter while Omi and Mary are arguments
def greet_user(f_name, l_name):
    print("Hi, there!")
    print(f"I am {f_name} {l_name} :)")


print("Start")
greet_user("Omi", "Shezy")
greet_user("Mary", "Asghee")
print("Finish")

# Return statement in functions:

def square(number):
    return number* number


result = square(17)
print(result)


# Converter function
def emoji_converter(message):
    words = message.split(' ')
    emojis ={
        ":)": "🙂",
        ":(": "☹",
        ":|": "😐"
    }
    output= ""
    for word in words:
        output += emojis.get(word,word) + " "
    return output


message = input(">  ")
result = emoji_converter(message)
print(result)