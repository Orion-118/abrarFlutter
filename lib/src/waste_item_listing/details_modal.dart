import 'package:flutter/material.dart';

class DetailsModal extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  const DetailsModal({super.key, required this.index, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Item Details",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item name",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryFixed,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snapshot.data[index]['name'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item description",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryFixed,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snapshot.data[index]['description'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item amount",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryFixed,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snapshot.data[index]['Amount'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
