import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/Invice_item.dart';
import 'package:invoice/add_iteam.dart';
import 'package:invoice/summary_screen.dart';


class AddIteam extends StatefulWidget {
  const AddIteam({Key? key}) : super(key: key);

  @override
  State<AddIteam> createState() => _AddIteamState();
}

class _AddIteamState extends State<AddIteam> {
  final List<InvoiceIteam>  _items = [];


  void _addItem(BuildContext context) async{
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> AddItemScreen(item: , onRemove: () {  }, onUpdate: (InvoiceIteam ) {  },)),
    );
    if (result != null){
      setState(() {
        _items.add(result);
      });
    }
  }
  void _removeItem(int index){
    setState(() {
      _items.removeAt(index);
    });
  }
  double get _total => _items.fold(0, (total, item) => total+item.total);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Invoice App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Invoce App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()=>_addItem(context),
                  child: Text('Add Item')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                final total = _total.toStringAsFixed(2);
                final details = _items.map((item) => '${item.name} (${item.quantity} * ${item.price})= ${item.total}').join('\n');
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SumaryScreen(total:total, details:details)));
              }, child: Text('Generate Invoice'))
              ],
          )

        ),
      ),
    );
  }
}
