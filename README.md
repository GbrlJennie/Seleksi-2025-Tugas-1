<h1 align="center">
  <br>
  Tugas Seleksi Asisten Basis Data  <br>
  Data F1 Season 2021
  <br>
  <br>
</h1>

<h2 align="left">
  <br>
  Author
  <br>
</h2>
Nama: Gabriela Jennifer Sandy
<br> NIM: 18223092
  <br>

## Deskripsi
Proyek ini merupakan implementasi proses ETL (Extract, Transform, Load) untuk data hasil balapan Formula 1 musim 2021. Topik ini dipilih karena data F1 kaya akan relasi dan detail, menjadikannya studi kasus yang menarik untuk pemodelan basis data. Data diambil dari situs web resmi Formula 1 dan mencakup hasil ringkas setiap balapan, klasemen akhir pembalap dan tim, serta hasil terperinci dari setiap pembalap di setiap Grand Prix.

DBMS yang digunakan untuk proyek ini adalah PostgreSQL, karena kemampuannya dalam menangani tipe data yang beragam dan dukungan kuat untuk integritas data melalui foreign key constraints.
  

## Cara Menggunakan Scraper
Semua skrip scraper berada di dalam direktori Data Scraping/src/. Untuk mengekstrak semua data, jalankan skrip dengan urutan sebagai berikut dari dalam direktori src tersebut:

1. Ekstrak Data Balapan (races.json)
Jalankan skrip races.py untuk mengumpulkan ringkasan dari setiap balapan dalam satu musim.
2. Ekstrak Data Pembalap (drivers.json)
Jalankan skrip drivers.py untuk mengumpulkan data klasemen akhir setiap pembalap.
3. Ekstrak Data Tim (teams.json)
Jalankan skrip teams.py.
4. Ekstrak Data Hasil Detail (detailed_race_results.json)
Jalankan skrip results.py untuk mengunjungi setiap halaman detail balapan dan mengumpulkan hasil dari semua pembalap.

Output: Keempat skrip di atas akan menghasilkan file JSON masing-masing di dalam direktori Data Scraping/data/.

## Penjelasan Struktur File JSON
Proses scraping menghasilkan empat file JSON yang masing-masing merepresentasikan satu entitas utama:
- races.json: Berisi daftar semua Grand Prix musim 2021. Setiap objek memiliki atribut seperti grand_prix, date (sudah diformat YYYY-MM-DD), winner, team, laps, time, dan detail_url sebagai tautan ke hasil lengkap.
- teams.json: Berisi daftar klasemen akhir tim konstruktor. Setiap objek memiliki atribut position, team, points, dan team_detail_url.
- drivers.json: Berisi daftar klasemen akhir pembalap. Setiap objek memiliki atribut position, driver_name, nationality, team, points, dan driver_detail_url.
- detail_results.json: Berisi hasil dari setiap pembalap di setiap balapan. Ini adalah data paling granular, dengan atribut seperti grand_prix, position, driver, no (nomor mobil), team, laps, time_or_status, dan points yang didapat pada balapan tersebut.

## Struktur ERD dan Diagram Relasional
Entity-Relationship Diagram (ERD)
ERD ini dirancang untuk memodelkan hubungan antar entitas utama. Results menjadi entitas asosiatif yang menghubungkan Races dan Drivers dalam hubungan many-to-many.

Proses Translasi ERD menjadi Diagram Relasional
ERD di atas ditranslasikan menjadi skema database relasional dengan aturan sebagai berikut:
1. Setiap entitas kuat (Teams, Drivers, Races, Circuits) menjadi sebuah tabel.
2. Setiap atribut menjadi sebuah kolom di dalam tabel tersebut dengan tipe data yang sesuai (e.g., VARCHAR, INTEGER, DATE, DECIMAL).
3. Primary Key (SERIAL) ditambahkan pada setiap tabel master untuk identifikasi unik.
4. Hubungan one-to-many (misalnya antara Teams dan Drivers) diimplementasikan dengan menambahkan foreign key (team_id) di sisi "many" (Drivers).
5. Hubungan many-to-many (antara Races dan Drivers) dipecah menjadi tabel perantara, yaitu tabel results, yang berisi foreign key dari kedua tabel yang dihubungkannya (race_id dan driver_id).

## Screenshot
<img width="1235" height="673" alt="query1" src="https://github.com/user-attachments/assets/cc30dbbe-1339-45e5-a747-0e9cfe29a089" />
<img width="672" height="658" alt="query3" src="https://github.com/user-attachments/assets/b6e19417-dc1f-4764-8613-48daf181435c" />
<img width="1452" height="128" alt="query2" src="https://github.com/user-attachments/assets/13b1119b-468d-4903-ba44-195d91ba372b" />

## Referensi
Sumber Data : https://www.formula1.com/en/results/2021/races
Library Python: beautifulsoup4, psycopg2-binary
DBMS: PostgreSQL 17.2


