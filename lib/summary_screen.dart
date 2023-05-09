
import 'package:flutter/material.dart';

class SumaryScreen extends StatelessWidget {
   SumaryScreen({Key? key, required this.total, required this.details}) : super(key: key);
  final String total;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Invoice '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Detail:'),
            SizedBox(height: 8,),
            Expanded(child: SingleChildScrollView(
              child: Text(details),
            )),
            SizedBox(height: 16,),
            Text('Total:'),
            SizedBox(height: 8,),
            Text('\$${total.toString()}',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
            SizedBox(height: 16,),
            ElevatedButton(onPressed:() {
              Navigator.pop(context);
              },
                child: Text('Done'))
          ],
        )
      ),
    );
  }
}
