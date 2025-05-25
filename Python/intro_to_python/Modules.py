# modules:
import random 
import Utilities as u

# Weight scale:
scale = u.WeightScale()
print(scale.lbs_to_kgs(76))

# Find maximum number:
list_num = [6,3,43,45,5,43534,324]

# Method 1:
find_max = max(list_num)
print(find_max)

# Method 2:
maximun = u.find_max(list_num)
print(maximun)

# Generate Random values:
for i in range(3):
    print(random.randint(15,28))

# pick random team members:
members = ["Omer", "Shehzad", "Mary", "Asghar"]
leader = random.choice(members)
print(leader)

# create a roll a dice game
class Dice:
    def roll(self):
        first = random.randint(1,6)
        second = random.randint(1,6)
        return first, second
    
dice =Dice()
roll = dice.roll()
print(roll)
