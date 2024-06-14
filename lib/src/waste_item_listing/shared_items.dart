import 'package:flutter/material.dart';
import 'package:green_cycle/src/waste_item_listing/details_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SharedItems extends StatefulWidget {
  const SharedItems({super.key});

  @override
  State<SharedItems> createState() => _SharedItemsState();
}

class _SharedItemsState extends State<SharedItems>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shared Community Items",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  // Implement your filter functionality here
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            // Replace this with your actual future
            future: fetchSharedItems(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.surfaceDim,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            elevation: 10,
                            useRootNavigator: true,
                            builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: DetailsModal(
                                index: index,
                                snapshot: snapshot,
                              ),
                            ),
                          );
                        },
                        splashColor: Colors.grey,
                        trailing: const Icon(Icons.arrow_right),
                        title: Text(snapshot.data[index]['name']),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<List<Map<String, String>>> fetchSharedItems() async {
    List<Map<String, String>> draftItems = [
      {
        "name": "Plastic Shoe Boxes",
        "description": "Sterilite Plastic Shoe Boxes - 13 x 8 x 5",
        "Amount": "1",
      },
      {
        "name": "Coca-Cola Classic Slim Can, 320 m.L.",
        "description": "Coca-Cola Classic Slim Can, 320 m.L.",
        "Amount": "10",
      },
      {
        "name": "Cashews",
        "description": "Kirkland Signature Organic Whole Cashews",
        "Amount": "111"
      },
      {
        "name": "Plastic Shoe Boxes",
        "description": "Sterilite Plastic Shoe Boxes - 13 x 8 x 5",
        "Amount": "1",
      },
      {
        "name": "Coca-Cola Classic Slim Can, 320 m.L.",
        "description": "Coca-Cola Classic Slim Can, 320 m.L.",
        "Amount": "10",
      },
      {
        "name": "Cashews",
        "description": "Kirkland Signature Organic Whole Cashews",
        "Amount": "111"
      },
      {
        "name": "Plastic Shoe Boxes",
        "description": "Sterilite Plastic Shoe Boxes - 13 x 8 x 5",
        "Amount": "1",
      },
      {
        "name": "Coca-Cola Classic Slim Can, 320 m.L.",
        "description": "Coca-Cola Classic Slim Can, 320 m.L.",
        "Amount": "10",
      },
      {
        "name": "Cashews",
        "description": "Kirkland Signature Organic Whole Cashews",
        "Amount": "111"
      },
    ];
    await Future.delayed(const Duration(seconds: 1));
    return draftItems;
  }
}
