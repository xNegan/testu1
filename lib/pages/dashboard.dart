import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatefulWidget {
  final Widget page;

  const Dashboard({required this.page, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(96, 125, 139, 1),
        currentIndex: currentIndex,
        onTap: (value) => _onTap(value),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_work),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopify),
              icon: Icon(Icons.shopping_bag),
              label: 'Cart'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_applications),
              label: 'Setting'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.person),
              label: 'profile'),
        ],
      ),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        setState(() {
          currentIndex = index;
          context.go('/home');
        });
        break;
      case 1:
        setState(() {
          currentIndex = index;

          context.go('/cart');
        });
        break;
      case 2:
        setState(() {
          currentIndex = index;

          context.go('/setting');
        });
        break;
      case 3:
        setState(() {
          currentIndex = index;

          context.go('/profile');
        });
        break;
      default:
    }
  }
}
