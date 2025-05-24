# Similation for the car game - if start- to start the car, stop - to stop the car, quit - to exit, help - to display all, anything esle, idk
command = ''
while command != 'quit':
    command = input("> ").lower()
    if command == 'start':
        print("start the car")
    elif command == 'stop':
        print('stop the car')
    elif command == 'help':
        print(" start - start the car \n stop - to stop the car \n quit - to exit")
    elif command == 'quit':
        print("pressed quit - exited the code")
        break
    else:
        print('I am not familiar with the command')

# guessing game - while loop
secret_number = 9
guesses = 0
guess_limit = 3
while guesses < guess_limit:
    guess = int(input("Guess:" ))
    guesses +=1
    if guess == secret_number:
        print("Congrats! You won!")
        break
else:
    print("Sorry, you lost :(")