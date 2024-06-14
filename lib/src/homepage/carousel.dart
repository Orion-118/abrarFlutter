import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:green_cycle/src/homepage/text_card.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentTextCard = 0;

  List<String> triviaList = [
    'About 90% of plastic bottles are not recycled, leading to massive waste accumulation in landfills and oceans.',
    'Recycling one ton of paper saves 17 trees, 7,000 gallons of water, and 4,000 kilowatt-hours of electricity.',
    'The average person generates over 4 pounds of trash every day and about 1.5 tons of solid waste per year.',
    'E-waste recycling recovers valuable metals as well as prevents harmful chemicals from contaminating the environment.',
    'It takes around 1,000 years for a plastic bag to degrade in a landfill. Imagine the damage to the environment.',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
          items: [
            ...triviaList.map((trivia) => TextCard(trivia: trivia))
            ],
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                _currentTextCard = index;
              });
            },
          )),
      buildCarouselDots()
    ]);
  }

  buildCarouselDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i <= triviaList.length ; i++)
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: CircleAvatar(
              radius: i == _currentTextCard ? 5 : 3,
              backgroundColor: i == _currentTextCard
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          )
      ],
    );
  }
}
