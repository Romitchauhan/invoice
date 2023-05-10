class InvoiceItem {
  final String name;
  final int quantity;
  final double price;

  InvoiceItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get totalPrice => quantity * price;

  InvoiceItem copyWith({
    required String name,
    required int quantity,
    required double price,
  }) {
    return InvoiceItem(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}

class Invoice {
  final List<InvoiceItem> items;
  final int totalQuantity;
  final double totalPrice;

  Invoice({
    required this.items,
    required this.totalQuantity,
    required this.totalPrice,
  });
}
