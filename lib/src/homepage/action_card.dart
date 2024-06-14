// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({super.key, required this.label, required this.iconName, this.onPressed,});
  final String iconName;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Theme.of(context).colorScheme.primary)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "lib/assets/images/icons/$iconName",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    label,
                    textScaler: TextScaler.linear(1.01),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
