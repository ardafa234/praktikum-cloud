// Menampilkan bukti bahwa halaman ini dilayani oleh platform (PaaS), bukan dari komputer lokal.
(function () {
  var tombol = document.getElementById("cek");
  var hasil = document.getElementById("hasil");
  var jumlahKlik = 0;

  tombol.addEventListener("click", function () {
    jumlahKlik += 1;

    var waktu = new Date().toLocaleString("id-ID", {
      dateStyle: "full",
      timeStyle: "medium"
    });

    hasil.innerHTML =
      "<strong>Aplikasi aktif.</strong><br>" +
      "Dilayani dari: " + location.host + "<br>" +
      "Waktu akses: " + waktu + "<br>" +
      "Jumlah klik: " + jumlahKlik;
  });
})();
