# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 13:47:17 2022

@author: hp
"""

import requests
from bs4 import BeautifulSoup
import pandas as pd

base_url = 'https://www.thewhiskyexchange.com/'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'
    }
    

productlinks = []
    
for x in range(16,21):
    r = requests.get(f'https://www.thewhiskyexchange.com/c/644/still-wine?pg={x}')
    soup = BeautifulSoup(r.content, 'lxml')
    
    productlist = soup.find_all('li', class_ = "product-grid__item")
    
    
    for item in productlist:
        for link in item.find_all('a', href = True):
            productlinks.append(base_url + link['href'])
        


#test_link = 'https://www.thewhiskyexchange.com/p/57209/single-malts-discovery-mini-pack-talisker-10-cardhu-12-singleton-12'
whiskylist = []

for link in productlinks:
    r = requests.get(link, headers= headers)

    soup = BeautifulSoup(r.content, 'lxml')
    name = soup.find('h1',class_ =  "product-main__name").contents[0].strip()

    al_p = soup.find('p', class_ = 'product-main__data').contents[0].strip()
    alcohol_amount= al_p[0: al_p.find('cl')]
    start_location_percent = al_p.find('/ ') 
    end_location_percent = al_p.find('%')
    alcohol_percent = al_p[start_location_percent + 2:end_location_percent]
    price = soup.find('p', class_ ='product-action__price').contents[0].replace('£','').strip()
    category = 'Wine & Champagne'
  


    whisky = {
        'Product_name': name,
        'Alcohol_amount': alcohol_amount,
        'Alcohol_percent': alcohol_percent,
        'Price': price,
        'Category': category
        }
    
    
    whiskylist.append(whisky)
    print("saving:", whisky['Product_name'])
    
df = pd.DataFrame(whiskylist)

print(df.head())
df.to_csv('wine3.csv', header=True, index=False)
