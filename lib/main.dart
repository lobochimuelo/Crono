import 'package:flutter/material.dart';
import 'package:crono/screens/home/home.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            "CRONO",

            style: TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          elevation: 0.0,

          ),
          body: CardRoom()
        ),
      )
  );

}

class CardRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    

    return Container(
      color: Colors.blue[100],
      child: Home()
    );
    
  }
}