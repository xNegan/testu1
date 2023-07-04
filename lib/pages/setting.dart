import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            'Setting page',
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
