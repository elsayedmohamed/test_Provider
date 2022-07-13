import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/cart_model.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text('${cart.basketItems[index].name}'),
                      subtitle: Text('${cart.basketItems[index].price}'),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(cart.basketItems[index]);
                          }),
                    ),
                  ),
                  itemCount: cart.basketItems.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        '${cart.totalPrice}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
