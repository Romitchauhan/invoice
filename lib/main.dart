import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/add_iteam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Invoice",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 100,top:70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              ' Invoice Screen',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 100,),
        ElevatedButton(
                onPressed: () {
                  // Navigate to the add item screen
                  Get.to(() => const InvoiceScreen());
                },
                child: const Text('Add Invoice'),
              ),

          ],
        ),
      ),
    );
  }
}
