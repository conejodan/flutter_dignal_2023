import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/widgets/cardio_widget.dart';

class CardioScreen extends StatelessWidget {
  const CardioScreen({super.key});

  static String route = "cardio_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cardio"),
      ),
      body: CardTimer(),
    );
  }
}
