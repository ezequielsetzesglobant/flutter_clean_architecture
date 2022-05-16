import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
