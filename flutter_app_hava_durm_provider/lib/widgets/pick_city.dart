import 'package:flutter/material.dart';

class PickCity extends StatefulWidget {
  @override
  _PickCityState createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  @override
  Widget build(BuildContext context) {

    final _textController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Form(key:_formKey,child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Şehir",
                  hintText: "Şehir Seçiniz",
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.search), onPressed: (){
            Navigator.pop(context,_textController.text);
          })
        ],
      ),),
    );
  }
}
