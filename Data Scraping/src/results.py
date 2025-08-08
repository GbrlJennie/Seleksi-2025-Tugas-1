import requests
from bs4 import BeautifulSoup
import json
import time

base_url = "https://www.formula1.com"

try:
    with open('../data/races.json', 'r') as f:
        races = json.load(f)
except FileNotFoundError:
    print("Error: File races.json tidak ditemukan. Jalankan skrip races.py terlebih dahulu.")
    exit()

detail_results = []

for race in races:
    grand_prix_name = race['grand_prix']
    detail_url = race['detail_url']

    print(f"Mengambil data untuk: {grand_prix_name}...")

    response = requests.get(detail_url)
    soup = BeautifulSoup(response.content, 'html.parser')

    results_table = soup.find('table', class_='f1-table-with-data')

    for row in results_table.find('tbody').find_all('tr'):
        cells = row.find_all('td')

        position = cells[0].get_text(strip=True)
        if position == 'NC' or position == 'DQ':
            position_new = 20
        else:
            position_new = int(position)

        number = int(cells[1].get_text(strip=True))

        driver_cell = cells[2]
        first_name = driver_cell.find('span', class_='max-lg:hidden').get_text(strip=True)
        last_name = driver_cell.find('span', class_='max-md:hidden').get_text(strip=True)
        driver_name = f"{first_name} {last_name}"
        
        team = cells[3].get_text(strip=True)
        laps = int(cells[4].get_text(strip=True))
        status = cells[5].get_text(strip=True)
        points = float(cells[6].get_text(strip=True))

        result_data = {
            "grand_prix": grand_prix_name,
            "position": position_new,
            "driver": driver_name,
            "no": number,
            "team": team,
            "laps": laps,
            "time_or_status": status,
            "points": points
        }
        detail_results.append(result_data)

    time.sleep(1) 

with open('../data/detail_results.json', 'w') as f:
    json.dump(detail_results, f, indent=4)

print("\nFile detail_results.json berhasil dibuat!")