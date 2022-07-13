import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/utilities/routes.dart';

import '../model/cart_model.dart';
import '../model/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Items> items = [
    Items(
      name: 'S20 Ultra',
      price: 200,
    ),
    Items(
      name: 'A30 Ultra',
      price: 500,
    ),
    Items(
      name: 'Samsung Galaxy',
      price: 900,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.checkOutRote);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Text('${cart.count}');
                }),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: Text('${items[index].name}'),
                trailing: IconButton(
                  onPressed: () {
                    cart.addItem(items[index]);
                  },
                  icon: Icon(Icons.add),
                ),
              );
            },
          ),
        ),
        itemCount: items.length,
      ),
    );
  }
}
