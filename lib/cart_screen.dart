import 'package:flutter/material.dart';
import 'package:flutter_10/product_storage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CartScreen> {
  double calculateTotal() {
    double total = 0.0;
    for (int i = 0; i < Storage.carts.length; i++) {
      total += Storage.carts[i].price;
    }
    return total;
  }

  double calculatePayment() {
    double total = calculateTotal();
    double payment = total - (total * selectedDiscount);
    return payment;
  }

  final List<double> discounts = [
    0.0,
    0.10,
    0.20,
    0.30
  ]; // Represented as percentages (e.g., 0.10 = 10%)
  double selectedDiscount = 0.0; // Default discount is 0%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button to white
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Storage.carts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        '${Storage.carts[index].imageUrl}',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      title: Text('${Storage.carts[index].name}'),
                      subtitle: Text('\$ ${Storage.carts[index].price}'),
                      trailing: IconButton(
                          onPressed: () {
                            Storage.carts.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '\$ ${calculateTotal().toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Discount:',
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                        value: selectedDiscount,
                        items: discounts.map((double discount) {
                          return DropdownMenuItem<double>(
                            value: discount,
                            child: Text(
                              '${(discount * 100).toStringAsFixed(0)}%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedDiscount = newValue!;
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Payment:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '\$ ${calculatePayment().toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
