import 'package:flutter_10/product.dart';

class Storage {
  static List<Product> products = [
    Product(
        id: 1,
        name: 'Blue-Jean',
        price: 15.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2024-07/2122405359/Jean%20(1).jpg'),
    Product(
        id: 2,
        name: 'White-Shirt',
        price: 9.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2024-08/1122406263/Slim-Fitted-Shirts%20(4).jpg'),
    Product(
        id: 3,
        name: 'Brown-Tshirt',
        price: 11.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2024-09/1122406286/Polo%20(4).jpg'),
    Product(
        id: 4,
        name: 'Black-Men-Shorts',
        price: 10.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2024-07/1122405223/Shorts%20(2).jpg'),
    Product(
        id: 5,
        name: 'Blue-Tshirt',
        price: 5.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2024-05/1112312098/Trouser%20(1).jpg'),
    Product(
        id: 6,
        name: 'Dotted-Dress',
        price: 20.99,
        imageUrl:
            'https://zandokh.com/image/catalog/products/2019/20809/lady-ploka-dot-dress-zando-(1).jpg'),
  ];
  static List<Product> carts = [];
}
