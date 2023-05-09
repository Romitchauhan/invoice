import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/Invice_item.dart';

class AddItemScreen extends StatefulWidget {
  final InvoiceIteam item;
  final VoidCallback onRemove;
  final Function(InvoiceIteam) onUpdate;
  const AddItemScreen({Key? key, required this.item, required this.onRemove, required this.onUpdate}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose(){
    _nameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  void _updateItem(){
    final name = _nameController.text.trim();
    final quantity = int.tryParse(_quantityController.text.trim())??0;
    final price = double.tryParse(_priceController.text.trim())??0.0;
    final total = quantity * price;
    widget.onUpdate(widget.item.copyWith(name:name,quantity:quantity,price:price,total:total));
    }

@override
  void initState(){
    super.initState();
    _nameController.text=widget.item.name;
    _quantityController.text = widget.item.quantity.toString();
    _priceController.text = widget.item.price.toStringAsFixed(2);
    _updateItem();
}
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         // Text('Item #${widget.item.number}'),
          SizedBox(height: 16),
          TextField(
            controller: _nameController,
            onChanged: (value)=> _updateItem(),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _quantityController,
            decoration: InputDecoration(labelText: 'Price'),
            onChanged: (value)=> _updateItem(),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _priceController,
            onChanged: (value)=> _updateItem(),
          ),


        ],
      ),
    );
  }
  }

