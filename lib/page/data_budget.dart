import 'package:counter_7/page/drawer.dart';
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
      drawer: SeparateDrawer(dataBudget: widget.budgetItem),
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
