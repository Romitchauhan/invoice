import 'package:flutter/material.dart';
import 'invoice.dart';


//import 'Invoice_item.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  List<InvoiceItem> _items = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  double get _totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  int get _totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  void _addItem() {
    final name = _nameController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    if (name.isNotEmpty && quantity > 0 && price > 0) {
      final item = InvoiceItem(name: name, quantity: quantity, price: price);
      _items.add(item);
      _nameController.clear();
      _quantityController.clear();
      _priceController.clear();
      _listKey.currentState?.insertItem(_items.length - 1);
      setState(() {});
    }
  }

  void _removeItem(int index) {
    _listKey.currentState?.removeItem(
      index,
          (context, animation) => _buildListItem(_items[index], animation),
    );
    _items.removeAt(index);
    setState(() {});
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Widget _buildListItem(InvoiceItem item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        leading: CircleAvatar(child: Text(item.quantity.toString())),
        title: Text(item.name),
        subtitle: Text('\$${item.price.toStringAsFixed(2)} each'),
        trailing: Text('\$${item.totalPrice.toStringAsFixed(2)}'),
        onLongPress: () => _removeItem(_items.indexOf(item)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Invoice'),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.orangeAccent,
          child: Column(
              children: [
              SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Item name',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Quantity',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: 'Price',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _addItem,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return _buildListItem(_items[index], animation);
              },
            ),
          ),
          SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                    //  Text('Total Quantity: $_totalQuantity'),
                      SizedBox(height: 8),
                      Text('Total Price: \$${_totalPrice.toStringAsFixed(2)}'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, Invoice(
                            items: _items,
                            totalQuantity: _totalQuantity,
                            totalPrice: _totalPrice,
                          ));
                        },
                        child: Text('Save Invoice'),
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ),
    );
  }
}

