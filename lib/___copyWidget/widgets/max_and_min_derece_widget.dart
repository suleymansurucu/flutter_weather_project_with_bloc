import 'package:flutter/material.dart';

class MaxAndMinDereceWidget extends StatelessWidget {
  const MaxAndMinDereceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Maximum :' + '24' + 'C', style: TextStyle(fontSize: 20),),
        Text('minium :' + '24' + 'C',style: TextStyle(fontSize: 20),),
      ],
    );
  }
}
