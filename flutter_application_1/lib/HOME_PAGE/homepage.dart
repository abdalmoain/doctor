import 'package:flutter/material.dart';
import 'package:flutter_application_1/HOME_PAGE/Search_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Search_bar(),
        ],
      ),
    );
  }
}