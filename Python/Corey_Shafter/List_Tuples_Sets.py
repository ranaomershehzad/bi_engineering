
######## LISTS ########
courses = ['Math', 'CompSci', 'Physics', 'History']

# Slicing:
print(courses[1])   # second item
print(courses[3])   # last item (manual)
print(courses[-1])  # last item (dynamic)
print(courses[:3])  # first 3 index items
print(courses[2:])  # everything from index 2 item

# Add item
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.append('Art')
print(courses)

# Insert
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.insert(0,'Gym')
print(courses)
courses_2 = ['Art','Gym']
courses.insert(0,courses_2)
print(courses)

# Extend
courses = ['Math', 'CompSci', 'Physics', 'History']
courses_2 = ['Art','Gym']
courses.extend(courses_2)
print(courses)

# Remove
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.remove('Math')
print(courses)

# Pop
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.pop()
print(courses)
popped = courses.pop()
print(popped)

# Reverse
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.reverse()
print(courses)

# Sort:
courses = ['Math', 'CompSci', 'Physics', 'History']
courses.sort()
print(courses)
nums = [32,4,324343,2,33,424]
nums.sort(reverse=True)
print(nums)
# Save sort in a new variable
nums = [32,4,324343,2,33,424]
sorted_nums = sorted(nums, reverse=True)
print(sorted_nums)