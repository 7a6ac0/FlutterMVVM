import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;

  ErrorScreen({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? ""),
    );
  }
}
