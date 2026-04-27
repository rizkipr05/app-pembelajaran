# Ardata Learning - Platform Pembelajaran Digital

**Ardata Learning** adalah aplikasi platform pembelajaran berbasis mobile yang dirancang untuk memudahkan akses materi pembelajaran, video edukasi, dan kuis interaktif. Proyek ini terdiri dari aplikasi mobile built with Flutter dan backend API built with PHP & MySQL.

## 🚀 Fitur Utama
- **Autentikasi**: Registrasi dan Login akun siswa.
- **Materi Pembelajaran**: Akses detail materi edukasi.
- **E-Video**: Streaming video pembelajaran langsung di aplikasi.
- **Kuis Interaktif**: Evaluasi pemahaman melalui kuis setelah mempelajari materi.
- **Sistem Badge**: Dapatkan lencana penghargaan untuk progres pembelajaran.
- **Profil Pengguna**: Manajemen data diri dan statistik belajar.

## 🛠️ Stack Teknologi
- **Frontend**: Flutter (Dart)
- **Backend API**: PHP (Vanilla)
- **Database**: MySQL
- **Web Server**: XAMPP / LAMPP / Apache

## 📋 Persyaratan Sistem
Sebelum memulai, pastikan perangkat Anda telah terpasang:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Versi terbaru disarankan)
- [XAMPP](https://www.apachefriends.org/index.html) atau server lokal sejenis.
- VS Code atau Android Studio.
- Emulator Android atau perangkat fisik untuk testing.

## ⚙️ Cara Setup & Instalasi

### 1. Setup Database
1. Buka **phpMyAdmin** (`http://localhost/phpmyadmin`).
2. Buat database baru dengan nama `db_pembelajaran`.
3. Import file `db_pembelajaran.sql` yang tersedia di root folder proyek ini.

### 2. Setup Backend (API)
1. Salin folder proyek `app-pembelajaran` ke dalam direktori `htdocs` (untuk XAMPP) atau `/var/www/html` (untuk Linux Apache).
2. Pastikan file konfigurasi database di `api/db.php` sudah sesuai dengan kredensial MySQL Anda:
   ```php
   $host = "localhost";
   $db_name = "db_pembelajaran";
   $username = "root";
   $password = "";
   ```
3. Jalankan Apache dan MySQL melalui XAMPP Control Panel.

### 3. Setup Frontend (Mobile)
1. Masuk ke direktori mobile:
   ```bash
   cd mobile
   ```
2. Ambil semua dependency yang dibutuhkan:
   ```bash
   flutter pub get
   ```
3. (**PENTING**) Update `baseUrl` API pada service Flutter Anda agar mengarah ke alamat IP server lokal atau `localhost` (untuk emulator).
4. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## 📂 Struktur Proyek
- `api/`: Berisi file backend PHP untuk endpoint API.
- `mobile/`: Source code aplikasi Flutter.
- `db_pembelajaran.sql`: File export database MySQL.

---
Dikembangkan dengan ❤️ oleh **Ardata Team**.
