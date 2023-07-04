import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            'cart page',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Go Home'))
      ]),
    );
  }
}
