// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBarState extends State<NavBar> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: curIndex,
        showUnselectedLabels: true,
        backgroundColor: Colors.black26,
        unselectedItemColor: Theme.of(context).colorScheme.secondary ,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(size: 30),
        onTap: (index) {
          setState(() {
            curIndex = index;
          });

          switch (index) {
            case 0:
              context.go( '/home');
              break;
            case 1:
              context.go( '/home');
              break;
            case 2:
              context.go( '/home');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
              label: "Games",
              icon: Icon(Icons.sports_esports),
          ),
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              label: "Levels",
              icon: Icon(Icons.route),
            ),
    
          // BottomNavigationBarItem(
          //     label: "Community",
          //     icon: Icon(Icons.groups),
          // ),
          // BottomNavigationBarItem(
          //     label: "Profile",
          //     icon: Icon(Icons.person_outline),
          // ),
        ]);
  }
}
