# use classes to define new types 
# - number strings, boolean
# - lists, dictionaries

class Point:
    def move(self):
        print("move")
    
    def draw(self):
        print("draw")


# object is an instance of a class
# class is a blueprint or the templete for creating an object, while object are the actual instance based on the blueprint

# Point 1
point1 = Point()
point1.x = 10
point1.y =20
print(point1.x)
print(point1.y)
point1.draw()

# Point 2
point2= Point()
point2.x = 100
point2.y = 100000
print(f"This is point 2: {point2.x}")