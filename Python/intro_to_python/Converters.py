# weight converter
class WeightScale:
    def kgs_to_lbs(self,kgs):
        lbs = kgs*20/9
        return f"The weight in pounds is {lbs} lbs"


    def lbs_to_kgs(self,lbs):
        kgs = lbs*9/20
        return f"The weight in kilograms is {kgs} kgs"