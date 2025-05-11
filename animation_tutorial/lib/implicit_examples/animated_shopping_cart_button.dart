import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: isClicked ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isClicked ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isClicked ? 50 : 10.0),
            ),
            child:
                isClicked
                    ? Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 6),
                          Text(
                            "Added to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                    : Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
