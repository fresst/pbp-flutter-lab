import 'dart:developer';
import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:flutter/material.dart';

class DataBudgetPage extends StatefulWidget {
  var budgetItem;
  DataBudgetPage({super.key, this.budgetItem});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      //DRAWER
      drawer: Drawer(
        child: Column(
          children: [
            // MENAMBAHKAN CLICKABLE MENU
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // ROUTE MENU KE HALAMAN UTAMA ("counter_7")
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // ROUTE MENU KE "Tambah Budget"
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TambahBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // ROUTE MENU KE "Data Budget"
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataBudgetPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(widget.budgetItem == null)
              Center(
                    child: Column(
                      children: const [Text("Tidak terdapat data")],
                    ),
                  )
            else
              widget.budgetItem.length == 0
                  ? Center(
                      child: Column(
                        children: const [Text("Tidak terdapat data")],
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: widget.budgetItem.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(widget.budgetItem[index].judul),
                                subtitle: Text(widget.budgetItem[index].nominal),
                                trailing: Text(widget.budgetItem[index].tipeBudget),
                              ),
                            );
                          }, 
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
