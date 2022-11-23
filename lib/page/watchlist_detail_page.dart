import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DetailWatchListPage extends StatelessWidget {
  var thisWatchList;
  DetailWatchListPage({super.key, this.thisWatchList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: SeparateDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.blue,
              onPressed: () {
                // ROUTE MENU KE "My Watch List Page"
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                );
              }, 
            ),
            Center(
              child: Text(
                thisWatchList.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(height: 10),
                const Text("Release Date: "),
                Text(
                    DateFormat.yMMMMd('en_US').format(thisWatchList.releaseDate)),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 10),
                const Text("Rating: "),
                Text("${thisWatchList.rating}/5"),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 10),
                const Text("Status: "),
                (thisWatchList.watched) ? Text("watched") : Text("not watched"),
              ],
            ),
            Text("Review: "),
            Flexible(child: Text(thisWatchList.review)),  
          ],
        ),
      ),
    );
  }
}
