# 📱 Student Dashboard – NIM_Tugas7

Aplikasi **Student Dashboard** adalah implementasi kreatif dari *Tugas Pemrograman Mobile Pertemuan 9*. Aplikasi ini menggabungkan konsep **Routes**, **Side Menu**, **Login**, dan **Local Storage** menggunakan **Flutter**.

Aplikasi ini mensimulasikan portal mahasiswa di mana pengguna dapat login menggunakan **Nama & NIM**, melihat jadwal kuliah, mengelola tugas, serta melihat data profil. Sesi pengguna disimpan secara lokal sehingga pengguna tetap login meskipun aplikasi ditutup.

---

## ✨ Fitur Utama

### 🔐 Sistem Login & Validasi
- Input **Nama** dan **NIM** wajib diisi.
- Jika kosong, aplikasi menampilkan **SnackBar error**.

### 💾 Local Storage (Shared Preferences)
- Menyimpan data Nama & NIM sebagai sesi login.
- Mendukung fitur **auto-login** setelah aplikasi dibuka kembali.

### 🧭 Navigation (Routes)
- Navigasi antar halaman terpusat menggunakan `routes`.
- Menggunakan `Navigator.pushReplacementNamed` untuk perpindahan halaman yang lebih bersih.

### 📂 Side Menu (Drawer)
- Menampilkan Nama & NIM yang sedang login.
- Memuat navigasi ke halaman Home, Jadwal, Tugas, dan Profil.
- Tombol **Logout** menghapus data sesi dan kembali ke halaman Login.

### 📝 Interaktif & User Friendly
- Checklist tugas yang dapat dicentang.
- Dashboard modern menggunakan Grid Menu.
- UI responsif dan mudah digunakan.

---

## 📁 Struktur Folder (lib/) & Penjelasan

### **1. `main.dart` – Entry Point**
- Mengatur tema aplikasi (warna dasar Indigo).
- Mendaftarkan semua route untuk navigasi halaman.

### **2. `login_page.dart` – Halaman Login**
- Menggunakan `TextEditingController` untuk input.
- Validasi Nama & NIM tidak boleh kosong.
- Jika valid → disimpan menggunakan `SharedPreferences`.
- Fungsi **_checkLogin()** otomatis mengecek data sesi dan masuk ke Home bila user masih login.

### **3. `sidemenu.dart` – Side Navigation Drawer**
- Menggunakan `UserAccountsDrawerHeader` untuk menampilkan profil pengguna secara dinamis.
- Tombol navigasi ke halaman utama aplikasi.
- Tombol Logout untuk menghapus semua data sesi (`prefs.clear()`).

### **4. `home_page.dart` – Dashboard Utama**
- Mengambil Nama dari local storage untuk sapaan pengguna:  
  **"Selamat Datang, [Nama]!"**
- Menampilkan menu utama dalam bentuk **GridView** (Jadwal, Tugas, Profil, dll).

### **5. `schedule_page.dart` – Jadwal Kuliah**
- Menggunakan data dummy berupa `List<Map>`.
- Ditampilkan dalam bentuk card menggunakan `ListView`.

### **6. `assignments_page.dart` – Daftar Tugas**
- Menggunakan `StatefulWidget` sehingga daftar tugas dapat diubah statusnya.
- `CheckboxListTile` memungkinkan user menandai tugas yang selesai.
- Perubahan status diperbarui menggunakan `setState()`.

### **7. `profile_page.dart` – Profil Pengguna**
- Mengambil kembali **user_name** dan **user_nim** dari `SharedPreferences`.
- Tampilan UI dengan header melengkung agar lebih estetis.

---

## 🛠️ Teknologi yang Digunakan
- Flutter (Dart)
- SharedPreferences
- Material Design Widgets

---

## 🚀 Cara Menjalankan Aplikasi
```sh
flutter pub get
flutter run
```

---

## 📸 Preview
<img width="467" height="976" alt="Screenshot 2025-11-18 233302" src="https://github.com/user-attachments/assets/f66a0056-dbff-417d-bd13-9a138c69b9a2" />
<img width="465" height="971" alt="Screenshot 2025-11-18 233322" src="https://github.com/user-attachments/assets/f43dfe57-ab49-4ac9-b8f5-55fb6677d392" />
<img width="469" height="976" alt="Screenshot 2025-11-18 233332" src="https://github.com/user-attachments/assets/49a90b76-959f-451f-ae26-746df23942c2" />
<img width="462" height="976" alt="Screenshot 2025-11-18 233344" src="https://github.com/user-attachments/assets/922cc188-d008-44a4-8853-633333de8053" />
<img width="466" height="974" alt="Screenshot 2025-11-18 233404" src="https://github.com/user-attachments/assets/33c625b8-3d56-49e9-b874-3dc775d181db" />
<img width="465" height="960" alt="Screenshot 2025-11-18 233422" src="https://github.com/user-attachments/assets/69fc4e55-81af-49c5-9cd8-9d214872562d" />
