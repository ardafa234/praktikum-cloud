# Analisis Perbandingan IaaS, PaaS, dan SaaS

## Ringkasan Tiga Model

**IaaS (Infrastructure as a Service)** menyediakan infrastruktur mentah: server virtual, penyimpanan, dan jaringan. Pengguna bertanggung jawab atas sistem operasi dan semua yang berjalan di atasnya.

**PaaS (Platform as a Service)** menyediakan platform siap pakai untuk menjalankan aplikasi. Pengguna fokus pada kode aplikasi, sedangkan penyedia mengurus server, sistem operasi, dan lingkungan runtime.

**SaaS (Software as a Service)** menyediakan aplikasi jadi yang langsung dipakai lewat browser. Pengguna hanya mengelola konten dan pengaturan akun.

## Tanggung Jawab Pengelolaan

| Lapisan | IaaS | PaaS | SaaS |
|---|---|---|---|
| Aplikasi | Pengguna | Pengguna | Penyedia |
| Data | Pengguna | Pengguna | Pengguna |
| Runtime | Pengguna | Penyedia | Penyedia |
| Sistem operasi | Pengguna | Penyedia | Penyedia |
| Virtualisasi | Penyedia | Penyedia | Penyedia |
| Server dan jaringan | Penyedia | Penyedia | Penyedia |

## Pengalaman Selama Praktikum

> Bagian ini ditulis sebagai contoh. **Sesuaikan dengan yang benar-benar kamu alami** (misalnya error yang muncul, berapa lama prosesnya, atau hal yang membuatmu bingung).

### IaaS (VM Ubuntu di Killercoda)

- Saya harus memeriksa sendiri spesifikasi (CPU, RAM, disk) dan memasang Nginx dengan `apt install`.
- Saya juga yang memastikan layanan berjalan lewat `systemctl status nginx`.
- Semua konfigurasi ada di tangan saya, mulai dari paket, layanan, sampai keamanan.
- Fleksibilitas tinggi, tetapi langkah manualnya paling banyak dan risiko salah konfigurasi lebih besar.

### PaaS (Render)

- Saya cukup mengunggah kode ke GitHub, menghubungkannya ke Render, dan mengisi beberapa kolom konfigurasi.
- Tidak ada langkah memasang sistem operasi atau web server. Render menjalankan dan menyajikan situs, lalu memberi URL publik.
- Setiap kali saya melakukan commit baru ke GitHub, platform dapat men-deploy ulang secara otomatis.
- Kontrolnya lebih terbatas dibanding VM: saya tidak mengatur sistem operasi atau konfigurasi server secara langsung.

### SaaS (Google Docs)

- Tidak ada instalasi atau konfigurasi: buka browser, login, langsung menulis.
- Fitur kolaborasi, autosave, dan riwayat versi sudah tersedia.
- Saya tidak bisa mengubah cara kerja aplikasinya, hanya memakai fitur yang disediakan.

## Perbandingan

| Aspek | IaaS | PaaS | SaaS |
|---|---|---|---|
| Kontrol | Penuh | Sedang | Minimal |
| Kemudahan | Rendah | Sedang | Tinggi |
| Waktu persiapan | Lama | Singkat | Instan |
| Skalabilitas | Diatur sendiri | Banyak yang otomatis | Diatur penyedia |
| Keahlian teknis | Tinggi | Sedang | Rendah |
| Cocok untuk | Admin sistem, kebutuhan khusus | Developer yang fokus ke aplikasi | Pengguna umum dan bisnis |
| Contoh | EC2, Compute Engine | Render, App Engine, Azure App Service | Google Docs, Trello, Slack |

## Batasan Praktikum

- Killercoda adalah lab sandbox: tidak ada konsol atau billing seperti di AWS/GCP/Azure, IP yang tercatat adalah IP sandbox, dan sesi gratis dibatasi sekitar 60 menit.
- Aplikasi PaaS yang di-deploy berupa situs statis. Pada situs statis, platform hanya menyajikan berkas; kemampuan PaaS menjalankan kode backend (mis. Node.js) baru terlihat jika memakai jenis layanan seperti *Web Service*.
- Layanan cloud komersial (Google Cloud, Oracle Cloud, dan sejenisnya) berbayar atau membutuhkan registrasi yang lebih rumit, sehingga praktikum memakai alternatif gratis.

Meski begitu, perbedaan pembagian tanggung jawab pengelolaan pada ketiga model tetap dapat dirasakan.

## Bonus: Kubernetes

Bagian opsional di folder `bonus-kubernetes/` memperlihatkan prinsip platform yang mengurus aplikasi untuk kita: kita hanya menentukan image dan jumlah replika, dan platform otomatis membuat ulang pod yang dihapus.

## Kesimpulan

Semakin ke arah SaaS, semakin sedikit yang harus dikelola pengguna, tetapi semakin kecil pula kontrolnya. IaaS cocok bila butuh kendali penuh, PaaS cocok untuk mempercepat deployment aplikasi, dan SaaS cocok untuk kebutuhan sehari-hari tanpa urusan teknis.
