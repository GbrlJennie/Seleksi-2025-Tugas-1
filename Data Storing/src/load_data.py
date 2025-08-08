import json
import psycopg2

try:
    conn = psycopg2.connect(
        dbname="seleksi_basdat",
        user="postgres",
        password="Jenn*2801", 
        host="localhost",
        port="5432"
    )
    cur = conn.cursor()
    print("Koneksi ke database berhasil!")
except psycopg2.Error as e:
    print(f"Gagal terkoneksi ke database: {e}")
    exit()

driver_to_car_number = {}
team_name_to_id = {}
driver_name_to_id = {}
race_name_to_id = {}

# driver number
print("Membuat pemetaan nomor mobil pembalap...")
with open('../../Data Scraping/data/detail_results.json', 'r') as f:
    results_data = json.load(f)

for result in results_data:
    driver_name = result.get('driver')
    car_number = result.get('no') 
    if driver_name and car_number and driver_name not in driver_to_car_number:
        driver_to_car_number[driver_name] = car_number

# teams
print("Memuat data teams...")
with open('../../Data Scraping/data/teams.json', 'r') as f:
    teams_data = json.load(f)

for team in teams_data:
    cur.execute(
        "INSERT INTO teams (team_name, points, detail_url) VALUES (%s, %s, %s) RETURNING team_id, team_name",
        (team['team'], team['points'], team['team_detail_url'])
    )
    team_id, team_name = cur.fetchone()
    team_name_to_id[team_name] = team_id

# drivers
print("Memuat data drivers...")
with open('../../Data Scraping/data/drivers.json', 'r') as f:
    drivers_data = json.load(f)

for driver in drivers_data:
    team_id = team_name_to_id.get(driver['team'])
    driver_number = driver_to_car_number.get(driver['driver_name'])

    cur.execute(
        "INSERT INTO drivers (driver_name, driver_number, nationality, points, team_id, detail_url) VALUES (%s, %s, %s, %s, %s, %s) RETURNING driver_id, driver_name",
        (driver['driver_name'], driver_number, driver['nationality'], driver['points'], team_id, driver['driver_detail_url'])
    )
    driver_id, driver_name = cur.fetchone()
    driver_name_to_id[driver_name] = driver_id

# races
print("Memuat data races...")
with open('../../Data Scraping/data/races.json', 'r') as f:
    races_data = json.load(f)

for race in races_data:
    cur.execute(
        "INSERT INTO races (grand_prix, race_date, laps, winner_name, time, detail_url) VALUES (%s, %s, %s, %s, %s, %s) RETURNING race_id, grand_prix",
        (race['grand_prix'], race['date'], race['laps'], race['winner'], race['time'], race['detail_url'])
    )
    race_id, grand_prix = cur.fetchone()
    race_name_to_id[grand_prix] = race_id

# results
print("Memuat data detailed race results...")
for result in results_data: 
    race_id = race_name_to_id.get(result['grand_prix'])
    driver_id = driver_name_to_id.get(result['driver'])

    if race_id and driver_id:
        cur.execute(
            "INSERT INTO results (race_id, driver_id, position, laps, time_or_status, points) VALUES (%s, %s, %s, %s, %s, %s)",
            (race_id, driver_id, result['position'], result['laps'], result['time_or_status'], result['points'])
        )

conn.commit()
cur.close()
conn.close()

print("\nSemua data berhasil dimuat ke dalam database!")