#!/usr/bin/env bash
# Praktikum IaaS: menampilkan spesifikasi VM dan memasang web server Nginx.
# Jalankan di Ubuntu Playground (Killercoda) sebagai root.

set -u

line() { printf '\n==== %s ====\n' "$1"; }

line "Sistem Operasi"
grep -E '^(PRETTY_NAME|VERSION)=' /etc/os-release

line "Jumlah vCPU"
lscpu | grep -E '^CPU\(s\):'

line "Memori (RAM)"
free -h

line "Disk"
df -h /

line "IP Address internal"
hostname -I

line "IP Address publik (jika diizinkan)"
if ! curl -s --max-time 5 ifconfig.me; then
  echo "Tidak dapat diakses (jaringan sandbox Killercoda)."
fi
echo

line "Instalasi Nginx"
apt-get update -y
apt-get install -y nginx

line "Menjalankan Nginx"
systemctl start nginx 2>/dev/null || service nginx start
systemctl status nginx --no-pager 2>/dev/null | head -n 5 || service nginx status

line "Uji akses web server"
curl -s localhost | head -n 10

echo
echo "Selesai. Ambil screenshot output di atas untuk laporan."
echo
echo "Langkah berikutnya (screenshot di browser):"
echo "  1. Jalankan: systemctl status nginx   (harus active/running)"
echo "  2. Klik menu Traffic / Ports di Killercoda > Custom Ports > isi 80 > Access"
echo "  3. Screenshot halaman 'Welcome to nginx!'"
