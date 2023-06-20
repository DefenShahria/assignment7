import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;
  final int totalProducts;

  Mysnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }


  CartPage({required this.products, required this.totalProducts});

  void clearCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Clear Cart'),
          content: Text('Are you sure you want to clear the cart?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }






  @override
  Widget build(BuildContext context) {
    int totalProducts = 0;
    for (var product in products) {
      totalProducts += product.count;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalProducts'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          totalProducts == 0 ? null : () => clearCart(context);
          Mysnackbar('Pressed', context);
          print(totalProducts);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}