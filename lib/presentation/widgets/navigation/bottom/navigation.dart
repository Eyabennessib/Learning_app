import 'package:flutter/material.dart';
import 'package:dummy_app/core/constants.dart';

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
          icon:  Image.asset(AppAssets.iconHome),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset(AppAssets.iconMap),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset(AppAssets.iconDumble),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset(AppAssets.iconPosition),
          label: "",
        ),

        BottomNavigationBarItem(
          icon:  Image.asset(AppAssets.iconBars),
          label: "",
        ),
      ],
    );
  }
}
