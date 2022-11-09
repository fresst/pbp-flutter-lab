## Jawaban Pertanyaan
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