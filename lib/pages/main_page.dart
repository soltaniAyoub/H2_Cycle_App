import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final Widget child; // ✅ la page active
  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/main/home')) return 0;
    if (location.startsWith('/main/map')) return 1;
    if (location.startsWith('/main/recycle')) return 2;
    if (location.startsWith('/main/rewards')) return 3;
    if (location.startsWith('/main/profile')) return 4;

    return 0; // défaut : Home
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/main/home');
        break;
      case 1:
        context.go('/main/map');
        break;
      case 2:
        context.go('/main/recycle');
        break;
      case 3:
        context.go('/main/rewards');
        break;
      case 4:
        context.go('/main/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      body: widget.child, // ✅ affiche la page courante
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.recycling), label: "Recycle"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Rewards"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
