import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key, required this.primaryColor});

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'الطلبات'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline),
          label: 'المفضلة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'حسابي',
        ),
      ],
    );
  }
}
