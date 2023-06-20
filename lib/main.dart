import 'package:flutter/material.dart';
import 'package:practice/screen2.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;
  int count;

  Product({required this.name, required this.price, this.count = 0});
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}
int totalProducts = 0;


class _ProductListState extends State<ProductList> {

  List<Product> products = [
    Product(name: 'Bananas', price: 35),
    Product(name: 'Milk', price: 80),
    Product(name: 'Eggs', price: 45),
    Product(name: 'Bread', price: 40),
    Product(name: 'Chicken', price: 250),
    Product(name: 'Apples', price: 60),
    Product(name: 'Rice', price: 70),
    Product(name: 'Potatoes', price: 55),
    Product(name: 'Yogurt', price: 50),
    Product(name: 'Cereal', price: 100),
    Product(name: 'Tomatoes', price: 65),
    Product(name: 'Onions', price: 30),
    Product(name: 'Pasta', price: 75),
    Product(name: 'Carrots', price: 40),
    Product(name: 'Cheese', price: 150),
    Product(name: 'Spinach', price: 85),
    Product(name: 'Ground Beef', price: 300),
    Product(name: 'Oranges', price: 55),
    Product(name: 'Butter', price: 70),
    Product(name: 'Lettuce', price: 50),
    Product(name: 'Salmon', price: 400),
    Product(name: 'Strawberries', price: 120),
    Product(name: 'Cucumbers', price: 35),
    Product(name: 'Honey', price: 90),
    Product(name: 'Avocado', price: 75),
  ];



  Mysnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(products: products, totalProducts: totalProducts,)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: Text('${products[index].count}'),
            onTap: () {
              setState(() {
                Mysnackbar('Added on cart', context);
                products[index].count++;
                if (products[index].count == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}