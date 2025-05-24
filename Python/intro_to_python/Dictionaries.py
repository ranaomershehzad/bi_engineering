# dictionaries:
customer= {
"name": "Omer Shehzad",
"email": "rmos@gmail.com",
"phone":"090078601",
"is_nice": True
}

customer["name"] = "Maryam Ass"

print(customer["name"])
print(customer.get("phone"))

# Map numbers to words:
phone = input("Phone: ")
digit_mapping = {
"1": "One",
"2": "Two",
"3":"Three",
"4": "Four"
}

output = ""
for ch in phone:
    output += digit_mapping.get(ch, "Null") + " "
print(output)

# Emoji converter:
message = input(">  ")
words = message.split(' ')
emojis ={
    ":)": "🙂",
    ":(": "☹",
    ":|": "😐"
}
output= ""
for word in words:
    output += emojis.get(word,word) + " "
print(output)
