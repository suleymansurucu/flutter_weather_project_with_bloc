import 'package:flutter/material.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Last update : ' + TimeOfDay(hour: 20, minute: 35).format(context), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),);
  }
}
