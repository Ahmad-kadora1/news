import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting Screen',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}
