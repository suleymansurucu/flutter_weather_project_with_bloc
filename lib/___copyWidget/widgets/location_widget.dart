import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String choosedCity;
  const LocationWidget({super.key, required this.choosedCity});

  @override
  Widget build(BuildContext context) {
    return Text('Ankara',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),);
  }
}
