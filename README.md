## Tugas 7
1. - *Stateless Widget* adalah widget yang tidak dapat diubah setelah di-*build*.
     Perubahan isi variabel, icon, dan buttons, serta *data retrieval* tidak 
     mengubah state app.
   - *Stateful Widget* adalah widget yang dapat diubah setelah di-*build*.
     State dari app dapat berubah tergantung variabel, input, dan data yang ada.

2. Widget yang dipakai dalam proyek kali ini adalah sebagai berikut:
   - Center: widget untuk memposisikan child-nya di tengah
   - Column: widget untuk menampilkan child-nya pada suatu *array* vertikal
   - MainAxisAlignment: widget untuk mengatur posisi child-nya dalam flex layout
   - Padding: widget untuk menambahkan *padding* pada child-nya
   - Row: widget untuk menampilkan child-nya pada suatu *array* horizontal
   - Visibility: widget untuk menampilkan atau menunjukkan child-nya
   - FloatingActionButton: widget button yang *float* di atas widget-widget lain
   - Text: widget untuk menampilkan sebuah *string* teks dengan satu `style` tertentu
   - Icon: widget untuk menampilkan icon yang sudah didefinisikan berdasarkan library *Icons*

3. `setState()` digunakan untuk mengubah (lebih tepatnya *rebuild*) suatu 
   widget beserta *descendants*-nya. Pada program ini, `setState()` mengubah 
   variabel `_counter` ketika fungsi `_incrementCounter` dan `_decrementCounter` 
   dipanggil.

4. - `final`: variabel harus diketahui saat runtime. 
   - `const`: variabel harus diketahui saat compile time.<br>
   Kedua `final` dan `const` tidak dapat diubah-ubah lagi setelah diinisialisasi.

## Tugas 8
1. - `Navigator.push`: Mengubah **current route** menjadi route baru dengan menambahkan **new route** ke stack. `Navigator.push` tidak menghilangkan route sebelumnya dari stack. Jika ingin pindah ke route sebelumnya, dilakukan `Navigator.pop`
   - `Navigator.pushReplacement`: Mengubah **current route** menjadi route baru dan men-**dispose current route** (yang sudah berubah menjadi **previous route**)

2. Widget yang dipakai dalam proyek kali ini adalah sebagai berikut:
   - Center: widget untuk memposisikan child-nya di tengah
   - Column: widget untuk menampilkan child-nya pada suatu *array* vertikal
   - Padding: widget untuk menambahkan *padding* pada child-nya
   - TextButton: widget button yang diposisikan pada halaman beserta widget-widget lain
   - Text: widget untuk menampilkan sebuah *string* teks dengan satu `style` tertentu
   - Container: widget untuk meng-**contain** widget lain
   - Drawer: widget untuk menampilkan children-nya secara vertikal layaknya lemari (?)
   - Form: widget untuk membuat dan menyimpan form
   - ListTile: widget untuk menampung teks dengan tambahan atribut `leading` dan `trailing`

3. `onPressed`, `onSaved`, `onTap`, `onChanged`

4. Navigator memiliki **stack of route** dan memiliki 2 cara untuk mengaturnya: secara declarative dan imperative.
   Declarative menggunakan `Navigator.pages` sedangkan imperative menggunakan `Navigator.push` dan `Navigator.pop`

5. - Membuat drawer yang berisi routing (Home - Form - Data)
   - Membuat kelas model baru untuk menyimpan data budget 
   - Membuat halaman form yang berisi 2 input text, 1 dropdown, dan tombol untuk men-**trigger** `onSaved`
   - Membuat list berisi budget-budget
   - Membuat halaman yang menunjukkan data-data dari form tadi. Page ini memiliki atribut `budgetItem` yang menerima list budget tadi.

## Tugas 9
1. Bisa, tetapi struktur/format datanya bisa saja tidak sesuai dengan yang ingin diolah. Oleh karena itu, lebih baik dibuat modelnya terlebih dahulu

2. - FutureBuilder: membuat widget tersendiri berdasarkan interaksi dengan sebuah class `Future`
   - IconButton: widget untuk menampilkan sebuah **button** yang berupa icon
   - Flexible: widget untuk mengontrol **flex** dari `child` milik Row, Column, atau Flex
   - Center: widget untuk memposisikan child-nya di tengah
   - Column: widget untuk menampilkan child-nya pada suatu *array* vertikal
   - Row: widget untuk menampilkan child-nya pada suatu *array* horizontal
   - ListTile: widget untuk menampung teks dengan tambahan atribut `leading` dan `trailing`
   - Container: widget untuk meng-**contain** widget lain

3. Mekanisme pengambilan data dari JSON adalah sebagai berikut
   - Membuat model untuk data yang akan di-GET dari JSON
   - Menambahkan dependensi HTTP
   - Membuat suatu fungsi async `Future` untuk ngambil data dari URL menggunakan HTTP request GET
   - *Parse* data yang diambil sesuai format model yang telah dibuat
   - Menampilkan data yang telah diambil oleh fungsi `Future` tadi menggunakan `FutureBuilder`

4. - Membuat *routing* menuju *page* My Watch List pada `drawer`
   - Membuat 1 file model, `mywatchlist.dart`, dan 2 file page untuk menampilkan model, `mywatchlist_page` dan `watchlist_detail_page.dart`
   - Menambahkan dependensi HTTP dalam project
   - Membuat utility untuk fetch data seperti pada jawaban nomor 3 di file `mywatchlist_page`
   - Menampilkan keseluruhan data yang di-*fetch* dari URL menggunakan `FutureBuilder` di page `mywatchlist_page`
   - Mengirim data `mywatchlist` yang diklik ke page `watchlist_detail_page.dart` untuk diperlihatkan detail filmnya
   - Menampilkan detail salah satu objek `mywatchlist` pada page tersebut