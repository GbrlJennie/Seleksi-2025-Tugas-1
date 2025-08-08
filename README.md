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
NIM: 18223092
  <br>

## Deskripsi
Proyek ini merupakan implementasi proses ETL (Extract, Transform, Load) untuk data hasil balapan Formula 1 musim 2021. Topik ini dipilih karena data F1 kaya akan relasi dan detail, menjadikannya studi kasus yang menarik untuk pemodelan basis data. Data diambil dari situs web resmi Formula 1 dan mencakup hasil ringkas setiap balapan, klasemen akhir pembalap dan tim, serta hasil terperinci dari setiap pembalap di setiap Grand Prix.

DBMS yang digunakan untuk proyek ini adalah PostgreSQL, karena kemampuannya dalam menangani tipe data yang beragam dan dukungan kuat untuk integritas data melalui foreign key constraints.
  

## Cara Menggunakan Scraper
Semua skrip scraper berada di dalam direktori Data Scraping/src/. Untuk mengekstrak semua data, jalankan skrip dengan urutan sebagai berikut dari dalam direktori src tersebut:

1. Ekstrak Data Balapan (races.json)
Jalankan skrip races.py untuk mengumpulkan ringkasan dari setiap balapan dalam satu musim.