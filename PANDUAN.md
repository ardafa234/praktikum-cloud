# Panduan Langkah Kerja: dari Daftar Akun sampai Laporan Selesai

Perkiraan waktu total: 1,5 sampai 2 jam. Sesi Killercoda gratis dibatasi sekitar 60 menit, jadi ambil screenshot sambil jalan.

## Tahap 0: Akun GitHub (±5 menit)

1. Buka https://github.com dan klik **Sign up**.
2. Isi email, password, dan username, lalu verifikasi emailnya.
3. Catat username GitHub-mu.

## Tahap 1: Daftar atau login Killercoda (±3 menit)

Killercoda tidak punya form daftar terpisah: akun otomatis terbuat saat login pertama.

1. Buka https://killercoda.com.
2. Klik **Login** di pojok kanan atas.
3. Pilih **GitHub** (atau Google), lalu klik **Authorize**.
4. Pastikan foto profilmu muncul di pojok kanan atas.
5. Selalu login dengan metode yang sama agar tidak terbentuk dua akun.

## Tahap 2: Buat repositori GitHub (±10 menit)

1. Ekstrak `praktikum-cloud.zip` ke komputermu.
2. Di GitHub klik **+** di kanan atas, lalu **New repository**.
3. Isi nama `praktikum-cloud`, pilih **Public**, jangan centang opsi README, lalu **Create repository**. Harus Public agar bisa di-clone dari Killercoda dan dibaca Render.
4. Unggah proyek, pilih salah satu cara:

**Tanpa Git:** di halaman repo klik **uploading an existing file**, seret semua isi folder hasil ekstrak (termasuk subfolder `app`, `iaas`, dan lainnya), lalu **Commit changes**. Pastikan struktur folder tetap sama.

**Dengan Git:**
```bash
cd praktikum-cloud
git init
git add .
git commit -m "Kerangka praktikum cloud"
git branch -M main
git remote add origin https://github.com/<username>/praktikum-cloud.git
git push -u origin main
```
Saat diminta password, pakai Personal Access Token (GitHub: Settings, Developer settings, Personal access tokens), bukan password akun.

5. Edit `app/index.html` di GitHub (ikon pensil): ganti `GANTI_DENGAN_NAMAMU` dan `GANTI_DENGAN_NIM`, lalu **Commit changes**.
6. Screenshot halaman repositori (menampilkan folder `app/`), simpan sebagai `04-paas-github-repo.png`.

## Tahap 3: IaaS, VM Ubuntu (±15 menit)

1. Buka https://killercoda.com/playgrounds/scenario/ubuntu dan tunggu terminal muncul.
2. Jalankan:
```bash
git clone https://github.com/<username>/praktikum-cloud.git
cd praktikum-cloud
bash iaas/setup-vm.sh
```
3. Screenshot bagian spesifikasi (OS, vCPU, RAM, IP) sebagai `01-iaas-spesifikasi-vm.png`.
4. Jalankan `systemctl status nginx`, screenshot sebagai `02-iaas-nginx-status.png`.
5. Klik **Traffic / Ports** di kanan atas, pilih **Custom Ports**, isi `80`, lalu **Access**. Screenshot halaman "Welcome to nginx!" sebagai `03-iaas-nginx-browser.png`.
6. Catat OS, vCPU, RAM, dan IP untuk tabel di README.

Kalau `git clone` gagal, salin isi `iaas/setup-vm.sh` secara manual ke terminal.

## Tahap 4: PaaS, Render (±20 menit)

1. Buka https://render.com dan login dengan GitHub (**Sign in with GitHub**), lalu izinkan akses ke repositori.
2. Klik **New +**, lalu **Static Site**, dan pilih repositori `praktikum-cloud`.
3. Isi konfigurasi:
   - **Name:** mis. `praktikum-cloud-<namamu>`
   - **Branch:** `main`
   - **Build Command:** kosongkan
   - **Publish Directory:** `app`
4. Screenshot form ini sebagai `05-paas-render-konfigurasi.png`.
5. Klik **Create Static Site**. Tunggu sampai status **Deploy succeeded / Live**, lalu screenshot sebagai `06-paas-render-deploy-sukses.png`.
6. Buka URL `https://<nama>.onrender.com` di browser, klik tombol **Cek status aplikasi**, lalu screenshot (URL harus terlihat) sebagai `07-paas-render-url.png`.
7. Catat URL-nya untuk README.

Render bisa meminta verifikasi tambahan di akun tertentu. Kalau muncul permintaan yang tidak kamu pahami, jangan lanjut dulu, tanyakan.

## Tahap 5: SaaS, Google Docs (±15 menit)

1. Buka https://docs.google.com dan buat dokumen berjudul **"Laporan Praktikum Cloud"**. Tulis beberapa paragraf, atau sesuai instruksi dosen.
2. Screenshot dokumen sebagai `08-saas-docs.png`.
3. Klik **Share**, bagikan ke teman, lalu screenshot sebagai `09-saas-share.png`.
4. Coba komentar dan edit bersamaan dengan teman.
5. Buka **File, Version history, See version history**, lalu screenshot sebagai `10-saas-version-history.png`.
6. Centang daftar kegiatan di `saas/catatan-saas.md`.

## Tahap 6 (opsional): Bonus Kubernetes (±15 menit)

1. Buka https://killercoda.com/playgrounds/scenario/kubernetes.
2. Jalankan:
```bash
git clone https://github.com/<username>/praktikum-cloud.git
cd praktikum-cloud
bash bonus-kubernetes/deploy.sh
```
3. Screenshot `kubectl get pods` sebagai `11-bonus-k8s-pods.png`.
4. Buka **Traffic / Ports**, **Custom Ports**, isi `30080`, lalu screenshot sebagai `12-bonus-k8s-hello.png`.

## Tahap 7: Lengkapi repositori (±20 menit)

1. Di GitHub buka folder `screenshots`, klik **Add file, Upload files**, lalu unggah semua gambar dengan nama persis seperti di atas.
2. Edit `README.md`:
   - Isi nama, NIM, dan dosen.
   - Ganti `<username>` dan `<nama-repo>` dengan milikmu.
   - Isi tabel hasil IaaS dan URL aplikasi Render.
   - Tulis kesimpulan dengan kata-katamu sendiri.
3. Buka `docs/analisis-perbandingan.md` dan sesuaikan bagian "Pengalaman Selama Praktikum" dengan yang kamu alami.
4. Jika tidak mengerjakan bonus Kubernetes, hapus bagian bonus dan gambar 11 dan 12 dari README.
5. Cek screenshot: jangan ada email, token, atau data pribadi yang terlihat.

## Tahap 8: Cek akhir dan kumpulkan

1. Buka halaman utama repositori dan pastikan semua gambar tampil.
2. Buka URL Render sekali lagi dan pastikan masih bisa diakses.
3. Kirim link repositori (dan URL Render) ke dosen sesuai format pengumpulan.

## Checklist

- [ ] Login Killercoda berhasil
- [ ] Repositori GitHub Public dan berisi folder `app/`
- [ ] Aplikasi aktif di URL `onrender.com`
- [ ] Screenshot 01 sampai 10 ada di `screenshots/`
- [ ] Tabel hasil IaaS dan URL terisi di README
- [ ] Kesimpulan dan analisis memakai kata-katamu sendiri
