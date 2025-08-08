import requests
from bs4 import BeautifulSoup
import json

base_url = "https://www.formula1.com"
teams_url = f"{base_url}/en/results.html/2021/team.html"

response = requests.get(teams_url)
soup = BeautifulSoup(response.content, 'html.parser')

teams_table = soup.find('table', class_='f1-table-with-data')

list_of_teams = []

for row in teams_table.find('tbody').find_all('tr'):
    cells = row.find_all('td')

    position = int(cells[0].get_text(strip=True))
    team = cells[1].find('a').get_text(strip=True)
    points = float(cells[2].get_text(strip=True))
    team_link = cells[1].find('a')['href']
    
    teams_data = {
        "position": position,
        "team": team,
        "points": points,
        "team_detail_url": f"{base_url}{team_link}"
    }
    list_of_teams.append(teams_data)

with open('../data/teams.json', 'w') as f:
    json.dump(list_of_teams, f, indent=4)

print("File teams.json berhasil dibuat!")