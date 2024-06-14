import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  const TextCard({super.key , required this.trivia});
  final String trivia;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.7))),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          trivia,
          style: TextStyle(
              color:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
        ),
      ),
    );
  }
}
