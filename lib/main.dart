import 'package:flutter/material.dart'; // Berisi widget dan fungsi untuk membangun aplikasi berbasis Material Design

void main() {
  // Titik masuk utama aplikasi Flutter.
  runApp(
      MyApp()); // Fungsi ini menjalankan aplikasi dengan memanggil runApp dan menginstansiasi objek MyApp
}

class MyApp extends StatelessWidget {
  // Mendefinisikan sebuah kelas MyApp yang merupakan turunan dari StatelessWidget
  final List<Map> bunga = [
    // Mendefinisikan sebuah List bunga yang berisi sejumlah objek Map. Setiap Map mewakili data bunga, termasuk nama, harga, dan nama file gambar.
    {"nama": "Matahari", "harga": "65000", "gambar": "img/1.jpg"},
    {"nama": "Rose", "harga": "55000", "gambar": "img/2.jpg"},
    {"nama": "Dahlia", "harga": "20000", "gambar": "img/3.jpg"},
    {"nama": "Aster", "harga": "25000", "gambar": "img/4.jpg"},
    {"nama": "Krisan", "harga": "35000", "gambar": "img/5.jpg"},
    {"nama": "Lily", "harga": "40000", "gambar": "img/6.jpg"},
    {"nama": "Matahari", "harga": "35000", "gambar": "img/7.jpg"},
    {"nama": "Jakaranda", "harga": "40000", "gambar": "img/8.jpg"},
    {"nama": "Anggrek", "harga": "60000", "gambar": "img/9.jpg"},
    {"nama": "Tulip", "harga": "70000", "gambar": "img/10.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    // Metode build yang dioverride dari StatelessWidget. Metode ini akan membangun tampilan utama aplikasi.
    return MaterialApp(
      // Root widget dari aplikasi Flutter. Ini mengkonfigurasi aspek-aspek utama aplikasi, seperti tema dan navigasi.
      home: Scaffold(
        // Widget yang mengandung kerangka tampilan aplikasi
        appBar: AppBar(
          title: Text("Katalog Bunga Audrey Surya"),
          backgroundColor: Colors.orange, // Warna latar belakang AppBar
          leading: Icon(Icons.home), // Ikon "home" pada AppBar
        ),
        body: ListView.separated(
          // Membuat daftar item yang bisa di-scroll
          itemCount: bunga.length, // Jumlah item dalam ListView
          itemBuilder: (context, index) {
            // Membuat tampilan setiap item dalam daftar
            return Card(
              // Membuat Card yang mengelilingi setiap item
              elevation: 5.0, // Mengatur elevasi
              margin: EdgeInsets.all(11.0), // Mengatur margin
              child: ListTile(
                // Menggunakan ListTile sebagai child dari Card
                leading: Image.asset(
                  // Menambahkan gambar pada elemen leading menggunakan Image.asset
                  bunga[index][
                      "gambar"], // Gambar ini diambil dari file yang ditentukan dalam bunga[index]["gambar"]
                  width: 80, // Mengatur lebar gambar
                  height: 80, // Mengatur tinggi gambar
                  fit: BoxFit.cover,
                ),
                title: Text(bunga[index]
                    ["nama"]), // Menampilkan nama bunga sebagai judul ListTile
                subtitle: Column(
                  // Di dalam subtitle, Anda menampilkan rating bintang (dengan ikon bintang) dan harga bunga
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Mengatur bagaimana widget child akan diatur secara silang
                  children: [
                    // Daftar widget child yang akan ditampilkan dalam widget
                    Row(
                      // Mengatur beberapa widget secara horizontal
                      children: List.generate(
                        // Membuat daftar Icon sebanyak 5 kali, sesuai dengan jumlah yang ditentukan
                        5,
                        (i) => Icon(
                          // Widget Icon yang akan digenerate sebanyak 5 kali
                          Icons.star,
                          color:
                              i < 3 // i kurang dari 3, maka ikon akan berwarna kuning, jika i lebih besar atau sama dengan 3, maka ikon akan berwarna abu-abu
                                  ? Colors.yellow // Warna bintang
                                  : Colors.grey, // Warna bintang
                        ),
                      ),
                    ),
                    Text(
                        "Harga: Rp ${bunga[index]["harga"]}"), // Membuat sebuah widget teks yang akan menampilkan teks
                    // "Harga: Rp " diikuti oleh nilai yang diambil dari daftar bunga
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, position) {
            // Menentukan bagaimana pemisah (separator) harus ditampilkan antara item dalam daftar
            if ((position + 1) % 4 == 0 && position != bunga.length - 1) {
              // Memeriksa apakah indeks elemen saat ini adalah
              //kelipatan dari 4 dan bukan elemen terakhir dalam daftar
              // Tambahkan pemisah setelah setiap 3 item dengan teks, pemisah yang lebih besar, dan font yang lebih besar
              return Container(
                padding: EdgeInsets.all(
                    8.0), // Properti untuk memberikan jarak dalam bentuk bantalan sebesar 8.0 piksel
                color: Colors
                    .orange, // Mengatur warna latar belakang pemisah menjadi oranye
                height: 50.0, // Mengatur tinggi pemisah menjadi 50.0 piksel
                child: Text(
                  // Widget teks yang akan ditampilkan dalam pemisah
                  "Dapatkan potongan 5%",
                  style: TextStyle(
                    // Mengatur properti gaya teks
                    color: Colors.white, // Mengatur warna
                    fontSize: 25.0, // Atur ukuran font
                  ),
                ),
              );
            } else {
              return SizedBox(); // Tidak ada pemisah untuk item selain yang setiap 3.
            }
          },
        ),
      ),
    );
  }
}
