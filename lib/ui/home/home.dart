import 'package:boiler_plate/utils/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomnavigationBarCutome(userRoll: " 1"),
    );
  }
}
