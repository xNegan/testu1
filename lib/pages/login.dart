import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            'login page',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
            onPressed: () => context.push('/home'), child: Text('go dash'))
      ]),
    );
  }
}
