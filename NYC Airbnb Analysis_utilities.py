
## Utilities
import matplotlib.pyplot as plt
import pandas as pd
df = pd.read_csv('AB_NYC_2019.csv')

class airbnb():
    def __init__(self, neighbourhood_group):
        self.neighbourhood_group = neighbourhood_group
    
    def count(self):
        neighbourhood_group = self.neighbourhood_group
        gdf = df.groupby('neighbourhood_group').size().to_frame()
        gdf.columns = ['Number_of_Houses']
        print(gdf.sort_values(by = ['Number_of_Houses']))
        pop_n = gdf.to_dict()
        pop_n = list(pop_n['Number_of_Houses'].keys())
        pop_ne = pop_n[2]
        if neighbourhood_group == pop_ne:
            print(f'The most popular neighbourhood in New York is {pop_ne}')
        else:
            print(f'{self.neighbourhood_group} is not the most popular neighbourhood in New York.')
            print(f'The most popular neighbourhood in New York is {pop_ne}')

class airbnb_reviews():
    def __init__(self, df):
        self.df = df

    def relationship(self):
        price = list(df['price'])
        number_of_reviews = list(df['number_of_reviews'])
        plt.plot(number_of_reviews, price, 'm*-')
        plt.scatter(number_of_reviews, price, c = 'c', alpha = 0.15)
        plt.title('Relation Between Price and Number of Reviews')
        plt.xlabel('Number of Reviews')
        plt.ylabel('Price')
        plt.show()
        print('The image shows the relationship between price and number of reviews.')





class airbnb_room_type():
    def __init__(self, room_type):
        self.room_type = room_type
    
    def pop_room_type(self, room_type):
        rdf = df.groupby('room_type').size().to_frame()
        rdf.columns = ['Number']
        print(rdf.sort_values(by = ['Number']))
        if room_type == 'Entire home/apt':
            print('The most popular room type in New York is Entire home/apt')
        else:
            print(f'{room_type} is not the most popular room type.')
            print('The most popular room type in New York is Entire home/apt')

           
       





class airbnb_busiest_host():
    def __init__ (self, host_name):
        self.host_name= host_name
        
    def host (self, host_name):
        df_host=df['host_name'].value_counts().to_frame()
        df_host.columns=['counts']
        top1= df_host['counts'].head(1)
        top1= top1.to_dict()
        if host_name == 'Michael':
            print(f'The busiest host is {list(top1.keys())[0]} who has {list(top1.values())[0]} orders.')
        else:
            print(f'{host_name} is not the busiest host in New York.')
            print(f'The most popular neighbourhood in New York is {list(top1.keys())[0]}')
        

