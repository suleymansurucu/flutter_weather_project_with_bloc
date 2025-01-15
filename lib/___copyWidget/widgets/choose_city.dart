import 'package:flutter/material.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({super.key});

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Choose City'),
      ),
      body: Form(
        
          child: Row(
            mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Please Choose City',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.search), onPressed: (){
            Navigator.pop(context, _textController.text);
          }  ),
        ],
      )),
    );
  }
}
