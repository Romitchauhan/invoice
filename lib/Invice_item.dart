class InvoiceIteam{
  final String name;
  final int quantity;
  final double price;
  final double total;
 // final int number;

  InvoiceIteam( {required this.name,required this.quantity, required this.price, required this.total});

  InvoiceIteam copyWith({required String name,required int quantity,required double price, required double total,}){
    return InvoiceIteam(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      total: total ?? this.total,
    );
  }

}

