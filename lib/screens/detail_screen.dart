import 'package:flutter/material.dart';
import '../models/gif.dart';

class DetailScreen extends StatelessWidget {
  final Gif gif;

  const DetailScreen({super.key, required this.gif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(gif.title)),
      body: Center(
        child: Image.network(gif.url),
      ),
    );
  }
}
