import 'package:flutter/material.dart';

class Search_bar extends StatefulWidget {
  const Search_bar({super.key});

  @override
  State<Search_bar> createState() => _Search_barState();
}

class _Search_barState extends State<Search_bar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TextFormField(
  decoration: InputDecoration(
    labelText: 'ابحث هنا...',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    // تصفية البيانات هنا
  },
      )
      ],
    );
    
  }
}