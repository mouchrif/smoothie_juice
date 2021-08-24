import 'package:flutter/material.dart';
import 'package:smoothie_juices/constants.dart';

class Smoothie {
  final String title;
  final double price;
  final Color color;
  final String assetName;
  final String? text;
  Smoothie({
    required this.title,
    required this.price,
    required this.color,
    required this.assetName,
    this.text,
  });

  static List<Smoothie> smoothies = [
    Smoothie(
      title: "Orange Juice Shake",
      price: 6,
      color: kYellowColor,
      assetName: "assets/images/juice2.png",
      text: "Cold, creamy, so thick that your straw stands straight up, and filled width juicy berries.",
    ),
    Smoothie(
      title: "Strawberry Shake",
      price: 5,
      color: kPinkColor,
      assetName: "assets/images/juice3.png",
    ),
    Smoothie(
      title: "Milk Shake",
      price: 8,
      color: kBlueColor,
      assetName: "assets/images/milkeshake.png",
    ),
  ];
}
