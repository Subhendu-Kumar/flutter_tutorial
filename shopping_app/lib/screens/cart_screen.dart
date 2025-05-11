import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    final cart = Provider.of<CartProvider>(context).cartItem;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Cart"))),
      body:
          cart.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    leading: Image.asset(item['imageUrl'] as String),
                    title: Text(
                      item['title'].toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      "Size:  ${item['size']} \nPrice: \$${item['price']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                "Are you sure you want to delete this product?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(
                                      context,
                                      listen: false,
                                    ).removeFromCart(item);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
