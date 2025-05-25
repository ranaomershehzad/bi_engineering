# lists
names = ['Omer', 'Shahim', 'Mary','Zoha']
print(names)

#get first element
print(names[0])

# second last
print(names[-2])

names[1] = 'Rana'
print(names)

# select a range of values - first 3 names
print(names[0:3])

#lists method - strings are objects -tv remote
numbers = [1,2,3,4,5,6,7]
numbers.append(10)
numbers.insert(0,24)
numbers.remove(2)
print(numbers)
print(2 in numbers)
#how many items in list
print(len(numbers))

# tuples - are like lists but immutable
ratings = (1,2,3,4,6,7)
print(ratings)
print(ratings.count(3))


# 6 hr course - Lists
names = [62,85,34,6,8,43,45454,32]
names.sort(reverse=True)
print(names)

# Unpacking
coordinates = [1,2,3]
x,y,z = coordinates
print(x)