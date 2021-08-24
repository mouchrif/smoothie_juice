import 'package:flutter/material.dart';
import 'package:smoothie_juices/widgets/juice_details.dart';
import 'package:smoothie_juices/widgets/side_bar_menu.dart';
import 'package:smoothie_juices/widgets/smoothies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smoothie app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: "/",
      routes: {
        SmoothieDetails.routeName: (ctx) => SmoothieDetails(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarMenu(),
          Expanded(
            child: Smoothies(),
          ),
        ],
      ),
    );
  }
}
