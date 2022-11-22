import 'package:counter_7/main.dart';
import 'package:counter_7/page/tambah_budget.dart';
import 'package:counter_7/page/data_budget.dart';
import 'package:flutter/material.dart';

class SeparateDrawer extends StatefulWidget {
  var dataBudget;
  SeparateDrawer({super.key, this.dataBudget});

  @override
  State<SeparateDrawer> createState() => _SeparateDrawerState();
}

class _SeparateDrawerState extends State<SeparateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  builder: (context) => DataBudgetPage(
                    budgetItem: widget.dataBudget,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
