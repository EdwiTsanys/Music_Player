# Aplikasi Pemutar Musik

Aplikasi pemutar musik Flutter statis yang menggunakan GetX untuk navigasi dan routing. Aplikasi ini mendemonstrasikan implementasi arsitektur yang bersih dengan pola GetX dan desain UI yang responsif.

## Struktur Proyek

```
lib/
├── main.dart                         # File utama aplikasi
├── app/
│   ├── pages/                        # Folder untuk semua halaman
│   │   ├── splash_view.dart          # Halaman pembuka
│   │   ├── home_view.dart           # Halaman utama
│   │   ├── search_view.dart         # Halaman pencarian
│   │   ├── playlist_detail_view.dart # Halaman detail playlist
│   │   └── now_playing_view.dart    # Halaman pemutar musik
│   └── route/
│       └── app_routes.dart          # Konfigurasi rute aplikasi
└── controllers/
    └── bottom_nav_controller.dart    # Pengontrol navigasi bawah
```

## Struktur Kode dan Detail Implementasi

### 1. Titik Masuk Utama (main.dart)

File main.dart berfungsi sebagai titik masuk utama aplikasi:
- Menggunakan `GetMaterialApp` untuk integrasi GetX
- Mengatur konfigurasi tema gelap
- Mengatur rute awal ke halaman splash screen
- Mendaftarkan semua rute aplikasi

```dart
GetMaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Music Player',
  theme: ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
  ),
  initialRoute: '/splash',
  getPages: AppPages.routes,
)
```

### 2. Manajemen Rute (app/route/app_routes.dart)

Mengimplementasikan sistem routing terpusat menggunakan GetX:
- Kelas `Routes`: Mendefinisikan konstanta rute statis
- Kelas `AppPages`: Mengkonfigurasi pemetaan rute ke halaman

```dart
abstract class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const search = '/search';
  static const playlistDetail = '/playlist-detail';
  static const nowPlaying = '/now-playing';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.home, page: () => HomeView()),
    // ... rute lainnya
  ];
}
```

### 3. Halaman-halaman

#### Halaman Pembuka (pages/splash_view.dart)
- Tampilan awal loading dengan logo aplikasi
- Otomatis berpindah ke halaman utama setelah 3 detik
- Animasi sederhana dengan indikator loading melingkar
- Desain bersih dan minimalis dengan konten yang terpusat

#### Halaman Utama (pages/home_view.dart)
- Fitur tata letak grid responsif untuk rilis baru dan rekomendasi artis
- Mengimplementasikan bar navigasi bawah untuk navigasi aplikasi
- Menggunakan LayoutBuilder untuk desain responsif:
  - Menyesuaikan jumlah kolom grid berdasarkan lebar layar
  - Menyesuaikan ukuran kartu untuk berbagai perangkat
- Bagian-bagian:
  - "Baru Rilis": Menampilkan rilis musik baru dalam grid
  - "Rekomendasi Artis": Menampilkan artis yang direkomendasikan dalam grid
- Setiap kartu musik di "Baru Rilis" bisa diklik dan mengarah ke tampilan Now Playing
- Kartu artis hanya untuk tampilan tanpa navigasi

#### Halaman Pencarian (pages/search_view.dart)
- Mengimplementasikan antarmuka kolom pencarian dengan sudut membulat
- Menampilkan genre musik dalam grid responsif
- Demonstrasi UI statis dengan berbagai kartu genre
- Menggunakan komponen Material Design untuk tema yang konsisten
- Fitur kartu genre:
  - Warna berbeda untuk setiap genre
  - Overlay ikon untuk daya tarik visual
  - Tidak ada interaksi klik (hanya tampilan)

#### Halaman Detail Playlist (pages/playlist_detail_view.dart)
- Menampilkan tampilan detail dari playlist
- Fitur app bar yang bisa menyusut dengan gradient latar belakang
- Menampilkan:
  - Gambar sampul playlist
  - Judul playlist dan pembuatnya
  - Jumlah lagu dan durasi
  - Daftar lagu dengan tombol putar
- Mengimplementasikan perilaku scroll yang halus

#### Halaman Pemutaran (pages/now_playing_view.dart)
- Antarmuka pemutar musik layar penuh
- Fitur-fitur:
  - Tampilan sampul album besar
  - Slider kemajuan untuk posisi lagu
  - Kontrol pemutaran (putar/jeda, berikutnya, sebelumnya)
  - Efek gradient latar belakang
  - Tampilan judul lagu dan artis
  - Kontrol tambahan (acak, ulang)

### 4. Pengontrol (Controllers)

#### Pengontrol Navigasi Bawah (controllers/bottom_nav_controller.dart)
- Mengelola status navigasi untuk bar navigasi bawah
- Mengimplementasikan navigasi sederhana antara bagian utama
- Tidak ada manajemen status yang kompleks sesuai persyaratan

## Fitur Utama

1. **Arsitektur Bersih**
   - Struktur folder yang terorganisir
   - Pemisahan tanggung jawab
   - Implementasi pola GetX

2. **Desain Responsif**
   - Menyesuaikan dengan berbagai ukuran layar
   - Tata letak grid responsif
   - Komponen UI yang fleksibel

3. **Navigasi**
   - Sistem navigasi GetX
   - Bar navigasi bawah
   - Routing halaman

4. **UI/UX**
   - Implementasi tema gelap
   - Bahasa desain yang konsisten
   - Transisi yang halus
   - Efek gradient

## Catatan Teknis

- Dibangun dengan framework Flutter dan GetX
- Implementasi UI statis (tanpa integrasi backend)
- Fokus pada UI/UX dan routing
- Prinsip desain responsif
- Komponen Material Design

## Keputusan Desain

1. **Implementasi Statis**
   - Tidak ada kompleksitas manajemen status
   - Fokus pada UI dan routing
   - Konten placeholder untuk demonstrasi

2. **Tata Letak Responsif**
   - Implementasi LayoutBuilder
   - Sistem grid adaptif
   - Ukuran kartu yang fleksibel

3. **Pola Navigasi**
   - GetX untuk routing sederhana
   - Navigasi bawah untuk bagian utama
   - Struktur navigasi yang bersih

## Alur Aplikasi

1. Pengguna memulai aplikasi → Muncul Splash Screen
2. Setelah 3 detik → Otomatis berpindah ke Halaman Utama
3. Halaman Utama:
   - Dapat melihat rilis baru dan artis yang direkomendasikan
   - Dapat mengklik rilis baru untuk menuju ke layar Now Playing
   - Dapat menggunakan navigasi bawah untuk mengakses Pencarian dan Perpustakaan
4. Halaman Pencarian:
   - Dapat melihat kolom pencarian dan grid genre
   - Implementasi statis (tidak ada fungsi pencarian yang sebenarnya)
5. Detail Playlist:
   - Dapat diakses dari berbagai titik di aplikasi
   - Menampilkan informasi detail playlist
   - Dapat berpindah ke layar Now Playing dari daftar lagu
6. Pemutaran Musik:
   - Menampilkan antarmuka pemutar layar penuh
   - Implementasi statis dari kontrol pemutar
