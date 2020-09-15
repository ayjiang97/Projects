
## Main Program

import pandas as pd
df = pd.read_csv('AB_NYC_2019.csv')
import utilities as u

### Question 1: Which neighbourhood group have the largest house number?
neighbourhood_group = ('Brooklyn', 'Manhattan', 'Queens', 'Staten Island', 'Bronx')
print('There are 5 neighbourhood groups in New York. They are', neighbourhood_group)

a = u.airbnb('Brooklyn')
print(u.airbnb.count(a))
aa = u.airbnb('Manhattan')
print(u.airbnb.count(aa))



### Question 2: Relationship 
##  between price and number of reviews
b = u.airbnb_reviews(df)
u.airbnb_reviews.relationship(b)



### Question 3: Room type and number of each room type
room_type = ('Entire home/apt', 'Private room', 'Shared room')
print('There are three kinds of room types, they are:', room_type)

c = u.airbnb_room_type('Shared room')
print(c.pop_room_type('Shared room'))
cc = u.airbnb_room_type('Entire home/apt')
print(cc.pop_room_type('Entire home/apt'))



### Question 4: Who is the busiest host?
top_3_hosts = ('David','Sonder(NYC)', 'Michael')
print(f'The top three busiest hosts are:', top_3_hosts)

d = u.airbnb_busiest_host('David')
print(d.host('David'))
'''
Michael is not the busiest host in New York.
The most popular neighbourhood in New York is Michael
'''

dd = u.airbnb_busiest_host('Michael')
print(dd.host('Michael'))


