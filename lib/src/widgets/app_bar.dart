// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: Icon(Icons.compost , color: Theme.of(context).colorScheme.error,), onPressed: () {},),
      title: Text("Green Cycle"),
      actions: [
        IconButton(icon: Icon(Icons.notifications , color: Theme.of(context).colorScheme.error,) ,onPressed: () {}, ),
        IconButton(icon: Icon(Icons.person , color: Theme.of(context).colorScheme.error,) ,onPressed: () {}, )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
