import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_cycle/src/widgets/nav_bar.dart';

class ImagePreview extends StatefulWidget {
  final String imagePath;
  const ImagePreview({super.key, required this.imagePath});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/camera-control');
          },
        ),
        title: const Text("Waste Classification"),
      ),
      bottomNavigationBar: const NavBar(),
      body: SingleChildScrollView(
        child: isLoading
            ? const CircularProgressIndicator()
            : Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.file(File(widget.imagePath)),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recyclable Waste",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.recycling,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ],
                            ),
                            Text("Not organic waste",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "Aluminium can",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Recycling Details",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Aluminium cans are 100% recyclable and can be recycled indefinitely "
                            "without a loss in quality. Recycling aluminium saves 95% of the energy "
                            "needed to make new aluminium from raw materials. Making cans from recycled "
                            "aluminium reduces air pollution by 95% and water pollution by 97%."
                            "Recycling aluminium cans saves 95% of the energy used to make aluminium cans "
                            "from raw materials. Making new aluminium cans from used cans takes 95% less energy."
                            "Recycling 1 tonne of aluminium saves 9 tonnes of CO2 emissions. Recycling aluminium ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
