import 'package:flutter/material.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;
  Color background;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
    required this.background});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Quality',
      image: 'images/first.svg',
      background: Colors.green,
      discription: "Sell your farm fresh products directly to consumers, "
          "cutting out the middleman and reducing emissions of the global supply chain.  "
  ),
  UnbordingContent(
      title: 'Convenient',
      image: 'images/second.svg',
      background: Color(0xFFD56C60),
      discription: "Our team of delivery drivers will make sure your orders are"
          " picked up on time and promptly delivered to your customers. "
  ),
  UnbordingContent(
      title: 'Local',
      image: 'images/reward.svg',
      background: Colors.yellow.shade400,
      discription: "We love the earth and know you do too! Join us in reducing our "
          "local carbon footprint one order at a time.  "
  ),
];