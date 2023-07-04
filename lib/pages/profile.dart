import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            'Profile page',
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
