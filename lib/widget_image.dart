import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  const WidgetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "imagens/p.png",
        height: 250,
        width: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
