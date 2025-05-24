# Constructors:


class Point:
    #constructor below:
    def __init__(self,x,y):
        self.x = x
        self.y=y

    def move(self):
        print("move")
    
    def draw(self):
        print("draw")

new_point = Point(52,62)
print(new_point.y)

# person
#- Name
#-talk() method

class Person:
    def __init__(self,name):
        self.name = name
    
    def talk(self):
        print(f"{self.name} is talking")

omi= Person("Omer")
omi.talk()

Maryam = Person("Maryam")
Maryam.talk()