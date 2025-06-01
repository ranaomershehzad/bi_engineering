# Weight exercise - need to convert from pounds to kgs and vice versa
# 1. Ask for weight
# 2. Ask if it is in (L)bs or (K)gs (1 lbs, 0.45359237 kg )
# 3. Display the converted weight

weight = float(input("Weight: "))
metric = input("(L)bs or (K)gs: ")
if metric.upper() == "L":
    con_weight = str(weight*0.45359237)
    print("Weight in Kgs is :" + con_weight)
elif metric.upper() == "K":
    con_weight = str(weight*2.20462)
    print("Weight in Lbs is :" + con_weight)
else:
    print("Please type either 'K' or 'L'")