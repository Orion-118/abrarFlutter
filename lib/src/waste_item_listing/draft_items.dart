import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_cycle/src/utils/snackbars_alerts.dart';
import 'package:green_cycle/src/waste_item_listing/add_new_item.dart';
import 'package:green_cycle/src/waste_item_listing/details_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DraftItems extends StatefulWidget {
  const DraftItems({super.key});

  @override
  State<DraftItems> createState() => _DraftItemsState();
}

class _DraftItemsState extends State<DraftItems>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = createSnackBar(
          title: "Draft info",
          message: "Long press on the list item to delete it",
          contentType: "help");
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        //TITLE ROW
        _getTitleRow(context),
        //BUTTON ROW
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getConfirmListButton(context),
              _getAddNewItemButton(context),
            ],
          ),
        ),
        //LIST VIEW
        Expanded(
          child: FutureBuilder(
            future: fetchDraftItems(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return _getListView(context, snapshot);
              }
            },
          ),
        ),
      ],
    );
  }

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
      "description": "Sterilite Plastic Shoe Boxes - 13 x 8 x 5, "
          "Sterilite Plastic Shoe Boxes - 13 x 8 x 5, "
          "Sterilite Plastic Shoe Boxes - 13 x 8 x 5",
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

  Future<List<Map<String, String>>> fetchDraftItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return draftItems;
  }

  ListView _getListView(BuildContext context, AsyncSnapshot snapshot) {
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
            onLongPress: () {
              setState(() {
                draftItems.removeAt(index);
              });
            },
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
            trailing: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(snapshot.data[index]['name']),
          ),
        );
      },
    );
  }

  Padding _getTitleRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Draft List",
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
    );
  }

  TextButton _getConfirmListButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.save,
            color: Theme.of(context).colorScheme.secondaryFixed,
          ),
          const SizedBox(width: 5),
          Text(
            "Confirm list",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondaryFixed,
            ),
          ),
        ],
      ),
    );
  }

  TextButton _getAddNewItemButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: Theme.of(context).colorScheme.onSurface,
      ),
      child: Text("Add New Item",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          )),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          elevation: 10,
          useRootNavigator: true,
          context: context,
          builder: (context) => PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              if (didPop) return;
              final NavigatorState navigator = Navigator.of(context);
              bool shouldPop = false;
              await createQuickAlertConfirm(
                  context: context,
                  title: "Discard changes?",
                  message: "This item will not be added to the list",
                  type: "confirm",
                  onConfirmBtnTap: () {
                    shouldPop = true;
                    navigator.pop();
                  },
                  onCancelBtnTap: () {
                    shouldPop = false;
                    navigator.pop();
                  });
              if (shouldPop) {
                navigator.pop();
              }
            },
            child: GestureDetector(
              onVerticalDragUpdate: (details) async {
                final NavigatorState navigator = Navigator.of(context);
                bool shouldPop = false;
                await createQuickAlertConfirm(
                    context: context,
                    title: "Discard changes?",
                    message: "This item will not be added to the list",
                    type: "confirm",
                    onConfirmBtnTap: () {
                      shouldPop = true;
                      navigator.pop();
                    },
                    onCancelBtnTap: () {
                      shouldPop = false;
                      navigator.pop();
                    });
                if (shouldPop) {
                  navigator.pop();
                }
              },
              child: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: AddNewItem(
                    draftItems: draftItems,
                    onNewItemAdded: () {
                      setState(() {});
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
