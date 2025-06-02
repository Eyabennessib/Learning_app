import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigator({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/home.png"),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/map.png"),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/dumble.png"),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/position.png"),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/bars.png"),
          label: "",
        ),
      ],
    );
  }
}
