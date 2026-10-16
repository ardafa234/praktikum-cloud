# Praktikum Cloud Computing: IaaS, PaaS, dan SaaS

Repositori ini berisi laporan dan berkas pendukung praktikum **Pengenalan Layanan Cloud: Membuat VM (IaaS), Menggunakan Platform (PaaS), dan Aplikasi SaaS**.

> **Nama:** _isi nama_
> **NIM:** _isi NIM_
> **Mata Kuliah:** Cloud Computing
> **Dosen:** _isi nama dosen_

| Model | Layanan yang dipakai |
|---|---|
| IaaS | VM Ubuntu di [Killercoda](https://killercoda.com) |
| PaaS | [Render](https://render.com) (Static Site, dari repositori GitHub ini) |
| SaaS | Google Docs |

## Tujuan

1. Memahami model layanan IaaS, PaaS, dan SaaS.
2. Mampu membuat instance virtual machine (IaaS).
3. Mampu memanfaatkan platform PaaS untuk menjalankan aplikasi sederhana.
4. Mampu menggunakan layanan SaaS dalam pekerjaan sehari-hari.

## Alat dan Bahan

- Akun GitHub, Killercoda, dan Render (semua bisa login dengan GitHub)
- Akun Google (untuk Google Docs)
- Koneksi internet dan browser

> **Catatan:** Killercoda adalah lab interaktif berbasis browser (sesi gratis dibatasi sekitar 60 menit), bukan penyedia cloud publik seperti AWS/GCP/Azure. VM Ubuntu di sana dipakai untuk mewakili IaaS. Karena layanan IaaS komersial berbayar dan registrasinya rumit, Killercoda dipilih sebagai alternatif gratis. IP yang tercatat adalah IP dari sandbox, bukan IP publik permanen.

## Struktur Repositori

```
.
├── README.md
├── PANDUAN.md                  # langkah kerja dari awal sampai akhir
├── iaas/
│   └── setup-vm.sh             # cek spesifikasi VM + pasang Nginx
├── app/                        # aplikasi web yang di-deploy ke Render (PaaS)
│   ├── index.html
│   ├── style.css
│   └── script.js
├── saas/
│   └── catatan-saas.md
├── docs/
│   └── analisis-perbandingan.md
├── bonus-kubernetes/           # opsional
│   ├── deployment.yaml
│   ├── service.yaml
│   └── deploy.sh
└── screenshots/
    └── README.md
```

---

## 1. IaaS: Membuat Virtual Machine

**Lab:** https://killercoda.com/playgrounds/scenario/ubuntu

### Langkah

1. Login ke Killercoda dan buka skenario Ubuntu Playground. Terminal ini berperan sebagai VM Linux yang bisa dikendalikan penuh.
2. Ambil repositori dan jalankan skrip:

```bash
git clone https://github.com/<username>/<nama-repo>.git
cd <nama-repo>
bash iaas/setup-vm.sh
```

3. Skrip menampilkan OS, vCPU, RAM, disk, dan IP, lalu memasang Nginx.
4. Periksa status server: `systemctl status nginx` (harus `active (running)`).
5. Buka web server dari browser: menu **Traffic / Ports** → **Custom Ports** → isi `80` → **Access**.

### Hasil

| Item | Nilai |
|---|---|
| OS | _isi_ |
| vCPU | _isi_ |
| RAM | _isi_ |
| IP Address | _isi_ |

### Screenshot

![Spesifikasi VM](screenshots/01-iaas-spesifikasi-vm.png)
![Status Nginx](screenshots/02-iaas-nginx-status.png)
![Nginx di browser](screenshots/03-iaas-nginx-browser.png)

---

## 2. PaaS: Deploy Aplikasi ke Render

Aplikasi berada di folder [`app/`](app/) (HTML, CSS, JavaScript). Render mengambil kode dari repositori GitHub ini dan menjalankannya, tanpa saya mengatur server atau sistem operasi.

### Langkah

1. Edit `app/index.html`: ganti `GANTI_DENGAN_NAMAMU` dan `GANTI_DENGAN_NIM`, lalu commit ke GitHub.
2. Buka https://render.com dan login dengan GitHub.
3. Klik **New +** → **Static Site**, lalu pilih repositori ini.
4. Isi konfigurasi:
   - **Name:** nama bebas, mis. `praktikum-cloud-<namamu>`
   - **Branch:** `main`
   - **Build Command:** kosongkan
   - **Publish Directory:** `app`
5. Klik **Create Static Site** dan tunggu status **Deploy succeeded / Live**.
6. Buka URL `https://<nama>.onrender.com` yang diberikan Render, lalu klik tombol **Cek status aplikasi**.

**URL aplikasi:** _isi URL onrender.com_

### Screenshot

![Repositori GitHub](screenshots/04-paas-github-repo.png)
![Konfigurasi Render](screenshots/05-paas-render-konfigurasi.png)
![Deploy berhasil](screenshots/06-paas-render-deploy-sukses.png)
![Aplikasi di URL Render](screenshots/07-paas-render-url.png)

---

## 3. SaaS: Google Docs

Catatan lengkap ada di [`saas/catatan-saas.md`](saas/catatan-saas.md).

### Screenshot

![Dokumen Google Docs](screenshots/08-saas-docs.png)
![Fitur Share](screenshots/09-saas-share.png)
![Riwayat Versi](screenshots/10-saas-version-history.png)

---

## 4. Analisis Perbandingan

Versi lengkap ada di [`docs/analisis-perbandingan.md`](docs/analisis-perbandingan.md).

| Aspek | IaaS (VM Ubuntu) | PaaS (Render) | SaaS (Google Docs) |
|---|---|---|---|
| Yang dikelola pengguna | OS, software, jaringan, aplikasi | Kode aplikasi dan konfigurasi | Konten/data |
| Yang dikelola penyedia | Hardware, virtualisasi | Hardware, OS, runtime, hosting | Semuanya |
| Fleksibilitas | Sangat tinggi | Sedang | Rendah |
| Kemudahan | Paling rumit | Cukup mudah | Paling mudah |
| Contoh nyata | Compute Engine, EC2 | Render, App Engine, Azure App Service | Google Docs, Trello |

## 5. Kesimpulan

_Tulis kesimpulan dengan kata-katamu sendiri: model mana yang paling cocok untuk kebutuhan apa, dan apa yang kamu pelajari dari praktikum ini._

---

## Bonus (opsional): PaaS dengan Kubernetes

Folder [`bonus-kubernetes/`](bonus-kubernetes/) berisi contoh deploy aplikasi ke Kubernetes Playground di Killercoda, untuk melihat bagaimana platform menjaga jumlah replika dan membuat ulang pod yang dihapus.

```bash
git clone https://github.com/<username>/<nama-repo>.git
cd <nama-repo>
bash bonus-kubernetes/deploy.sh
```

Akses lewat **Traffic / Ports** → **Custom Ports** → `30080`.

![Pods Kubernetes](screenshots/11-bonus-k8s-pods.png)
![Aplikasi Kubernetes](screenshots/12-bonus-k8s-hello.png)

## Referensi

- Killercoda: https://killercoda.com/docs
- Render Static Sites: https://render.com/docs/static-sites
- Kubernetes: https://kubernetes.io/docs/
- Nginx: https://nginx.org/en/docs/
