import requests
from bs4 import BeautifulSoup
import json

base_url = "https://www.formula1.com"
drivers_url = f"{base_url}/en/results.html/2021/drivers.html"

response = requests.get(drivers_url)
soup = BeautifulSoup(response.content, 'html.parser')

drivers_table = soup.find('table', class_='f1-table-with-data')

list_of_drivers = []

for row in drivers_table.find('tbody').find_all('tr'):
    cells = row.find_all('td')

    position = int(cells[0].get_text(strip=True))

    driver_cell = cells[1]
    first_name = driver_cell.find('span', class_='max-lg:hidden').get_text(strip=True)
    last_name = driver_cell.find('span', class_='max-md:hidden').get_text(strip=True)
    driver_name = f"{first_name} {last_name}"

    driver_link = cells[1].find('a')['href']
    nationality = cells[2].get_text(strip=True)
    team = cells[3].get_text(strip=True)
    points = float(cells[4].get_text(strip=True))
    
    driver_data = {
        "position": position,
        "driver_name": driver_name,
        "nationality": nationality,
        "team": team,
        "points": points,
        "driver_detail_url": f"{base_url}{driver_link}"
    }
    list_of_drivers.append(driver_data)

with open('../data/drivers.json', 'w') as f:
    json.dump(list_of_drivers, f, indent=4)

print("File drivers.json berhasil dibuat!")