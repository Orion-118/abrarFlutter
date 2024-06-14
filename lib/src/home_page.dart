// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_cycle/src/homepage/action_card.dart';
import 'package:green_cycle/src/homepage/carousel.dart';
import 'package:green_cycle/src/widgets/app_bar.dart';
import 'package:green_cycle/src/widgets/nav_bar.dart';
import 'package:green_cycle/src/homepage/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int _currentTextCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CustomSearchBar(),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.photo_camera,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () {
                      context.go("/camera-control");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                  children: [
                    ActionCard(
                      iconName: "locate.png",
                      label: "Locate",
                      onPressed: () {
                        context.push('/locate-vendor1');
                      },
                    ),
                    ActionCard(iconName: "schedule.png", label: "Schedule"),
                    ActionCard(
                        iconName: "list.png",
                        label: "List",
                        onPressed: () {
                          context.push('/waste-item-list');
                        }),
                    ActionCard(iconName: "voucher.png", label: "Voucher"),
                    ActionCard(iconName: "stories.png", label: "Stories"),
                    ActionCard(iconName: "community.png", label: "Community"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Play Exciting Games!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("lib/assets/images/quiz.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Did You Know...",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Carousel()),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
