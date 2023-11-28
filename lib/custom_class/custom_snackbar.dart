import 'package:flutter/material.dart';
class CustomSnackBar extends StatefulWidget {
  final String message;

  const CustomSnackBar({super.key, required this.message});

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.message);
  }

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(widget.message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),

      ),
    );
  }
}
