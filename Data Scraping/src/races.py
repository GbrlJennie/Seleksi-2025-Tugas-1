import requests
from bs4 import BeautifulSoup
import json

base_url = "https://www.formula1.com"
races_url = f"{base_url}/en/results.html/2021/races.html"

response = requests.get(races_url)
soup = BeautifulSoup(response.content, 'html.parser')

races_table = soup.find('table', class_='f1-table-with-data')

list_of_races = []

month_convert = {
    "Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04", "May": "05", "Jun": "06",
    "Jul": "07", "Aug": "08", "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12"
}

for row in races_table.find('tbody').find_all('tr'):
    cells = row.find_all('td')

    gp_cell = cells[0]
    if gp_cell.find('svg'):
            gp_cell.find('svg').decompose()
    grand_prix_name = cells[0].get_text(strip=True)

    date = cells[1].get_text(strip=True) 
    date_parts = date.split()          
    day = date_parts[0]
    month = month_convert[date_parts[1]]
    race_date = f"2021-{month}-{day}" 

    winner_cell = cells[2]
    first_name = winner_cell.find('span', class_="max-lg:hidden").get_text(strip=True)
    last_name = winner_cell.find('span', class_="max-md:hidden").get_text(strip=True)
    winner_name = f"{first_name} {last_name}"

    team_name = cells[3].get_text(strip=True)
    laps = int(cells[4].get_text(strip=True))
    time = cells[5].get_text(strip=True)
    race_link = cells[0].find('a')['href'] # detail race
    
    race_data = {
        "grand_prix": grand_prix_name,
        "date": race_date,
        "winner": winner_name,
        "team": team_name,  
        "laps": laps,      
        "time": time, 
        "detail_url": f"{base_url}{race_link}"
    }
    list_of_races.append(race_data)

with open('../data/races.json', 'w') as f:
    json.dump(list_of_races, f, indent=4)

print("File races.json berhasil dibuat!")