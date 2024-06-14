// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          contentPadding: EdgeInsets.only(left:25),
          label: Text("Search Waste Category" ,
            style: TextStyle(color: Colors.white70 ),
            textScaler: TextScaler.linear(1.1),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          suffix: IconButton(icon: Icon(Icons.search), onPressed: () {},)
        ),
      ),
    );
  }
}
