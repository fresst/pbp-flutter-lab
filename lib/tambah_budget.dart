import 'package:counter_7/budget.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Reference sources:
// https://www.technicalfeeder.com/2021/11/flutter-dropdown-button-example/
// https://www.appsloveworld.com/flutter/100/11/dropdownbuttonformfield-with-fixed-width-but-dynamic-text-items

class TambahBudgetPage extends StatefulWidget {
  const TambahBudgetPage({super.key});

  @override
  State<TambahBudgetPage> createState() => _TambahBudgetPageState();
}

class _TambahBudgetPageState extends State<TambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> tipeBudget = ['Pemasukan', 'Pengeluaran'];
  String? tipePilihan;
  String inputJudul = "";
  String inputNominal = "";
  static List<Budget> listBudget = [];
  var _judul = TextEditingController();
  var _nominal = TextEditingController();

  void _showPopUpAfter() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 15,
            child: Container(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                shrinkWrap: true,
                children: <Widget>[
                  const Center(child: Text('Informasi Data')),
                  const SizedBox(height: 20),
                  Text(
                    "Judul: " + inputJudul,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Nominal: " + inputNominal,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Jenis: " + tipePilihan!,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        inputJudul = "";
                        inputNominal = "";
                        tipePilihan = null;
                      });
                    },
                    child: const Text('Kembali'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      //DRAWER
      drawer: SeparateDrawer(dataBudget: listBudget),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _judul,
                  decoration: InputDecoration(
                    labelText: "Judul",
                    hintText: "ex: Beli Primogems",
                    // ADDING BORDER
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // VALIDATOR
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Judul harus diisi!";
                    }
                    return null;
                  },
                  // ADDING DECORATION ON TYPE
                  onChanged: (String? value) {
                    setState(() {
                      inputJudul = value!;
                    });
                  },
                  // ADDING BEHAVIOR WHEN STORING DATA
                  onSaved: (String? value) {
                    setState(() {
                      inputJudul = value!;
                    });
                    _judul.clear();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nominal,
                  // ADDING INPUT FORMATTER
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: "Nominal",
                    hintText: "ex: 85000",
                    // ADDING BORDER
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // VALIDATOR
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nominal harus diisi!";
                    }
                    return null;
                  },
                  // ADDING DECORATION ON TYPE
                  onChanged: (String? value) {
                    setState(() {
                      inputNominal = value!;
                    });
                  },
                  // ADDING BEHAVIOR WHEN STORING DATA
                  onSaved: (String? value) {
                    setState(() {
                      inputNominal = value!;
                    });
                    _nominal.clear();
                  },
                ),
              ),
              SizedBox(
                width: 130,
                child: DropdownButtonFormField(
                  value: tipePilihan,
                  hint: const Text("Pilih jenis"),
                  items: tipeBudget.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  // ADD onChanged
                  onChanged: (String? value) {
                    setState(() {
                      tipePilihan = value!;
                    });
                  },
                  // ADD onSaved
                  onSaved: (String? value) {
                    setState(() {
                      tipePilihan = value!;
                    });
                  },
                  // VALIDATOR
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Pilih tipe budget!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        Budget newBudget =
                            Budget(inputJudul, inputNominal, tipePilihan!);
                        listBudget.add(newBudget);
                      });
                      _showPopUpAfter();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
