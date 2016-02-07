# Some background on dates in R
# TODO: make code in dates_intro.r explaining date structures

# #
# # To be able to compare dates, work with date ranges and print dates in various formats
# # one must represent dates as a special type of variable, not just text like '2015-01-31' 
# #

# import pandas as pd
# import datetime 


# print("Date testing")
# # Standard date represntation in Python in datetime.date  
# d1 = datetime.date(1978, 4, 15) 
# d2 = datetime.date(2014, 4, 15)

# # check we can compare dates
# assert d2 > d1 

# # print some output
# # some date + .today() method will give today's date
# print("Today is", datetime.date(1917, 11, 7).today().isoformat())

# # In pandas there is even a more convenient date type called Timestamp
# # Actually, it is a high precision date and time data structure, but it 
# # can be used to handle dates too.

# # Timestamp can be constructed from many inputs, most simple - a text string 
# p1 = pd.Timestamp('1978-04-15')
# p2 = pd.Timestamp(d2)
# assert p2 > p1
# print("Today is", p1.today().date().isoformat())

# # More extensions:
# #  - http://strftime.org/ + https://docs.python.org/2/library/datetime.html#strftime-and-strptime-behavior
# #  - native 'calendar' package https://docs.python.org/3.5/library/calendar.html
# #  - dateutil https://dateutil.readthedocs.org/en/latest/