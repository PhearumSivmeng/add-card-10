import 'package:flutter/material.dart';
import 'package:flutter_10/cart_screen.dart';
import 'package:flutter_10/product.dart';
import 'package:flutter_10/product_storage.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductScreen> {
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: Storage.products.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                          10)), // Rounded corners for the container border
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Apply the same border radius to the image
                      child: Image.network(
                        '${Storage.products[index].imageUrl}',
                        width: 125,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${Storage.products[index].name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$ ${Storage.products[index].price}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Storage.carts.add(Product(
                            id: Storage.products[index].id,
                            name: Storage.products[index].name,
                            price: Storage.products[index].price,
                            imageUrl: Storage.products[index].imageUrl));
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            );
          }),
    );
  }
}
